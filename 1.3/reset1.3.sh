#!/bin/sh
# Сценарий очистки результатов выполнения задания

rm my_file my_hist_file && echo 'рабочие файлы удалёны'

echo $? # вывод завершения последней операции
