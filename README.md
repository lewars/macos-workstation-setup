# MacOS Workstation Setup

Install and configure your macOS workstation with essential development tools

## Description

The repository contains scripts to configure and install development
tools for your macOS workstation. This is accomplished
by leveraging tools like Ansible and Homebrew.

The development tools and software that this project installs can be
found in the ansible playbook.

All tools will be installed via Homebrew.

If you want to customize this list, please do. Remove any packages
that you don't like and add any packages that you do.

## Getting Started

```
git clone https://github.com/lewars/macos-workstation-setup
make setup
```

## Test and Development

If you want to test and develop this project, fork and clone your
repository. Once you do, follow the instructions below.

### Test

The automation steps are executed on a macOS VM created via HashiCorp
Packer and ran on a qemu (WIP).

```
make venv-deps
make test
```

### Dependencies

* QEMU >= 7.0.0.1
* MacOS >= 10.5 (Catalina).
* Homebrew >= 3.5.6
