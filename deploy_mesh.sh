#!/bin/bash
set -e
mkdir -p /usr/local/mesh
cd /usr/local/mesh
wget http://www.meshcentral.com/public/dh.ashx?mesh=$1 -O mesh_poky64.msh
wget http://www.meshcentral.com/public/dh.ashx?agent=18 -O mesh_poky64
chmod 755 ./mesh_poky64
ln -s /usr/local/mesh/mesh_poky64 /bin/meshcmd
set +e
# Loops infinitely so that the container stays alive forever
./mesh_poky64 start && tail -f /dev/null
