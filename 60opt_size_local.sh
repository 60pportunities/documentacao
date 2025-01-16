#!/bin/bash
LOG_FILE="/Users/horaciovasconcellos/Downloads/disk_usage.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
DISK_USAGE=$(df -h)
REPOSITORY_USAGE=$(git-sizer > $LOG_FILE)
echo "Data: $DATE"        >> $LOG_FILE
echo "$DISK_USAGE"        >> $LOG_FILE
echo "$REPOSITORY_USAGE"  >> $LOG_FILE
echo "----------------------------------" >> $LOG_FILE
# Mensagem de sucesso
echo "Monitoramento de uso de disco registrado com sucesso"
