# Notes

<details>
<summary> AWS server details </summary>

(will act as **remote**) aws Ubuntu Server 20.04
 - hostname: `ip-172-31-45-141` (TODO: will be changed later in day 3)
 - login/user: `ubuntu`
 - ip: `?`

(will act as **local**) Host Machine Ubuntu Desktop 20.04
 - hostname: `Pavilion`
 - login/user: `devpogi`

</details>

---

- AWS already asks us to create a public-key pair. So that is the default way to access server now (`-i` switch with `ssh`).

> The first time you connect to your server, you are asked if you wish to "cache the host key". Getting this warning for future connections means that either: (a) you are being fooled into connecting to a different machine or (b) someone may be trying a "man in the middle" attack.

- I got this warning on aws ec2 (t2.micro) Ubuntu server when I relaunched the instance the next day. The public IP did change. This made me to write [this script](../scripts/write_aws_ip.sh) to keep a track of the IPs I had used in the past. This might help somehow sometime but I am not sure how for now. I think it is good to keep records anyway.
