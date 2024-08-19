#!/bin/bash

#####################################
# Docker Start Script Configuration #
#####################################

INIT_SAMBA_SCRIPT_PATH=${INIT_SAMBA_SCRIPT_PATH:-"/scripts/init-samba.sh"}
WAIT_PERIOD=${WAIT_PERIOD:-5}

####################################################
# Executes Required Processes for Docker Execution #
####################################################

echo "Initializing Samba File Share Configuration..."
$INIT_SAMBA_SCRIPT_PATH

############################################################
# Launches Samba NetBIOS Name Service Daemon in Foreground #
############################################################

echo "Launching Samba NetBIOS Name Service Daemon (nmbd) in Foreground..."
nmbd --foreground --no-process-group &

################################################
# Launches Samba SMB/CIFS Daemon in Foreground #
################################################

echo "Launching Samba SMB/CIFS Daemon (smbd) in Foreground..."
smbd --foreground --no-process-group &

###############################
# Tailing System Log Messages #
###############################

echo "Waiting $WAIT_PERIOD Seconds for Startup Process to Complete..." && sleep $WAIT_PERIOD
tail -f /var/log/samba/log.smbd
