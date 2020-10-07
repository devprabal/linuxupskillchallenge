# Day 7

## Notes

- [x] Installed `apache2` (which is a httpd).
- [x] Updated the server with `sudo apt update` and `sudo apt upgrade`
- [x] Saw apache's homepage from *Pavilion* by going to `http://192.168.225.26`
- [x] Deleted `/var/www/html/index.html` and created a new file `newfile.txt` in that dir. Then visited the website from *Pavilion* again. It had turned to an **Index of** website!
- [x] Made a new `index.html` file there.
- [x] Ran commands like `sudo systemctl start apache2` and `sudo systemctl stop apache2` and `sudo systemctl status apache2` and examined the website from *Pavilion* after these.
- [x] Viewed config files at `/etc/apache` and log files at `/var/log/apache2`.

> as [u/Loud-Progress-007 says](https://www.reddit.com/r/linuxupskillchallenge/comments/isrd8h/thoughts_and_comments_day_7/g5d20ts?utm_source=share&utm_medium=web2x&context=3),
> 
> You don't have to delete index.html. You can create a directory at the same level as index.html, place the contents in there. In the index.html link to that directory and you should get the same result as if you had deleted index.html.

- [x] I did the above and it works!

## Readings

- [ ] [Using *systemctl* to manage services](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
- [ ] [HTTPD - Apache2 Web Server
](https://ubuntu.com/server/docs/web-servers-apache)
- [ ] [The Apache HTTP Server](http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/ch-Web_Servers.html#s1-The_Apache_HTTP_Server)