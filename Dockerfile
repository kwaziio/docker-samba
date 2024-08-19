######################################################
# Build-Time Arguments for the Docker Runtime Engine #
######################################################

ARG IMAGE=kwaziio/ubuntu
ARG TAG=latest

############################
# Ubuntu Base Docker Image #
############################

FROM ${IMAGE}:${TAG}

################################################
# Copies Configuration Scripts to Docker Image #
################################################

ARG SCRIPTS_DEST_DIR=/scripts
ENV SCRIPTS_DEST_DIR=${SCRIPTS_DEST_DIR}

ARG SCRIPTS_SRC_DIR=./scripts
ENV SCRIPTS_SRC_DIR=${SCRIPTS_SRC_DIR}

COPY ${SCRIPTS_SRC_DIR}/ ${SCRIPTS_DEST_DIR}/
RUN chmod +x ${SCRIPTS_DEST_DIR}/*

######################################################
# Disables Interactivity for the Image Build Process #
######################################################

ENV DEBIAN_FRONTEND=noninteractive

#######################################################
# Updates and Installs Operating System (OS) Packages #
#######################################################

RUN ${SCRIPTS_DEST_DIR}/install-packages.sh

############################################
# Uploads Default Samba Configuration File #
############################################

COPY resources/smb.conf /etc/samba/smb.conf

#######################################################
# Enables Interactivity for Debian Frontend Processes #
#######################################################

ENV DEBIAN_FRONTEND=

###########################
# Declares Required Ports #
###########################

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

#################################
# Updates Default Image Command #
#################################

CMD [ "/scripts/start.sh" ]
