PROJECT=bank
PYTHON=.env/bin/python
PIP=.env/bin/pip

setup: create-env update-env

create-env:
	virtualenv --python=python3 --no-site-packages .env

update-env:
	${PIP} install -U -r requirements.txt
