#!/bin/sh
#init
#automated set-up for new employees
#Global Personals LLC, by Ian Leung

function pause(){
   read -p "$*"
}
printf 'Making projects Folder in Your Current Directory: %s\n' "${PWD}" 
						   
mkdir projects

echo "Please enter your Email Address to be used for your RSA Key:"
read email

ssh-keygen -t rsa -C "$email"

echo "Uploading your key into your Git-lab Account"
pause 'Press [Enter] key to continue...'
	
exec ssh-agent bash
ssh-add ~/.ssh/$keyname
#need to add public key to your git lab account
		
cd ~/projects
git clone git@gitlab.fling.com:gpdev/www-fling-com.git fling

mkdir ~/sites 
cd ~/sites
ln -s projects/fling/api api.fling.com
ln -s projects/fling/admin admin.fling.com
ln -s projects/fling/web www.fling.com
ln -s projects/fling/lib lib
	
mkdir ~/sites/log
chmod -R a+w ~/sites/log

cd ~/sites/lib/conf
touch api_custom.php
touch www_custom.php
touch mobile_custom.php
touch secure_custom.php

cd ~/sites/admin.fling.com/include
touch custom_conf.php

echo "Please add specified code using Filezilla or another secure FTP to the touched files"
pause 'Press [Enter] key to continue...'
#not secure to do it over putty, 
#paste the codes into the files you touched

cd ~/projects/fling/admin
ln -s htpasswd htpasswd-local
ln -s /vol1/backup/fling-admin-images/pics/ pics

exit

#edit your host files

pause 'Press [Enter] key to continue...'
	
$SHELL