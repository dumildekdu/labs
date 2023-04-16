#!/bin/sh

LAB_CMD="find ../ -type f -name '*~'"

if [[ $NO_TILDA_PLS ]]; then
	echo -e "Удаляю файлы:\n"
	rm -vi `eval $LAB_CMD`
else
	echo -e "Запустите скрипт так:\n\nNO_TILDA_PLS=1 $0\n\n...если хотите удалить файлы:\n"
	eval $LAB_CMD

fi
