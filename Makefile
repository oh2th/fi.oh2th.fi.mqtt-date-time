install:
    install -m 755 your_script.pl /usr/local/bin/your_script
    install -m 644 your_script.service /etc/systemd/system/your_script.service
    systemctl daemon-reload
    systemctl enable your_script.service
    systemctl start your_script.service

uninstall:
    systemctl stop your_script.service
    systemctl disable your_script.service
    rm -f /usr/local/bin/your_script
    rm -f /etc/systemd/system/your_script.service
    systemctl daemon-reload

.PHONY: install uninstall
