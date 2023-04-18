#!/bin/sh

source ./common_env.sh

umount $MNT_POINT
rmdir  $MNT_POINT
rm -f  $IMG_FILE

# Скрипт из рабочей тетради не отработает, потому что мы не можем отмонтировать
# каталог с которым работаем

# cd /mnt/new_disk/
# rm -rf *
# umount /mnt/new_disk
# rm    /tmp/my_sys_2M.img
# rmdir /mnt/new_disk
