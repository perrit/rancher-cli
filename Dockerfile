FROM alpine as fetch
RUN apk add ca-certificates
RUN wget -cO /tmp/rancher.tar.gz https://github.com/rancher/cli/releases/download/v2.0.6-rc3/rancher-linux-amd64-v2.0.6-rc3.tar.gz
RUN tar xzf /tmp/rancher.tar.gz

FROM busybox
COPY --from=fetch /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=fetch /rancher-v2.0.6-rc3/rancher /usr/local/bin/rancher
