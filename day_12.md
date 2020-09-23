# Day 12

## Notes

- [x] It appears that `sftp` (I used the cli, from OpenSSH) is pretty useful over `scp` because `scp` closes the session after each file transfer.
- However, we cannot delete a dir which contains subdirs or is not empty because `sftp` doesnot provide `rm -r` option. A workaround this would be to first delete all file `rm newdir/*` and then delete the dir `rmdir newdir`.
- Also, since we login as a normal user, we won't be able to make files or copy files to in `/var/`, `/etc`, etc. dirs. A workaround this is to make/copy file where it is possible and then login with `ssh` and use `sudo`.

- Another tip is that when working in `ssh` session, (say in `vim`), we have only one terminal (else we would have to ssh from another terminal too). So, to escape (temporarily) to shell from vim, we can either do -
  - `:sh` and then `exit`
  - <kbd>Ctrl</kbd>+z and then `fg`, to suspend vim and bring it to foreground respectively.

- [x] `sftp` from nautilus also works great.

## Readings

- [ ] CyberDuck (http://cyberduck.io/)
- [ ] FileZilla (http://filezilla-project.org/download.php?type=client)
- [ ] SFTP – SSH Secure File Transfer Program (https://www.ssh.com/ssh/sftp/)
- [ ] sftp File From One Server To Another (http://www.cyberciti.biz/faq/sftp-file-from-server-to-another-in-unix-linux/)
