# GNU Emacs NSIS Windows Installer

This creates a Windows installer for Emacs using the [Nullsoft
Scriptable Install System][nsis] (NSIS).

## Build

Run `make` to build the installer:

    make

The Windows build is fetched from the main GNU mirror using `curl` and
converted into an installer.


[nsis]: http://nsis.sourceforge.net/
