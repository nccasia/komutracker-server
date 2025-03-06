.PHONY: init build

SHELL := /usr/bin/env bash

init:
	git pull
	git submodule update --init --recursive
	git submodule foreach --recursive git checkout master
	git submodule foreach --recursive git pull

init-poetry:
	pip install -U 'setuptools==65'
	pip install poetry

build:
	pip install -U packaging
	make --directory=aw-core build
	pip install -U packaging
	make --directory=aw-server build
	cd aw-webui && npm install && npm run build && cd ..