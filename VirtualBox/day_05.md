# Day 5

## Notes

- [x] I had already knows that `less` is more than `more`. So I navigated around some files using `less` and its keybindings.
- [x] I customized my `PS1`
- [x] I made a custom fetch script that I had been craving to make ever since I saw [`fet.sh`](https://github.com/6gk/fet.sh). Yes I took inspiration (and sometimes copied also) from `neofetch` and `fet.sh`.
- [x] I also spent the day making a color scheme (:banana: :fish:) for alacritty.

- `ma` mark a page in `less` with `a` to later return to it.
- `'a` goto the page marked with `a` in `less` (when viewing the file, which had been marked and the session not closed).
- `g` to go to the beginning of the document in `less`, `gg` or `1G` in vim.
- I will prefer searching with `/` over `?` though I will have to escape regex meta characters when doing so, example, to search for a line having **/home/devpogi**, the pattern I will have to enter in `less` is `/\/home\/devpogi`.
- `f` and `b` work the same as <kbd>Ctrl</kbd> + f and <kbd>Ctrl</kbd> + b respectively, so I will stick with `f` and `b` for forward and backward one page, in `less`.
- `v` to edit the currently viewing file (in `less`) in preconfigured text editor (it defaults to `nano`, but I have to change it to vim).
- press <kbd>Ctrl</kbd> + r  again for the next matching result from the `history`, however, if you accidently pass over the command, you can do <kbd>Ctrl</kbd> + s, to go back, however, prssing that might freeze the terminal (like it does in alacritty) and then you will have to press <kbd>Ctrl</kbd> + q to unfreeze, or you can add the line `stty -ixon` to `~/.bashrc` to disable freezing, but I haven't done that yet.
- <u>searching (with <kbd>Ctrl</kbd> + r) after you have typed a part of the command</u> section from 2nd reading (listed below) was a good read.

## Readings

- [x] [Unix Less Command: 10 Tips for Effective Navigation](http://www.thegeekstuff.com/2010/02/unix-less-command-10-tips-for-effective-navigation/)
- [x] [How To Use Bash History Commands and Expansions...](https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps)
- [x] [BASH Shell commands less](http://www.youtube.com/watch?v=ZQTt0LEoj3k)
- [ ] [Tab completion](https://www.youtube.com/watch?v=7V-fovVlCvA)
- [ ] [What are dotfiles?](http://thegeekyway.com/what-are-dotfiles/)
- [ ] [Nano editor tutorials](http://www.debianadmin.com/nano-editor-tutorials.html)

## Inspiration

I was feeling down yesterday 
because I could not completely ready all of the links in the "Extensions" section that had been posted for last 4 days.
so I told this to u/snori74
and to my surprise, he said that don't take stress and don't let it make you overwhelmed
"think of them as Part II and skip them for now"
"but do complete them in the next month"
I guess that is a fine advice and it lifted the burden of my brain.
I had thought I would be reading all of other people's comments too and learn from them.
However, I guess that will have to wait until next month.
I will try to complete all the tasks each day this month.
And will look into the readings once again next month, along with reading other peoples comments and trying to solve the tasks without any help.
That will perhaps be a kind of revision, and surely worth it.
