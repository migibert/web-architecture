ansible-galaxy install info.haproxy

ansible-galaxy install tersmitten.keepalived

vagrant up

Sample web architecture, a request will follow this path:
- [HTTPS] Firewall (HA) : fail2ban + iptables + keepalived
- [HTTPS] Load balancer (HA) : haproxy + keepalived
- [HTTPS] SSL Termination : stunnel
- [HTTP]  Load balancer (HA) : haproxy + keepalived
- [HTTP]  Web server : Apache