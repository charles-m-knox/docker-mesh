#!/bin/bash
set -e
mkdir -p /usr/local/mesh
cd /usr/local/mesh

# Determine if the variable $1 is defined. If not, read from file /secrets/mesh_id.txt
MESH_ID=$1
if [ -z ${1+x} ]; 
    then MESH_ID=$(cat /run/secrets/mesh-id);
fi
echo "MESH_ID=$MESH_ID"

wget http://www.meshcentral.com/public/dh.ashx?mesh=$MESH_ID -O mesh_poky64.msh
wget http://www.meshcentral.com/public/dh.ashx?agent=18 -O mesh_poky64
chmod 755 ./mesh_poky64
ln -s /usr/local/mesh/mesh_poky64 /bin/meshcmd
set +e
# Loops infinitely so that the container stays alive forever
./mesh_poky64 start && tail -f /dev/null
