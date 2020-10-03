# Day 20

## Notes

- One script can be used to do several things depending on what parameters you provide.
- Pop your script in `/etc/cron.daily` and it will run each day, or install a symlink to it in the appropriate `/etc/rc.d` dir and you can have it run each time the system is shut down or booted up.
- You can use `whois` to find details on IPs - just be aware that the system that is "attacking" you may be an innocent party that's been hacked into.

- Remember to include `-a` option in `grep`, as it sometimes consider `/var/log/auth.log` as a binary file.

- [x] Failed password attempts for valid users

```bash
grep -i "failed" /var/log/auth.log -a | grep -vi "invalid" | grep -vi "repeated" | awk '{printf "%-10s %12s\n", $9, $11}'

```
- [x] Invalid users attempts

```bash
grep -a "Invalid" /var/log/auth.log | awk '{printf "%-10s %12s\n", $8, $10}'

```

- [x] The complete script (this is different from that of u/snori74 from the course :sweat_smile:)

```bash
#!/bin/bash

usage() {
if [[ -z "$1" ]]; then
	echo "Usage: `basename $0` [wrongpass | invalid]"
	echo "OPTIONS - "
	echo "	wrongpass - Failed attempts by valid users due to wrong passwd"
	echo "	invalid - Invalid users attempting to ssh"
exit 0
fi
}

if [[ "$1" == "wrongpass" ]]; then
	echo "Failed password attempts for valid users"
	awk 'BEGIN {printf "%-10s %12s\n", "User", "IP"
	    printf "%-10s %12s\n", "----", "----"}'
	grep -i "failed" /var/log/auth.log -a | grep -vi "invalid" | grep -vi "repeated" | awk '{printf "%-10s %12s\n", $9, $11}'

elif [[ "$1" == "invalid" ]]; then
	echo "Invalid users"
	awk 'BEGIN {printf "%-10s %12s\n", "user", "IP"
		printf "%-10s %12s\n", "----", "----"}'
	grep -a "Invalid" /var/log/auth.log | awk '{printf "%-10s %12s\n", $8, $10}'	
else
	usage
fi
```


## Questions and Answers

I don't think "**disconnected from**" gives the desired result, (at least not in my case). 

A "good" (accepted password) session only has "Disconnected from" line in my logs when the session is closed. [an extract of "good" log here](https://pastebin.com/71xyPLVW)

"**Failed password**" [log](https://pastebin.com/yp4eVJmK), "**Invalid user**" [log](https://pastebin.com/mt1WN6Kk) shows me "bad" logins.

Failed but accepted on third attempt - [log](https://pastebin.com/xWY5uNq7)

## Readings

- [ ] [Learn Bash Scripts - Tutorial (video) ](http://www.youtube.com/watch?v=QGvvJO5UIs4)
- [ ] [Bash scripting tutorial ](http://linuxconfig.org/Bash_scripting_Tutorial)
- [ ] [BASH Programming - Introduction HOW-TO ](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html)
- [ ] [How to be a good (and lazy) System Administrator ](http://www.linuxjournal.com/content/how-be-good-and-lazy-system-administrator)