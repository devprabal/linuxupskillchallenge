# Day 11

## Notes

- [x] `updatedb` needs to be run because I had made changes to the config files under `/etc/logrotate.d` which have configs for `apache2`, `apt`, `ufw`, etc. The configs affect the files under `/var/log` which has files with substring **access.log** under `apache2/access.log`. Now running `locate access.log` will list **all** such files which have **access.log** as a substring.
- [ ] I cannot seem to fing how `updatedb` command runs (by cron or systemd?). There doesn't seem to be a reasonable entry in `/etc/cron.weekly` or `/etc/cron.daily` and the files under `/run/systemd` are complex for me to understand at the moment.
- There are 3 kind of "timestamps" (output of `stat` \<filename\>) -

    **Access** - the last time the file was *read*

    **Modify** - the last time the file was modified (*content* has been *modified*)

    **Change** - the last time *meta data* of the file was *changed* (e.g. permissions)

- `find` uses the permissions of the logged-in user you’ll get “permission denied” messages for many directories if you search the whole system.
- [x] The **output** (stdout) produced by `find` and the "Permission denied" **error** (stderr) produced by it go on two different **streams**.  Thus, what `grep` filters is the output (stdout) only and not the errors (stderr). They (errors) show up as they are. 
Therefore, we need to do this,

```bash 
find /home -mtime 0  2>&1 | grep -vi "Permission denied"
```

This takes in stderr stream to the stdout then grep can remove the unwanted things.
This syntax should be used with `find` to filter through errors and outputs.
> [Source, nixCraft](https://www.cyberciti.biz/faq/bash-find-exclude-all-permission-denied-messages/)

- [x] On the above lines, we can use `grep` in the same way, but this now searches for a substring **delaycompress** in the content of a text file by reading recursively all files under `/etc/`.

```bash
grep -R -i "delaycompress" /etc/* 2>&1 | grep -vi "Permission denied"
```

- Because `grep -R` only works on plain text files, it's most useful for the `/etc` and `/var/log` folders.

- [ ] Know to use `-exec` option of `find` command.

## Inspiration

My [pull request](https://github.com/snori74/linuxupskillchallenge/commit/fb953c451a0a69eba6cbed7749dedf3bff77debf) (on the above discussion of filtering out errors from `find` with `grep`) was merged. I am so happy. :star_struck:

![see a screenshot, :stuck_out_tongue_closed_eyes:](assets/day_11_pull_request_merged.png)

## Readings

- [ ] [25 find command examples...](https://www.linuxtechi.com/25-find-command-examples-for-linux-beginners/)
- [ ] [10 Tips for using "find"](https://www.linux.com/tutorials/10-tips-using-gnu-find/)
- [ ] [Five simple recipes for "grep"](http://arstechnica.com/open-source/news/2009/05/command-line-made-easy-five-simple-recipes-for-grep.ars)