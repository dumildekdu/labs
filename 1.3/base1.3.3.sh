#!/bin/sh

echo Список файлов, которые можно удалить:
find ../ -type f -name '*.*~' -not -path '*/.*'
