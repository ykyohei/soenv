#!/bin/bash

py=/usr/bin/python3.10
envname=soenv_$(date +"%Y%m%d")
path=/so/home/ykyohei/tools/soenv/
echo $py, $envname

virtualenv -p $py $path$envname
source $path$envname/bin/activate

$path$envname/bin/pip3 install -r requirements.txt
#$path$envname/bin/pip3 install pymaster
$path$envname/bin/python3 -m ipykernel install --prefix=$path$envname/ --name=$envname --display-name=$envname
$path$envname/bin/jupyter nbextension enable --py widgetsnbextension --sys-prefix
