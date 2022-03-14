FROM fedora:35

RUN dnf -y install \
man-db \
vim \
git \
ansible \
helm \
podman \
buildah \
podman-compose \
podman-docker \
podman-plugins \
make \
passwd \
sudo \
procps-ng \
iputils \
iproute \
findutils \
ncurses \
wget \
curl \
dnf-plugins-core \
dnf-utils \
findutils \
tar \
zip \
the_silver_searcher \
iputils \
iproute \
bind-utils \
htop \
shadow-utils \
origin-clients \
openssh-clients \
sshuttle \
openssh-askpass \
source-to-image \
net-tools \
pgp-tools \
gcc \
openssl \
openssl-devel \
slirp4netns \
fuse-overlayfs \
&& dnf clean all

RUN groupadd -g 1003 wslg

RUN useradd -G wheel -g 1003 -u 1003 wslu

COPY root /

RUN chmod 777 /boot-command.bash

RUN chown -R wslu:wslg /home/wslu

RUN bash /home/wslu/install-golang.bash
RUN bash /home/wslu/install-kubebuilder.bash

RUN chown -R wslu:wslg /home/wslu

USER wslu

RUN bash /home/wslu/install-operator-sdk.bash
RUN bash /home/wslu/install-golangci-lint.bash

WORKDIR /home/wslu
