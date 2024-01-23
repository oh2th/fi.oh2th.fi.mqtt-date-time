install:
	install -m 755 mqtt-date-time.pl /usr/local/bin/mqtt-date-time.pl
	install -m 644 mqtt-date-time.service /etc/systemd/system/mqtt-date-time.service
	systemctl daemon-reload
	systemctl enable mqtt-date-time.service
	systemctl start mqtt-date-time.service

uninstall:
	systemctl stop mqtt-date-time.service
	systemctl disable mqtt-date-time.service
	rm -f /usr/local/bin/mqtt-date-time.pl
	rm -f /etc/systemd/system/mqtt-date-time.service
	systemctl daemon-reload

.PHONY: install uninstall
