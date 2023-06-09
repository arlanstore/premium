#!/bin/bash

# Information owner this script
server_owner=https://raw.githubusercontent.com/arlanstore/premium/main

# Check permision access
  IPVPS=$(curl -s ipv4.icanhazip.com)
  IZIN=$(curl -s ${server_owner}/Autoscript/member_premium | grep ${IPVPS} | cut -d ' ' -f 1)
  if [[ $IPVPS = $IZIN ]]; then
  echo ""
  else
  clear
  figlet ARLAN project | lolcat
  echo ""
  echo "   AUTOSCRIPT HAS EXPIRED"
  echo ""
  echo "   THIS OWNER CONTACT   > WHATSAPP : +6283805933853"
  echo "                        > TELEGRAM : @arlanstore"
  echo "                        > EMAIL    : arlanvpnstore@gmail.com"
  echo ""
  echo "   THIS CREATOR CONTACT > WHATSAPP : +6283805933853"
  echo "                        > TELEGRAM : @arlanstore"
  echo "                        > EMAIL    : arlanvpnstore@gmail.com"
  echo ""
  exit 1
  fi

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr 0)

show_member(){
	clear
	echo "---------------------------------------------------"
	echo "|    USERNAME   |    EXP DATE   |     STATUS      |"
	echo "---------------------------------------------------"
	while read expired
	do
	AKUN="$(echo $expired | cut -d: -f1)"
	ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
	exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
	status="$(passwd -S $AKUN | awk '{print $2}' )"
		if [[ $ID -ge 1000 ]]; then
			if [[ "$status" = "L" ]]; then
			printf "%-17s %2s %-17s %2s \n" "  $AKUN" " $exp     " " ${RED}LOCKED${NORMAL}"
		else
			printf "%-17s %2s %-17s %2s \n" "  $AKUN" " $exp     " " ${GREEN}UNLOCKED${NORMAL}"
			fi
		fi
	done < /etc/passwd
	JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
	echo ""
	echo "---------------------------------------------------"
	echo "  Total Accounts Registered : $(tput setaf 2)$JUMLAH user$(tput sgr 0)"
	echo "---------------------------------------------------"
	echo ""
	echo "   ${RED} use {ctrl+c} to cancel!${NORMAL}"
}

delete_member(){
	echo -e ""
	read -p "    Username SSH to Delete  : " Pengguna
	echo -e ""
	if [[ "$Pengguna" = "" ]]; then
		echo -e "    $(tput setaf 1)Please Enter a Name!$(tput sgr 0)"
		delete_member
	elif getent passwd $Pengguna > /dev/null 2>&1; then
		userdel $Pengguna
		echo -e "    $(tput setaf 1)User $Pengguna was removed. $(tput sgr 0)"
		exit 1
	else
		echo -e "    $(tput setaf 1)Failure User $Pengguna is Not Exist. $(tput sgr 0)"
		delete_member
	fi
}

show_member ; delete_member