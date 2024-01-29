# Beepberry Buildroot

Buildroot is a slimmed-down, Beepy-centric image with a fast boot, compatible with the Raspberry Pi Zero 2 W. It is automatically set up with Beepy device drivers and a set of useful software. Tailored for on-the-go communication, it ships with the following applications:

* `gomuks` - Beeper command line client
* `mosh` - Mobile remote shell
* `w3m` - Text based browser
* `aerc` - Command line email client
* `nmtui` - Network management
* Python 3 with `pip`

Please install [firmware version 3.4](https://github.com/ardangelo/beepberry-rp2040/releases/tag/v3.4) for this Buildroot release.

## Pre-boot configuration: WiFi network and timezone

After flashing the SD image, configuration files added to `/boot/wlan` will be copied to the IWD directory.

You can rename and rename the file `/boot/wlan/ssid_goes_here.psk` to `/boot/wlan/<your_network_name>.psk` and edit its contents, replacing `passphrase_goes_here` with the network passphrase.

After booting, You can use the `nmtui` utility to configure Wi-Fi.

The file `timezone.txt` on the SD card's boot partition can be edited to change the device timezone. When a network is connected, time will automatically synchronize with time servers.

## Usage

For keybindings and modifier key behaviors, see [`beepy-kbd` documentation](https://github.com/ardangelo/beepberry-keyboard-driver/blob/main/README.md).

The initial boot will take about 30 seconds to resize disk partitions to fill your SD card. Subsequent boots take around 8 seconds from power-on to Tmux.

When a new Buildroot release is posted, you can update by reflashing the SD card, or by running the command `sudo update_buildroot` to pull the latest changes from the release image.

## Connecting via SSH

SSH is enabled by default, you can configure WiFi as above to connect remotely to debug.

The username is `beepy` and the password is `beepbeep`. You should change this from the default using `passwd` as soon as possible for security reasons.

## Building SD card image from source

Run `./build-image.sh`. This will download Buildroot and build a Beepberry SD card image at `buildroot/output/images/sdcard.img`.

For subsequent builds you can just run `make -j $(nproc)` from the `buildroot` directory.
