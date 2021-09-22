#!/usr/bin/env python
# coding: utf-8

# to get the right reqs file: pipreqs ./spo

VENVS_DIR="PATH_TO_VENV"
VENV_NAME="spo"

# load module
module load python/3.7
module load gurobi/9.1.2
# check if the license is set
gurobi_cl 1> /dev/null && echo Success || echo Fail

# create virtual env
virtualenv --no-download $VENVS_DIR/$VENV_NAME
source $VENVS_DIR/$VENV_NAME/bin/activate
pip install --no-index --upgrade pip
pip install torch==1.7.0
pip install tqdm
pip install numpy
pip install Pyomo
pip install scipy
pip install pathos
pip install scikit_learn
pip install submitit

# install gurobipy
cp -r $GUROBI_HOME .
cd 9.1.2
python setup.py install
cd ..
rm -r 9.1.2

## execution
module load python/3.7
module load gurobi/9.1.2
source $VENVS_DIR/$VENV_NAME/bin/activate

# run . create_env.sh
