# Day 8

## Info

(will act as **remote**) VirtualBox Ubuntu Server 20.04
 - hostname: `ariana`
 - login/user: `haiji`
 - ip: `192.168.225.26`

(will act as **local**) Host Machine Ubuntu Desktop 20.04
 - hostname: `Pavilion`
 - login/user: `devpogi`
 - ip: `192.168.225.44`

## Notes

- [x] `tail -n +2 file.txt` will display all lines except the first line in `file.txt`. The `+` sign reverses the usage of `tail` since `tail -n 2 file.txt` will display the last two lines and `tail -n +1 file.txt` will display the whole file.
- [x] Installed termux on two phones to simulate bad login attempt.
- [x] I used three commands to filter out the *bad* logins and saved them in `~/attackers.txt`

```bash
$ grep -ai "invalid" auth.log | grep ssh | cut -d ' ' -f 8- | grep -v "user"| grep -v "\[" > ~/attackers.txt

$ grep -ai "authenticating" auth.log | grep "root" | cut -d ' ' -f 11- >> ~/attackers.txt

$ grep -ai "authenticating" auth.log | grep -v "root" | cut -d ' ' -f 11-
```

> `-a` option in grep is to treat binary files as if they were plain text files. I don't know why grep was treating `auth.log` as a binary file.


The file `~/attackers.txt` looks like this - 

```txt
haiji@haiji from 192.168.225.59 port 53572
kiyose from 192.168.225.44 port 43056
devpogi from 192.168.225.59 port 52626
usr from 192.168.225.59 port 52870
ubuntu from 192.168.225.59 port 52890
pogi from 192.168.225.29 port 47292
root 192.168.225.44 port 43054 [preauth]
root 192.168.225.44 port 44182 [preauth]
root 192.168.225.59 port 52606 [preauth]
root 192.168.225.59 port 52622 [preauth]
haiji 192.168.225.44 port 49244 [preauth]
haiji 192.168.225.44 port 43058 [preauth]
```
- [x] To filter out just the ip addresses, I used these 2 commands on `~/attackers.txt`

```bash
$ cut -d ' ' -f 3 attackers.txt | grep -v "port" > attackingips.txt

$ cut -d ' ' -f 2 attackers.txt | grep -v "from" >> attackingips.txt
```

- [x] To get unique ip's `cat attackingips.txt | sort | uniq` which gave me - 

```txt
192.168.225.29
192.168.225.44
192.168.225.59
```

- [ ] Learning `awk` and `sed`

## Readings

- [ ] [Text processing commands ](https://www.youtube.com/watch?v=nLa6jAbULe8&t=97s)
- [ ] [OSTechNix grep tutorial ](https://www.ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/)
- [ ] [Where GREP Came From ](https://www.youtube.com/watch?v=NTfOnGZUZDk)