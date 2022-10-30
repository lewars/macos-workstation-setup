# macos-workstation Makefile
PKR_HCL=workstation.pkr.hcl

validate:
	packer validate $(PKR_HCL)
.PHONY: validate

build: validate
	packer build --force $(PKR_HCL)
.PHONY: build

venv:
	python3 -m pip install --user virtualenv
	python3 -m virtualenv $@

venv-deps: venv
	source venv/bin/activate && \
		python3 -m pip install --upgrade pip wheel virtualenv && \
		python3 -m pip install ansible
.PHONY: venv-deps

setup: venv-deps
	source venv/bin/activate && \
		ansible-playbook -i ansible/inventory -v -K ansible/playbook.yml
.PHONY: setup

test:
	true # work in progress
.PHONY: test

setup-vm:
	vagrant up
.PHONY: setup

clean:
	rm -fr venv
.PHONY: clean
