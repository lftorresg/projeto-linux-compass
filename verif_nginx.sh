#!/bin/bash

# Diretório e arquivos de log
DIR_SCRIPT=$(dirname "$(realpath "$0")")
DIR_LOG="${DIR_SCRIPT}/logs"
LOG_ONLINE="${DIR_LOG}/status_online.log"
LOG_OFFLINE="${DIR_LOG}/status_offline.log"

# Garantir que o diretório de log existe
if [ ! -d "$DIR_LOG" ]; then
    echo "Criando diretório de logs em: $DIR_LOG"
    mkdir -p "$DIR_LOG"
    chmod 755 "$DIR_LOG"
fi

# Verificar o status do Nginx
SERVICO="nginx"
DATA_HORA=$(date "+%d-%m-%Y %H:%M:%S")

if systemctl is-active --quiet "$SERVICO"; then
    STATUS="ONLINE"
    MENSAGEM="O serviço $SERVICO está em execução."
    echo "$DATA_HORA | $SERVICO | $STATUS | $MENSAGEM" >> "$LOG_ONLINE"
else
    STATUS="OFFLINE"
    MENSAGEM="O serviço $SERVICO não está ativo ou está com problemas."
    echo "$DATA_HORA | $SERVICO | $STATUS | $MENSAGEM" >> "$LOG_OFFLINE"
fi

echo "Status registrado: $STATUS"
