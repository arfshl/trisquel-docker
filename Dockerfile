FROM scratch
ARG TARGETARCH
ADD /home/runner/work/trisquel-docker/trisquel-docker/${TARGETARCH}/trisquel-${TARGETARCH}.tar.gz /
CMD ["/bin/bash"]