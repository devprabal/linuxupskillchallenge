# Day 1

## Info

(will act as **remote**) VirtualBox Ubuntu Server 20.04
 - hostname: `ariana`
 - login/user: `haiji`
 - ip: `192.168.225.26`

(will act as **local**) Host Machine Ubuntu Desktop 20.04
 - hostname: `Pavilion`
 - login/user: `devpogi`
 - ip: `192.168.225.44`

## Notes

- [x] Changed the network adapter setting->Attached to-> "Bridged Adapter" in VirtualBox.

This gave me IP of 192.168.225.26 (found using `ip a` or `ifconfig` in the **inet** field on VM) instead of earlier 10.0.2.15 (when the VM was behind NAT in the above setting).

- [x] Connected to ariana using `ssh haiji@192.168.225.26` from *Pavilion*.

- [x] Changed password of *haiji* on *ariana* (while in `ssh` from *Pavilion*) with `passwd` command.

- [x] Watched [video for PuTTY, thought I am not using Windows, it was a good watch](https://www.youtube.com/watch?v=lMMOUSRPfJc)

- [ ] Not configured *ariana* with public-key to be used for ssh.

- [ ] I don't think I will ever get a warning like below because I will not be having a public IP with a VirtualBox VM.

> Regardless of which client you use, the first time you connect to your server, you may receive a warning that you're connecting to a new server - and be asked if you wish to "cache the host key". Do this. Now, if you get a warning in future connections it means that either: (a) you are being fooled into connecting to a different machine or (b) someone may be trying a "man in the middle" attack.


- [ ] Configuring ssh client (*Pavilion*, in this case?) for fonts and fg/bg colors, PS1, etc. 

 
## Questions and Answers

[reddit link](https://www.reddit.com/r/linuxupskillchallenge/comments/inupo2/day_1_accessing_your_server/g4bu27i?utm_source=share&utm_medium=web2x&context=3)

- What are the chances that the ip (currently, 192.168.225.26) will change in future?

> It'll probably stay the same

- How much do I miss out on this course if "the bad guys/bots" are not constantly attacking my server (due to VirtualBox VM) ?

> You'll feel a lot safer :-) Seriously though, you can simply do a bunch of SSH attempted logins as "admin" , "root", "test" etc yourself to get some simulated Bad Guy traffic in your logs.


- Why don't we get attacked on cellular mobile data?

> Um, your phone won't have any "open ports"?

