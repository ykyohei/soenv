#!/bin/bash

py=python3.8
envname=soenv_$(date +"%Y%m%d")
envname=soenv_test
path=/software/
echo $py, $envname

sudo virtualenv -p $py $path$envname
source $path$envname/bin/activate

sudo $path$envname/bin/pip3 install -r requirements.txt
sudo $path$envname/bin/pip3 install pymaster
sudo $path$envname/bin/$py -m ipykernel install --prefix=$path$envname/ --name=$envname --display-name=$envname
sudo $path$envname/bin/jupyter nbextension enable --py widgetsnbextension --sys-prefix

mkdir $envname"_sotodlib"
cd $envname"_sotodlib"
git clone git@github.com:simonsobs/sotodlib.git
cd sotodlib
sudo $path$envname/bin/pip3 install .
$path$envname/bin/$py setup.py test

sudo unlink $path/soenv_latest
sudo ln -s $path$envname $path/soenv_latest
