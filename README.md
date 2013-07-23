# GNU Emacs NSIS Windows Installer

This creates a Windows installer for Emacs using the
[Nullsoft Scriptable Install System](http://nsis.sourceforge.net/)
(NSIS). Just run `make` to build it,

    make

The Windows build is fetched from the main GNU mirror using `curl` and
converted into an installer.
