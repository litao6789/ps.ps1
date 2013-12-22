ps.ps1
======

Simple PowerShell Script to run and check processes for Windows, like supervisor for Linux.

If you use linux, please check http://supervisord.org/

If you use Windows, and would like python to do so, please check  https://github.com/limodou/Win32-Process-Watcher

FAQ
=====

__Q__: I can't run ps.ps1

__A__: we can't run powershell scripts by default securiyt policy. open  __PowerShell__ console with administrator privilege, and type

`set-executionpolicy remotesigne`

then answer `Y`, so we unlock this restrict.

After that you can run ps1 files by right click them, and choose __"Run with PowerShell"__ on context menu.


__Q__: I need to run __program1, program2, program3, program4__ and watch them.

__A__: Append __ps.ps1__ :
`start_and_check_without_argment "program1" "program2" "program3"  "program4"`

And then run __ps.ps1__ 

Q:How about this situation:

`program1 argment11 argment12 argment13`

`program2 argment21 argment22`

`program3 argment31`

A: Append to ps.ps1 :

`start_and_check_with_argment "program1" "argment11 argment12 argment13" "program2" "argment21 argment22" "program3" "argment31"`

And then run __ps.ps1__

Q:How about this situation:

`program1 `

`program2 argment2`

`program3`

`program4 argment41 argment42`

A: You need run two copy of ps.ps1, one invoke __start_and_check_without_argment__ function, the other one invoke __start_and_check_with_argment__ function.

`copy ps.ps1 ps1.ps1`

Append to ps.ps1:

`start_and_check_without_argment "program1" "program3"`

Append to ps1.ps1:

`start_and_check_with_argment  "program2" "argment2" "program4" "argment41 argment42"`

Then run __ps.ps1__ and __ps1.ps1__
