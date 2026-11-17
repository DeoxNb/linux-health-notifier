# Linux Health Notifier 🐧📊

Un sistema de automatización ligero para Linux que monitoriza los recursos del servidor (Disco y RAM) y envía alertas automáticas a través de Webhooks (Discord/Slack) cuando los niveles alcanzan un umbral crítico.

## Características
- **Cero dependencias:** Escrito en Bash puro usando herramientas nativas (`df`, `free`, `awk`, `curl`).
- **Automatizado:** Se integra directamente con `cron`.
- **Notificaciones en tiempo real:** Envía avisos push a tu canal de mensajería preferido.

## Instalación y Uso

1. Clona este repositorio:
   `git clone https://github.com/TU_USUARIO/linux-health-notifier.git`
2. Edita `monitor.sh` y añade la URL de tu Webhook en la variable `WEBHOOK_URL`.
3. Ejecuta el instalador:
   `./install.sh`

## ¿Por qué este proyecto?
Creado para resolver el problema real de las caídas silenciosas de servidores por saturación de logs (disco lleno) o fugas de memoria, automatizando la respuesta preventiva.
