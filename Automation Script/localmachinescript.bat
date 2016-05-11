set location="C:\Users\Ian\Desktop"
set username=ileung
set password=AGr4@3t*zqhe123

set PATH=%location%;%PATH%
echo Logging into remote SSH
cd %location%

REM echo USERNAME=%username% > temp.txt
REM type remotescript.sh>>temp.txt
REM del remotescript.sh
REM rename temp.txt remotescript.sh

plink -l %username% -pw %password% -t backup3.wealthymen.com -m  %location%\remotescript.sh REM %username%

echo 208.91.207.177 dev.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts
echo 208.91.207.177 dev.mobile.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts
echo 208.91.207.177 admin.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts
echo 208.91.207.177 %username%.www.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts
echo 208.91.207.177 %username%.api.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts
echo 208.91.207.177 %username%.secure.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts
echo 208.91.207.177 %username%.admin.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts
echo 208.91.207.177 %username%.mobile.fling.com >> %WINDIR%\System32\Drivers\Etc\Hosts

pause
