#!/bin/sh

for p in `pgrep -f ya.ru`
do
	kill $p
done
