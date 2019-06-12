.PHONY: homebrew

install: galaxy-install homebrew

galaxy-install:
	ansible-galaxy install -r requirements.yml

homebrew:
	ansible-playbook --ask-become-pass -i ./hosts playbook.yml -vvv
