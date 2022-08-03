#!/bin/bash

printf "\033c"

if [ "$(id -u)" != "0" ]; then
	echo -e "\n---------------------------------------------------------------------------------\n"
	echo -e "Bitte nur als root verwenden!\n"
	echo "sudo ${0}"
	echo -e "\n---------------------------------------------------------------------------------"
	exit 1
fi

DEPENDENCIES="xz-utils git screen nano wget"
dpkg -s $DEPENDENCIES &>/dev/null
if [ $? -ne 0 ]; then
	echo -e " folgende pakete werden installiert:\n"
	for DEPENDENCY in $DEPENDENCIES; do
		echo "- $DEPENDENCY"
	done
	echo ""
	read -r -p "Bitte Gebe 'Ja' ein um den download zu erlauben! Andernfals wird das script bendet!: " ANSWER
	if [ "$ANSWER" == "Ja" ]; then
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
    wget cdn.prokiemc.de/fivem-script/de/server.cfg
    mkdir -p /home/FiveM/help
    cd /home/FiveM/help
    wget wget cdn.prokiemc.de/fivem-script/de/infomationen.txt
		if [ $? -ne 0 ]; then
			echo -e "\n---------------------------------------------------------------------------------\n"
			echo "Ein Fehler ist aufgetreten! Versucheernuert!"
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
      wget cdn.prokiemc.de/fivem-script/de/server.cfg
      mkdir -p /home/FiveM/help
      cd /home/FiveM/help
      wget wget cdn.prokiemc.de/fivem-script/de/infomationen.txt
			if [ $? -ne 0 ]; then
				echo "Fehler Konte nicht behoben werden! Script Wird Bendet!"
				exit 1
			fi
		fi
	else
		echo "Deine Antwort war \"$ANSWER\" und nicht ja. Deswegen wird das script nun Bendet."
		exit 1
    echo -e "\n---------------------------------------------------------------------------------"
    echo "---------------------------------------------------------------------------------"
    echo -e "---------------------------------------------------------------------------------\n"
    echo "DEIN FIVEM SERVER WURDE ERFOLGREICH INSTALLIERT"

    echo -e "\n---------------------------------------------------------------------------------"
    echo "---------------------------------------------------------------------------------"
    echo -e "---------------------------------------------------------------------------------\n"

echo "Dein Server wird noch nicht funktioniren, du musst erst noch einstellungen vornehmen!"
echo -e "\n---------------------------------------------------------------------------------\n"

echo "Dein Server findest du unter /home/FiveM/"

echo "Diese dinge musst du noch tun:"

echo "1. Bearbeite die datei server.cfg mit nano /home/FiveM/server-data/server.cfg und ersetze unten bei sv_licenseKey changeme mit deinem key"
echo "Einen neuen key kanst du unter: https://keymaster.fivem.net/ generiren lassen, soltest du bereits einen key besitzen kannst du ihn dort auch verwalten!"

echo "2. Erstelle einen steam web api key unter https://steamcommunity.com/dev/apikey und gebe ihn wie folgt in die server.cfg ein (KEINEN NEUN EINTRAG ERSTELLEN! UNTEN IST BEREITS EIN EINTRAG!)"
echo "Der eintrag steam_webApiKey sollte dan so aussehen: set steam_webApiKey "Dein key  hier"! "

echo "3. Jetzt musst du nurnoch deinen server namen und deine beschreibung anpassen! dies kannst du ebenfals in der server.cfg datei machen! nano /home/FiveM/server-data/server.cfg"

echo "4. Speichere deine server.cfg mit strg + S und verlasse die datei mit strg + x"


echo "Du hast die wichtigsten einstellungen gemacht! Wenn du Hilfe brauchst findest du hier webseiten und unseren discord:"
echo "FiveM Forum:https://forum.cfx.re/"
echo "FiveM Dokumentation:https://docs.fivem.net/docs/server-manual/setting-up-a-server-vanilla/#linux "
echo "Unser Discord: Comming Soon"
echo "Du hast Probleme erstelle ein issue auf github!: https://github.com/Luxuscraft-Studios-Japan/FiveM-Iinstall-script/issues/new/choose"

echo "Diese Infomationen samt den anderen wurden ebenfals gespeichert unter /home/FiveM/help/"
echo -e "\n---------------------------------------------------------------------------------\n"

IP=$(host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has address" | awk '{ print $NF }')

echo "Dies ist die IP-Adresse und Port deines FiveM Servers!:"
echo -e "\n---------------------------------------------------------------------------------\n"

echo "$IP:30120"

echo -e "\n---------------------------------------------------------------------------------\n"
echo "Danke, dass Sie unser Skript verwenden! Bitte hinterlasse eine Bewertung! https://sites.google.com/view/luxuscraftstudiosjapan/projects/fivem"
cd /home/FiveM/
wget https://github.com/Luxuscraft-Studios-Japan/FiveM-Iinstall-script/blob/b30760697c008fb712b0a6f3e475d9f34bec1bec/start.sh
chmod -R 777 start.sh
echo "Um Deinen Server richtig zu starten, verwende das Skript start.sh und nicht run.sh!"
echo "So startest du Dein Server ./start.sh (wenn du in /home/FiveM bist)"
echo "Wenn du dich außerhalb deines fivem-Ordners befindest, verwende den folgenden Befehl: ./home/FiveM/start.sh"
echo -e "\n---------------------------------------------------------------------------------\n"
