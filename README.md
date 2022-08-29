# kali-virt-installer

I've tested in the following environments:

### Host Machine

```bash
$ neofetch
           `-/osyhddddhyso/-`              user@hostname
        .+yddddddddddddddddddy+.           ----------------
      :yddddddddddddddddddddddddy:         OS: Xubuntu 22.04.1 LTS x86_64
    -yddddddddddddddddddddhdddddddy-       Host: XPS 13 9380
   odddddddddddyshdddddddh`dddd+ydddo      Kernel: 5.15.0-46-generic
 `yddddddhshdd-   ydddddd+`ddh.:dddddy`    Uptime: 4 days, 1 hour, 40 mins
 sddddddy   /d.   :dddddd-:dy`-ddddddds    Packages: 1858 (dpkg), 120 (brew), 7 (snap)
:ddddddds    /+   .dddddd`yy`:ddddddddd:   Shell: bash 5.1.16
sdddddddd`    .    .-:/+ssdyodddddddddds   Resolution: 1920x1080, 3840x1600
ddddddddy                  `:ohddddddddd   DE: Xfce 4.16
dddddddd.                      +dddddddd   WM: Xfwm4
sddddddy                        ydddddds   WM Theme: Default
:dddddd+                      .oddddddd:   Theme: Greybird-dark [GTK2/3]
 sdddddo                   ./ydddddddds    Icons: elementary-xfce-dark [GTK2/3]
 `yddddd.              `:ohddddddddddy`    Terminal: tmux
   oddddh/`      `.:+shdddddddddddddo      CPU: Intel i7-8565U (8) @ 4.600GHz
    -ydddddhyssyhdddddddddddddddddy-       GPU: Intel WhiskeyLake-U GT2 [UHD Graphics 620]
      :yddddddddddddddddddddddddy:         Memory: 13676MiB / 15649MiB
        .+yddddddddddddddddddy+.
           `-/osyhddddhyso/-`


$ apt list libvirt-daemon libvirt-clients
Listing... Done
libvirt-clients/jammy-updates,now 8.0.0-1ubuntu7.1 amd64 [installed]
libvirt-daemon/jammy-updates,now 8.0.0-1ubuntu7.1 amd64 [installed]

$ kvm --version
QEMU emulator version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.3)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

$ virt-install --version
4.0.0
```

### Guest Machine

```bash
root@kali:~# neofetch
..............                                     root@kali
            ..,;:ccc,.                             ---------
          ......''';lxO.                           OS: Kali GNU/Linux Rolling x86_64
.....''''..........,:ld;                           Host: KVM/QEMU (Standard PC (Q35 + ICH9, 2009) pc-q35-6.2)
           .';;;:::;,,.x,                          Kernel: 5.18.0-kali5-amd64
      ..'''.            0Xxoc:,.  ...              Uptime: 43 mins
  ....                ,ONkc;,;cokOdc',.            Packages: 2594 (dpkg)
 .                   OMo           ':ddo.          Shell: zsh 5.9
                    dMc               :OO;         Resolution: 1920x1440
                    0M.                 .:o.       DE: Xfce 4.16
                    ;Wd                            WM: Xfwm4
                     ;XO,                          WM Theme: Kali-Dark
                       ,d0Odlc;,..                 Theme: Kali-Dark [GTK2/3]
                           ..',;:cdOOd::,.         Icons: Flat-Remix-Blue-Dark [GTK2/3]
                                    .:d;.':;.      Terminal: tmux
                                       'd,  .'     CPU: Intel i7-8565U (8) @ 1.992GHz
                                         ;l   ..   GPU: 00:01.0 Red Hat, Inc. QXL paravirtual graphic card
                                          .o       Memory: 1309MiB / 9720MiB
                                            c
                                            .'
                                             .

root@kali:~# cat /proc/version
Linux version 5.18.0-kali5-amd64 (devel@kali.org) (gcc-11 (Debian 11.3.0-3) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT_DYNAMIC Debian 5.18.5-1kali6 (2022-07-07)
```

## Usage

You can customize `vcpus`, `ram_size`, `disk_size`, etc.
It is used apt cache server in this `install` script by using `mirror/http/proxy` option.
Check the `install` script.

`root` user login is enabled. Its password is `toor`. You can change it in `preseed.cfg`.

In the end of installation process, it execute `post.sh` script. Check the `post.sh` script, you can customize it.

The installation command is the below:

```bash
sudo apt install -y libvirt-daemon libvirt-clients  # if you haven't already installed

./install
# or you can set argument as follows:
# DISK_SIZE="120" EXTRA_ARGS="DEBCONF_DEBUG=5 mirror/http/proxy=http://192.168.1.123:3142" ./install
```

if Installation finished, then you can open Kali VM and login with ID/Password `root`, `toor`.

## References

- [1.4. What is the Debian Installer?](https://www.debian.org/releases/stable/amd64/ch01s04.en.html)
- [Appendix B. Automating the installation using preseeding](https://www.debian.org/releases/stable/amd64/apb.en.html)
- [Kali inside QEMU/LibVirt with virt-manager (Guest VM) | Kali Linux Documentation](https://www.kali.org/docs/virtualization/install-qemu-guest-vm/)
- [mr.builder/preseed.cfg at master · svx/mr.builder](https://github.com/svx/mr.builder/blob/master/ubuntu/http/preseed.cfg)
- [https://www.debian.org/releases/stable/example-preseed.txt](https://www.debian.org/releases/stable/example-preseed.txt)
- [Kali Linux / Recipes / kali-preseed-examples · GitLab](https://gitlab.com/kalilinux/recipes/kali-preseed-examples )
