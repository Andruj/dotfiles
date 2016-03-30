sudo apt-get -qq install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --directory-prefix ~/Downloads
sudo dpkg -i ~/Downloads/google-chrome*.deb
rm -rf ~/Downloads/google-chrome*.deb
