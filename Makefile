VERSION = 24.3
FETCH_URL = http://ftp.gnu.org/gnu/emacs/windows

emacs-$(VERSION)-installer-i386.exe : emacs-$(VERSION)-bin-i386.zip
	unzip -o $^
	makensis -DVERSION=$(VERSION) emacs.nsi

emacs-$(VERSION)-bin-i386.zip :
	curl -O $(FETCH_URL)/emacs-$(VERSION)-bin-i386.zip

.PHONY : clean dist-clean

clean :
	rm -rf emacs-24.3 *.exe

dist-clean : clean
	rm *.zip
