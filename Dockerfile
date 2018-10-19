FROM frolvlad/alpine-glibc

# usage:
# docker build --build-arg HTTP_PROXY=$http_proxy --build-arg HTTPS_PROXY=$https_proxy -f Dockerfile -t mesh:alpine .
# REPLACE THE MESH_ID VARIABLE ACCORDINGLY
# docker run -e MESH_ID=012312039019238019283019283109283102938120938 --net=host -d --rm -it mesh:alpine
# Optionally run this to debug:
# docker exec -it CONTAINER_NAME /bin/bash

RUN apk add wget bash nano libx11-dev libxtst

ARG MESH_GID=2000
ARG MESH_UID=2000

RUN addgroup -g ${MESH_GID} mesh \
    && adduser -S -G mesh -u ${MESH_UID} mesh

COPY deploy_mesh.sh /bin/deploy_mesh.sh
RUN chmod +x /bin/deploy_mesh.sh

ARG MESH_ID=0

CMD ["/bin/deploy_mesh.sh", "$MESH_ID"]
