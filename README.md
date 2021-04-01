# Ingress Pod

The official Simplenetes Ingress Pod, which uses `haproxy` as router.

```sh
sns host attach ingress@loadbalancer --link=git-url
sns pod compile ingress

# Generate haproxy.conf new on pod changes.
sns cluster geningress
sns pod updateconfig ingress
```

Pre-existing certificates can be added to `cluster-dir/_config/ingress/usercerts`, then updateconfig and sync.
