#!/bin/bash

source ~/.bash_profile

python /vagrant/python/List_Volumes.py -s ${PUREFA_URL} -t ${PUREFA_API}
exit
