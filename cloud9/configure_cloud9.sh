#!/bin/bash

pushd ~/environment/

function create_repository () {
	if [ ! -d "$1" ]; then
		mkdir $1
		git clone "git@github.com:BioStrand/"$1".git" $1
	fi
}

create_repository notebooks

popd
