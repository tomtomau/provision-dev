.PHONY: homebrew

install: galaxy-install homebrew

galaxy-install:
	ansible-galaxy install -r requirements.yml

homebrew:
	ansible-playbook -i ./hosts playbook.yml
