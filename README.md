# docker-templates
Docker Templates

To install Netdata:
```bash
docker run -d --name=netdata \
  --hostname=oscar-server \
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
  -v /home/oscar/media/downloads/telegram:/downloads \
  -e "TELEGRAM_DAEMON_API_ID=API_ID" \
  -e "TELEGRAM_DAEMON_API_HASH=API_HASH" \
  -e "TELEGRAM_DAEMON_CHANNEL=CHANNEL_ID" \
  -e "TELEGRAM_DAEMON_DEST=/downloads" \
  -e "TELEGRAM_DAEMON_SESSION_PATH=/config" \
  --restart unless-stopped \
  alfem/telegram-download-daemon
```
