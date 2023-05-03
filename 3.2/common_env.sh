#!/bin/sh

if [ $(whoami) != 'root' ]; then
	echo 'Скрипт необходимо запускать от имени суперпользователя!'
	exit 1
fi

if [[ $# -ne 5 ]]; then
	echo 'Неверный набор аргументов! Ожидается: '
	echo $0 group1 group2 user1 user2 user3
	exit 1
fi

TOP_LVL_DIR=/srv
LAB_DIR1=$TOP_LVL_DIR/dir1
LAB_DIR2=$TOP_LVL_DIR/dir2

LAB_GROUP1=$1
LAB_GROUP2=$2

LAB_USER1=$3
LAB_USER2=$4
LAB_USER3=$5
