# docker-templates
Docker Templates

To install plextraktsync:
```bash
docker run -d --name=plextraktsync \
  -v /var/lib/docker/volumes/config/plextraktsync:/app/config \
  ghcr.io/taxel/plextraktsync
```

To install plextraktsync-watch:
```bash
docker run -d --name=plextraktsync-watch \
  -v /var/lib/docker/volumes/config/plextraktsync:/app/config \
  --restart unless-stopped \
  ghcr.io/taxel/plextraktsync watch
```

To install telegram-download-daemon:
```bash
docker run --name=telegram-download-daemon \
  -v /var/lib/docker/volumes/config/telegram-download-daemon:/config \
  -v /home/server/media/downloads/telegram:/downloads \
  -e "TELEGRAM_DAEMON_API_ID=API_ID" \
  -e "TELEGRAM_DAEMON_API_HASH=API_HASH" \
  -e "TELEGRAM_DAEMON_CHANNEL=CHANNEL_ID" \
  -e "TELEGRAM_DAEMON_DEST=/downloads" \
  -e "TELEGRAM_DAEMON_SESSION_PATH=/config" \
  --restart unless-stopped \
  alfem/telegram-download-daemon
```
