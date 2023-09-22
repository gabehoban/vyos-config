# vyos-config

My VyOS config.

Thanks to bjw-s for the framework for setting up VyOS in a iac/gitops fashion!
https://github.com/bjw-s/vyos-config

# Setup/Updating

1. Copy the url from the lastest release in this repository.
2. Run the following to download the image to VyOS `add system image <url>`.
3. Reboot.
4. Once system is back online, run `show system image` to verify update.
5. Run `delete system image <old_image>` to remove the old image.

Use `commit-confirm` when doing things that might lock you out - this reboots in 10 mins by defualt if you dont enter `confirm` into the configure mode. As you haven't saved it, when it reboots it will pick up your last known working config.

## Vyos

```
cd /config
git init
git remote add origin git@github.com:<repo>.git
git branch --set-upstream-to=origin/main main
git checkout main -f
git log
```

scp age key to folder

```bash
scp ~/.config/sops/age/keys.txt vyos@<ip>:/config/secrets/age.txt
```

# Wireguard

Generate a keypair for your remote device

```
generate pki wireguard key-pair
```

Note them for remote device. Add the private key into the wg01 in interfaces.sh
