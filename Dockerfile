FROM alpine as fetch
WORKDIR /tmp
RUN ["/sbin/apk", "add", "ca-certificates"]
RUN ["/usr/bin/wget", "-c", "https://github.com/rancher/cli/releases/download/v2.0.6-rc3/rancher-linux-amd64-v2.0.6-rc3.tar.gz"]
RUN ["/bin/tar", "xzf", "rancher-linux-amd64-v2.0.6-rc3.tar.gz"]

FROM busybox
LABEL maintainer="Perrit B.V. <support@perrit.nl>"
COPY --from=fetch /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=fetch /tmp/rancher-v2.0.6-rc3/rancher /usr/local/bin/rancher
