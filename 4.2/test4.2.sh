#!/bin/sh

if [[ $# -ne 2 ]]; then
	echo 'Неверный набор аргументов! Ожидается: '
	echo $0 url1.org url2.com
	exit 1
fi

echo "ping по адресу $1"
pgrep -fa 'ping\s+'$1 | wc -l

echo "ping по адресу $2"
pgrep -fa 'ping\s+'$2 | wc -l
