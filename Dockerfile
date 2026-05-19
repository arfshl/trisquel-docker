FROM scratch
ARG TARGETARCH
ADD /home/runner/work/trisquel-docker/trisquel-docker/trisquel-${TARGETARCH}.tar.gz /
CMD ["/bin/bash"]