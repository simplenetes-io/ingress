# Ingress Pod

The official Simplenetes Ingress Pod, which uses `haproxy` as router.

```sh
sns host attach ingress@loadbalancer --link=git-url
sns pod compile ingress

# Generate haproxy.conf new on pod changes.
sns cluster geningress
sns pod updateconfig ingress
```


## Pre-existing certificates
Add .pem certs to `cluster-dir/_config/ingress/usercerts`, then updateconfig and sync.

## Certificate fetcher
The Ingress pod fetches letsencrypt certificates from the Letsencrypt pod.
The preprocess variable `ingress_useFetcher=true` must be set in `cluster-vars.env` before compiling the pod.
By default the certificates are fetched every 12 hours. do force a fetch do:  

```sh
sns pod signal ingress fetcher
```

This will restart the fetcher container to make it fetch the certificate bundle a new.
