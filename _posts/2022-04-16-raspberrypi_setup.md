---
layout: post
title: How I setup my Raspberry-pi
author: Prakrut Chaubal
date: 2022-04-16 10:34:30 +1100
categories: [Computers]
tags: [raspberry-pi]
---
# Password-less login with ssh-keys
I prefer installing Ubuntu 21 LTS server edition on my Rpi simply because it is
easier to install a lot of software packages and to find support for other
basic problems  over the internet. I will assume you have etched the image
onto the raspberry-pi and you can remotely ssh into your device.

It is annoying to type my password everytime I want to login to the device. So I enable auto-login with ssh-keys. To do
this, ssh has an inbuilt tool called ssh-copy-id which copies your public key to the .ssh directory of the remote
device.

```console
$ ssh-copy-id username@remote_host
```

This will prompt for a password and close the connection after copying the keys. If successful, the next login does not
ask for a password. 

I also disable password authentication to reduce the risk of someone being able to log in to my device by guessing
the password when I open the device to the internet. To do this I open the `/etc/ssh/sshd_config` file and set

```console
PasswordAuthentication no
```

and then restart the ssh service through systemd with 

```console
$ sudo systemctl restart ssh
```

# *btop* for monitoring the system
I really like the visual candy that btop provides over htop and so it is one of the first things I install. 
The latest release version can be downloaded from the github repo under the `releases` page. Make sure to download the
`arm-linux` version with

```console
$ wget <link_to_github_linux_arm_downloads>
```
This gives a `.tbz` file which needs `bzip2` to extract it. `bzip2` can be installed with 
```console
$ sudo apt-get install bzip2
$ bzip2 -d <filename.tbz>
$ mkdir btop
$ tar -xvf <filename.tar> -C btop
```
`btop` can now be run by running the executable `btop/bin/btop`. To make sure it is available everywhere and to all
users, I copy it to my `/usr/bin` directory with 

```console
$ sudo cp btop/bin/btop /usr/bin
```

# Miniconda
Conda does not currently provide `arm/aarch` prebuilt binaries. However, the `conda-forge` packages work. Download the
`aarch` package from <https://github.com/conda-forge/miniforge/#download>.

# Make new users

# Mount drives

# Neovim
```console
 $ sudo add-apt-repository ppa:neovim-ppa/unstable
 $ sudo apt install neovim
```


# Wireguard
```console
sudo apt install wireguard
```

# Increase swap


