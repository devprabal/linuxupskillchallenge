# Day 14

## Notes

```text
-rw-r----- 1 syslog adm    2065 Sep 24 12:43 /var/log/auth.log
-rw-r--r-- 1 root   root    817 Sep 23 12:50 /etc/group
-rw-r--r-- 1 root   root   1812 Sep 23 12:47 /etc/passwd
-rw-r----- 1 root   shadow 1155 Sep 23 12:46 /etc/shadow
```

- I am currently user **haiji** who is also a member of group **sudo** and **adm** (because of being the first non-root user of the system). Therefore, I fall under *others* (in permission bits) for the files `/etc/passwd`,`/etc/shadow` and `/etc/group`. Therefore, I can read `/etc/passwd` and `/etc/group` without requiring any extra priviledges. However, `/etc/shadow` is not availabe for reading (r) to *others*, and thus I need to prefix `sudo` to acquire root-previledges to read it. Since, I am also a member of **adm** group, therefore, I can read `/var/log/auth.log` without `sudo` prefixing. This last statement will not be true for **fred** user who is not a member of **adm** group. So he will be *others* for `/var/log/auth.log` and since there is no read (r) permission for *others* on this file, he will need to prefix `sudo` (which he can only do if he is a member of group **sudo**).

- `adduser` prompts for a password for the newly created user in Ubuntu. It is possibly (on other systems) that it may not ask for a password, in that case, we have to do - `sudo passwd <newuser>`.

- [x] I remember, I had once been locked out of the system when I ran `sudo visudo` and corrupted the `/etc/sudoers` file. I haven't had the courage to run that command again, until now. Removed **fred** from group **sudo** and granted him only the permission for reboot (without prompting for his password) in `/etc/sudoers` file.

```bash
sudo deluser fred sudo 
```
(read man page for `deluser`)

To confirm, type `sudo su fred` and then type `groups` and then `exit` to return to **haiji@Ariana**

```bash
ls -l sudoers
```

Even the root account cannot write to this file. I guess that's why there is `visudo` utility for editing it.

```text
-r--r----- 1 root root 755 Feb  3  2020 sudoers
```

Then became a root by `sudo -i` and ran `visudo`. Added the lines - 

```text
# Allow user "fred" to run "sudo reboot"
# ...and don't prompt for a password
#
fred ALL=NOPASSWD:/sbin/reboot
```
and exited with <kbd>Ctrl</kbd>+ x. 

Strangely, it asked to save the file as `/etc/sudoers.tmp`
But there was no file with this name when I exited and all the changes made were reflected in `/etc/sudoers` file.


- [x] I can login as **fred** via ssh and can change into **haiji**'s home dir by `cd ~haiji`. I wanted to try this out ever since I read about it in the "The Linux Command Line" book by *William Shotts*.
- [x] As is supported from yesterday's conversation about the option `:w!` to overwrite a non-writable but readable file, since only because the original owner (who has the permission to chmod, change permissions for the file) of the file issued that command. I (**fred**) tried doing this to a file whose owner was **haiji** and perm were `-r--r--r--`, and expectedly, it didn't work. `:w!` in vim says that it cannot open the file for writing.

## Readings

- [ ] [Restricting shell access ](http://www.cyberciti.biz/tips/howto-linux-shell-restricting-access.html)
- [ ] [Linux Password & Shadow File Formats ](https://www.tldp.org/LDP/lame/LAME/linux-admin-made-easy/shadow-file-formats.html)
- [ ] [How to create users and groups in Linux from the command line ](https://www.techrepublic.com/article/how-to-create-users-and-groups-in-linux-from-the-command-line/)
- [x] [Learn how to use the $EDITOR environmental variable to set your default editor to `vim`, and how to make this permanent by editing your .bashrc file" ](https://www.a2hosting.com/kb/developer-corner/linux/setting-the-default-text-editor-in-linux). With this done, ''visudo'' will use ''vim'' rather than ''nano'' for editing. This will also make `less` use `vim` for editing when pressed <kbd>v</kbd>.
- [ ] [Sudo – An Advanced Howto ](https://centoshelp.org/security/sudo-an-advanced-howto/)
- [ ] [A cartoon that should now make sense! ](http://xkcd.com/149/ )
- [ ] [Basic Linux Permissions: sudo and sudoers ](http://www.youtube.com/watch?v=YSSIm0g00m4)

