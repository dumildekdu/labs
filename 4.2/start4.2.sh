#!/bin/sh

if [[ $# -ne 2 ]]; then
	echo 'Неверный набор аргументов! Ожидается: '
	echo $0 url1.org url2.com
	exit 1
fi

for i in `seq 1 3`; do ping $1 >/dev/null & done

for i in `seq 1 2`; do ping $2 >/dev/null & done
