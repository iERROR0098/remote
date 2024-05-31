#!/bin/bash

install_sshpass() {
    if ! command -v sshpass &> /dev/null; then
        echo "Installing sshpass..."
        sudo apt update
        sudo apt install -y sshpass
    fi
}

while IFS=':' read -r ip user pass; do
    echo "Connecting to $ip with username $user..."
    
    install_sshpass

    sshpass -p "$pass" ssh -o StrictHostKeyChecking=no "$user@$ip" 'bash -s' < <(curl -Ls https://raw.githubusercontent.com/iERROR0098/marzban-node/main/node.sh)

    echo "Finished for server $ip"
done < sv.txt
