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

mkdir -p "${ROOT_USER_DIR}"/.config/qterminal.org
cat <<EOF > "${ROOT_USER_DIR}"/.config/qterminal.org/qterminal.ini
[General]
AskOnExit=false
BookmarksFile=/root/.config/qterminal.org/qterminal_bookmarks.xml
BookmarksVisible=true
Borderless=true
ChangeWindowIcon=false
ChangeWindowTitle=false
ConfirmMultilinePaste=false
FixedTabWidth=true
FixedTabWidthValue=250
HideTabBarWithOneTab=true
HistoryLimited=false
HistoryLimitedTo=1000
KeyboardCursorShape=2
LastWindowMaximized=true
MenuVisible=false
MotionAfterPaste=0
SavePosOnExit=false
SaveSizeOnExit=true
ScrollbarPosition=0
ShowCloseTabButton=false
TabBarless=true
TabsPosition=0
Term=xterm-256color
TerminalBackgroundImage=
TerminalMargin=6
TerminalTransparency=0
TerminalsPreset=0
TrimPastedTrailingNewlines=false
UseBookmarks=false
UseCWD=false
colorScheme=Linux
emulation=linux
enabledBidiSupport=true
fontFamily=Bitstream Vera Sans Mono
fontSize=10
guiStyle=
highlightCurrentTerminal=false
showTerminalSizeHint=true
version=0.14.1

[DropMode]
Height=99
KeepOpen=false
ShortCut=Alt+F12
ShowOnStart=true
Width=99

[MainWindow]
ApplicationTransparency=8
isMaximized=false
pos=@Point(1920 0)
size=@Size(1920 1056)
state=@ByteArray(\0\0\0\xff\0\0\0\0\xfd\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\0\xfc\x2\0\0\0\x1\xfb\0\0\0&\0\x42\0o\0o\0k\0m\0\x61\0r\0k\0s\0\x44\0o\0\x63\0k\0W\0i\0\x64\0g\0\x65\0t\0\0\0\0\0\xff\xff\xff\xff\0\0\0u\0\xff\xff\xff\0\0\a\x80\0\0\x4 \0\0\0\x4\0\0\0\x4\0\0\0\b\0\0\0\b\xfc\0\0\0\0)

[Sessions]
size=0

[Shortcuts]
Add%20Tab=
Bottom%20Subterminal=
Clear%20Active%20Terminal=
Close%20Tab=
Collapse%20Subterminal=
Copy%20Selection=Ctrl+Shift+C
Find=
Fullscreen=F11
Hide%20Window%20Borders=
Left%20Subterminal=
Move%20Tab%20Left=
Move%20Tab%20Right=
New%20Window=
Next%20Tab=
Next%20Tab%20in%20History=
Paste%20Clipboard=Ctrl+Shift+V
Paste%20Selection=Shift+Ins
Preferences...=
Previous%20Tab=
Previous%20Tab%20in%20History=
Quit=
Rename%20Session=
Right%20Subterminal=
Show%20Tab%20Bar=
Split%20Terminal%20Horizontally=
Split%20Terminal%20Vertically=
Toggle%20Bookmarks=
Toggle%20Menu=
Top%20Subterminal=
Zoom%20in="Ctrl+="
Zoom%20out=Ctrl+-
Zoom%20reset=Ctrl+0
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
    docker.io
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
