#!/bin/bash

###
# jupyter-lab.sh
#
# This script is intended to help you run jupyter lab on server.
#

###
# Conda parameters
#
CONDA_HOME=$HOME/miniconda3
CONDA_ENV=pipegap

unset XDG_RUNTIME_DIR
source $CONDA_HOME/etc/profile.d/conda.sh
conda activate $CONDA_ENV

jupyter lab --no-browser --ip=$(hostname -I) --port-retries=100
