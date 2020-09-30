# Day 18

## Notes

- `logrotate --debug /etc/logrotate.conf` gives dump of what actually will be performed without actually performing it. So it becomes handy for testing the configuration changes made to `/etc/logrotate.d/apache2`
- Apparently, `logrotate` is handled by systemd timer (see `systemctl status logrotate`, and `systemctl status logrotate.timer`) instead of `cron` (see `less /etc/cron.daily/logrotate` which has a line *skip in favour of systemd timer*).
- [x] `/etc/logrotate.d/apache2` already had **daily** in it so I changed the no.of copies it keeps to 10 from 12 and compression from default (gzip) to bzip2

##### **`/etc/logrotate.d/apache2`**
```text 
/var/log/apache2/*.log {
        daily
        missingok
        rotate 10
        compress
        compresscmd /usr/bin/bzip2
        delaycompress
        ...
```
- [x] Created a file `/var/log/mylogfile.log`, changed its perm to **-rw-r--r-- root adm** and `echo`ed some text into it. (Making a secret dir like this is soo cool, just change the perm to *710 root normaluser*).
- [x] Created corresponding logrotate config for the above file

##### **`/etc/logrotate.d/mylogfile`**
```text
/var/log/mylogfile.log {
        size 2
        rotate 1
        maxage 2
        su root adm
        compress
        compresscmd /usr/bin/bzip2
        notifempty
        copytruncate
}
```

The line **su root adm** is copied from `/etc/logrotate.conf` into this because I intend to run this conf file standalone (for immediate testing, although this conf file is included in the main conf file `/etc/logrotate.conf`) as -

```bash
sudo logrotate /etc/logrotate.d/mylogfile
```

This will create `/var/log/mylogfile.log.1.bz2` with the contents from `/var/log/mylogfile.log` and truncate the later to 0. You can view the former by `less` or `zless`.

## Readings

- [x] [Use logrotate to Manage Log Files ](http://library.linode.com/linux-tools/utilities/logrotate)
- [x] arch wiki for `logrotate`
- [x] [The Ultimate Logrotate Command Tutorial ](http://www.thegeekstuff.com/2010/07/logrotate-examples/)
- [x] [LINUX: openSUSE and logrotate ](http://www.youtube.com/watch?v=UoHmj3ef3Is)
