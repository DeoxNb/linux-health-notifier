#!/bin/bash

# ==========================================
# Configuración
# ==========================================
# Reemplaza con tu Webhook de Discord/Slack
WEBHOOK_URL="AQUI_TU_WEBHOOK_URL" 

UMBRAL_DISCO=85 # Porcentaje máximo de disco
UMBRAL_RAM=90   # Porcentaje máximo de RAM

# ==========================================
# Recolección de Métricas
# ==========================================
# Obtiene el porcentaje de uso de la partición principal (/)
USO_DISCO=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Obtiene el porcentaje de uso de RAM
USO_RAM=$(free | awk '/Mem/ {printf("%3.0f", $3/$2 * 100)}')

# ==========================================
# Lógica de Alertas
# ==========================================
MENSAJE=""

if [ "$USO_DISCO" -ge "$UMBRAL_DISCO" ]; then
    MENSAJE="⚠️ *ALERTA:* Uso de disco crítico al ${USO_DISCO}%\n"
fi

if [ "$USO_RAM" -ge "$UMBRAL_RAM" ]; then
    MENSAJE="${MENSAJE}⚠️ *ALERTA:* Uso de RAM crítico al ${USO_RAM}%\n"
fi

# Si hay mensaje, enviar la alerta al Webhook
if [ -n "$MENSAJE" ] && [ "$WEBHOOK_URL" != "AQUI_TU_WEBHOOK_URL" ]; then
    curl -H "Content-Type: application/json" \
         -d "{\"content\": \"$(hostname) reporta:\n$MENSAJE\"}" \
         $WEBHOOK_URL
fi
