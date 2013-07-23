# GNU Emacs NSIS Windows Installer

This creates a Windows installer for Emacs using the
[Nullsoft Scriptable Install System](http://nsis.sourceforge.net/)
(NSIS).

## Download

 * [emacs-24.3-installer-i386.exe](http://skeeto.s3.amazonaws.com/emacs/emacs-24.3-installer-i386.exe)
 (48MB, [asc](http://skeeto.s3.amazonaws.com/emacs/emacs-24.3-installer-i386.exe.asc))

## Build

Just run `make` to build it,

    make

The Windows build is fetched from the main GNU mirror using `curl` and
converted into an installer.
