SHELL := /bin/bash

.PHONY: install help

install:
	bash ./install.sh

help:
	@echo "make install - copy all repository files to HOME with backup"

