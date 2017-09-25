THISDIR=$(dir $(lastword $(MAKEFILE_LIST)))
TOPDIR=$(shell source $(THISDIR)/config.sh && echo "$$topdir")

all: $(notdir $(wildcard $(TOPDIR)/modules/*)) ;

platform:
	@echo Configuring platform.
	@./add_hp_and_bootstrap.sh

%::
	@echo Generating $@.
	@./deps2.sh $@ $^

389-ds: platform networking-base perl python3 python3-ecosystem bind

apache-commons: platform java

autotools: platform perl 

bind: platform python3 python3-ecosystem

cloud-init: platform python3 python3-ecosystem

fonts: platform

freeipa: platform java perl 389-ds bind krb5 sssd samba pki tomcat resteasy httpd  python2 python2-ecosystem python3 python3-ecosystem

GNOME: platform X11-base

hardware-support: platform

httpd: platform python2 python2-ecosystem

installer: platform hardware-support X11-base python3 python3-ecosystem networking-base perl # GNOME

java: platform fonts X11-base

krb5: platform

networking-base: platform perl python3 python3-ecosystem

perl: platform

pki: platform java tomcat resteasy apache-commons

postgresql: platform

python2: platform fonts X11-base

python2-ecosystem: platform python2

python3-bootstrap: platform fonts

python3-ecosystem-bootstrap: platform

python3-ecosystem: platform python3

python3: platform fonts X11-base

resteasy: platform java apache-commons

ruby: platform

samba: platform python2 python2-ecosystem

sssd: platform samba python3 python3-ecosystem

systemtap: platform perl 

tomcat: platform java apache-commons

udisks2: platform krb5 python3

X11-base: platform fonts perl autotools
