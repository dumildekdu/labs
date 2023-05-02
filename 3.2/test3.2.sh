#!/bin/sh

source ./common_env.sh

# USER2

echo "$LAB_DIR1 $LAB_DIR2" |
    grep "'" &&
    echo 'Потенциально опасное содержимое в одной из $LAB_DIR*' &&
    exit 1

su -l $LAB_USER2 -c "

cd '$LAB_DIR1' &&
touch file_u2d1 &&
whoami && echo 'создал(а) файл в каталоге ' && pwd &&

cd '$LAB_DIR2' && touch file_u2d2 &&
    echo \$(whoami) 'создал(а) файл в каталоге' \$(pwd) &&
    echo"

# USER1

su -l $LAB_USER1 -c "
cd '$LAB_DIR1' &&
    whoami && echo 'доступ к файлу в каталоге ' && pwd &&
    cp file_u2d1 file_u1d1 &&
echo \$?

cd '$LAB_DIR2' &&
    echo \$(whoami) 'создал(а) файл в каталоге' \$(pwd) &&
    cp file_u2d2 file_u1d2 &&
echo \$?
echo"

# USER3

su -l $LAB_USER3 -c "
cd '$LAB_DIR2' &&
        touch file_u3d2 &&
        whoami && echo 'создал(а) файл в каталоге' && pwd &&

cd '$LAB_DIR1' &&
        touch file_u3d1 &&
        echo \$(whoami) 'создал(а) файл в каталоге' \$(pwd) &&
        cp file_u3d2 file_u1d2

echo \$? "
