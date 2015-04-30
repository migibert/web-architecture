ansible-galaxy install info.haproxy

ansible-galaxy install tersmitten.keepalived

ansible-galaxy install migibert.stunnel

ansible-galaxy install geerlingguy.firewall

ansible-galaxy install tersmitten.fail2ban

vagrant up

Sample web architecture, a request will follow this path:
- [HTTPS] Firewall (HA) : fail2ban + iptables + keepalived
- [HTTPS] Load balancer (HA) : haproxy + keepalived
- [HTTPS] SSL Termination : stunnel
- [HTTP]  Load balancer (HA) : haproxy + keepalived
- [HTTP]  Web server : Apache

TODO:
Uninstall useless rcpbind on all hosts
Add some DOS/DDOS security on firewalls (fail2ban with custom filter on traffic log ?)