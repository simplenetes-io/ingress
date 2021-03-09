# Ingress Pod

The official Simplenetes Ingress Pod, which uses `haproxy` as router.

```sh
snt attach-pod ingress@loadbalancer
snt import-config ingress
snt compile ingress
snt generate-ingress
snt update-config ingress
```
