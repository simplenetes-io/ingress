# Ingress Pod

The official Simplenetes Ingress Pod, which uses `haproxy` as router.

```sh
sns attach-pod ingress@loadbalancer
sns import-config ingress
sns compile ingress
sns generate-ingress
sns update-config ingress
```
