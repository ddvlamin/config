#!/bin/bash

github_key=$1

pushd ~/environment/

rm -Rf ~/.pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

cp config/cloud9/.bashrc ~/.bashrc
source ~/.bashrc

pyenv install 3.6.9
pyenv virtualenv 3.6.9 data-utilities
pyenv virtualenv 3.6.9 notebooks

ssh-add $github_key

cp -R config/cloud9/environment/.c9/* .c9/

function create_repository () {
	rm -Rf $1
	mkdir $1
	git clone "git@github.com:BioStrand/"$1".git" $1
	pushd $1
	pyenv local $1
	popd
}

create_repository data-utilities
create_repository core
create_repository notebooks

popd
