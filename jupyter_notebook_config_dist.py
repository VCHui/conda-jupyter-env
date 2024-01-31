import sys, os
c = get_config()  #noqa
c.NotebookApp.allow_origin = '*'
c.NotebookApp.allow_remote_access = True
c.NotebookApp.base_url = '/jupyter'
# c.NotebookApp.login_handler_class = 'notebook.auth.login.LoginHandler'
c.NotebookApp.certfile = os.path.abspath('jupyter.pem')
c.NotebookApp.keyfile = os.path.abspath('jupyter.pem')
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.notebook_dir = os.path.abspath('ipynb')
c.NotebookApp.open_browser = False
c.NotebookApp.password = ""
c.NotebookApp.token = ""
c.NotebookApp.port = 8888
c.NotebookApp.quit_button = True
c.NotebookApp.terminals_enabled = False
c.NotebookApp.trust_xheaders = True
c.ContentsManager.hide_globs = ['__pycache__', '*.pyc', '*.pyo', '.DS_Store', '*.so', '*.dylib', '*~', '*.py']
