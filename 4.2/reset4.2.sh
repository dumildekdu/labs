#!/bin/sh

if [[ $# -lt 2 ]]; then
	echo 'Неверный набор аргументов! Ожидается: '
	echo $0 url1.org [url2.com]
	exit 1
fi

for url in $@
do
	for p in `pgrep -f 'ping\s+'$url`
	do
		kill $p
	done
done
