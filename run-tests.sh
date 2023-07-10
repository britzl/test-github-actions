#!/usr/bin/env bash

set -e

ERRORTXT="./errors.txt"

check_error() {
	local status=$1
	if [ $status -ne 0 ]; then
		touch "${ERRORTXT}"
		echo "Failed. Code '${status}'" >> "${ERRORTXT}"
	fi
}

check_failed_runs() {
	if [ -f "${ERRORTXT}" ]; then
		echo "At least one of the builds failed:"
		cat "${ERRORTXT}"
		exit 1
	fi
}

run() {
	set +e
	java -jar test.jar
	check_error $?
	set -e
}

which java
java -version

run
check_failed_runs
