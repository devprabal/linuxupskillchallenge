# Day 16

## Notes

- [x] Creating an archive from some songs starting with **S**, `tar -cvf songs.tar S*`
- [x] Checking the archive and individual file sizes.
 

- `tar -tf songs.tar | awk '{printf "'\''%s'\''\n", $0}' | xargs ls -l | awk '{print $5}' | awk '{sum+=$1;} END {printf "%0.3f KB", sum/1024}'`

or shorter

- `tar -tvf songs.tar | awk '{print $3}' | awk '{sum+=$1;} END {printf "%0.3f KB", sum/1024}'`

they both give - 

**35474.563 KB**

`ls -l songs.tar | awk '{printf "%0.3f KB", $5/1024}'` gives - 

**35480.000 KB**

- [x] Creating compressed archive `tar -cvzf songsc.tar.gz S*` using *gzip* and *bzip2* compression methods. `tar -cvjf songsc.tar.gz S*`.

- A compressed tar archive like this is known as a "tarball".

- [x] Comparing sizes
- `ls -l songsc.tar.gz | awk '{printf "%0.3f KB" ,$5/1024}'` gives -  
**35211.450 KB**
- `ls -l songs.tbz2 | awk '{printf "%0.3f KB", $5/1024}'` gives - **35288.767 KB**


| filename      |     size     |
|---------------|:------------:|
| S*            | 35474.563 KB |
| songs.tar     | 35480.000 KB |
| songsc.tar.gz | 35211.450 KB |
| songs.tbz2    | 35288.767 KB |

> S* refers to all the files in the archive

- *gzip* (`-z`), *xz* (`-J`), *bzip2* (`-j`) are some of the compresssion algorithms supported by `tar`.
- `tar` can detect the compression used and use the corresponding decompression method to get back the files. So, `tar -xf archivename` will work for *tar.bz2* (aka *tbz2*), *tar.gz* (aka *tgz*), etc.

- [x] Extracting only the files "*Samarkand Overture - Yuri on Ice.mp3* and *Spyair - Imagination.mp3*"

- A listing `tar -tf songs.tbz2` of the tar shows us that it has the following files - 

```text 
Samarkand Overture - Yuri on Ice.mp3
Shounanno Kaze - Grand Blue.mp3
SixTONES - NAVIGATOR full.mp3
South_Side_Symphony,_ViolinGamer_Nightfall_From__Naruto_Shippuden_.mp3
Spyair - Imagination.mp3
Survive Said The Prophet - Found & Lost.mp3
```
> the output was pasted using <kbd>Ctrl</kbd> <kbd>v</kbd> after running `tar -tf songs.tbz2 | xclip -selection clipboard`


- We use `tar -C newdir/ -xvf songs.tbz2 --wildcards Spy* Samar*` to extract the two needed files to **newdir** (it should exist). `-C` option is order sensitive, it tells tar to change into the following dir and then perform an action. So adding `-C` to the end of command won't extract the files in the dir. *(Always see the man pages.)*


## Readings

- [x] What is a .bz2 file - and how would you extract the files from it?
- [ ] Research how absolute and relative paths are handled in tar - and why you need to be careful extracting from archives when logged in as root
- [x] You might notice that some tutorials write "tar cvf" rather than "tar -cvf" with the switch character - do you know why? (Traditional way for options vs UNIX way vs GNU way)
- [ ] [18 Tar Command Examples in Linux ](https://www.tecmint.com/18-tar-command-examples-in-linux/)
- [ ] [Linux TAR Command ](http://linuxbasiccommands.wordpress.com/2008/04/04/linux-tar-command/)
- [ ] [Linux tar command tutorial ](https://www.youtube.com/watch?v=CUdwDEKlDrw) (video)