#get absolutely path of this file
$x = Split-Path -Parent $MyInvocation.MyCommand.Definition

# uncomment below two lines to run programs with argments
#. ( $x + "\ps.ps1" ) 
#start_and_check_with_argment "notepad"  "c:\1.txt" "notepad" "c:\3.txt" "notepad"  "c:\5.txt" "notepad"  "c:\9.txt"

# uncomment below two lines to run programs without argments
#. ( $x + "\ps.ps1" ) 
#start_and_check_without_argment "notepad" "calc" "cmd"

# just for example
. ( $x + "\ps.ps1" ) 
#start_and_check_without_argment "notepad" "calc" "cmd"