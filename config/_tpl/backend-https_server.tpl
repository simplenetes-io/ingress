mode http
# Enable insertion of the X-Forwarded-For header to requests sent to servers so servers can see the actualy client IP.
option forwardfor
# Set a HTTP header "X-proto: https" so that server can see that the client request was made over HTTPS.
http-request set-header X-Proto https
# Pod defined endpoints:
