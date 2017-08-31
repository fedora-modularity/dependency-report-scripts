THISDIR=$(dir $(lastword $(MAKEFILE_LIST)))
TOPDIR=$(shell source $(THISDIR)/config.sh && echo "$$topdir")

all: $(notdir $(wildcard $(TOPDIR)/modules/*)) ;

platform:
	@echo Configuring platform.
	@./add_hp_and_bootstrap.sh

%::
	@echo Generating $@.
	@./deps2.sh $@ $^

389-ds: platform platform-placeholder networking-base perl

autotools: platform perl platform-placeholder

bind: platform platform-placeholder

freeipa: platform platform-placeholder java perl 389-ds bind krb5 sssd samba pki tomcat resteasy httpd storage-devices

httpd: platform platform-placeholder

installer: platform platform-placeholder

java: platform platform-placeholder

krb5: platform platform-placeholder

networking-base: platform platform-placeholder

perl: platform platform-placeholder

pki: platform platform-placeholder java tomcat resteasy storage-devices

platform-placeholder: platform

postgresql: platform platform-placeholder

python2: platform platform-placeholder

python3-bootstrap: platform platform-placeholder

python3-ecosystem-bootstrap: platform platform-placeholder

python3-ecosystem: platform platform-placeholder

python3: platform platform-placeholder

resteasy: platform platform-placeholder

ruby: platform platform-placeholder

samba: platform platform-placeholder

sssd: platform platform-placeholder samba

storage-devices: platform platform-placeholder

storaged: platform platform-placeholder

systemtap: platform perl platform-placeholder

tomcat: platform platform-placeholder

X11-base: platform platform-placeholder
