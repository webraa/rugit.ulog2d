help:
	@cat Makefile
ulog.config:
	@sudo nvim /etc/ulogd.conf
proposed.config:
	@nvim ./etc/ulogd.conf
install.config:
	@sudo cp -v ./etc/ulogd.conf /etc/
reset.sqlt:
	@./scripts/create-table.sh
restart:
	@sudo systemctl restart ulogd2; sudo systemctl status ulogd2
install:
	@sudo apt install -y ulogd2 ulogd2-sqlite3 sqlite3
pull:
	@git pull
savetogit:
	@git add . && git commit -m 'saving' && git push
