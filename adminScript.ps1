#set alias
Set-Alias wh Write-Host
Set-Alias rh Read-Host
$host.ui.RawUI.WindowTitle = "Admin Script"
 
#clear Screen
cls
 
write-host "  
     ___________________________
    !\_________________________/!\
    !!PS C:> .\adminScript.ps1 !! \
    !!                         !!  \
    !!                         !!  !
    !!                         !!  !
    !!                         !!  !
    !!                         !!  !
    !!                         !!  !
    !!                         !!  /
    !!_________________________!! /
    !/_________________________\!/
       __\_________________/__/!_
      !_______________________!/ )
    ________________________    (__
   /oooo  oooo  oooo  oooo /!   _  )_
  /ooooooooooooooooooooooo/ /  (_)_(_)
/ooooooooooooooooooooooo/ /    (o o)
/_______________________/_/    ==\o/==

  "
 
$option = rh "
PRESS 'Ctrl + c' to back out into regular powershell
 
    A = Active Directory
    S = System Center Configuration Manager
    R = Remote Menu // rr = mstsc.exe // Combine R with number for shortcut
    T = Task Manager(Admin)
    I = Internet Explorer
    O = Open new powershell window
  CMD = Open new command prompt window as admin
  ISE = Powershell ISE
   LS = Opens notepad with other useful unlisted commands
   AD = query AD for computer to see if it exist
  USB = format and copy ISO to USB
 
  Enter "
  
 
# function re-runs script after each entry
function runagain {
c:\ldoc\adminScript.ps1
}
 
 
<#
# Netping // pings entire subnet and writes log to c:\temp\netping.csv
function netping {
write-host "" > c:\temp\netping.csv
Invoke-Item C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe | netpinger
}
#>
 
 
 
# remote function // clears screen and directs user to remote (mstsc.exe) menu
function remote {
clear-host
$remOption = rh "
1 = mstsc /v: #computerName
2 = mstsc /v: #computerName
3 = mstsc /v: #computerName
4 = mstsc /v: #computerName
 
Enter blank option to exit
 
Enter Number "
if ($remOption -eq "1"){
    mstsc /v: #computerName
    runagain
    }
    if ($remOption -eq "2") {
    mstsc /v: #computerName
    runagain 
    }
    if ($remOption -eq "3") {
    mstsc /v: #computerName
    }
    if ($remOption -eq "4") {
    mstsc /v: #computerName
    runagain
    }
    if ($remOption -eq "print") {
    mstsc /v: #computerName
    runagain
    }
    else{
    runagain
    }
}
 
foreach ($patato in $option) {
    if ($patato -eq "A"){
    dsa.msc
    runagain
    }
    if ($patato -eq "S"){
    $confLocation = "C:\Program Files (x86)\ConfigMgr\bin\"
    Set-Location $confLocation
    start Microsoft.ConfigurationManagement.exe
    Set-Location C:\scripts
    runagain
    }
    if ($patato -eq "r"){
    remote
    runagain
    }
    if ($patato -eq "rr"){
    mstsc.exe
    runagain
    }
    if ($patato -eq "r1"){
    mstsc /v: #computerName
    runagain
    }
    if ($patato -eq "r2") {
    mstsc /v: #computerName
    runagain 
    }
    if ($patato -eq "r3") {
    mstsc /v: #computerName
    }
    if ($patato -eq "r4") {
    mstsc /v: #computerName
    runagain
    }
    if ($patato -eq "T"){
    taskmgr.exe
    runagain
    }
    if ($patato -eq "I"){
    start iexplore.exe
    runagain
    }
    if ($patato -eq "O"){
    Invoke-Item C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
    runagain
    }
    if ($patato -eq "cmd"){
    Invoke-Item C:\Windows\System32\cmd.exe
    runagain
    }
    if ($patato -eq "ise"){
    Invoke-Item C:\Windows\System32\WindowsPowerShell\v1.0\powershell_ise.exe
    runagain
    }
    #this command was for other shortcut commands that I did not want to crowd up the screen. 
    if ($patato -eq "ls"){
    notepad C:\temp\lsCommands.txt
    runagain
    }
    if ($patato -eq "ad"){
    $adcomputer = rh "what is the computer name? "
    $getem = get-adcomputer $adcomputer
    wh $getem
    sleep 5
    runagain
    }
    if ($patato -eq "ko"){
    kill -Name OUTLOOK -Force
    runagain
    }
    if ($patato -eq "stop"){
    Stop-Service winrm
    runagain
    }
    if ($patato -eq "start"){
    Start-Service winrm
    runagain
    }
 
    ######
    # start of commands unlisted in menu
    #####
    else{
    wh "Invalid Option"
    Sleep 3
    runagain
    }
 
    
}
 