#!/usr/bin/env bash

set -e

INSTALL=${INSTALL:-sudo apt-get install -y}

export DEBIAN_FRONTEND=noninteractive

log() {
	echo -e "\033[34m[bootstrapper] $* \033[0m"
}

log WE ARE $(whoami)

if [ "$EUID" -ne 0 ] ; then 
	log Escalating privileges..
	sudo "$0"
	exit 0
fi

# https://github.com/virtkick/virtkick-starter#first-run

apt-get update
$INSTALL git-core vim-nox tmux
git clone https://github.com/virtkick/virtkick-starter.git
cd virtkick-starter
./virtkick-start -dim
