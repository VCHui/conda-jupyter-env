SHELL = bash

# ENV = jupyter

all:
	@echo "$(ENV) options"
	@echo
	@grep -A1 "^\w*:" ./Makefile | sed -e "s/^/  /g"
	@echo

install:
	conda env create -n $(ENV) -q --file ./$(ENV).yml

uninstall:
	conda remove -n $(ENV) -y --all

versions:
	conda run -n $(ENV) jupyter --version

list:
	conda list -n $(ENV) | egrep 'ext|jupytext|widget|voila'

grepconf:
	egrep -v '^$$|^#'

install.%: ENV=$*
install.%:
	make uninstall ENV=$(ENV) && make install ENV=$(ENV)

uninstall.%: ENV=$*
uninstall.%:
	make uninstall ENV=$(ENV)

versions.%: ENV=$*
versions.%:
	make versions ENV=$(ENV)

list.%: ENV=$*
list.%:
	make list ENV=$(ENV)
