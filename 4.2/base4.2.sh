#!/bin/sh

if [[ $# -lt 2 ]]; then
	for p in `pgrep -f 'ping\s+'$1`
	do
		kill $p
	done
else
	echo 'Неверный набор аргументов! Ожидается: '
	echo $0 url1.org
	exit 1
fi

