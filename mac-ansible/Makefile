.PHONY: homebrew

install: galaxy-install playbook

galaxy-install:
	ansible-galaxy install -r requirements.yml

playbook:
	ansible-playbook --ask-become-pass -i ./hosts playbook.yml -u tom
