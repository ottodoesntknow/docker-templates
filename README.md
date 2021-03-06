# docker-templates
Docker Templates

To install yacht:
```bash
docker run -d --name=yacht \
  -l local.yacht.port.8000=WebUI \
  -l swag=enable \
  -l swag_auth=http \
  -p 8000:8000 \
  --net themysteryshack \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes/config/yacht:/config \
  --restart always \
  selfhostedpro/yacht
```

To install Notifiarr:
```bash
docker run -d --privileged --name=notifiarr \
  --hostname=themysteryshack \
  -l local.notifiarr.port.19999=Connection \
  -l swag=enable \
  -p 5454:5454 \
  --net themysteryshack \
  -v /var/run/utmp:/var/run/utmp \
  -v /etc/sudoers:/etc/sudoers \
  -v /var/lib/docker/volumes/config/notifiarr:/config \
  -v /home/server/media:/media \
  -v /tmp/notifiarr:/tmp \
  -e "PUID=1000" \
  -e "PGID=1000" \
  -e "UMASK=002" \
  -e "TZ=Europe/Madrid" \
  -e "TMPDIR=/tmp" \
  --restart always \
  golift/notifiarr
```

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
