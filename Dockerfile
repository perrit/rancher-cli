FROM alpine as fetch
RUN ["/sbin/apk", "add", "--no-cache", "ca-certificates"]
RUN ["/usr/bin/wget", "-cO", "/tmp/rancher.tar.xz", "https://github.com/rancher/cli/releases/download/v2.0.6/rancher-linux-amd64-v2.0.6.tar.xz"]
RUN ["/bin/tar", "xf", "/tmp/rancher.tar.xz", "-C", "/tmp"]

FROM busybox
LABEL maintainer="Perrit B.V. <support@perrit.nl>"
COPY --from=fetch /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=fetch /tmp/rancher-v2.0.6/rancher /usr/local/bin/rancher
CMD ["/usr/local/bin/rancher", "--help"]
