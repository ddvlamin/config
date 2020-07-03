#!/bin/bash

github_user=$1
github_pat=$2

pushd ~/environment/

git config --global credential.helper store

rm -Rf ~/.pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

cp config/cloud9/.bashrc ~/.bashrc
source ~/.bashrc

pyenv install 3.6.9
pyenv virtualenv 3.6.9 biostrand

cp -R config/cloud9/environment/.c9/* .c9/

function create_repository () {
	rm -Rf $1
	mkdir $1
	git clone "https://"$github_user":"$github_pat"@github.com/BioStrand/"$1".git" $1
	pushd $1
	pyenv local biostrand
	if [ -f setup.py ]; then
		pip install -e .
	fi
	if [ ! -f setup.py ] && [ -f requirements.txt ]; then
	       pip install -r requirements.txt
       	fi	       
	popd
}

create_repository data-utilities
create_repository notebooks

popd
