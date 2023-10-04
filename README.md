# My dotfiles
These are deployed using GNU stow.

## How to deploy a Linux VM
> Most Linux distros if using a DE will have you create a user with sudo privileges, as well as a home directory.

1. Change the root password.
`sudo su -`

`passwd`

`exit`

2. Run `setup.sh`

3. Lock down SSH, preventing password & root logins, as well as locking SSH to particular IPs.
`sudo nvim /etc/ssh/sshd_config`
`PermitRootLogin no PasswordAuthentication no AllowUsers joonas@(your-ip) joonas@(another-ip-if-any)`

4. Restart ssh.
`service sshd restart`

5. Set up a firewall (using Ubuntu provides ufw). This sets up a basic firewall and configures the server to accept traffic over port 80 and 443.
`ufw allow from {your-ip} to any port 22 ufw allow 80 ufw allow 443 ufw enable`



## How to deploy a Server
>These next steps are taken from "My First 5 Minutes on a server."

## What to work on
- script the setup, script for each os
    - Ubuntu changes
        - Download git first
        - Add stow, curl to pkglist
    - Pop changes
        - install stow outside of pkglist
