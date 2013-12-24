#get absolutely path of this file
$x = Split-Path -Parent $MyInvocation.MyCommand.Definition

# uncomment below two lines to run programs with argments
#. ( $x + "\ps.ps1" ) 
#start_and_check_with_argment "notepad"  "d:\1.txt" "notepad" "d:\3.txt" "notepad"  "d:\5.txt" "notepad"  "d:\9.txt"

# uncomment below two lines to run programs without argments
#. ( $x + "\ps.ps1" ) 
#start_and_check_without_argment "notepad" "calc" "cmd"