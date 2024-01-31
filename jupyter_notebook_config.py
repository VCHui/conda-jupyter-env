import os
c.NotebookApp.certfile = os.path.abspath('jupyter.pem')
c.NotebookApp.keyfile = os.path.abspath('jupyter.pem')
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.notebook_dir = os.path.abspath('ipynb')
c.NotebookApp.open_browser = False
c.NotebookApp.password = ""
c.NotebookApp.token = ""
