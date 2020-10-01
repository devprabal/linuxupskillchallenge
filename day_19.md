# Day 19

## Notes

#### **`tree  --dirsfirst -L 2 -ad home/haiji`** 
```
home/haiji
├── .cache
│   └── mc
├── .config
│   └── mc
├── .local
│   └── share
├── .ssh
└── test
```

`ls -ild` in home/haiji gives me - 

```
264604 drwxr-xr-x 7 haiji haiji 4096 Oct  1 14:03 .
```

The number of hard links are 7 for this dir. This is because, all of the below point to the same thing, 

1. `home` will have the dir `haiji`
2. `haiji` will have a dir `.`
3. `.cache`, `.config`, `.local`, `.ssh` will have a dir `..`
4. `test` will have a dir `..`

## Readings

- [ ] [Anatomy of the Linux file system ](https://developer.ibm.com/tutorials/l-linux-filesystem/)
- [ ] [Hard and soft links ](http://linuxgazette.net/105/pitcher.html)
- [ ] [What's an inode? ](http://www.linux-mag.com/id/8658/)
- [ ] [UNIX / Linux filesystem Inodes. Linux symbolic (soft) and hard links ](http://www.cyberciti.biz/tips/understanding-unixlinux-filesystem-inodes.html) 