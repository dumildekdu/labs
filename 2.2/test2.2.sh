#!/bin/sh

source ./common_env.sh

df -h $WORKDIR

echo "Количество созданных файлов:"

ls -1 $WORKDIR | wc -l
