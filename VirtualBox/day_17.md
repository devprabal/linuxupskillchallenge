# Day 17

## Notes

- `nmap -V`
```text
Nmap version 7.80 ( https://nmap.org )
Platform: x86_64-pc-linux-gnu
Compiled with: liblua-5.3.3 openssl-1.1.1d nmap-libssh2-1.8.2 libz-1.2.11 libpcre-8.39 libpcap-1.9.1 nmap-libdnet-1.12 ipv6
Compiled without:
Available nsock engines: epoll poll select
```
- `which nmap`

```text
/usr/bin/nmap
```

- `wget` is a good tool to download things from the internet. `wget -v https://nmap.org/dist/nmap-7.80.tar.bz2`

- `tar --exclude='*/*' -tf nmap-7.80.tar.bz2` to list only the top level contents of this tarball. Use `*/*/*` to list two levels.

- After installing from source, `which nmap` points to 

```text
/usr/local/bin/nmap
```

and `/usr/local/bin/nmap -V` returns 

```text
Nmap version 7.80 ( https://nmap.org )
Platform: x86_64-unknown-linux-gnu
Compiled with: nmap-liblua-5.3.5 nmap-libz-1.2.11 nmap-libpcre-7.6 nmap-libpcap-1.9.0 nmap-libdnet-1.12 ipv6
Compiled without: openssl libssh2
Available nsock engines: epoll poll select
```

~~But, `nmap -V` returns the one from `/usr/bin/nmap`~~

I don't know why it returned different once, but now it returns from the `/usr/local/bin/nmap`.

## Questions and Answers

[reddit link](https://www.reddit.com/r/linuxupskillchallenge/comments/j1led8/thoughts_and_comments_day_17/g71pweb?utm_source=share&utm_medium=web2x&context=3)

**Is it okay to do the following things?**

```
cd /usr/bin
sudo mv nmap nmap.bak
sudo ln -s /usr/local/bin/nmap nmap
```

> You shouldn't do this - "which nmap" should show that the version that you've just installed will load in preference to the default.

- [Effect of compiling from source on already installed applications](https://unix.stackexchange.com/questions/46656/effect-of-compiling-from-source-on-already-installed-applications/46658)

**Takeaways -**

- The prefixes `/usr/local/` should be before `/usr/` in the `PATH` variable. Both of which should be before, `/bin` prefixes. The first match to the binary is returned (with `which` command, for example), so this makes sense.
- Apparently, there is no way to keep track of the packages installed from source for updates. (unless the package itself has some option of doing it, like masterpdfeditor notifies for an update available)
- You can also run the non-default (as in PATH ) version of the software you want from `/usr/bin` by running it like `/usr/bin/nmap -V`, etc.

## Readings

- [x] [What is Linux From Scratch? ](http://www.linuxfromscratch.org/lfs/)
- [x] [What is Gentoo? ](http://www.gentoo.org/main/en/about.xml)
- [ ] [The Arch Build System ](https://wiki.archlinux.org/index.php/Arch_Build_System)

None of these is typically used in production servers, but investigating any of them will certainly increase your knowledge of how Linux works "under the covers" - asking you to make many choices that the production-ready distros such as RHEL and Ubuntu do on your behalf by choosing what they see as sensible defaults.

- [ ] [Understanding software Installation (configure, make, make install) ](https://www.codecoffee.com/software-installation-configure-make-install/)
- [ ] [Installing From Tarballs ](http://linux.byexamples.com/archives/156/installing-from-tarballs/)
- [ ] [How to rebuild an existing package from source ](http://raphaelhertzog.com/2010/12/15/howto-to-rebuild-debian-packages/)
- [ ] [Compiling things on Ubuntu the Easy Way ](https://help.ubuntu.com/community/CompilingEasyHowTo)
