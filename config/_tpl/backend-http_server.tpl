mode http
# Enable insertion of the X-Forwarded-For header to requests sent to servers so servers can see the actualy client IP.
option forwardfor
# Make sure the HTTP header "X-proto" cannot be set by client when accepting HTTP connections.
http-request del-header X-Proto
# Pod defined endpoints:
