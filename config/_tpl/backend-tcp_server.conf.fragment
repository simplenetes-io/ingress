mode tcp
# Load balance according to least connections.
balance leastconn
# Make sure the repsonse looks valid.
tcp-response content accept if { res.ssl_hello_type 2 }
# Pod defined endpoints:
