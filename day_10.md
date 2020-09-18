# Day 10

## Notes

- [x] Surprisingly (?) `crontab -l` and `sudo crontab -l` didnot have any scheduled tasks.
- [x] Looked at default crontab in `/etc/crontab`. And only `/etc/cron.daily` had scripts in it, `cron.hourly, weekly, monthly` were empty.
- [x] Scripts like `/etc/cron.daily/apt-compact, update-notifier-common` were easy to read unlike others.
- [x] Saw `systemctl list-timers --all`

## Readings

- [ ] [Job scheduling with `cron` and `at` ](http://www.ibm.com/developerworks/linux/library/l-job-scheduling/index.html)
- [ ] [A good overview of systemd/Timers](https://wiki.archlinux.org/index.php/Systemd/Timers)
- [ ] [How to Use Systemd Timers as a Cron Replacement](https://www.maketecheasier.com/use-systemd-timers-as-cron-replacement/)
