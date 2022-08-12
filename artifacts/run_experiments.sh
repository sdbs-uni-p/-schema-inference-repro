#!/bin/bash

(
	cd $HOME/implementation
	pipenv run python3.9 deco_experiments.py $1 && printf "\nFinished.\nResults are in $HOME/results\n"
)
