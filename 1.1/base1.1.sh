#!/bin/sh
# Сценарий записи системной информации в файл
# Лабораторная работа № 1

date      >  my_file
pwd       >> my_file
whoami    >> my_file
uname -sr >> my_file
