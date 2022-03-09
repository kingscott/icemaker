#!/bin/bash

sleep 1;
echo "Installing...";

echo "Making script executable...";
# Make executable
chmod +x ./icm.sh
sleep 1;

echo "Copying to /usr/local/bin as icm...";
sudo cp icm.sh /usr/local/bin/icm
sleep 1;

echo "fini";