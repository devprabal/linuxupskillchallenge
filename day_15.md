# Day 15

## Notes

- `apt-cache dump` can be used to see what packages are available officially and their dependencies. Example - 

```bash
apt-cache dump | grep -i "figlet"
```

gives - 

```text
Package: python-pyfiglet
Package: figlet
  Depends: figlet (null)
Package: python3-pyfiglet
  Depends: python-pyfiglet 0.7.1
  Depends: figlet (null)
  Depends: python-pyfiglet 0.7.1
  Depends: figlet 2.2.1-4
  Depends: figlet (null)
  Depends: figlet (null)
  Depends: php-text-figlet (null)
Package: php-text-figlet
  Depends: python3-pyfiglet (null)
  Depends: figlet (null)
```
- [x] `apt-cache dump | grep "Package:" | wc -l` to see the number of packages that can be already installed from the repositories. (gives 89628)
- You can immediately execute the previous command(s) by `!beginning_few_letters_of_command`. Example, if you have entered the following three commands - 

```bash
apt-cache dump | grep "Package:" | wc -l
find . -name "*conf*"
sudo apt update
```
- Now if you want to run command 1, you can simple do `!apt`, similarly for command 2 `!fi` and command 3 `!sudo`.
- [x] It seems multiverse and universe are already enabled in the `/etc/apt/sources.list`.

## Readings

- [ ] [How to use yum - Introduction ](http://fedoranews.org/tchung/howto/2003-11-09-yum-intro.shtml)
- [ ] [Package management with APT ](https://help.ubuntu.com/community/AptGet/Howto)
- [ ] [What do you mean by Free Software? ](http://www.debian.org/intro/free)
