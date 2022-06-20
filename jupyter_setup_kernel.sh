#!/usr/bin/env bash

ENVNAME=$(head -1 ./req.yml | cut -d\  -f2)

if [ "$(which conda)" = "" ]
then
    echo "conda not found!"
    exit 1
fi
echo "found $(which conda)"

if ! (which python | grep -q "envs.${ENVNAME}")
then
    echo "not ${ENVNAME} env!"
    exit 1
fi

if [ "$(which jupyter)" = "" -o \
     "$(dirname $(which jupyter))" != \
     "$(dirname $(which python))" ]
then
    echo "jupyter_server not installed on base"
    conda install -n base jupyter_server
    exit 1
fi

./jupyter_remove_kernel.sh

echo
echo "## ${ENVNAME} kernel installation on jupyter ##"
echo

python -m ipykernel install --user --name ${ENVNAME}
jupyter kernelspec list

./jupyter_setup_ssl.sh
