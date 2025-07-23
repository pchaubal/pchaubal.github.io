+++
title = "How I setup my Raspberry-pi"
date = Date(2022, 4, 16)
rss = "This is a list of some interesting resources that I came across while browsing the internet"
tags = ["raspberry-pi"]
+++

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

# Change default shell to `bash`

```console
chsh
```

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
Conda does not currently provide `arm/aarch` pre-built binaries. However, the `conda-forge` packages work. Download the
`aarch` package from <https://github.com/conda-forge/miniforge/#download>.

# Make new users
To make a new user in Linux, the syntax is 

```console
sudo useradd -m username
```
This creates a new user with default settings defined in `/etc/default/useradd`. The `m` flag creates a home directory for the user.
We don''t want to give admin rights to all the users. To do this we can create groups such that users
of each group have a limited set of predefined privileges.
A new group with name `groupname` is created with 
```console
sudo groupadd groupname
```
We can then add new users to this group with 
```console
sudo usermed -a groupname username
```
Finally, to allow them access to the device with ssh-keys, make a `.ssh` directory in their home
directory and add their public key to the `authorized_keys` file. This directory is created by the
root user and will not have proper permissions. Set the correct permissions with 

```console
sudo chmod 700 /home/username/.ssh
sudo chmod 600 /home/username/.ssh/authorized_keys
```
and then change the ownership of the `.ssh` and all its contents recursively with
```console
sudo chown -R username:group /home/user/username/.ssh
```
Now your new user can sign-in to your device with their ssh key.
# Mount drives
To mount a drive, first make a new directory where the drive will be mounted. I prefer to make it in the top level directory.
```console
sudo mkdir /drive1
```
Then, find the name of the drive with `lsblk`. 
Finally, mount it with
```console
sudo mount -t ext4 /dev/sda1 /drive1/
```
To mount the drive at boot, find its uuid with `sudo blkid`.
Then add the following line to `/etc/fstab`:
```console
UUID=<uuid> <pathtomount> <filesystem> defaults 0 0
```
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
```console
# Turn swap off
# This moves stuff in swap to the main memory and might take several minutes
sudo swapoff -a

# Create an empty swapfile
# Note that "1G" is basically just the unit and count is an integer.
# Together, they define the size. In this case 8GB.
sudo dd if=/dev/zero of=/swapfile bs=1G count=8
# Set the correct permissions
sudo chmod 0600 /swapfile

sudo mkswap /swapfile  # Set up a Linux swap area
sudo swapon /swapfile  # Turn the swap on
```

Add `/swapfile swap swap sw 0 0` to your `/etc/fstab` to make it load at boot.


