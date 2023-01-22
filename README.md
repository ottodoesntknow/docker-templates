# docker-templates
Docker Templates

To install Portainer:
```bash
docker run -d --name=portainer \
  -l swag=enable \
  -p 9443:9443 \
  --net themysteryshack \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes/config/portainer:/data \
  --restart always \
  portainer/portainer-ce:latest
```
