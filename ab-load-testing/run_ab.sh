#!/bin/bash

function get_options {
    while [[ $# -gt 1 ]]; do
        opt="$1"
        shift;
        current_arg="$1"
        case "$opt" in
            "--host"                ) HOST="$1"; shift;;
            "--total-requests"      ) TOTAL_REQUESTS="$1"; shift;;
            "--concurrent-requests" ) CONCURRENT_REQUESTS="$1"; shift;;
            *                       ) echo "ERROR: Invalid option: \""$opt"\"" >&2
                                      exit 1;;
        esac
    done
}

function run_ab {
	ab -l -n $TOTAL_REQUESTS -c $CONCURRENT_REQUESTS $HOST
	if [[ $? != 0 ]]; then
		echo "Example Usage: --host http://docker.com/ --total-requests 10 --concurrent-requests 2"
		echo "Note: the URL must contain a trailing '/' if not requesting a specific resources"
		echo "   example: http://docker.com/"
		exit 1
	fi
}

function main {
	get_options $@
	run_ab
}

main $@