@ECHO OFF 
ECHO Thanks For Using DrPanayioths Tooler.//////// To oti to kanei me ena click magiko > "G:\BATCH\Test.txt"

netsh interface ip add dns name="Ethernet" addr=1.1.1.2
netsh interface ip add dns name="Ethernet" addr=1.0.0.2 index=2
netsh interface ipv6 add dnsserver "Ethernet" 2606:4700:4700::1112
ipconfig /flushdns

powercfg -s e9a42b02-d5df-448d-aa00-03f14749eb61


start "" https://christitus.com/windows-tool/
start "" powershell.exe




pause
exit /b 0
