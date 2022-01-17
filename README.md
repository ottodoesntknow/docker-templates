# docker-templates
Docker Templates

To install Notifiarr:
```bash
docker run -d --privileged --name=notifiarr \
  --hostname=server \
  -l local.notifiarr.port.19999=Connection \
  -p 5454:5454 \
  -v /var/run/utmp:/var/run/utmp \
  -v /etc/sudoers:/etc/sudoers \
  -v /var/lib/docker/volumes/config/notifiarr:/config \
  -v /home/server/media:/media \
  -e "PUID=1000" \
  -e "PGID=1000" \
  -e "UMASK=002" \
  -e "TZ=Europe/Madrid" \
  -e "TMPDIR=/config/tmp" \
  --restart always \
  golift/notifiarr
```

To install Netdata:
```bash
docker run -d --name=netdata \
  --hostname=server \
  -l local.yacht.port.19999=WebUI \
  -p 19999:19999 \
  -v /var/lib/docker/volumes/config/netdata:/etc/netdata \
  -v /var/lib/docker/volumes/config/netdata/lib:/var/lib/netdata \
  -v /var/lib/docker/volumes/config/netdata/cache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -e "PGID=998" \
  --restart always \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata
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
