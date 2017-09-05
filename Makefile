THISDIR=$(dir $(lastword $(MAKEFILE_LIST)))
TOPDIR=$(shell source $(THISDIR)/config.sh && echo "$$topdir")

all: $(notdir $(wildcard $(TOPDIR)/modules/*)) ;

platform:
	@echo Configuring platform.
	@./add_hp_and_bootstrap.sh

%::
	@echo Generating $@.
	@./deps2.sh $@ $^

389-ds: platform platform-placeholder networking-base perl storage-devices python3 python3-ecosystem

apache-commons: platform platform-placeholder

autotools: platform perl platform-placeholder

bind: platform platform-placeholder python3 python3-ecosystem

fonts: platform platform-placeholder

freeipa: platform platform-placeholder java perl 389-ds bind krb5 sssd samba pki tomcat resteasy httpd storage-devices python2 python2-ecosystem python3 python3-ecosystem

hardware-support: platform platform-placeholder

httpd: platform platform-placeholder

installer: platform platform-placeholder hardware-support

java: platform platform-placeholder fonts

krb5: platform platform-placeholder

networking-base: platform platform-placeholder perl python3 python3-ecosystem

perl: platform platform-placeholder

pki: platform platform-placeholder java tomcat resteasy storage-devices apache-commons

platform-placeholder: platform

postgresql: platform platform-placeholder

python2: platform platform-placeholder fonts

python2-ecosystem: platform platform-placeholder python2

python3-bootstrap: platform platform-placeholder fonts

python3-ecosystem-bootstrap: platform platform-placeholder

python3-ecosystem: platform platform-placeholder python3

python3: platform platform-placeholder

resteasy: platform platform-placeholder java apache-commons

ruby: platform platform-placeholder

samba: platform platform-placeholder

sssd: platform platform-placeholder samba python3 python3-ecosystem

storage-devices: platform platform-placeholder perl python2 python2-ecosystem

systemtap: platform perl platform-placeholder

tomcat: platform platform-placeholder java apache-commons

udisks2: platform platform-placeholder krb5 python3

X11-base: platform platform-placeholder
