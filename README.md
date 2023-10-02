# My dotfiles
These are deployed using GNU stow.

## How to deploy
>These next steps are taken from "My First 5 Minutes on a server."

1. Change the root password.
'passwd'

2. Fresh slate of the package manager.
`apt update && apt upgrade`

3. Install "Fail2ban" to monitor log attempts to a server and blocks suspicious activity as it occurs.
`apt install fail2ban`

4. Setting up your login user.
`useradd joonas mkdir /home/joonas mkdir /home/joonas/.ssh chmod 700 /home/joonas/.ssh`

5. Require public key authentication.
`vim /home/joonas/.ssh/authorized\_keys`

6. Add the contents of the id_rsa.pub on your local machine and any other public keys.
`chmod 400 /home/joonas/.ssh/authorized\_keys chown joonas:joonas /home/joonas -R`

7. Test the new user by logging in. Log back into the root user and set sudo for login user.
`passwd joonas`

8. Add sudo access
`visudo`
`root ALL=(ALL) ALL joonas ALL=(ALL) ALL` comment all existing user/group grant lines and add this.

9. Lock down SSH, preventing password & root logins, as well as locking SSH to particular IPs.
`PermitRootLogin no PasswordAuthentication no AllowUsers joonas@(your-ip) joonas@(another-ip-if-any)`

10. Restart ssh.
`service ssh restart`

11. Set up a firewall (using Ubuntu provides ufw). This sets up a basic firewall and configures the server to accept traffic over port 80 and 443.
`ufw allow from {your-ip} to any port 22 ufw allow 80 ufw allow 443 ufw enable`

12. Install Logwatch to keep an eye. Monitors and logs emails for you.
`apt-get install logwatch vim /etc/cron.daily/00logwatch`
`/usr/sbin/logwatch --output mail --mailto test@gmail.com --detail high`

13. Download packages from a list. WORK IN PROGRESS
`xargs -a pkglist.txt sudo apt install`



Use `stow .` to deploy dotfiles on local machine.

## Needs fixing
- oh-my-zsh
    - zsh-syntaxhighlighting
    - zsh-autosuggestion
