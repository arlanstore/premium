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
  figlet Firdaus project | lolcat
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

echo " For this time, we have problem for check this service"
echo " Im sorry"
echo ""
