#!/bin/bash

py=python3.8
envname=soenv_$(date +"%Y%m%d")
echo $py, $envname

sudo virtualenv -p $py /software/$envname
source /software/$envname/bin/activate

sudo /software/$envname/bin/pip3 install -r requirements.txt
sudo /software/$envname/bin/$py -m ipykernel install --prefix=/software/$envname/ --name=$envname --display-name=$envname
sudo /software/$envname/bin/jupyter nbextension enable --py widgetsnbextension --sys-prefix
sudo unlink /software/soenv_latest
sudo ln -s /software/$envname /software/soenv_latest

mkdir $envname"_sotodlib"
cd $envname"_sotodlib"
git clone git@github.com:simonsobs/sotodlib.git
cd sotodlib
sudo /software/$envname/bin/pip3 install .
/software/$envname/bin/$py setup.py test
