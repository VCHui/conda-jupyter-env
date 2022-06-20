#!/usr/bin/env bash

ENVNAME=$(head -1 ./req.yml | cut -d\  -f2)

if [ "$(which conda)" = "" ]
then
    echo "conda not found!"
    exit 1
fi

if [ "$(which jupyter)" = "" -o \
     "$(dirname $(which jupyter))" != \
     "$(dirname $(which python))" ]
then
    echo "jupyter_server not installed on base"
    exit 1
fi

if (jupyter kernelspec list | grep -q kernels.${ENVNAME})
then
    echo
    echo "found ${ENVNAME} kernel on jupyter!"
    jupyter kernelspec remove --log-level=INFO -y -f ${ENVNAME}
fi
