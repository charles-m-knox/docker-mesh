#!/bin/bash
set -e
mkdir -p /usr/local/mesh
cd /usr/local/mesh
wget http://www.meshcentral.com/public/dh.ashx?mesh=$1 -O mesh_poky64.msh
wget http://www.meshcentral.com/public/dh.ashx?agent=18 -O mesh_poky64
chmod 755 ./mesh_poky64
ln -s /usr/local/mesh/mesh_poky64 /sbin/meshcmd
ln -s /usr/local/mesh/mesh_poky64 /etc/rc2.d/S20mesh
ln -s /usr/local/mesh/mesh_poky64 /etc/rc3.d/S20mesh
ln -s /usr/local/mesh/mesh_poky64 /etc/rc5.d/S20mesh
./mesh_poky64 start
# Infinite loop here
su -c "tail -f /dev/null" mesh
