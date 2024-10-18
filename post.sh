#!/bin/bash

ROOT_USER_DIR=/root

# change left CapsLock key to Ctrl
sed -i -e 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/g' /etc/default/keyboard

mkdir -p "${ROOT_USER_DIR}"/.config/xfce4/xfconf/xfce-perchannel-xml
cat <<EOF > "${ROOT_USER_DIR}"/.config/xfce4/xfconf/xfce-perchannel-xml/displays.xml
<?xml version="1.0" encoding="UTF-8"?>
<channel name="displays" version="1.0">
  <property name="ActiveProfile" type="string" value="Default"/>
  <property name="Default" type="empty">
    <property name="Virtual-1" type="string" value="Virtual-1">
      <property name="Active" type="bool" value="true"/>
      <property name="EDID" type="string" value=""/>
      <property name="Resolution" type="string" value="1920x1440"/>
      <property name="RefreshRate" type="double" value="60.000000"/>
      <property name="Rotation" type="int" value="0"/>
      <property name="Reflection" type="string" value="0"/>
      <property name="Primary" type="bool" value="true"/>
      <property name="Scale" type="empty">
        <property name="X" type="double" value="1.000000"/>
        <property name="Y" type="double" value="1.000000"/>
      </property>
      <property name="Position" type="empty">
        <property name="X" type="int" value="0"/>
        <property name="Y" type="int" value="0"/>
      </property>
    </property>
  </property>
</channel>
EOF

mkdir -p "${ROOT_USER_DIR}"/.config/xfce4/xfconf/xfce-perchannel-xml
cat <<EOF > "${ROOT_USER_DIR}"/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml
<?xml version="1.0" encoding="UTF-8"?>
<channel name="keyboards" version="1.0">
  <property name="Default" type="empty">
    <property name="KeyRepeat" type="empty">
      <property name="Delay" type="int" value="181"/>
      <property name="Rate" type="int" value="60"/>
    </property>
    <property name="Numlock" type="bool" value="false"/>
  </property>
</channel>
EOF

mkdir -p "${ROOT_USER_DIR}"/.config/xfce4/xfconf/xfce-perchannel-xml
cat <<EOF > "${ROOT_USER_DIR}"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-power-manager" version="1.0">
  <property name="xfce4-power-manager" type="empty">
    <property name="power-button-action" type="empty"/>
    <property name="show-panel-label" type="empty"/>
    <property name="show-tray-icon" type="bool" value="false"/>
    <property name="dpms-on-ac-sleep" type="uint" value="0"/>
    <property name="blank-on-ac" type="int" value="0"/>
    <property name="dpms-on-ac-off" type="uint" value="0"/>
    <property name="dpms-enabled" type="bool" value="false"/>
  </property>
</channel>
EOF


cat <<'EOF' >> "${ROOT_USER_DIR}"/.zshrc
setopt share_history
bindkey -e
bindkey '\ef' emacs-forward-word

# ref: https://www.emacswiki.org/emacs/TrampMode#h5o-9
if [[ "$TERM" == "dumb" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  if whence -w precmd >/dev/null; then
      unfunction precmd
  fi
  if whence -w preexec >/dev/null; then
      unfunction preexec
  fi
  PS1='$ '
fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias code="code --unity-launch --no-sandbox --user-data-dir=~/.config/Code --disable-gpu-sandbox"

export LESS="-asXFMMRqix8 --mouse --wheel-lines=3"
EOF

chsh -s /usr/bin/zsh root

sed -e 's/^PROMPT_ALTERNATIVE=twoline/PROMPT_ALTERNATIVE=oneline/' \
    -e 's/^zle -N toggle_oneline_prompt/# zle -N toggle_oneline_prompt/' \
    -e 's/^bindkey ^P toggle_oneline_prompt/# bindkey ^P toggle_oneline_prompt/' \
    -e 's/^HISTSIZE=1000/HISTSIZE=9999999999/' \
    -e 's/^SAVEHIST=2000/SAVEHIST=9999999999/' \
    -i "${ROOT_USER_DIR}"/.zshrc

# not working
# xfconf-query -c xsettings -p /Gtk/KeyThemeName -n -t string -s Emacs

gunzip /usr/share/wordlists/rockyou.txt.gz

# my customize
git clone https://github.com/4n86rakam1/dotfiles.git "${ROOT_USER_DIR}"/.dotfiles
cd "${ROOT_USER_DIR}"/.dotfiles/ || exit 1
HOME=/root ./bootstrap/dotfiles_symlink
HOME=/root ./bootstrap/qterminal

wget -q https://github.com/4n86rakam1.keys -O "${ROOT_USER_DIR}"/.ssh/authorized_keys
chmod 600 "${ROOT_USER_DIR}"/.ssh/authorized_keys

apt_packages_list=(
    7zip
    altdns
    arjun
    beef-xss
    binwalk
    bloodhound
    borgbackup
    bzip2
    cargo
    cewl
    checksec
    cherrytree
    cisco-auditing-tool
    cmake
    crackmapexec
    dnsenum
    dnsrecon
    enum4linux
    evil-winrm
    exploitdb
    eyewitness
    fcrackzip
    ffmpeg
    ffuf
    foremost
    gdb
    ghidra
    git
    glusterfs-cli
    glusterfs-server
    gnupg
    gobuster
    golang-go
    gzip
    hashcat
    htop
    httprobe
    hydra
    imagemagick
    john
    jq
    keepass2
    ltrace
    masscan
    mawk
    mongodb-clients
    naabu
    neo4j
    neofetch
    nikto
    npm
    nuclei
    peass
    pspy
    recon-ng
    responder
    rlwrap
    seclists
    sendemail
    shellcheck
    shellter
    sherlock
    sleuthkit
    smbclient
    smbmap
    smtp-user-enum
    socat
    spice-vdagent
    sqlmap
    squashfs-tools
    stegcracker
    steghide
    strace
    subfinder
    sublist3r
    traceroute
    tzdata
    wfuzz
    wget
    whatweb
    whois
    wine64
    winetricks
    wordlists
    wpscan
    xq
    xsel
    xxd
    xz-utils
    yq
    zlib1g
)

DEBIAN_FRONTEND=noninteractive apt-get install -qq "${apt_packages_list[@]}"

# finished
echo Installation finished. > "${ROOT_USER_DIR}/installation-$(date +%Y-%m-%d-%H%M%S).txt"
