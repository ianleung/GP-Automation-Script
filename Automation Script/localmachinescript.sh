function pause(){
   read -p "$*"
}

LOCATION="/Users/Ian/Desktop"
USERNAME="ileung"
PASSWORD="AGr4@3t*zqhe123"

export PATH=$PATH:$LOCATION

echo Logging into remote SSH
cd $LOCATION

ssh -l $USERNAME -pw $PASSWORD -t backup3.wealthymen.com -m $LOCATION/remotescript.sh $USERNAME

echo 208.91.207.177 dev.fling.com >> $WINDIR/System32/Drivers/Etc/Hosts
echo 208.91.207.177 dev.mobile.fling.com >> $WINDIR/System32/Drivers/Etc/Hosts
echo 208.91.207.177 admin.fling.com >> %WINDIR%/System32/Drivers/Etc/Hosts
echo 208.91.207.177 $USERNAME.www.fling.com >> %WINDIR%/System32/Drivers/Etc/Hosts
echo 208.91.207.177 $USERNAME.api.fling.com >> %WINDIR%/System32/Drivers/Etc/Hosts
echo 208.91.207.177 $USERNAME.secure.fling.com >> %WINDIR%/System32/Drivers/Etc/Hosts
echo 208.91.207.177 $USERNAME.admin.fling.com >> %WINDIR%/System32/Drivers/Etc/Hosts
echo 208.91.207.177 $USERNAME.mobile.fling.com >> %WINDIR%/System32/Drivers/Etc/Hosts

pause 'Press [Enter] key to continue...'
