#!/bin/bash

# Define a function to handle graceful shutdown
shutdown() {
    echo "---Gracefully shutting down processes---"
    # Stop any long-running processes here
    pkill luckybackup
    pkill vncserver
    pkill sshd
    # Exit with status 0 to indicate a clean shutdown
    exit 0
}

# Trap the SIGTERM signal so that when it is sent to PID 1, we call the shutdown function
trap shutdown SIGTERM

# Keep the script running so it can catch signals
while true; do
    sleep 60
done
