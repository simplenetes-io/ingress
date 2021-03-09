mode http
# One IP cannot have more than 100 connections opened over a 3 sec period.
# IPv4
stick-table type ip size 100k expire 30s store conn_rate(3s)
tcp-request connection track-sc0 src
tcp-request connection reject if { sc0_conn_rate ge 100 }
# IPv6
#stick-table type ipv6 size 100k expire 30s store conn_rate(3s)
#tcp-request connection track-sc1 src
#tcp-request connection reject if { sc1_conn_rate ge 100 }
# Maximum wait to hold the contents for haproxy to figure out what it is.
tcp-request inspect-delay 10s
# Make browsers always use HTTPS for the domain. Remember for 30 days.
http-response set-header Strict-Transport-Security "max-age=2592000; includeSubDomains"
# Pod defines rules:
