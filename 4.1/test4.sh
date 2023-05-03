#!/bin/sh

echo "ping по адресу ya.ru"
pgrep -f ya.ru | wc -l

echo "ping по адресу yandex.ru"
pgrep -f yandex.ru | wc -l

