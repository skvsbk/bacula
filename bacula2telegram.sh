#!/bin/bash

TOKEN="408041858:AAFFFg1tDshK5Nd5mcflEyN0FSoMDfbQZWY"

which curl &>/dev/null
if [ $? -ne 0 ] ; then echo 'FAIL: curl not found.' && exit 1 ; fi
if [ $# -ne 3 ] ; then echo 'FAIL: Params not defined.' && echo 'Usage: bacula2telegram.sh TelegramID Subject Message' && exit 1 ; fi

CHAT_ID="$1"
SUBJECT="$2"
MESSAGE="$3"

curl -s --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"${CHAT_ID}\",\"text\":\"${SUBJECT}\n${MESSAGE}\"}" "https://api.telegram.org/bot$TOKEN/sendMessage"

#echo  "https://api.telegram.org/bot$TOKEN/sendMessage"


if [ $? -eq 0 ] ; then exit 1 ; fi

