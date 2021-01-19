################################################################################

# generic downloader / unpacker - (c) 2021 Neelanjan Bhowmik, Durham University, UK

################################################################################

# ************ ICLMA 2020 paper models - shufflenetonfire / nasnetonfire

echo; echo

################################################################################

URL=https://collections.durham.ac.uk/downloads/r1tb09j570z
DIR_LOCAL_TARGET=weights

FILE_NAME=thomson-2020-fire-detection-pretrained-models-pytorch--version1-r1tb09j570z.zip
DIR_NAME_UNZIPPED=thomson-2020-fire-detection-pretrained-models-pytorch--version1-r1tb09j570z
MD5_SUM=6511b75be1c36147a94c98587d6bccb6

IDENTIFIER_STRING="ICLMA 2020 Fire Detection CNN (shufflenetonfire / nasnetonfire) models"

UNCOMPRESS_COMMAND="unzip -q"

################################################################################

# set this script to fail on error

set -e

# check for required commands to download and md5 check

(command -v curl | grep curl > /dev/null) ||
  (echo "Error: curl command not found, cannot download!")

(command -v md5sum | grep md5sum > /dev/null) ||
  (echo "Error: md5sum command not found, md5sum check will fail!")

################################################################################

# perform download

echo "Downloading $IDENTIFIER_STRING ..."

mkdir -p $DIR_LOCAL_TARGET

TARGET=./$DIR_LOCAL_TARGET/$FILE_NAME

curl -L -k $URL > $TARGET

################################################################################

# perform md5 check and move to required local target directory

cd $DIR_LOCAL_TARGET

echo "checking the MD5 checksum for downloaded $IDENTIFIER_STRING ..."

CHECK_SUM_CHECKPOINTS="$MD5_SUM  $FILE_NAME"

echo $CHECK_SUM_CHECKPOINTS | md5sum -c

echo "Unpacking the compressed file (using $UNCOMPRESS_COMMAND)..."

$UNCOMPRESS_COMMAND $FILE_NAME

# echo "Tidying up..."

W_FILE=weights.zip

$UNCOMPRESS_COMMAND $DIR_NAME_UNZIPPED/$W_FILE

rm $FILE_NAME && rm -r $DIR_NAME_UNZIPPED
mv $DIR_LOCAL_TARGET/* ./
rm -r $DIR_LOCAL_TARGET

echo "... completed -> required $IDENTIFIER_STRING are now in $DIR_LOCAL_TARGET/"

echo "[Done]"
################################################################################