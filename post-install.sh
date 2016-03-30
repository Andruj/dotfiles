dir=./installers

echo
echo "Installing git, vim, and curl..."
source $dir/terminal-install.sh
echo
echo "Installing Java 7 and 8..."
source $dir/java-install.sh
echo
echo "Installing Spotify..."
source $dir/spotify-install.sh
echo
echo "Installing Google Chrome..."
source $dir/chrome-install.sh
echo
echo "Installing Dart and the Dart SDK..."
source $dir/dart-install.sh
echo
echo "Installing Node and npm..."
source $dir/node-install.sh
echo
echo "Installing Babel, Yeoman, Gulp and other global modules..."
source $dir/node-module-install.sh
echo
echo "Installing MongoBD..."
source $dir/mongodb-install.sh
echo
echo "Installing Go..."
source $dir/go-install.sh
echo
echo "Installing Scala..."
source $dir/scala-install.sh
