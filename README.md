# kali-virt-installer

## Requirements

- `virt-install`command

## Usage

```bash
./install

# or you can set argument as follows:
# DISK_SIZE="120" EXTRA_ARGS="DEBCONF_DEBUG=5 mirror/http/proxy=http://192.168.1.123:3142" ./install
```

You can customize a post install script `post.sh`.

## References

- [1.4. What is the Debian Installer?](https://www.debian.org/releases/stable/amd64/ch01s04.en.html)
- [Appendix B. Automating the installation using preseeding](https://www.debian.org/releases/stable/amd64/apb.en.html)
- [Kali inside QEMU/LibVirt with virt-manager (Guest VM) | Kali Linux Documentation](https://www.kali.org/docs/virtualization/install-qemu-guest-vm/)
- [mr.builder/preseed.cfg at master · svx/mr.builder](https://github.com/svx/mr.builder/blob/master/ubuntu/http/preseed.cfg)
- [https://www.debian.org/releases/stable/example-preseed.txt](https://www.debian.org/releases/stable/example-preseed.txt)
- [Kali Linux / Recipes / kali-preseed-examples · GitLab](https://gitlab.com/kalilinux/recipes/kali-preseed-examples )
