@echo off
echo Boosting Your PC's Performance...

:: Disable unnecessary visual effects for better performance
echo Disabling visual effects...
SystemPropertiesPerformance.exe /pagefile

:: Set power plan to High Performance
echo Setting Power Plan to High Performance...
powercfg -s SCHEME_MIN

:: Disable sleep mode for performance (optional)
echo Disabling Sleep Mode...
powercfg -change standby-timeout-ac 0

:: Clear temporary files
echo Clearing temporary files...
del /q /f /s %TEMP%\*

:: Disable unnecessary startup programs using 'msconfig' (for faster boot)
echo Disabling unnecessary startup programs...
msconfig

:: Adjust CPU priority for foreground apps (this can help prioritize user tasks)
echo Setting CPU to prioritize foreground apps...
start "" /high

:: Enable System Performance Boost (Optional but can help on older systems)
echo Enabling maximum system performance boost...
bcdedit /set disabledynamictick yes

:: Clean up disk space
echo Cleaning up disk space...
cleanmgr /sagerun:1

:: Optimize hard drive (if using HDD)
echo Defragmenting Hard Drive...
defrag C: /O

:: Clear browser cache (for Chrome, Firefox, Edge)
echo Clearing browser cache...
del /q /f /s "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*"
del /q /f /s "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*\cache2\*"
del /q /f /s "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*"

:: Disable indexing for faster file access
echo Disabling Windows indexing service...
sc stop "wuauserv" 
sc config "wuauserv" start= disabled

:: Update GPU drivers (using NVIDIA driver update as example, adjust for AMD)
echo Checking for GPU Driver Update...
start "" "C:\Program Files\NVIDIA Corporation\NVIDIA Update Core\nvupdate.exe"

:: Close unnecessary background apps to free resources
echo Closing unnecessary background apps...
taskkill /F /IM "Skype.exe"
taskkill /F /IM "OneDrive.exe"
taskkill /F /IM "Dropbox.exe"
taskkill /F /IM "Steam.exe"
taskkill /F /IM "Discord.exe"

:: Clear system logs to free up space
echo Clearing system logs...
wevtutil cl Application
wevtutil cl System
wevtutil cl Security

:: Display current system performance stats
echo Displaying system performance...
systeminfo | findstr /C:"Total Physical Memory"
systeminfo | findstr /C:"Available Physical Memory"

:: Done
echo PC Performance Boost Complete!
pause
