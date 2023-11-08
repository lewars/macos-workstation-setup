# macos-workstation Makefile
SHELL = /bin/bash
PYTHON_VERSION=3.12

install-brew:
	hash brew || /bin/bash -c \
		"$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

venv:
	hash pip || brew install python$(PYTHON_VERSION)
	python3 -m pip install --user virtualenv
	python3 -m virtualenv $@

venv-deps: install-brew venv
	source venv/bin/activate && \
		python3 -m pip install --upgrade pip wheel virtualenv && \
		python3 -m pip install ansible
.PHONY: venv-deps

setup: install-brew venv-deps
	source venv/bin/activate && \
		ansible-playbook -i ansible/inventory -vv --become-password-file ~/.become.txt ansible/playbook.yml
.PHONY: setup

test:
	true # work in progress
.PHONY: test

clean:
	rm -fr venv
.PHONY: clean
