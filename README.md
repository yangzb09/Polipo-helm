## Polipo Proxy Usage

Polipo is a tool to transfer socks to http, in case we meet SOFTWARE does not support sock5 protocol.

# RUN docker directly:
```bash
docker run -d \
-e SSR_HOST=<IP of ssr service> \
-e SSR_PORT=<port of ssr service>\
-p 1080:38321 yangzb09/zbpo:0.2 
```
The service exposes 1080 http port for proxy

# RUN SSR & Polipo via docker-compose:
```bash
docker-compose -f zbproxy.yml pull
docker-compose -f zbproxy.yml -d up
```
# RUN Polipo via helm

coming soon

# Setting docker to use proxy:
```bash
# vim /usr/lib/systemd/system/docker.service.d/proxy.conf 
[Service]
Environment="HTTPS_PROXY=http://192.168.26.1:1080/"
Environment="HTTP_PROXY=http://192.168.26.1:1080/"
Environment="NO_PROXY=localhost,127.0.0.1/32,10.0.0.0/8,172.16.0.0/16,192.168.1.0/24"
#systemctl reload-daemon docker.service
#systemctl restart docker.service
```
[Issue about socks5 proxy support](https://github.com/moby/moby/issues/16083)

Setting github to use proxy
```bash
git config --global http.proxy 'http://192.168.26.1:1080'
git config --global https.proxy 'http://192.168.26.1:1080'
```

# Setting shell environment to use proxy
```shell
vim ~/.bash_profile
export https_proxy=http://192.168.26.1:1080
export http_proxy=http://192.168.26.1:1080
export NO_PROXY=192.168.0.0/16,localhost,127.0.0.1/32,master.hostname.example.com,10.0.0.0/8,172.16.0.0/16
```
