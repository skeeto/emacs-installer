.POSIX:
ARCH      = x86_64
MAJOR     = 26
MINOR     = 1
VERSION   = $(MAJOR).$(MINOR)
FETCH_URL = https://ftp.gnu.org/gnu/emacs/windows/emacs-$(MAJOR)

emacs-$(VERSION)-installer-$(ARCH).exe: emacs-$(VERSION)/ emacs.nsi
	makensis -DVERSION=$(VERSION) -DARCH=$(ARCH) emacs.nsi

emacs-$(VERSION)/: emacs-$(VERSION)-$(ARCH).zip
	unzip -o -d $@ emacs-$(VERSION)-$(ARCH).zip

emacs-$(VERSION)-$(ARCH).zip:
	curl -LO $(FETCH_URL)/emacs-$(VERSION)-$(ARCH).zip

clean:
	rm -rf emacs-$(VERSION) emacs-$(VERSION)-installer-$(ARCH).exe

distclean: clean
	rm -f emacs-$(VERSION)-$(ARCH).zip
