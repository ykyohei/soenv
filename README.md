# prerequisites
```bash
pip install virtualenv
# soenv requirements
apt install python3.8 gfortran build-essential gcc g++ make libtool texinfo dpkg-dev pkg-config libfftw3-dev libfftw3-3 libgsl-dev libcfitsio-dev git wget autoconf automake libtool autoconf-doc libtool-doc mpich
# saenv requirements
apt install cmake libboost-all-dev libflac-dev libnetcdf-dev
# toast 3
apt install libssl-dev libopenblas-dev liblapack-dev
```

# jupyter setup
config
```bash
$ jupyter server --generate-config
```
edit ~/.jupyter/jupyter_server_config.py
```bash
c.ServerApp.ip = '<server ip>'
c.ServerApp.open_browser = False
c.ServerApp.port = 8888 'any port range 0 to 65353 you like which doen't conflict with others'
c.ServerApp.notebook_dir = '/homes/<username>'
```
password
```bash
$ jupyter server password
```
