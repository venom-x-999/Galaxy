#!/bin/bash

clear
echo ""
sleep 1
echo -e "\e[31mPLEASE WAIT A MINUTE.... UNTIL IT COMPLETED. \e[0m"
sleep 2

# Function to check internet connectivity
check_internet() {
    # Ping Google's public DNS server
    ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        return 0
    else
        echo -e "\e[31mNo internet connection. Please turn on internet.\e[0m"
        return 1
    fi
}

# Check internet connectivity
check_internet
echo -e "\e[0m"


# Check if storage permissions are already enabled
if [ -d "/storage/emulated/0" ]; then
    echo "Storage permissions are already enabled."
else
    echo "Storage permissions are not enabled. Enabling them now..."
    termux-setup-storage
fi


clear
echo -e "\e[31mPLEASE WAIT A MINUTE.... UNTIL IT COMPLETED. \e[0m"
echo ""

apt install curl

chmod +x galaxy.sh.x
./galaxy.sh.x
