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

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-pptp")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
	echo "       You have no existing clients!"
	sleep 3
	ltp
fi
echo " Press CTRL+C to return"
echo " Select the existing client you want to renew"
echo ""
echo " ============================================" | lolcat
grep -E "^### " "/var/lib/premium-script/data-user-pptp" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
        echo ""
	read -rp "       Select one client [1]: " CLIENT_NUMBER
        echo ""
else
        echo ""
	read -rp "       Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
        echo ""
fi
done
read -p "       Expired (days) : " masaaktif
user=$(grep -E "^### " "/var/lib/premium-script/data-user-pptp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/var/lib/premium-script/data-user-pptp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /var/lib/premium-script/data-user-pptp
echo ""
echo " PPTP Account Has Been Successfully Renewed"
echo " ==========================================" | lolcat
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo ""
