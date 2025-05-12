@echo off
setlocal enabledelayedexpansion

set "BACKUP_DIR=%USERPROFILE%\Desktop\Registry_Backup"
set "DATE_TIME=%date:~-4,4%-%date:~-7,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "DATE_TIME=%DATE_TIME: =0%"
set "BACKUP_FILE=%BACKUP_DIR%\registry_backup_%DATE_TIME%.reg"

:: Create backup directory if it doesn't exist
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

echo ===================================================
echo        Audio Registry Backup and Restore Tool
echo ===================================================
echo.

if "%1"=="restore" goto restore

:backup
echo Creating registry backup before applying audio optimizations...
echo This may take a moment...

:: Create backup of all registry keys that will be modified by the optimizer
echo Windows Registry Editor Version 5.00 > "%BACKUP_FILE%"

:: Audio keys
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Audio" "%BACKUP_DIR%\audio.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Audio\AudioPolicy" "%BACKUP_DIR%\audiopolicy.reg" /y
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Audio" "%BACKUP_DIR%\cusraudio.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render" "%BACKUP_DIR%\mmdevices.reg" /y
reg export "HKEY_CURRENT_USER\Software\Microsoft\Multimedia\Audio" "%BACKUP_DIR%\multimedia.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbstor" "%BACKUP_DIR%\usbstor.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBXHCI\Parameters" "%BACKUP_DIR%\usbxhci.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Audiosrv" "%BACKUP_DIR%\audiosrv.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder" "%BACKUP_DIR%\audioendpoint.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AudioIsolationService" "%BACKUP_DIR%\audioiso.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" "%BACKUP_DIR%\priority.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "%BACKUP_DIR%\systemprofile.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" "%BACKUP_DIR%\taskprofile.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9\0d7e1197-0e77-49f8-9c63-decbfda8dca0" "%BACKUP_DIR%\power1.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Audio" "%BACKUP_DIR%\policyaudio.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Audio\DriverPolicies" "%BACKUP_DIR%\driverpolicies.reg" /y
reg export "HKEY_CURRENT_USER\Software\Microsoft\Multimedia\Audio\Effects" "%BACKUP_DIR%\audioeffects.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Audio\Spatial" "%BACKUP_DIR%\audiospatial.reg" /y
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Devices\AudioInput" "%BACKUP_DIR%\audioinput.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0d7e1197-0e77-49f8-9c63-decbfda8dca0" "%BACKUP_DIR%\power2.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture" "%BACKUP_DIR%\capture.reg" /y
reg export "HKEY_CURRENT_USER\Software\Microsoft\Multimedia\Audio\DeviceCpl" "%BACKUP_DIR%\devicecpl.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USB" "%BACKUP_DIR%\usb.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbhub\HubSettings" "%BACKUP_DIR%\usbhub.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "%BACKUP_DIR%\memory.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" "%BACKUP_DIR%\kernel.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Audio\StereoEnhancement" "%BACKUP_DIR%\stereo.reg" /y
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\DPC" "%BACKUP_DIR%\dpc.reg" /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Audio\AudioSessionAPI" "%BACKUP_DIR%\sessionapi.reg" /y

echo.
echo Registry backup completed successfully!
echo Backup saved to: %BACKUP_FILE%
echo.
echo You can restore these settings by running:
echo %~nx0 restore
echo.
goto end

:restore
echo Restoring registry settings from backup...
echo.

set "choice="
set /p choice="Are you sure you want to restore registry settings? (Y/N): "
if /i not "%choice%"=="Y" goto end

for %%f in ("%BACKUP_DIR%\*.reg") do (
    echo Restoring: %%~nxf
    regedit /s "%%f"
)

echo.
echo Registry settings restored successfully!
echo.
echo It's recommended to restart your computer for changes to take effect.
echo.
goto end

:end
pause 