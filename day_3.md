# Day 3

## Info

(will act as **remote**) VirtualBox Ubuntu Server 20.04
 - hostname: `Ariana`
 - login/user: `haiji`
 - ip: `192.168.225.26`

(will act as **local**) Host Machine Ubuntu Desktop 20.04
 - hostname: `Pavilion`
 - login/user: `devpogi`
 - ip: `192.168.225.44`

## Notes

- [x] I had already changed the timezone on Day 1 with `sudo dpkg-reconfigure tzdata` instead of `timedatectl`. Yet, I used `timedatectl` to see the current setting about timezone and `timedatectl list-timezones` to see timezones. India's timezone will be available under Asia/Kolkata. 
> The major practical effects of this are (1) the timing of scheduled tasks, and (2) the timestamping of the logs files kept under `/var/log`. If you make a change, there will naturally be a "jump" in the dates and time recorded.


- [x] I noticed the jump in timestamp in the `/var/log/auth.log` (which records any usage of `sudo` along with other logs.)

```text
-- **START OF THIS FILE** --

Sep  7 08:56:59 ariana useradd[717]: new group: name=haiji, GID=1000
Sep  7 08:56:59 ariana useradd[717]: new user: name=haiji, UID=1000, GID=1000, home=/home/haiji, shell=/bin/bash, from=none
.
.
.
Sep  7 08:56:59 ariana useradd[717]: add 'haiji' to group 'sudo'
.
.
.
Sep  7 11:05:30 ariana sshd[1009]: pam_unix(sshd:session): session closed for u
ser haiji

-- **JUMP HAPPENED HERE** --

Sep  7 15:38:50 ariana systemd-logind[649]: New seat seat0.
Sep  7 15:38:50 ariana systemd-logind[649]: Watching system buttons on /dev/inp
ut/event0 (Power Button)
```

- [x] Changed the hostname by editing `/etc/hostname` and `/etc/hosts`

- [x] Saw `/etc/shadow` file and read a little about `crypt` and `shadow` from the man pages. Saw the encrypted password for *haiji* user.

- [Ubuntu uses sha512crypt for hashing the password.](https://crypto.stackexchange.com/questions/40841/what-is-the-algorithm-used-to-encrypt-linux-passwords)

- *99999* in the *maximum password age* field in `/etc/shadow` file for login user (*haiji*, in my case) is approximately 273 years.

> A password field which starts with an exclamation mark means that the password is locked. The remaining characters on the line represent the password field before the password was locked. If the password field contains some string that is not a valid result of crypt(3), for instance ! or *, the user will not be able to use a unix password to log in (but the user may log in the system by other means).
> 
>> *from shadow man page.*


>> [u/komodo](https://www.reddit.com/r/linuxupskillchallenge/comments/ip257g/day_3_power_trip/g4igadr?utm_source=share&utm_medium=web2x&context=3) says that, 
> 
> On AWS EC2, you will find that all of your password hashes in `/etc/shadow` are `*` or `!` I've read that `*` means that the user is completely disabled for login. `!` indicates the user has never been given a password, which is the case for the `ubuntu` account. If you'd like you can set a password with `sudo passwd ubuntu`. If you look at `/etc/shadow` afterwards you will see a proper hash.
>> though I cannot experiment with that because I don't have an aws ec2.

- ~~`sudo -i` will use home dir as `/root` and will not be corrupted by user's env variables. However, `sudo -s` will use user's home dir (example, /home/devpogi) and will have user's env variables. Both will have root's PATH.~~

- ~~What's worth keeping in mind here is that the `-s` command line option gives you a shell with root privileges, but you don't get the root environment - it's your `.bashrc` that gets sourced. This means that, for example, in the new shell that `sudo -s` runs, executing the whoami command will still return your username, and not 'root'.~~

> `sudo -s` gave me root on `whoami` and gave me `/root` on `echo $HOME`, I am not sure about which `.bashrc` got sourced, but instead of changing to `/root`, it remained at the last working dir (i.e. the dir before execution of `sudo -s` command).

- sudo session remains active for 15-mins by default. Suppose during this session, you have to give someone access to your terminal, but you don't want them to be able to use sudo. What will you do? `sudo -k` is used to revoke root privileges, and will prompt for password at the next occurence of sudo.
 
- 

## Readings

- [x] [Sudo in Ubuntu](https://help.ubuntu.com/community/RootSudo)
- [ ] [Server best practices](http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html)
- [x] [How to use sudo](https://www.howtoforge.com/tutorial/sudo-beginners-guide/)
- [x] [This is how password cracking is done](https://null-byte.wonderhowto.com/how-to/crack-shadow-hashes-after-getting-root-linux-system-0186386/)

## Questions And Answers

[discord exported messages](assets/day3_questions-discord.html)

**Summary**: 
- Use sudo prefixed commands instead of logging into a temporary root shell with `sudo -i`. 
- Create a shell script if I need to do a series of sudo commands, this will save from errors (when directly writing sudo in terminal)
- I can copy `~/.bashrc` to `/root/.bashrc` but it is not best practice to use the root login shell.
- Again, I can login from tty with root account (remember the `!` in encrypted password field in `/etc/shadow`) but that is not preferred.
