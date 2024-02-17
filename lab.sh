#!/bin/bash

# Set the path to your downloads folder
DOWNLOADS_FOLDER="$HOME/Downloads"

# Remove all .pem files in the downloads folder
rm "$DOWNLOADS_FOLDER"/*.pem

# Prompt the user to download the new PEM file
read -p "Please download the new PEM file and press Enter to continue..."

# Change permissions of existing .pdf files to chmod 400
sudo chmod 400 "$DOWNLOADS_FOLDER"/*.pem

# Prompt the user to enter the EC2 IP address
read -p "Enter EC2 IP address: " EC2_IP

# Check if the provided IP address is valid
if [[ ! $EC2_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid IP address. Exiting."
  exit 1
fi

# Use the .pem file associated with your EC2 instance
PEM_FILE="labsuser.pem"

# SSH connection command
ssh -i "$DOWNLOADS_FOLDER/$PEM_FILE" ec2-user@"$EC2_IP"
