#!/bin/bash

##############################
# Global Samba Configuration #
##############################

SAMBA_DNS_PROXY=${SAMBA_DNS_PROXY:-"no"}
SAMBA_MAP_TO_GUEST=${SAMBA_MAP_TO_GUEST:-"bad user"}
SAMBA_SECURITY=${SAMBA_SECURITY:-"user"}
SAMBA_SERVER_STRING=${SAMBA_SERVER_STRING:-"Samba Server"}
SAMBA_WORKGROUP=${SAMBA_WORKGROUP:-"WORKGROUP"}

##################################
# Samba File Share Configuration #
##################################

SHARE_BROWSABLE=${SHARE_BROWSABLE:-"yes"}
SHARE_DIRECTORY=${SHARE_DIRECTORY:-"/srv/samba/shared"}
SHARE_GUEST_OK=${SHARE_GUEST_OK:-"yes"}
SHARE_PERMISSIONS=${SHARE_PERMISSIONS:-"777"}
SHARE_READ_ONLY=${SHARE_READ_ONLY:-"no"}
SHARE_WRITABLE=${SHARE_WRITABLE:-"yes"}

####################################
# Updates Samba Configuration File #
####################################

echo "Updating Global Samba Configuration..."
sed -i "s/SAMBA_DNS_PROXY/${SAMBA_DNS_PROXY}/g" /etc/samba/smb.conf
sed -i "s/SAMBA_MAP_TO_GUEST/${SAMBA_MAP_TO_GUEST}/g" /etc/samba/smb.conf
sed -i "s/SAMBA_SECURITY/${SAMBA_SECURITY}/g" /etc/samba/smb.conf
sed -i "s/SAMBA_SERVER_STRING/${SAMBA_SERVER_STRING}/g" /etc/samba/smb.conf
sed -i "s/SAMBA_WORKGROUP/${SAMBA_WORKGROUP}/g" /etc/samba/smb.conf

##########################################
# Updates Samba File Share Configuration #
##########################################

echo "Updating Samba File Share Configuration..."
sed -i "s/SHARE_BROWSABLE/${SHARE_BROWSABLE}/g" /etc/samba/smb.conf
sed -i "s/SHARE_DIRECTORY/${SHARE_DIRECTORY}/g" /etc/samba/smb.conf
sed -i "s/SHARE_GUEST_OK/${SHARE_GUEST_OK}/g" /etc/samba/smb.conf
sed -i "s/SHARE_READ_ONLY/${SHARE_READ_ONLY}/g" /etc/samba/smb.conf
sed -i "s/SHARE_WRITABLE/${SHARE_WRITABLE}/g" /etc/samba/smb.conf

##########################################
# Initializes Samba File Share Directory #
##########################################

echo "Creating Samba File Share Directory..."
mkdir -p $SHARE_DIRECTORY

echo "Updating File Permissions for Samba File Share Directory..."
chmod -R $SHARE_PERMISSIONS $SHARE_DIRECTORY
