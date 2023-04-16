#!/bin/sh

echo "В репозитории (\"$(pwd)\") " \
$( find ../ -type f -name '*~' | wc -l ) \
'файла(ов) от vim'"'"'а'
