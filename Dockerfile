FROM scratch
ARG TARGETARCH
ADD trisquel-${TARGETARCH}.tar.xz /
CMD ["/bin/bash"]
LABEL org.opencontainers.image.title="trisquel"
LABEL org.opencontainers.image.description="Unofficial docker image for Trisquel GNU/Linux-Libre"
LABEL org.opencontainers.image.source="https://github.com/arfshl/trisquel-docker"
LABEL org.opencontainers.image.url="https://github.com/arfshl/trisquel-docker"
LABEL org.opencontainers.image.documentation="https://github.com/arfshl/trisquel-docker/blob/main/README.md"
LABEL org.opencontainers.image.licenses="GPL-3.0-or-later"