# docker-mesh

An Alpine-based Docker image that contains some networking utilities and runs [Mesh](https://meshcentral.com/)

## Usage

```bash
docker build --build-arg HTTP_PROXY=$http_proxy --build-arg HTTPS_PROXY=$https_proxy -f Dockerfile -t mesh:alpine .
# REPLACE THE MESH_ID VARIABLE ACCORDINGLY
docker run -e MESH_ID=012312039019238019283019283109283102938120938 --net=host -d --rm -it mesh:alpine
# Optionally run this to debug:
docker exec -it CONTAINER_NAME /bin/bash
```

If needed you can mount files from the host, for example (note that since this is a dangerous thing to do, the host volume is mounted read-only in this example - change at your own discretion):

```bash
docker run -e MESH_ID=012312039019238019283019283109283102938120938 -v /:/host_files:ro --net=host -d --rm -it mesh:alpine
```

If you don't want to use an environment variable to specify your `MESH_ID`, you can alternatively mount a file at `/secrets/mesh-id.txt`:

```bash
docker run -v $(pwd)/mesh-id.txt:/run/secrets/mesh-id -v /:/host_files:ro --net=host -d --rm -it mesh:alpine
```
