FROM chenchongbiao/baseimage-kasmvnc:deepinbeige

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE="deepin dde"

RUN \
  echo "**** add icon ****" && \
  curl -o \
    /kclient/public/icon.png \
    https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/webtop-logo.png && \
  echo "**** install packages ****" && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install -y \
    chromium \
    dde-api-proxy \
    dde-application-manager \
    dde-clipboard \
    dde-desktop \
    dde-shell \
    dde-file-manager \
    dde-launchpad \
    dde-permission-manager \
    dde-qt5integration \
    dde-qt6integration \
    dde-session\
    dde-session-shell \
    dde-session-ui \
    deepin-desktop-base \
    deepin-desktop-schemas \
    deepin-desktop-theme \
    deepin-gtk-theme \
    deepin-icon-theme \
    deepin-kwin-x11 \
    deepin-terminal \
    deepin-upgrade-manager \
    deepin-wallpapers-nonfree \
    startdde \
    deepin-osconfig \
    qml-module-qt-labs-platform \
    dde-desktop-plugins \
    dde-disk-mount-plugin \
    dde-file-manager-common-plugins \
    dde-file-manager-daemon-plugins \
    dde-file-manager-plugins \
    dde-file-manager-preview-plugins \
    dde-widgets \
    deepin-anything-server && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
VOLUME /config
