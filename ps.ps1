# powershell script for run and check processes with argment
# author litao
# run first by administrator :
# set-executionpolicy remotesigned

# plz use ps1.ps1 to invoke this script

# log file
$logfile = "log\ps.log"
$logpath =  Split-Path $logfile
if (! (Test-Path $logpath) ) { mkdir $logpath } 

$timestr=get-date -uformat "%Y-%m-%d-%H-%M-%S"

function start_and_check_without_argment {
  $processArray = New-Object string[] ( $args.count)
  $argsArray = New-Object string[] ( $args.count)
  $pidArray = New-Object string[] ( $args.count )

  #parse cmd and run them
  for($j=0;$j -lt $args.count; $j++){      
    $processArray[$j] = $args[$j]  
    $pidArray[$j]  = [Diagnostics.Process]::Start($processArray[$j]).ID
    Write-Host $timestr " started process: " + $processArray[$j] + " PID: " +  $pidArray[$j]
    $timestr + " started process: " + $processArray[$j] + " PID: " +  $pidArray[$j] >> $logfile
    } 

  #check whether pids is exists, or run them
  while(1){    
    for($i=0;$i -lt $args.count; $i++) {    
      if(!(get-process -id $pidArray[$i] -ErrorAction silentlycontinue)) {
        $pidArray[$i] = [Diagnostics.Process]::Start($processArray[$i]).ID
        Write-Host $timestr " restart process: " + $processArray[$i]  + " PID: " +  $pidArray[$i] 
        $timestr + " restart process: " + $processArray[$i]  + " PID: " +  $pidArray[$i] >> $logfile
      }
    }

    # waits for 10 seconds    
    sleep 10
  }
}

function start_and_check_with_argment {  
  #check argments 
  if( ( $args.count -lt 2 ) -or ( $args.count %2 -gt  0)) {
  "Please check your argments, and run again."
  exit
  }

  $processArray = New-Object string[] ( $args.count/2)
  $argsArray = New-Object string[] ( $args.count/2)
  $pidArray = New-Object string[] ( $args.count/2 )
  $j = 0

  #parse cmd and argments and run then
  for($i=0;$i -lt $args.count; $i=$i+2) {      
    $processArray[$j] = $args[$i]
    $argsArray[$j] = $args[$i+1]     
    $pidArray[$j]  = [Diagnostics.Process]::Start($processArray[$j] , $argsArray[$j]).ID
    Write-Host $timestr " started process: " + $processArray[$j] + $argsArray[$j] + " PID: " +  $pidArray[$j]  
    $timestr + " started process: " + $processArray[$j] + $argsArray[$j] + " PID: " +  $pidArray[$j] >> $logfile      
    $j++        
  } 
  
  #check whether pids is exists, or run cmd with argment
  while(1){
    for($i=0;$i -lt $j; $i=$i+1) {    
      if( !(get-process -id $pidArray[$i] -ErrorAction silentlycontinue)){ 
        $pidArray[$i] = [Diagnostics.Process]::Start($processArray[$i] , $argsArray[$i]).ID
        Write-Host $timestr " restart process: " + $processArray[$i] + $argsArray[$i] + " PID: " +  $pidArray[$i] 
        $timestr + " restart process: " + $processArray[$i] + $argsArray[$i] + " PID: " +  $pidArray[$i] >> $logfile
      }
    }
  
    # waits for 10 seconds    
    sleep 10
  }
}


# usages like belows

#start_and_check_with_argment "notepad"  "d:\1.txt" "notepad" "d:\3.txt" "notepad"  "d:\5.txt" "notepad"  "d:\9.txt"

#start_and_check_without_argment "notepad" "calc" "cmd"