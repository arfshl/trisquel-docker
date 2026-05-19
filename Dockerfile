FROM scratch
ARG TARGETARCH
ADD trisquel-${TARGETARCH}.tar.gz /
CMD ["/bin/bash"]