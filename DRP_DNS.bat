@ECHO OFF 
ECHO Thanks For Using DrPanayioths DNS Changer.

netsh wlan show interfaces | findstr "SSID" >nul
if %errorlevel%==0 (
    for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| findstr "SSID"') do (
        set "SSID=%%a"
        set "SSID=%SSID:~1%"
        echo Connected to Wi-Fi: %SSID%
        ECHO.

        netsh interface ip add dns name="%SSID%" addr=1.1.1.2
        netsh interface ip add dns name="%SSID%" addr=1.0.0.2 index=2
        netsh interface ipv6 add dnsserver "%SSID%" 2606:4700:4700::1112
    )
    ipconfig /flushdns
    powercfg -s e9a42b02-d5df-448d-aa00-03f14749eb61
) else (
    ECHO.
    echo Not connected to Wi-Fi.    
    echo Connected To Ethernet.
    ECHO.

    netsh interface ip add dns name="Ethernet" addr=1.1.1.2
    netsh interface ip add dns name="Ethernet" addr=1.0.0.2 index=2
    netsh interface ipv6 add dnsserver "Ethernet" 2606:4700:4700::1112
    ipconfig /flushdns
    powercfg -s e9a42b02-d5df-448d-aa00-03f14749eb61
)





pause
exit /b 0
