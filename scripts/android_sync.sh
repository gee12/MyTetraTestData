#!/bin/sh

# переменные
DATADIR=$1
#DATADIR=$(pwd)
GITDIR=$2
LOGFILE="$DATADIR/scripts/android_sync.log"

# функции
log() {
   echo "$(date +""%d.%m.%Y\ %T"") === $@"
}

# перенаправляем вывод
exec 2>>$LOGFILE 1>>$LOGFILE

# вступление
echo ""
log "==============================================="
log "Changes from Android"

# выполнение команд
#log Command \"cd $GITDIR\"
cd $GITDIR

log Command \"git diff\"
git diff --name-status

log Command \"git add .\"
git add .

log Command \"git commit\"
curdate=$(date +"%d.%m.%Y %T")
git commit -a -v -m "Changes from Android - $curdate"

log Command \"git pull\"
git pull origin master

log Command \"git push\"
git push -v origin master
