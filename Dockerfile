FROM scratch
ARG TARGETARCH
ADD trisquel-${TARGETARCH}.tar.xz /
CMD ["/bin/bash"]