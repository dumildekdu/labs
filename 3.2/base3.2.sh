#!/bin/sh

# Немедленно выходим если какая-либо команда завершится ошибкой
set -e

# Общие проверки, псевдонимы для $1 ... $5
source ./common_env.sh

groupadd $LAB_GROUP1
groupadd $LAB_GROUP2

adduser $LAB_USER1
adduser $LAB_USER2
adduser $LAB_USER3

gpasswd -a $LAB_USER1 $LAB_GROUP1

gpasswd -a $LAB_USER2 $LAB_GROUP1
gpasswd -a $LAB_USER2 $LAB_GROUP2

gpasswd -a $LAB_USER3 $LAB_GROUP2

for LAB_USR in $LAB_USER1 $LAB_USER2 $LAB_USER3
do
	echo "Пользователь $LAB_USR:"
	id $LAB_USR
done

mkdir $LAB_DIR1 $LAB_DIR2

chgrp $LAB_GROUP1 $LAB_DIR1
chgrp $LAB_GROUP2 $LAB_DIR2

chmod 2775 $LAB_DIR1 $LAB_DIR2

ls -la $TOP_LVL_DIR
