FROM scratch
ARG TARGETARCH
ADD ${TARGETARCH}/trisquel-${TARGETARCH}.tar.gz /
CMD ["/bin/bash"]