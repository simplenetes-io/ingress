# These settings are designed for HAProxy 2.0
global
    # Sets the maximum size of the Diffie-Hellman parameters used for generating the ephemeral/temporary Diffie-Hellman key in case of DHE key exchange.
    tune.ssl.default-dh-param 2048
    # TODO: check these settings so they are up to date and safe choices.
    ssl-default-bind-options   no-tls-tickets ssl-min-ver TLSv1.2
    ssl-default-bind-ciphers   ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS
    # Note: maxconn requires ulimit -n(2xmaxconn+100)
    # We need to know that the servers aggregated conn limits are sufficient to handle the number of connections let through.
#ifdef ${INGRESS_MAXCONN}
    maxconn ${INGRESS_MAXCONN}
#endif

#iftrue ${INGRESS_STATS}
    stats socket /var/run/haproxy.sock mode 600 level admin
    stats timeout 2m  # Timeout for input while interactive
#endif

defaults
    timeout server  10s  # Inactivity time
    timeout client  10s  # Inactivity time
    timeout connect 10s  # Max wait to connect to server
    timeout tunnel  10m  # TCP mode, the terminating side must apply HTTP mode control. HTTP mode inactivity time for upgrading connections.
    timeout http-request 10s  # Time to wait for a complete HTTP request
    # If 400/408 errors occur alot, see: https://cbonte.github.io/haproxy-dconv/1.7/configuration.html#option%20http-ignore-probes
    # Error files served by haproxy on occasions
    errorfile 408 /mnt/conf/error408.http
    errorfile 500 /mnt/conf/error500.http
    errorfile 502 /mnt/conf/error502.http
    errorfile 503 /mnt/conf/error503.http
    errorfile 504 /mnt/conf/error504.http
