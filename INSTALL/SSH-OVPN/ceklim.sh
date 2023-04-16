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

echo "============================================" | lolcat
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "   -=USER WHO VIOLATE THE MAXIMUM LIMIT=-";
echo " ";
cat /root/log-limit.txt
else
echo " ";
echo "      No user has committed a violation";
fi
echo " ";
echo " ";
echo "============================================" | lolcat
echo " ";
echo "          {b}  $(tput setaf 2)BACK$(tput sgr 0)    {x}  $(tput setaf 1)EXIT$(tput sgr 0)"
echo " ";
read -rp "    Choose : " back
echo ""
case $back in
b | B | BACK | back)
tessh
;;
*)
HOME
;;
esac
