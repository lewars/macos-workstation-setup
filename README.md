# MacOS Workstation Setup

Install and configure your macOS workstation with essential development tools

## Description

The repository contains scripts to configure and install development
tools for your macOS workstation from scratch. This is accomplished
by leveraging tools like Ansible, Homebrew, and to some extent,
Packer.

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
* Packer >= 1.8.2
* MacOS >= 10.5 (Catalina).
* Homebrew >= 3.5.6

**Note 1:** This project may work on earlier versions of macOS, but it
has not been tested.

**Note 2:** At this time, this will not work on
Windows. Hopefully, it will be implemented soon.

## Help

This project is brand new! If you run into any issues or bugs, please
notify me (Alistair Y. Lewars) or create a GitHub issue here with a
detailed description of the problem. I will look into it and fix
it. Lastly, pull requests are welcome.
