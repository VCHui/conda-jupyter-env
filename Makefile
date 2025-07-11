# -*- Makefile -*-

SHELL = bash

JENV = nb6 # jupyter-notebook server environment

all:
	@echo "$(ENV) options"
	@echo
	@grep -hA1 "^[[:alnum:]]?*[.[:alnum:]-]*:" ./Makefile* |\
		sed -e "s/^/  /g"
	@echo

grepconf:
	@# usage: cat config.py | make grepconf
	@egrep -v '^$$|^#'

list:
	conda list -n $(ENV) |\
		egrep 'ext|jupytext|widget|voila' |\
		sort -h

list.%: ENV=$*
list.%:
	@make -s list ENV=$(ENV)

jupyter-versions:
	conda run -n $(ENV) jupyter --version

jupyter-versions.%: ENV=$*
jupyter-versions.%:
	@make -s jupyter-versions ENV=$(ENV)

kernel-list:
	conda run -n $(JENV) jupyter-kernelspec list

kernel-remove:
	conda run -n $(JENV) jupyter-kernelspec remove \
		--log-level=INFO -y -f $(ENV)

kernel-remove.%: ENV=$*
kernel-remove.%:
	@make -s kernel-remove ENV=$(ENV)

kernel-install:
	conda run -n $(ENV) python -m ipykernel \
		install --user --name $(ENV)

kernel-install.%: ENV=$*
kernel-install.%:
	@make -s kernel-install ENV=$(ENV)

.PHONY: grepconf list jupyter-versions \
	kernel-list kernel-remove kernel-install

include Makefile.condaenv Makefile.pem
