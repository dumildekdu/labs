#!/bin/sh

source ./common_env.sh

rm -v $LAB_DIR1/file_u?d? $LAB_DIR2/file_u?d?

rmdir -v $LAB_DIR1 $LAB_DIR2

userdel -r $LAB_USER1
userdel -r $LAB_USER2
userdel -r $LAB_USER3

groupdel $LAB_GROUP1
groupdel $LAB_GROUP2
