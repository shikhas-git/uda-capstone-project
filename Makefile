## The Makefile includes instructions on environment setup and lint tests
# Dockerfile should pass hadolint
# index.html should pass lint
# (Optional) Build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	#python3 -m venv ~/.devops

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./hadolint --disable=DL3007  Dockerfile
	
	
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	#pylint --disable=R,C,W1203 app.py

all: install lint test
