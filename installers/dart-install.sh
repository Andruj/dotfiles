sudo apt-get -qq install -y apt-transport-https # Enable HTTPS for apt.
# Get the Google Linux package signing key.
sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
# Set up the location of the stable repository.
sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt-get -qq update
sudo apt-get -qq install -y dart
