FROM alpine as fetch
RUN wget -cO /tmp/rancher.tar.gz https://github.com/rancher/cli/releases/download/v2.0.6-rc3/rancher-linux-amd64-v2.0.6-rc3.tar.gz
RUN tar xzf /tmp/rancher.tar.gz

FROM busybox
COPY --from=fetch /rancher-v2.0.6-rc3/rancher /usr/local/bin/rancher