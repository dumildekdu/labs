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
		exit 0
	fi
done

trap 'echo "Не удалось подготовить окружение. Попробуйте выполнить ./reset2.sh ?"' EXIT
truncate -s 2M $IMG_FILE
mkfs.ext2      $IMG_FILE
mkdir          $MNT_POINT
mount          $IMG_FILE $MNT_POINT
df -H          $MNT_POINT

mkdir $WORKDIR

for CTR in {1..9000}
do
	NEW_FILE=file_$CTR
        trap 'echo "Не удалось создать: $NEW_FILE"' EXIT
	touch $WORKDIR/$NEW_FILE 2>/dev/null
done
