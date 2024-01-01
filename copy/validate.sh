
FQDN=$(echo $ADDR | cut -d: -f1)
if [ "$FQDN" == "" ]; then
    echo "must specify FQDN"
    exit 1
fi
PORT=$(echo $ADDR | cut -d: -f2)
if [ $( echo $PORT | egrep -c [0-9]+) -eq 0 ]; then
    echo "must specify port"
    exit 2
fi

CONTAINER_NAME="vault_$(echo $FQDN | tr '.' '_')"
VOLUME_NAME="volume_$(echo $FQDN | tr '.' '_')"

