# Eensy - Embedded Linux Git Server

Project webpage is located at http://www.digitalpeer.com/eensy/.

What happens when you combine an embedded Linux board, buildroot, MySQL, Gogs,
and a host of other utilities into a witches brew of hand crafted configuration
and software?  You get a full featured embedded git service on a small, low
power, low cost device.

This project consists of a mini distro for running a full featured git server on
an embedded Linux board.

The following boards are currently supported:
* Raspberry Pi 2
* Raspberry Pi 3
* Beaglebone Black
* Cubieboard 2

However, if you know your way around buildroot it will run on any board
supported by buildroot and Gogs.

## Features

* Easily customizable with default setup.
* Boot to Gogs configuration and account setup.
* Default automatic setup and configuration of MySQL server.
* Runs Gogs externally on port 80 using iptables.
* Gogs runs as user git, root login is disabled, and sudo is setup.
* Buildroot based mini distro.
* Gogs, written in Go, is resource friendly for embedded devices.
* Uses the usbmount project to mount external media for repository storage.

## System Requirements

The build is tested on the following distributions:
* Ubuntu 16.04 LTS x86_64

### Install Ubuntu System Dependencies

Install the following system dependencies:
```sh
$ sudo apt-get install subversion build-essential bison flex gettext libncurses5-dev texinfo autoconf automake libtool mercurial git-core gperf gawk expat curl cvs libexpat-dev bzr
```

## Build

Replace CONFIG below with your board config located in eensy/configs.

To build, you need this repository and a vanilla buildroot repository.

    $ git clone https://github.com/digitalpeer/eensy.git
    $ git clone https://github.com/digitalpeer/buildroot.git
    $ cd buildroot
    $ make BR2_EXTERNAL=../eensy/ CONFIG
    $ make

## Create Bootable uSD Card

Insert your uSD card into your PC and see what device node it's using.  Make
sure and unmount any filesystems on it before continuing.

    $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M; sync

Now, you've got a ready to go uSD card.

## Setup Instructions

* Attach any external USB storaged devices you wish to use.
* Connect up a serial console unless you're feeling lucky.
* Apply power.
* The device will initialize and reboot automatically at least once.
* The defauls login is
    username: git
    password: eensy
* Out of the box, the board uses DHCP. So, figure out the IP address it gets
  assigned and navigate to that address using a web browser.
* SSH in or use the console to change the git password by running ``passwd``.

## License

Copyright (c) 2016 Joshua Henderson

Eensy is licensed under the same license as buildroot: the GNU General Public
License, either version 2 of the License, or (at your option) any later version.
See COPYING for more information.
