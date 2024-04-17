- hosts: all
  tasks:
    - name: Execute Bash script to update and upgrade apt packages
      become: yes
      ansible.builtin.shell: |
        #!/bin/bash
        # Define all hosts (space-separated list)
        all_hosts="192.168.5.6"

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
      args:
        executable: /bin/bash