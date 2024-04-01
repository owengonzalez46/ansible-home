#!/bin/bash

# Define all hosts (space-separated list)
all_hosts="192.168.5.6 192.168.1.6"

# Function to update and upgrade packages using sudo
update_and_upgrade() {
  host=$1

  echo "Updating and upgrading packages on $host with sudo..."
  ssh "$host" "sudo apt-get update && sudo apt-get -y upgrade"
}

# Call the function for each host
for host in $all_hosts; do
  update_and_upgrade "$host"
done