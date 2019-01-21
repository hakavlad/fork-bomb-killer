#
PREFIX = /

all:
	@ echo "Nothing to compile. Use: make install, make uninstall, make systemd"

install:
	install -d $(DESTDIR)/$(PREFIX)/usr/sbin
	install -m0755 ./fork-bomb-killer $(DESTDIR)/$(PREFIX)/usr/sbin/fork-bomb-killer
	
	install -d $(DESTDIR)/$(PREFIX)/lib/systemd/system
	install -m0644 ./fork-bomb-killer.service $(DESTDIR)/$(PREFIX)/lib/systemd/system/fork-bomb-killer.service
	
uninstall:
	# 'make uninstall' must not fail with error if systemctl is unavailable or returns error
	systemctl disable fork-bomb-killer.service || true
	rm -fv $(PREFIX)/usr/sbin/fork-bomb-killer
	
	rm -fv $(PREFIX)/lib/systemd/system/fork-bomb-killer.service
	
systemd:
	systemctl daemon-reload
	systemctl enable fork-bomb-killer.service
	systemctl restart fork-bomb-killer.service
