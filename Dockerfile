FROM scratch
ARG TARGETARCH
ADD debian-${TARGETARCH}.tar.gz /
CMD ["/bin/bash"]