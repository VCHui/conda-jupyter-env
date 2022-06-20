#!/usr/bin/env bash

ENVNAME=$(head -1 ./req.yml | cut -d\  -f2)

if [ "$(which conda)" = "" ]
then
    echo "conda not found!"
    exit 1
elif (which conda | grep -q condabin)
then
    echo "expecting .../bin/conda"
    echo "found $(which conda)"
    echo "require conda base env"
    exit 1
fi
echo "found $(which conda)"

./jupyter_remove_kernel.sh

if $(conda env list | grep -q ${ENVNAME})
then
    echo "found ${ENVNAME} environment!"
    conda remove -n ${ENVNAME} -y --all
fi
