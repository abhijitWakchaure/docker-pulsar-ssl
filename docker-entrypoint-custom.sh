#!/usr/bin/env bash
# Author: Abhijit Wakchaure <awakchau@tibco.com>

# arg1: error message
# [arg2]: exit code
function exit_with_error {
    printf '\n%s\n' "$1" >&2 ## Send message to stderr.
    exit "${2-1}" ## Return a code specified by $2, or 1 by default.
}

# Run the script to generate SSL certs on the fly
${CERTS_ROOT}/createCerts.sh
${CERTS_ROOT}/update-conf.sh
# # Take the ownership for dirs as postgres is running with non-root user
# chown -R postgres:postgres ${CERTS_ROOT}

python3 -m http.server -d ${CERTS_ROOT}/certs &

bin/apply-config-from-env.py conf/standalone.conf && bin/pulsar standalone