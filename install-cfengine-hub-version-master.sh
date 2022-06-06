URL=$(cf-remote --version master list hub ubuntu20 | tail -n 1)
curl $URL
PACKAGE_FILENAME=$(basename $URL)
apt install ./$PACKAGE_FILENAME
