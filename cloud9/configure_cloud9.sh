#!/bin/bash

pushd ~/environment/

function create_repository () {
	if [ ! -d "$1" ]; then
		mkdir $1
		git clone "git@github.com:BioStrand/"$1".git" $1
	fi
}

create_repository data-utilities
create_repository core
create_repository notebooks

cp -R config/cloud9/environment/.c9/* .c9/

popd
