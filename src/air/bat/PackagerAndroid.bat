@echo off
if not exist %CERT_FILE% goto certificate

:: Package Android
echo.
echo Packaging %AIR_NAME%-android.apk...
call adt -package -target apk-debug %SIGNING_OPTIONS% air/%AIR_NAME%-android.apk "application.xml" %FILE_OR_DIR%
goto end

:certificate
echo.
echo Certificate not found: %CERT_FILE%
echo.
echo Troubleshooting: 
echo - generate a default certificate using 'bat\CreateCertificate.bat'
echo.
if %PAUSE_ERRORS%==1 pause
exit

:failed
echo AIR setup creation FAILED.
echo.
echo Troubleshooting: 
echo - did you build your project in FlashDevelop?
echo - verify AIR SDK target version in %APP_XML%
echo.
if %PAUSE_ERRORS%==1 pause
exit

:end
echo.