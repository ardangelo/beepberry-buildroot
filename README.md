# Beepberry Buildroot

## Building an SD card image

Run `./build-image.sh`. This will download Buildroot and build a Beepberry SD card image at `buildroot/output/images/sdcard.img`.

For subsequent builds you can just run `make -j $(nproc)` from the `buildroot` directory.

For the keyboard to work, you'll need to build and flash the firmware from this PR for now: https://github.com/sqfmi/i2c_puppet/pull/1

## Extra: Configuring a WiFi network

Create a file at `root_overlay/var/lib/iwd/<SSID>.psk` with these contents:

```
[Security]
Passphrase=<passphrase>
```

Next time you build an SD card image, this network will be configured to auto-connect at boot.

## Extra: Connecting via SSH

SSH is enabled by default, you can configure WiFi as above to connect remotely to debug.

The username is `beepberry` and the password is `beepbeep`. You should change this from the default using `passwd` as soon as possible for security reasons.
