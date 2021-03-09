# Fetcher

This subproject of ingress is the "fetcher" image. It's duty is to connect to the Letsencrypt pod and fetch the certificates and then unpack them to a shared ramdisk so that the haproxy container can use them.

## Make
Update version info in Makefile.  

```sh
make build
make build-image
make push-image
```
