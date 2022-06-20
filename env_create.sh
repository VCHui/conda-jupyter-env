#!/usr/bin/env bash

. ./env_remove.sh
test $? -eq 1 && exit 1

echo
echo "## conda env setup ##"
echo
RUN="conda env create -n ${ENVNAME} --file ./req.yml"
echo "${RUN}"
${RUN}
