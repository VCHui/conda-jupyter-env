#!/usr/bin/env bash

# man openssl-req, openssl-x509 for references
# subj[ req_distinguished_name ] "/C/ST/L/O/OU/CN/emailAddress"

PEM=./jupyter.pem

if [ \! -f ${PEM} ]
then
    echo
    echo "## set up a self-sigend ssl/https certificate, ${PEM} ##"
    echo
    openssl req -x509 -out ${PEM} -keyout ${PEM} \
        -nodes -days 365 -newkey rsa:2048 \
	-subj "/O=${USER}/OU=jupyter/CN=localhost"
fi

echo
echo "## self-signed ssl/https certificate ${PEM} ##"
echo
openssl x509 -subject -fingerprint -serial -dates \
    -noout -in ${PEM} # to view
echo
