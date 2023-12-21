help:
	@cat Makefile

pull:
	@git pull

savetogit: git.pushall
git.pushall: git.commitall
	@git push
git.commitall: git.addall
	@if [ -n "$(shell git status -s)" ] ; then git commit -m 'saving'; else echo '--- nothing to commit'; fi
git.addall:
	@git add .

apt.install:
	@sudo apt update
	@sudo apt install -y ulogd2 ulogd2-sqlite3 sqlite3
edit:
	@nvim ./configs/ulogd.conf
install:
	@sudo cp -vfb ./configs/ulogd.conf /etc/ulogd.conf
sysedit:
	@sudo nvim /etc/ulogd.conf
db.reset:
	@./scripts/re-create-bootlog.sh
	@./scripts/re-create-mainlog.sh
	@./scripts/re-create-alterlog.sh

bootlog:
	@./scripts/monitor.sh /var/log/ulog/bootlog-sqlt3.db ./sqlt3-schm/bootlog.sql
monitor:
	@./scripts/monitor.sh /var/log/ulog/mainlog-sqlt3.db ./sqlt3-schm/mainlog.sql

status:
	@sudo systemctl status ulogd2
restart:
	@sudo systemctl restart ulogd2
