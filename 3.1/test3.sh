#!/bin/sh

# USER2

su -l user2 -c '
cd /srv/dir1
touch file_u2d1
whoami && echo "создал(а) файл в каталоге " && pwd
cd /srv/dir2

touch file_u2d2

echo "`whoami` создал(а) файл в каталоге `pwd`" '

# USER1

su -l user1 -c '
cd /srv/dir1/

whoami && echo "доступ к файлу в каталоге " && pwd
cp file_u2d1 file_u1d1

echo $?

cd /srv/dir2/

echo "`whoami` создал(а) файл в каталоге `pwd`"

cp file_u2d2 file_u1d2

echo $? '

# USER3

su -l user3 -c '
cd /srv/dir2
touch file_u3d2
whoami && echo "создал(а) файл в каталоге" && pwd

cd /srv/dir1

touch file_u3d1

echo "`whoami` создал(а) файл в каталоге `pwd`"

cp file_u3d2 file_u1d2

echo $? '
