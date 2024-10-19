#!/usr/bin/zsh

ROOT_USER_DIR=/root

# change left CapsLock key to Ctrl
sed -i -e 's/XKBOPTIONS=""/XKBOPTIONS="ctrl:nocaps"/g' /etc/default/keyboard

export HOME=/root

# xfce setting
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml

cat <<EOF > ~/.config/xfce4/xfconf/xfce-perchannel-xml/displays.xml
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

cat <<EOF > ~/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml
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

cat <<EOF > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
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

cat <<EOF > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-keyboard-shortcuts" version="1.0">
  <property name="commands" type="empty">
    <property name="default" type="empty">
      <property name="&lt;Alt&gt;F1" type="empty"/>
      <property name="&lt;Alt&gt;F2" type="empty"/>
      <property name="&lt;Alt&gt;F3" type="empty"/>
      <property name="&lt;Primary&gt;Escape" type="empty"/>
      <property name="Super_L" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Delete" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;l" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;t" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Shift&gt;&lt;Alt&gt;t" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Shift&gt;Escape" type="empty"/>
      <property name="&lt;Super&gt;l" type="empty"/>
      <property name="&lt;Super&gt;p" type="empty"/>
      <property name="override" type="empty"/>
      <property name="Print" type="empty"/>
      <property name="&lt;Primary&gt;Print" type="empty"/>
      <property name="&lt;Shift&gt;Print" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Shift&gt;Print" type="empty"/>
      <property name="&lt;Alt&gt;Print" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Print" type="empty"/>
      <property name="XF86Display" type="empty"/>
      <property name="XF86Mail" type="empty"/>
      <property name="XF86WWW" type="empty"/>
    </property>
    <property name="custom" type="empty">
      <property name="&lt;Alt&gt;F3" type="string" value="xfce4-appfinder"/>
      <property name="&lt;Super&gt;p" type="string" value="xfce4-display-settings --minimal"/>
      <property name="override" type="bool" value="true"/>
    </property>
  </property>
  <property name="xfwm4" type="empty">
    <property name="default" type="empty">
      <property name="Escape" type="empty"/>
      <property name="Left" type="empty"/>
      <property name="Right" type="empty"/>
      <property name="Up" type="empty"/>
      <property name="Down" type="empty"/>
      <property name="&lt;Alt&gt;Delete" type="empty"/>
      <property name="&lt;Alt&gt;Insert" type="empty"/>
      <property name="&lt;Alt&gt;F4" type="empty"/>
      <property name="&lt;Alt&gt;F6" type="empty"/>
      <property name="&lt;Alt&gt;F7" type="empty"/>
      <property name="&lt;Alt&gt;F8" type="empty"/>
      <property name="&lt;Alt&gt;F11" type="empty"/>
      <property name="&lt;Alt&gt;F12" type="empty"/>
      <property name="&lt;Alt&gt;&lt;Shift&gt;Page_Down" type="empty"/>
      <property name="&lt;Alt&gt;&lt;Shift&gt;Page_Up" type="empty"/>
      <property name="&lt;Alt&gt;&lt;Shift&gt;Tab" type="empty"/>
      <property name="&lt;Alt&gt;space" type="empty"/>
      <property name="&lt;Alt&gt;Tab" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;1" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;2" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;3" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;4" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;5" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;6" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;7" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;8" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;9" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;0" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;d" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Down" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;End" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Home" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Left" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Down" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Left" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Right" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Up" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Right" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Up" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;1" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;2" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;3" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;4" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;5" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;6" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;7" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;8" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;9" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;0" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;Down" type="empty"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;Up" type="empty"/>
      <property name="&lt;Super&gt;Down" type="empty"/>
      <property name="&lt;Super&gt;Left" type="empty"/>
      <property name="&lt;Super&gt;Right" type="empty"/>
      <property name="&lt;Super&gt;Tab" type="empty"/>
      <property name="&lt;Super&gt;Up" type="empty"/>
    </property>
    <property name="custom" type="empty">
      <property name="&lt;Primary&gt;&lt;Alt&gt;5" type="string" value="workspace_5_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;7" type="string" value="move_window_workspace_7_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Up" type="string" value="move_window_up_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;0" type="string" value="move_window_workspace_10_key"/>
      <property name="&lt;Alt&gt;F4" type="string" value="close_window_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Down" type="string" value="down_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;0" type="string" value="workspace_10_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;2" type="string" value="move_window_workspace_2_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;End" type="string" value="move_window_next_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;6" type="string" value="workspace_6_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;8" type="string" value="move_window_workspace_8_key"/>
      <property name="Right" type="string" value="right_key"/>
      <property name="&lt;Super&gt;Right" type="string" value="tile_right_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;1" type="string" value="workspace_1_key"/>
      <property name="Down" type="string" value="down_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;3" type="string" value="move_window_workspace_3_key"/>
      <property name="&lt;Alt&gt;Tab" type="string" value="cycle_windows_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Left" type="string" value="move_window_left_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;7" type="string" value="workspace_7_key"/>
      <property name="&lt;Alt&gt;F6" type="string" value="stick_window_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;9" type="string" value="move_window_workspace_9_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Right" type="string" value="move_window_right_workspace_key"/>
      <property name="&lt;Alt&gt;Delete" type="string" value="del_workspace_key"/>
      <property name="&lt;Super&gt;Tab" type="string" value="switch_window_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;4" type="string" value="move_window_workspace_4_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;2" type="string" value="workspace_2_key"/>
      <property name="&lt;Super&gt;Left" type="string" value="tile_left_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;8" type="string" value="workspace_8_key"/>
      <property name="&lt;Alt&gt;&lt;Shift&gt;Page_Up" type="string" value="raise_window_key"/>
      <property name="&lt;Alt&gt;F7" type="string" value="move_window_key"/>
      <property name="Up" type="string" value="up_key"/>
      <property name="&lt;Alt&gt;&lt;Shift&gt;Tab" type="string" value="cycle_reverse_windows_key"/>
      <property name="&lt;Alt&gt;F11" type="string" value="fullscreen_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;d" type="string" value="show_desktop_key"/>
      <property name="&lt;Alt&gt;space" type="string" value="popup_menu_key"/>
      <property name="Escape" type="string" value="cancel_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;3" type="string" value="workspace_3_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;&lt;Shift&gt;Down" type="string" value="move_window_down_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;9" type="string" value="workspace_9_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Home" type="string" value="move_window_prev_workspace_key"/>
      <property name="&lt;Alt&gt;F12" type="string" value="above_key"/>
      <property name="&lt;Alt&gt;&lt;Shift&gt;Page_Down" type="string" value="lower_window_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Left" type="string" value="left_workspace_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;4" type="string" value="workspace_4_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Right" type="string" value="right_workspace_key"/>
      <property name="&lt;Super&gt;Up" type="string" value="maximize_window_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;6" type="string" value="move_window_workspace_6_key"/>
      <property name="&lt;Primary&gt;&lt;Alt&gt;Up" type="string" value="up_workspace_key"/>
      <property name="&lt;Alt&gt;F8" type="string" value="resize_window_key"/>
      <property name="Left" type="string" value="left_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;1" type="string" value="move_window_workspace_1_key"/>
      <property name="&lt;Alt&gt;Insert" type="string" value="add_workspace_key"/>
      <property name="&lt;Super&gt;Down" type="string" value="hide_window_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;Down" type="string" value="tile_down_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;5" type="string" value="move_window_workspace_5_key"/>
      <property name="&lt;Primary&gt;&lt;Super&gt;Up" type="string" value="tile_up_key"/>
      <property name="override" type="bool" value="true"/>
    </property>
  </property>
  <property name="providers" type="array">
    <value type="string" value="xfwm4"/>
    <value type="string" value="commands"/>
  </property>
</channel>
EOF

cat <<EOF > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfwm4" version="1.0">
  <property name="general" type="empty">
    <property name="button_layout" type="empty"/>
    <property name="theme" type="empty"/>
    <property name="title_font" type="empty"/>
    <property name="easy_click" type="empty"/>
    <property name="workspace_count" type="empty"/>
    <property name="cycle_workspaces" type="bool" value="false"/>
    <property name="scroll_workspaces" type="empty"/>
    <property name="wrap_windows" type="empty"/>
    <property name="box_resize" type="empty"/>
    <property name="cycle_raise" type="bool" value="false"/>
    <property name="borderless_maximize" type="empty"/>
    <property name="workspace_names" type="empty"/>
    <property name="activate_action" type="string" value="bring"/>
    <property name="box_move" type="bool" value="false"/>
    <property name="button_offset" type="int" value="0"/>
    <property name="button_spacing" type="int" value="0"/>
    <property name="click_to_focus" type="bool" value="true"/>
    <property name="cycle_apps_only" type="bool" value="false"/>
    <property name="cycle_draw_frame" type="bool" value="true"/>
    <property name="cycle_hidden" type="bool" value="true"/>
    <property name="cycle_minimum" type="bool" value="true"/>
    <property name="cycle_minimized" type="bool" value="false"/>
    <property name="cycle_preview" type="bool" value="true"/>
    <property name="cycle_tabwin_mode" type="int" value="1"/>
    <property name="double_click_action" type="string" value="maximize"/>
    <property name="double_click_distance" type="int" value="5"/>
    <property name="double_click_time" type="int" value="250"/>
    <property name="focus_delay" type="int" value="250"/>
    <property name="focus_hint" type="bool" value="true"/>
    <property name="focus_new" type="bool" value="true"/>
    <property name="frame_opacity" type="int" value="100"/>
    <property name="frame_border_top" type="int" value="0"/>
    <property name="full_width_title" type="bool" value="true"/>
    <property name="horiz_scroll_opacity" type="bool" value="false"/>
    <property name="inactive_opacity" type="int" value="100"/>
    <property name="maximized_offset" type="int" value="0"/>
    <property name="mousewheel_rollup" type="bool" value="true"/>
    <property name="move_opacity" type="int" value="100"/>
    <property name="placement_mode" type="string" value="center"/>
    <property name="placement_ratio" type="int" value="20"/>
    <property name="popup_opacity" type="int" value="100"/>
    <property name="prevent_focus_stealing" type="bool" value="false"/>
    <property name="raise_delay" type="int" value="250"/>
    <property name="raise_on_click" type="bool" value="true"/>
    <property name="raise_on_focus" type="bool" value="false"/>
    <property name="raise_with_any_button" type="bool" value="true"/>
    <property name="repeat_urgent_blink" type="bool" value="false"/>
    <property name="resize_opacity" type="int" value="100"/>
    <property name="shadow_delta_height" type="int" value="0"/>
    <property name="shadow_delta_width" type="int" value="0"/>
    <property name="shadow_delta_x" type="int" value="0"/>
    <property name="shadow_delta_y" type="int" value="-3"/>
    <property name="shadow_opacity" type="int" value="50"/>
    <property name="show_app_icon" type="bool" value="false"/>
    <property name="show_dock_shadow" type="bool" value="true"/>
    <property name="show_frame_shadow" type="bool" value="true"/>
    <property name="show_popup_shadow" type="bool" value="false"/>
    <property name="snap_resist" type="bool" value="false"/>
    <property name="snap_to_border" type="bool" value="true"/>
    <property name="snap_to_windows" type="bool" value="false"/>
    <property name="snap_width" type="int" value="10"/>
    <property name="vblank_mode" type="string" value="auto"/>
    <property name="tile_on_move" type="bool" value="true"/>
    <property name="title_alignment" type="string" value="center"/>
    <property name="title_horizontal_offset" type="int" value="0"/>
    <property name="titleless_maximize" type="bool" value="false"/>
    <property name="title_shadow_active" type="string" value="false"/>
    <property name="title_shadow_inactive" type="string" value="false"/>
    <property name="title_vertical_offset_active" type="int" value="0"/>
    <property name="title_vertical_offset_inactive" type="int" value="0"/>
    <property name="toggle_workspaces" type="bool" value="false"/>
    <property name="unredirect_overlays" type="bool" value="true"/>
    <property name="urgent_blink" type="bool" value="false"/>
    <property name="use_compositing" type="bool" value="true"/>
    <property name="wrap_cycle" type="bool" value="true"/>
    <property name="wrap_layout" type="bool" value="true"/>
    <property name="wrap_resistance" type="int" value="10"/>
    <property name="wrap_workspaces" type="bool" value="false"/>
    <property name="zoom_desktop" type="bool" value="true"/>
    <property name="zoom_pointer" type="bool" value="true"/>
  </property>
</channel>
EOF

cat <<'EOF' >> ~/.zshrc
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

sed -e 's/^PROMPT_ALTERNATIVE=twoline/PROMPT_ALTERNATIVE=oneline/' \
    -e 's/^zle -N toggle_oneline_prompt/# zle -N toggle_oneline_prompt/' \
    -e 's/^bindkey ^P toggle_oneline_prompt/# bindkey ^P toggle_oneline_prompt/' \
    -e 's/^HISTSIZE=1000/HISTSIZE=9999999999/' \
    -e 's/^SAVEHIST=2000/SAVEHIST=9999999999/' \
    -i ~/.zshrc

chsh -s /usr/bin/zsh root

# not working
# xfconf-query -c xsettings -p /Gtk/KeyThemeName -n -t string -s Emacs

gunzip /usr/share/wordlists/rockyou.txt.gz

# my customize
git clone https://github.com/4n86rakam1/dotfiles.git "${ROOT_USER_DIR}"/.dotfiles
cd "${ROOT_USER_DIR}"/.dotfiles/ || exit 1
HOME=/root ./bootstrap/dotfiles_symlink
HOME=/root ./bootstrap/qterminal

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
echo -e "$(date +%Y-%m-%d-%H%M%S)\n$(id)\nInstallation finished." > ~/installation-log.txt
