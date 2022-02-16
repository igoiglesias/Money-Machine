#!/usr/bin/env bash
base_dir=$(pwd)

sudo apt update
sudo apt install build-essential wget -y

cd /var/tmp/
wget https://artiya4u.keybase.pub/TA-lib/ta-lib-0.4.0-src.tar.gz --show-progress 
tar -xvf ta-lib-0.4.0-src.tar.gz
cd ta-lib/
./configure --prefix=/usr
sudo make && sudo make install -j

cd $base_dir

virtualenv .venv
source .venv/bin/activate

python3 -m pip install -r requirements.txt
