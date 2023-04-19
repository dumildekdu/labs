#!/bin/sh

# Немедленно выходим если какая-либо команда завершится ошибкой
set -e

source ./common_env.sh

if [ $(whoami) != 'root' ]; then
	echo 'Скрипт нужно запускать от имени суперпользователя!'
	exit 0
fi

for NEED in IMG_FILE MNT_POINT WORKDIR
do
	if [ -z ${!NEED} ]; then
		echo "Переменная $NEED не определена!"
		exit 1
	fi
done

trap 'echo "Не удалось подготовить окружение. Попробуйте выполнить ./reset2.sh ?"' ERR
truncate -s 2M $IMG_FILE
mkfs.ext2      $IMG_FILE
mkdir          $MNT_POINT
mount          $IMG_FILE $MNT_POINT
df -H          $MNT_POINT

echo

mkdir $WORKDIR

CTR=1

while true
do
	NEW_FILE=file_$CTR
        trap 'echo; exit 0' ERR
	dd if=/dev/zero of=$WORKDIR/$NEW_FILE bs=10K count=1 status=none

	CTR=$((CTR+1))
done
