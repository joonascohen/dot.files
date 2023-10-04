# My dotfiles
These are deployed using GNU stow.

## How to deploy a Linux VM
> Most Linux distros if using a DE will have you create a user with sudo privileges, as well as a home directory.

1. Change the root password.
`sudo su -`

`passwd`

`exit`

2. Install OPENSSH and stow to make configuration easier.
`sudo apt install openssh-server stow`

3. Copy this repository in home directory in order to config files away.
`git clone https://github.com/joonascohen/dot.files.git`

4. Stow all configuration files
`stow zsh nvim`

5. Download packages.
`xargs -a pkglist.txt sudo apt install`

6. Require public key authentication.
`mkdir ~/.ssh`

`chmod 700 ~/.ssh`

`cd .ssh`

`touch authorized_keys`

`chmod 600 ~/.ssh/authorized_keys`

`ssh-copy-id joonas@ip` on local machine


7. Lock down SSH, preventing password & root logins, as well as locking SSH to particular IPs.
`sudo nvim /etc/ssh/sshd_config`
`PermitRootLogin no PasswordAuthentication no AllowUsers joonas@(your-ip) joonas@(another-ip-if-any)`

8. Restart ssh.
`service ssh restart`

9. Set up a firewall (using Ubuntu provides ufw). This sets up a basic firewall and configures the server to accept traffic over port 80 and 443.
`ufw allow from {your-ip} to any port 22 ufw allow 80 ufw allow 443 ufw enable`

10. Install Logwatch to keep an eye. Monitors and logs emails for you.
`apt-get install logwatch vim /etc/cron.daily/00logwatch`
`/usr/sbin/logwatch --output mail --mailto test@gmail.com --detail high`

11. Install oh-my-zsh and plugins

## How to deploy a Server
>These next steps are taken from "My First 5 Minutes on a server."

## What to work on
- script the setup
