wget https://github.com/atom/atom/releases/download/v1.6.1/atom-amd64.deb -q --show-progress
sudo dpkg -i atom-amd64.deb
sudo apt-get -qq install -fy
rm -rf atom-amd64.deb
