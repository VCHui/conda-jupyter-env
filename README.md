# condajupyter-env

A repo template for maintaining a conda env and running jupyter-notebook

## Purpose for development only (not multi-user)

* [`env_create.sh`](#conda-env-createremove) to remove and create the _env_ in one step
  
* [`jupyter_setup_kernel.sh`](#jupyter-kernel-notebook-config) to
  install a separate kernel for the _env_
  
  - enable jupyter notebook to use alternative kernels of different _envs_

* [`jupyter notebook.nohup`](#run-jupyter-notebook-like-a-system-service)
  runs like a system service

    - accept connections to jupyter over the network
    - use a self-signed ssl certificate for https
    - maybe useful to set a password

## Usage

### conda env create/remove

* in the `base` _env_

* edit [`./req.yml`](req.yml)

  - change the name `template` for the new _env_
  - update the package list

* run [`./env_create.sh`](env_create.sh) to create the new _env_, it nest executes

  - extraction of the _env_ name from [`./req.yml`](req.yml)

  - [`./env_remove.sh`](env_remove.sh) to remove the current _env_, if exists

    - [`./jupter_remove_kernel.sh`](jupyter_remove.sh) to remove
      the _env_ jupyter kernel, if installed
      
### jupyter kernel notebook config
 
* in the new _env_

* run [`./jupyter_setup_kernel.sh`](jupyter_setup_kerne.sh) to
  install a jupyter kernel for the _env_, it nest executes
  - [`./jupter_setup_ssl.sh`](jupyter_setup_ssh.sh) to create
    a self-signed ssl cert file and key `./jupyter.pem` for jupyter notebook
   
* edit [`./jupyter_notebook_config.py`](jupyter_notebook_config.py)
  if needed; the config sets

  - cert and key files to `./jupyter.pem`
  - ip `0.0.0.0` to listens all network connections
  - notebook directory to [`./ipynb`](ipynb)
  - no starting a browser
  - (__NOTE__ password is unset)

### run jupyter notebook like a system service

* [`./jupyter_notebook.nohup`](jupyter_notebook.nohop) `start`

* [`./jupyter_notebook.nohup`](jupyter_notebook.nohop) `stop`

* [`./jupyter_notebook.nohup`](jupyter_notebook.nohop) `status`

* `less ./jupyter_notebook.log` to view the log



