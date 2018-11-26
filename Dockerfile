FROM alpine as fetch
RUN ["/sbin/apk", "add", "ca-certificates"]
RUN ["/usr/bin/wget", "-cO", "/tmp/rancher.tar.gz", "https://github.com/rancher/cli/releases/download/v2.0.6-rc3/rancher-linux-amd64-v2.0.6-rc3.tar.gz"]
RUN ["/bin/tar", "xzf", "/tmp/rancher.tar.gz", "-C", "/tmp"]

FROM busybox
LABEL maintainer="Perrit B.V. <support@perrit.nl>"
COPY --from=fetch /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=fetch /tmp/rancher-v2.0.6-rc3/rancher /usr/local/bin/rancher
CMD ["/usr/local/bin/rancher", "--help"]
