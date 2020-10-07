# Day 9

## Notes

- [x] Used `ss`, `nmap` to see open ports.
- [x] Used `ufw` to allow and disallow http traffic and seen the updated rules in `iptables -L | grep http` 
- [x] Checked that [http://192.168.225.26](http://192.168.225.26) did not display the webpage after denying http traffic using `ufw`.
- [x] Also checked open ports of *Ariana* and *Pavilion* and my phone using `nmap` from a device other than which is to be checked for (though u/snori74 said not to do so). But since, my network is a private one, I thought to check.
- [x] Changed ssh to listen on port 2002 rather than on default 22 in `/etc/ssh/sshd_config`. Then restarted the ssh daemon with `sudo systemctl reload-or-restart ssh`. But closed the current connection to *Ariana* after doing so, **and forgot to update the rule for the changed ssh port in ufw**. 
- [x] So, I had to log in to the Virtual Box machine and update the rule to allow traffic on port 2002 `sudo ufw allow 2002/tcp` and `sudo ufw enable`. 
- [x] Then I could log in to *Ariana* from *Pavilion* by `ssh haiji@192.168.225.26 -p 2002`. :wink: 

- Note that ssh command uses **-p** (lowercase) while scp, sftp use **-P** (uppercase) for port option.


## Readings

- [ ] [How to Log Linux IPTables Firewall Dropped Packets to a Log File ](http://www.thegeekstuff.com/2012/08/iptables-log-packets/)
- [ ] [Firewalling with iptables - One approach ](http://www.pettingers.org/code/firewall.html)
- [ ] [12 ss Command Examples to Monitor Network Connections ](https://www.tecmint.com/ss-command-examples-in-linux/)
- [ ] [UFW - Uncomplicated Firewall ](https://help.ubuntu.com/community/UFW)
- [ ] [Collection of basic Linux Firewall iptables rules ](http://linuxconfig.org/collection-of-basic-linux-firewall-iptables-rules)
- [ ] [10 Netstat Command Example ](http://www.thegeekstuff.com/2010/03/netstat-command-examples/)
- [ ] [UFW Uncomplicated Firewall ](http://www.youtube.com/watch?v=nc3A5Dy4xE0&feature=relmfu)
- [ ] [How to install nftables in Ubuntu ](https://www.liquidweb.com/kb/how-to-install-nftables-in-ubuntu/)