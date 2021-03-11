# Fetcher

This subproject of ingress is the "fetcher" image. It's duty is to connect to the Letsencrypt pod and fetch the certificates and then unpack them to a shared ramdisk so that the haproxy container can use them.

## Releases
Images are automatically built by _GitHub Actions_ in the parent repository (ingress) whenever a new tag is pushed.
Please refer to the [GitHub Docker Registry](https://github.com/orgs/simplenetes-io/packages?repo_name=ingress) for the list of available images.

## Manual build
Update version in `build_image.sh`.

```sh
./make.sh
./build_image.sh
```
