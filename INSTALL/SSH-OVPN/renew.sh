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
read -p "    Username       :  " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "    Day Extend     :  " Days
echo ""
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
echo -e ""
echo -e "  #Extended days for user =-"
echo -e "  ============================================" | lolcat
echo -e "   Username        :  $User"
echo -e "   Days Added      :  $Days Days"
echo -e "   Expired on      :  $Expiration_Display"
echo -e ""
else
echo -e ""
echo -e "           $(tput setaf 1)Username Doesnt Exist!$(tput sgr 0)       "
sleep 2
clear
renew
fi
