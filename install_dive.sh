#! /usr/bin/env bash
# script_name: Description of the script purpose.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
readonly base_url='https://github.com/wagoodman/dive/releases/download'
readonly dive_version='0.9.2'
readonly release_file='/etc/os-release'


main() {
    local url package
    url="$base_url/v${dive_version}/dive_${dive_version}_linux_amd64"

    if (( EUID == 0 )); then
        if [[ -f "$release_file" ]]; then
            if (grep -qi 'rhel' "$release_file"); then
                url+='.rpm'
                command='rpm -i'
            elif (grep -qi 'debian' "$release_file"); then
                url+='.deb'
                command='apt install'
            else
                printf "Uknown linux distribution, I cannot install dive.\n"
                return 1
            fi
        fi

        # Start installation.
        # TODO: fix the installation line.
        package="$(basename "$url")"
        # PWD='/tmp' curl -# -JLO "$url" && eval "$command $package"
    else
        printf 'Execute with administrative privileges.\n'
        return 1
    fi
}


main "$@"
