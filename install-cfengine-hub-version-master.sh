URL=$(cf-remote --version master list hub ubuntu20 | tail -n 1)
curl -O $URL
PACKAGE_FILENAME=$(basename $URL)
sudo apt install ./$PACKAGE_FILENAME

# Setup un-privledged execution
mkdir -p ~/.cfagent/inputs
ln -s /var/cfengine/share/NovaBase/masterfiles/lib/ ~/.cfagent/inputs/lib
find ~/.cfagent
find /var/cfengine
