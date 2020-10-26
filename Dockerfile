FROM ubuntu:18.04

ARG USER_ID
ARG GROUP_ID

# Add user to sudoers
RUN apt-get update && apt-get install -y sudo
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN adduser user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

# Install SDK deps
RUN sudo apt-get update && sudo apt-get install -y \
    bash-completion \
    libgconf-2-4 \
    libcanberra-gtk-module \
    locales \
    netcat \
    iproute2 \
    iputils-ping \
    iptables \
    dnsutils \
    network-manager \
    openssh-server \
    usbutils \
    libgtk-3-0 \
    libx11-xcb-dev \
    libxss-dev \
    libnss3 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    lsb-release \
    nodejs \
    npm

COPY sdkmanager_1.3.1-7110_amd64.deb /
COPY entrypoint.sh /entrypoint.sh
RUN sudo apt-get install -y /sdkmanager_1.3.1-7110_amd64.deb

ENTRYPOINT [ "/entrypoint.sh" ]
