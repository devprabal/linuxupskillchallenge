# Day 2

## Notes

- [x] Configured PS1 which had been pending for several days.
I wanted a simple way to know if I am inside a git directory or not and nothing else (not using zsh, not powerlevel10k, just bash). So I did [this](https://pastebin.com/DsMEwG3c) and [here](https://imgur.com/a/SLuSJn8) is the output. I followed [arch wiki](https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Embedding_commands) which says to avoid using `PROMPT_COMMAND` for printing characters to terminal because bash doesn't count those characters and so, it may end up placing the cursor at a position which doesn't include the calculation of characters from `PROMPT_COMMAND`. However, it could have been used to reassign PS1 but my PS1 was already long. PS1 is set once when it used for the first time, so the trick to embed commands is to avoid expansion the first time either by single quotes or backslashing the dollar of command subsititution. It will be expanded, when the prompt is actually display.
![ps1 look](assets/PS1.png)

- [x] read a bit of man pages for several commands.
- `help <shellbuitin>` instead of `<shellbuitin> --help` (example, echo --help will print --help).
- `man builtins` will show all builtins.
- Anyways, I usually try all these things, `man program`, `program --help`, `info program`, `help program`, and either one or more will give me what I want.

- [x] `ls -t` to sort files in descending order last-modified.
- `ls -Falhit` is a good use along with already aliased `ls='ls --color=auto'`.

## Readings

- [x] [PS1,2,3,4, PROMPT_COMMAND](http://www.thegeekstuff.com/2008/09/bash-shell-take-control-of-ps1-ps2-ps3-ps4-and-prompt_command/)
- [x] [Customizing the prompt PS1](https://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/) But I would suggest and likely follow (1) The linux command line book for colors etc (2) arch wiki for embedding commands.
- [x] [basic commands](https://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/) Again, I will strongly suggest **the linux command line book** by *William Shotts* and some of *Luke Smith's* videos.
- [ ] [Explore the Linux file system](https://www.digitalocean.com/community/tutorials/how-to-use-cd-pwd-and-ls-to-explore-the-file-system-on-a-linux-server)
- [ ] [Linux File System](https://www.youtube.com/watch?v=2qQTXp4rBEE)
- [ ] [Simple Terminal Commands on Ubuntu](http://www.youtube.com/watch?v=CGBsurVdLGY)
- [ ] [Solaris Unix Commands](http://www.gsp.com/support/virtual/admin/unix/solaris/commands.html)