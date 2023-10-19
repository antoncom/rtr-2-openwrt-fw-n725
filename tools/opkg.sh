#!/bin/sh

ipk_folder=/data/bitcord/ipk      # Put all .ipk files there, by "adb push"
tmp_folder=/data/bitcord/tmp	  # Each package is uncompressed there temporarily	  
root_folder=/data/bitcord/root     # There is regular OpenWrt file structure after
                          # unpacking ipk files, like this:
                          # ./etc
                          # ./lib
                          # ./sbin
                          # ./usr
                          # ./www

# How to use #
##############
# Once the .ipk files in the place, just run the script: opkg.sh
##############

# This helper function checks whether the target file/folder is already exist. If not,
# then the folder is created and file or symlink is copied to the regular OpenWrt
# folder structure, like /usr/lib, /usr/bin, /etc/init.d, etc.
populate_file(){
    local source="${1}"
    local target="${2}"

    # Skip that files, which name ends with ".js.o"
    [[ ${source:0-5} == ".js.o" ]] && { echo "SKIP: $source "; return 0; }

    # If source is a directory and target location does not exist
    # then create directory in target location
    [[ -d "${source}" ]] && [[ ! -s "${target}" ]] && { mkdir -p "${target}"; return; }

    # If source is a file and target file doesn't exist then copy it to target location
    # [[ -f "${source}" ]] && [[ ! -e "$target" ]] && { cp -P "${source}" "${target}"; return; }

    # If source is a file and target file doesn't exist then create symbolic link instead of the file
    # The link refers to /data/bitcord/tmp directory structure - as a mirracle of /root
    [[ -f "${source}" ]] && [[ ! -e "$target" ]] && { ln -s "${source}" "${target}"; return; }
}



# Populate regular OpenWrt folders with compiled files extracted from .ipk   
                                                                             
populate(){                                                                  
		local pkg_file="${1}"
		local pkg_folder=$tmp_folder/$pkg_file
		local pkgpath_length=${#pkg_folder}

        cd "$pkg_folder"						|| { echo "[ERR] opkg.sh populate() Unable to change folder $pkg_folder"; return 1; }
        sources=$(find $pkg_folder/* -maxdepth 10)
        for src in $sources; do
        	#[[ "$src" != *".gz"* ]] && [[ "$src" != *"debian-binary"* ]] && {
        	[[ ${src:0-3} != ".gz" ]] && [[ ${src:0-13} != "debian-binary" ]] && {
            	target=${src:${pkgpath_length}}                                              
            	populate_file $src $target                                    
	     		#echo "Populate $src ---> $target"
	     	}
        done                                                              
}           


# Make post-install setting, defined in the Makefile

setup(){
	local pkg_file="${1}"
	local pkg_folder=$tmp_folder/$pkg_file
	cd "$pkg_folder"                                        	|| { echo "[ERR] opkg.sh setup() Unable to change folder $pkg_folder"; return 1; }
    sh -c "$(tar -xzf ./control.tar.gz "./postinst-pkg" -O)"	|| { echo "[ERR] opkg.sh setup() $pkg_file - postinst-pkg error"; return 1; }
	# echo "setup() $pkg_folder"
}


remove_tmp(){
	local pkg_file="${1}"
	local pkg_folder=$tmp_folder/$pkg_file
	rm -r $pkg_folder
	#echo "remove_tmp() $pkg_folder"
}	


# Unpack .ipk files placed in $ipk_folder and put its content to $tmp_folder

unpack_and_install_ipk(){
	cd "$ipk_folder" || { echo "No IPK folder found!"; return 0; }
	files="$(ls)"
	[ -z "$files" ] && return 0

	for pkg in $files; do
	    local pkg_folder="$tmp_folder/$pkg"
	    mkdir -p "$pkg_folder" 					|| { echo "[ERR] opkg.sh unpack_and_install() Unable to create temporary package folder $pkg_folder"; return 1; }
	    tar zxpvf "$ipk_folder/$pkg" -C "$pkg_folder" 1> /dev/null || { echo "[ERR] opkg.sh unpack_and_install() Unable to unpack $ipk_folder/$pkg"; return 1; }
	    cd "$pkg_folder" && tar -xzf data.tar.gz 1> /dev/null	|| { echo "[ERR] opkg.sh unpack_and_install() Unable to unpack $ipk_folder/$pkg/data.tar.gz"; return 1; }

	    populate $pkg
	    setup $pkg
	    remove_tmp $pkg
	done
}

unpack_and_install_ipk
