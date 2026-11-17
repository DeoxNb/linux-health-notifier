#!/bin/bash

echo "Instalando Linux Health Notifier..."

# Dar permisos de ejecución al monitor
chmod +x monitor.sh

# Obtener la ruta absoluta del script
RUTA_SCRIPT=$(readlink -f monitor.sh)

# Agregar la tarea a cron (se ejecuta cada 5 minutos)
# Verifica primero que no exista ya para no duplicarla
(crontab -l 2>/dev/null | grep -v "$RUTA_SCRIPT"; echo "*/5 * * * * $RUTA_SCRIPT") | crontab -

echo "✅ Instalación completada. El sistema se monitorizará cada 5 minutos."
