#!/bin/bash

printf "\033c"

if [ "$(id -u)" != "0" ]; then
	echo -e "\n---------------------------------------------------------------------------------\n"
	echo -e "ONLY USE ROOT OR SUDO\n"
	echo "sudo ${0}"
	echo -e "\n---------------------------------------------------------------------------------"
	exit 1
fi

DEPENDENCIES="xz-utils git screen nano wget"
dpkg -s $DEPENDENCIES &>/dev/null
if [ $? -ne 0 ]; then
	echo -e "For the FiveM server to work, the following packages must be installed\n"
	for DEPENDENCY in $DEPENDENCIES; do
		echo "- $DEPENDENCY"
	done
	echo ""
	read -r -p "Please enter 'Yes' to allow the download! Otherwise the script will end!: " ANSWER
	if [ "$ANSWER" == "Yes" ]; then
		apt-get update
		apt-get -y install $DEPENDENCIES
    mkdir -p /home/FiveM/server
    cd /home/FiveM/server
    wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5777-315653e9b3f712d6b478f143f23ff97017520df3/fx.tar.xz
    tar xf fx.tar.xz
    rm fx.tar.xz
    mkdir -p /home/FiveM/server-data
    cd /home/FiveM/server-data
    git clone https://github.com/citizenfx/cfx-server-data.git /home/FiveM/server-data
    wget cdn.prokiemc.de/fivem-script/server.cfg
    mkdir -p /home/FiveM/help
    cd /home/FiveM/help
    wget wget cdn.prokiemc.de/fivem-script/en/infomationen.txt
		if [ $? -ne 0 ]; then
			echo -e "\n---------------------------------------------------------------------------------\n"
			echo "An error has occurred! Will start again!"
			echo -e "\n---------------------------------------------------------------------------------\n"
			sleep 3
      apt-get update
      apt-get -y install $DEPENDENCIES
      mkdir -p /home/FiveM/server
      cd /home/FiveM/server
      wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5777-315653e9b3f712d6b478f143f23ff97017520df3/fx.tar.xz
      tar xf fx.tar.xz
      rm fx.tar.xz
      mkdir -p /home/FiveM/server-data
      cd /home/FiveM/server-data
      git clone https://github.com/citizenfx/cfx-server-data.git /home/FiveM/server-data
      wget cdn.prokiemc.de/fivem-script/server.cfg
      mkdir -p /home/FiveM/help
      cd /home/FiveM/help
      wget wget cdn.prokiemc.de/fivem-script/en/infomationen.txt
			if [ $? -ne 0 ]; then
				echo "Error could not be fixed! Script was killed!"
				exit 1
			fi
		fi
	else
		echo "Your ANSWER was \"$ANSWER\" and not Yes. Script was killed!"
		exit 1
    echo -e "\n---------------------------------------------------------------------------------"
    echo "---------------------------------------------------------------------------------"
    echo -e "---------------------------------------------------------------------------------\n"
    echo "YOUR FIVEM SERVER WAS SUCCESSFULLY INSTALLED"

    echo -e "\n---------------------------------------------------------------------------------"
    echo "---------------------------------------------------------------------------------"
    echo -e "---------------------------------------------------------------------------------\n"

echo "Your server will not work yet, you have to make settings first!"
echo -e "\n---------------------------------------------------------------------------------\n"
echo "Your server can be found under /home/FiveM/"

echo "You still have to do these things:"

echo "1. Edit the file server.cfg with nano /home/FiveM/server-data/server.cfg and replace below at sv_licenseKey changeme with your key"
echo "You can get a new key generated at: https://keymaster.fivem.net/, if you already have a key you can also manage it there!"

echo "2. Create a steam web api key at https://steamcommunity.com/dev/apikey and enter it into the server.cfg as follows (DO NOT CREATE NEW ENTRY! BELOW IS ALREADY AN ENTRY!)"
echo "The steam_webApiKey entry should then look like this: set steam_webApiKey "Your key here" "

echo "3. Now all you have to do is change your server name and description! You can also do this in the server.cfg file! nano /home/FiveM/server-data/server.cfg"

echo "4. Save your server.cfg with ctrl + S and exit the file with ctrl + X"


echo "You have made the most important settings! If you need help, you can find websites and our discord here:"
echo "FiveM Forum:https://forum.cfx.re/"
echo "FiveM Documentation:https://docs.fivem.net/docs/server-manual/setting-up-a-server-vanilla/#linux "
echo "Our Discord: Coming Soon"
echo "You have problems create an issue on github!: https://github.com/Luxuscraft-Studios-Japan/FiveM-Iinstall-script/issues/new/choose"

echo "This information and the others were also saved under /home/FiveM/help/"
echo -e "\n---------------------------------------------------------------------------------\n"

IP=$(host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has address" | awk '{ print $NF }')

echo "This is the IP address and port of your FiveM server!:"
echo -e "\n---------------------------------------------------------------------------------\n"

echo "$IP:30120"

echo -e "\n---------------------------------------------------------------------------------\n"
echo -e "\n---------------------------------------------------------------------------------\n"

echo "Thanks for using our script! please leave a Review! https://sites.google.com/view/luxuscraftstudiosjapan/projects/fivem"
cd /home/FiveM/
wget https://github.com/Luxuscraft-Studios-Japan/FiveM-Iinstall-script/blob/b30760697c008fb712b0a6f3e475d9f34bec1bec/start.sh
chmod -R 777 start.sh
echo "To start your server properly use the start.sh script and not run.sh!"
echo "this is how you start your server ./start.sh (if ud is in /home/FiveM)"
echo "if you are outside your fivem folder use the following command: ./home/FiveM/start.sh"
echo -e "\n---------------------------------------------------------------------------------\n"
