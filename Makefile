# macos-workstation Makefile

install-brew:
	hash brew || /bin/bash -c \
		"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

venv:
	hash pip || sudo brew install python3-pip
	python3 -m pip install --user virtualenv
	python3 -m virtualenv $@

venv-deps: install-brew venv
	source venv/bin/activate && \
		python3 -m pip install --upgrade pip wheel virtualenv && \
		python3 -m pip install ansible
.PHONY: venv-deps

setup: install-brew venv-deps
	source venv/bin/activate && \
		ansible-playbook -i ansible/inventory -K -v ansible/playbook.yml
.PHONY: setup

test:
	true # work in progress
.PHONY: test

clean:
	rm -fr venv
.PHONY: clean
