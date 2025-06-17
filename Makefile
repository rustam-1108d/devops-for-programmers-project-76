VAULT_PASS=--vault-password-file .vault_pass

prepare:
	ansible-playbook -i inventory.ini playbook.yml --tags prepare

deploy:
	ansible-playbook -i inventory.ini playbook.yml --tags deploy $(VAULT_PASS)

vault_encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml $(VAULT_PASS)

vault_decrypt:
	ansible-vault decrypt group_vars/webservers/vault.yml $(VAULT_PASS)

vault_edit:
	ansible-vault edit group_vars/webservers/vault.yml $(VAULT_PASS)
