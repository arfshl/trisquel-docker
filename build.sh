# export the env
export RELEASE=aramo
case "$ARCH" in
    armhf) ARCH_DOCKER=arm ;;
    ppc64el) ARCH_DOCKER=ppc64le ;;
    arm64) ARCH_DOCKER=arm64 ;;
    amd64) ARCH_DOCKER=amd64 ;;
esac
echo "RELEASE=$RELEASE" >> "$GITHUB_OUTPUT"
echo "ARCH=$ARCH" >> "$GITHUB_OUTPUT"

# install depedencies
curl -L -o /tmp/mmdebstrap.deb http://ftp.us.debian.org/debian/pool/main/m/mmdebstrap/mmdebstrap_1.5.7-3_all.deb
sudo apt install -yq /tmp/mmdebstrap.deb
curl -L -o /tmp/keyring.deb http://ftp.us.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2025.1_all.deb
sudo apt install -yq /tmp/keyring.deb
curl -L -o /tmp/trisquelkey.deb https://archive.trisquel.org/trisquel/pool/main/t/trisquel-keyring/trisquel-keyring_2023.02.07_all.deb
sudo apt install -yq /tmp/trisquelkey.deb

# start build with mmdebstrap
dist_version="$RELEASE"
sudo mmdebstrap \
    --arch=$ARCH \
    --variant=apt \
    --components="main" \
    --include=trisquel-keyring,locales,passwd,software-properties-common,ca-certificates \
    --format=tar \
    ${dist_version} \
    trisquel-$ARCH_DOCKER.tar.xz \
    "deb http://archive.trisquel.org/trisquel ${dist_version} main" \
    "deb http://archive.trisquel.org/trisquel ${dist_version}-updates main" \
    "deb http://archive.trisquel.org/trisquel ${dist_version}-security main" \
    "deb http://archive.trisquel.org/trisquel ${dist_version}-backports main"
