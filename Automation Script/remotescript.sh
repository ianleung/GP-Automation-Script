function pause(){
#custom pause function
   read -p "$*"
}

#variables
USERNAME=ileung 
echo $USERNAME

echo ""
if [ ! -d ~/projects ]
then
#create project directory	
	printf 'Making projects Folder in Your Current Directory: %s' "${PWD}" 
						   
	mkdir projects
else
	echo -e "\nProject directory already exists."
fi

if [ ! -f ~/.ssh/id_rsa ]
then
#create RSA public and private keys
	echo -e "\nPlease enter your Email Address to be used for your RSA Key:"
	read EMAIL

	ssh-keygen -t rsa -C "$EMAIL"
else
	echo -e "\nRSA key already exists."
fi

#attempting to ssh copy public key to git
ssh-copy-id -i ~/.ssh/id_rsa.pub 

#upload key to git-lab before proceeding, otherwise git clone will give access denied
echo -e "\nUpload your key into your Git-lab Account if you haven't done so already\n"
	pause 'Press [Enter] key to continue...'
	
cd ~/projects

if [ ! -d fling ]
then
#checkout files from git repository into projects folder
	git clone git@gitlab.fling.com:gpdev/www-fling-com.git fling
fi

if [ ! -d ~/sites ]
then
#create sites directory	
	mkdir ~/sites 	
else
	echo -e "\nSites directory already exists.\n"
fi

cd ~/sites

#create symlinks (can check if correct symlink)
ln -s projects/fling/api api.fling.com
ln -s projects/fling/admin admin.fling.com
ln -s projects/fling/web www.fling.com
ln -s projects/fling/lib lib


if [ ! -d ~/sites/log ]
then
#create log directory	
	mkdir ~/sites/log
	chmod -R a+w ~/sites/log
else
	echo -e "\nLog directory already exists."
fi

#creates/updates 'touches' files
cd ~/sites/lib/conf
touch api_custom.php
touch www_custom.php
touch mobile_custom.php
touch secure_custom.php

echo "<?php
error_reporting('E_STRICT');
ini_set('error_log', '/home/$USERNAME/sites/log/error.log');
define('API_LOG_DIR', '/home/$USERNAME/sites/log');
define('API_BASE_DIR', '/home/$USERNAME/sites/api.fling.com');
define('API_PACKAGES_DIR', '/home/$USERNAME/sites/lib/packages');" > api_custom.php

echo "<?php
error_reporting('E_STRICT');
ini_set('error_log','/home/$USERNAME/sites/log/error.log');
define('BASE_DIR', '/home/$USERNAME/sites');
define('WWW_LOG_DIR', '/home/$USERNAME/sites/log');
define('WWW_BASE_DIR', '/home/$USERNAME/sites/www.fling.com');
define('WWW_PACKAGES_DIR', '/home/$USERNAME/sites/lib/package');
define('DEV_DEBUG_HELPER', true);
define('DEV_SERVER', true);" > www_custom.php

echo "<?php
error_reporting('E_STRICT');
ini_set('error_log','/home/$USERNAME/sites/log/error.log');
define('BASE_DIR', '/home/$USERNAME/sites');
define('WWW_LOG_DIR', '/home/$USERNAME/sites/log');
define('WWW_BASE_DIR', '/home/$USERNAME/sites/mobile.fling.com');
define('WWW_PACKAGES_DIR', '/home/$USERNAME/sites/lib/package');
define('DEV_SERVER', true);" > mobile_custom.php

echo "<?php
error_reporting('E_STRICT');
ini_set('error_log','/home/$USERNAME/sites/log/error.log');
define('BASE_DIR', '/home/$USERNAME/sites');
define('WWW_LOG_DIR', '/home/$USERNAME/sites/log');
define('WWW_BASE_DIR', '/home/$USERNAME/sites/secure.fling.com');
define('WWW_PACKAGES_DIR', '/home/$USERNAME/sites/lib/package');" > secure_custom.php

pause 'Press [Enter] key to continue...'


cd ~/sites/admin.fling.com/include
touch custom_conf.php

echo "<?php
error_reporting('E_STRICT');
ini_set('error_log','/home/USERNAME/sites/log/error.log');
define('BASE_DIR', '/home/USERNAME/sites/admin.fling.com');
$_SERVER['PHP_AUTH_USER'] = 'USERNAME';" > custom_conf.php


echo -e "\nPlease edit specified code using Filezilla or another secure FTP before proceeding.\n"
pause 'Press [Enter] key to continue...'

#more symlinks
cd ~/projects/fling/admin
ln -s htpasswd htpasswd-local
ln -s /vol1/backup/fling-admin-images/pics/ pics

if [ ! -d ~/sites/lib/var/api ]
then
	mkdir ~/sites/lib/var/api
else
	echo -e "\nAPI directory already exists."
fi

#copying files that are generated
cp /usr/sites/lib/var/browse* ~/sites/lib/
cp /usr/sites/lib/var/api/qp.php ~/sites/lib/var/api/
cp /usr/sites/lib/var/*special_cams* ~/sites/lib/var/

exit