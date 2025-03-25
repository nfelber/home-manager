{ pkgs

# Note, this should be "the standard library" + HM extensions.
, lib

# Whether to enable module type checking.
, check ? true

  # If disabled, the pkgs attribute passed to this function is used instead.
, useNixpkgsModule ? true }:

let

  modules = [
    ./accounts/email.nix
    ./accounts/calendar.nix
    ./accounts/contacts.nix
    ./config/home-cursor.nix
    ./config/i18n.nix
    ./files.nix
    ./home-environment.nix
    ./i18n/input-method/default.nix
    ./launchd/default.nix
    ./manual.nix
    ./misc/dconf.nix
    ./misc/debug.nix
    ./misc/editorconfig.nix
    ./misc/fontconfig.nix
    ./misc/gtk.nix
    ./misc/lib.nix
    ./misc/mozilla-messaging-hosts.nix
    ./misc/news.nix
    ./misc/nixgl.nix
    ./misc/numlock.nix
    ./misc/pam.nix
    ./misc/qt.nix
    ./misc/qt/kconfig.nix
    ./misc/shell.nix
    ./misc/specialisation.nix
    ./misc/submodule-support.nix
    ./misc/tmpfiles.nix
    ./misc/uninstall.nix
    ./misc/version.nix
    ./misc/vte.nix
    ./misc/xdg-autostart.nix
    ./misc/xdg-desktop-entries.nix
    ./misc/xdg-mime-apps.nix
    ./misc/xdg-mime.nix
    ./misc/xdg-portal.nix
    ./misc/xdg-system-dirs.nix
    ./misc/xdg-user-dirs.nix
    ./misc/xdg.nix
    ./misc/xfconf.nix
    ./programs/abook.nix
    ./programs/aerc.nix
    ./programs/aerospace.nix
    ./programs/afew.nix
    ./programs/alacritty.nix
    ./programs/alot.nix
    ./programs/antidote.nix
    ./programs/aria2.nix
    ./programs/astroid.nix
    ./programs/atuin.nix
    ./programs/autojump.nix
    ./programs/autorandr.nix
    ./programs/awscli.nix
    ./programs/bash.nix
    ./programs/bashmount.nix
    ./programs/bat.nix
    ./programs/bacon.nix
    ./programs/beets.nix
    ./programs/bemenu.nix
    ./programs/borgmatic.nix
    ./programs/bottom.nix
    ./programs/boxxy.nix
    ./programs/broot.nix
    ./programs/browserpass.nix
    ./programs/btop.nix
    ./programs/bun.nix
    ./programs/carapace.nix
    ./programs/cava.nix
    ./programs/cavalier.nix
    ./programs/chromium.nix
    ./programs/cmus.nix
    ./programs/command-not-found/command-not-found.nix
    ./programs/comodoro.nix
    ./programs/darcs.nix
    ./programs/dircolors.nix
    ./programs/direnv.nix
    ./programs/discocss.nix
    ./programs/distrobox.nix
    ./programs/earthly.nix
    ./programs/eclipse.nix
    ./programs/emacs.nix
    ./programs/eww.nix
    ./programs/eza.nix
    ./programs/fastfetch.nix
    ./programs/fd.nix
    ./programs/feh.nix
    ./programs/firefox.nix
    ./programs/fish.nix
    ./programs/floorp.nix
    ./programs/foot.nix
    ./programs/freetube.nix
    ./programs/fuzzel.nix
    ./programs/fzf.nix
    ./programs/gallery-dl.nix
    ./programs/getmail.nix
    ./programs/gh.nix
    ./programs/gh-dash.nix
    ./programs/ghostty.nix
    ./programs/git-cliff.nix
    ./programs/git-credential-oauth.nix
    ./programs/git-worktree-switcher.nix
    ./programs/git.nix
    ./programs/gitui.nix
    ./programs/gnome-shell.nix
    ./programs/gnome-terminal.nix
    ./programs/go.nix
    ./programs/gpg.nix
    ./programs/gradle.nix
    ./programs/granted.nix
    ./programs/havoc.nix
    ./programs/helix.nix
    ./programs/hexchat.nix
    ./programs/himalaya.nix
    ./programs/home-manager.nix
    ./programs/hstr.nix
    ./programs/htop.nix
    ./programs/hyfetch.nix
    ./programs/hyprlock.nix
    ./programs/i3blocks.nix
    ./programs/i3status-rust.nix
    ./programs/i3status.nix
    ./programs/iamb.nix
    ./programs/imv.nix
    ./programs/info.nix
    ./programs/ion.nix
    ./programs/irssi.nix
    ./programs/java.nix
    ./programs/jetbrains-remote.nix
    ./programs/jq.nix
    ./programs/jqp.nix
    ./programs/jujutsu.nix
    ./programs/joshuto.nix
    ./programs/joplin-desktop.nix
    ./programs/just.nix
    ./programs/k9s.nix
    ./programs/kakoune.nix
    ./programs/keychain.nix
    ./programs/khal.nix
    ./programs/khard.nix
    ./programs/kitty.nix
    ./programs/kodi.nix
    ./programs/kubecolor.nix
    ./programs/lapce.nix
    ./programs/lazydocker.nix
    ./programs/lazygit.nix
    ./programs/ledger.nix
    ./programs/less.nix
    ./programs/lesspipe.nix
    ./programs/lf.nix
    ./programs/librewolf.nix
    ./programs/lieer.nix
    ./programs/looking-glass-client.nix
    ./programs/lsd.nix
    ./programs/man.nix
    ./programs/mangohud.nix
    ./programs/matplotlib.nix
    ./programs/mbsync.nix
    ./programs/mcfly.nix
    ./programs/mercurial.nix
    ./programs/mergiraf.nix
    ./programs/micro.nix
    ./programs/mise.nix
    ./programs/mods.nix
    ./programs/mpv.nix
    ./programs/mr.nix
    ./programs/msmtp.nix
    ./programs/mu.nix
    ./programs/mujmap.nix
    ./programs/navi.nix
    ./programs/ncmpcpp.nix
    ./programs/ncspot.nix
    ./programs/ne.nix
    ./programs/neomutt.nix
    ./programs/neovide.nix
    ./programs/neovim.nix
    ./programs/newsboat.nix
    ./programs/nh.nix
    ./programs/nheko.nix
    ./programs/nix-index.nix
    ./programs/nix-your-shell.nix
    ./programs/nnn.nix
    ./programs/noti.nix
    ./programs/notmuch.nix
    ./programs/nushell.nix
    ./programs/obs-studio.nix
    ./programs/octant.nix
    ./programs/offlineimap.nix
    ./programs/oh-my-posh.nix
    ./programs/onlyoffice.nix
    ./programs/opam.nix
    ./programs/openstackclient.nix
    ./programs/pandoc.nix
    ./programs/papis.nix
    ./programs/password-store.nix
    ./programs/pay-respects.nix
    ./programs/pazi.nix
    ./programs/pet.nix
    ./programs/pidgin.nix
    ./programs/pistol.nix
    ./programs/piston-cli.nix
    ./programs/pls.nix
    ./programs/poetry.nix
    ./programs/powerline-go.nix
    ./programs/pqiv.nix
    ./programs/pubs.nix
    ./programs/pyenv.nix
    ./programs/pylint.nix
    ./programs/qcal.nix
    ./programs/qutebrowser.nix
    ./programs/ranger.nix
    ./programs/rbw.nix
    ./programs/rclone.nix
    ./programs/readline.nix
    ./programs/rio.nix
    ./programs/ripgrep.nix
    ./programs/rofi-pass.nix
    ./programs/rofi.nix
    ./programs/rtorrent.nix
    ./programs/ruff.nix
    ./programs/sagemath.nix
    ./programs/sapling.nix
    ./programs/sbt.nix
    ./programs/scmpuff.nix
    ./programs/script-directory.nix
    ./programs/senpai.nix
    ./programs/sftpman.nix
    ./programs/sioyek.nix
    ./programs/skim.nix
    ./programs/sm64ex.nix
    ./programs/spotify-player.nix
    ./programs/sqls.nix
    ./programs/ssh.nix
    ./programs/starship.nix
    ./programs/swayimg.nix
    ./programs/swaylock.nix
    ./programs/swayr.nix
    ./programs/taskwarrior.nix
    ./programs/tealdeer.nix
    ./programs/terminator.nix
    ./programs/termite.nix
    ./programs/tex-fmt.nix
    ./programs/texlive.nix
    ./programs/thefuck.nix
    ./programs/thunderbird.nix
    ./programs/timidity.nix
    ./programs/tint2.nix
    ./programs/tiny.nix
    ./programs/tmate.nix
    ./programs/tmux.nix
    ./programs/tofi.nix
    ./programs/todoman.nix
    ./programs/topgrade.nix
    ./programs/translate-shell.nix
    ./programs/urxvt.nix
    ./programs/vdirsyncer.nix
    ./programs/vifm.nix
    ./programs/vim-vint.nix
    ./programs/vim.nix
    ./programs/vinegar.nix
    ./programs/vscode.nix
    ./programs/vscode/haskell.nix
    ./programs/pywal.nix
    ./programs/rbenv.nix
    ./programs/watson.nix
    ./programs/waylogout.nix
    ./programs/waybar.nix
    ./programs/wezterm.nix
    ./programs/wlogout.nix
    ./programs/wofi.nix
    ./programs/xmobar.nix
    ./programs/xplr.nix
    ./programs/yambar.nix
    ./programs/yazi.nix
    ./programs/yt-dlp.nix
    ./programs/z-lua.nix
    ./programs/zathura.nix
    ./programs/zed-editor.nix
    ./programs/zellij.nix
    ./programs/zk.nix
    ./programs/zoxide.nix
    ./programs/zplug.nix
    ./programs/zsh.nix
    ./programs/zsh/prezto.nix
    ./programs/zsh/zsh-abbr.nix
    ./services/activitywatch.nix
    ./services/amberol.nix
    ./services/arrpc.nix
    ./services/autorandr.nix
    ./services/avizo.nix
    ./services/barrier.nix
    ./services/batsignal.nix
    ./services/betterlockscreen.nix
    ./services/blanket.nix
    ./services/blueman-applet.nix
    ./services/borgmatic.nix
    ./services/cachix-agent.nix
    ./services/caffeine.nix
    ./services/cbatticon.nix
    ./services/cliphist.nix
    ./services/clipman.nix
    ./services/clipmenu.nix
    ./services/clipse.nix
    ./services/comodoro.nix
    ./services/conky.nix
    ./services/copyq.nix
    ./services/darkman.nix
    ./services/davmail.nix
    ./services/devilspie2.nix
    ./services/dropbox.nix
    ./services/dunst.nix
    ./services/dwm-status.nix
    ./services/easyeffects.nix
    ./services/emacs.nix
    ./services/etesync-dav.nix
    ./services/espanso.nix
    ./services/flameshot.nix
    ./services/fluidsynth.nix
    ./services/fnott.nix
    ./services/fusuma.nix
    ./services/getmail.nix
    ./services/git-sync.nix
    ./services/glance.nix
    ./services/gnome-keyring.nix
    ./services/gpg-agent.nix
    ./services/grobi.nix
    ./services/gromit-mpx.nix
    ./services/home-manager-auto-upgrade.nix
    ./services/hound.nix
    ./services/hypridle.nix
    ./services/hyprpaper.nix
    ./services/hyprpolkitagent.nix
    ./services/imapnotify.nix
    ./services/jankyborders.nix
    ./services/kanshi.nix
    ./services/kbfs.nix
    ./services/kdeconnect.nix
    ./services/keybase.nix
    ./services/keynav.nix
    ./services/librespot.nix
    ./services/lieer.nix
    ./services/linux-wallpaperengine.nix
    ./services/listenbrainz-mpd.nix
    ./services/lorri.nix
    ./services/lxqt-policykit-agent.nix
    ./services/macos-remap-keys
    ./services/mako.nix
    ./services/mbsync.nix
    ./services/megasync.nix
    ./services/mopidy.nix
    ./services/mpd.nix
    ./services/mpdris2.nix
    ./services/mpd-discord-rpc.nix
    ./services/mpd-mpris.nix
    ./services/mpris-proxy.nix
    ./services/muchsync.nix
    ./services/network-manager-applet.nix
    ./services/nextcloud-client.nix
    ./services/nix-gc.nix
    ./services/notify-osd.nix
    ./services/ollama.nix
    ./services/opensnitch-ui.nix
    ./services/osmscout-server.nix
    ./services/owncloud-client.nix
    ./services/pantalaimon.nix
    ./services/parcellite.nix
    ./services/pass-secret-service.nix
    ./services/pasystray.nix
    ./services/pbgopy.nix
    ./services/picom.nix
    ./services/plan9port.nix
    ./services/playerctld.nix
    ./services/plex-mpv-shim.nix
    ./services/podman-linux
    ./services/polkit-gnome.nix
    ./services/polybar.nix
    ./services/poweralertd.nix
    ./services/psd.nix
    ./services/pueue.nix
    ./services/pulseeffects.nix
    ./services/random-background.nix
    ./services/recoll.nix
    ./services/redshift-gammastep/gammastep.nix
    ./services/redshift-gammastep/redshift.nix
    ./services/remmina.nix
    ./services/rsibreak.nix
    ./services/safeeyes.nix
    ./services/screen-locker.nix
    ./services/sctd.nix
    ./services/signaturepdf.nix
    ./services/skhd.nix
    ./services/snixembed.nix
    ./services/spotifyd.nix
    ./services/ssh-agent.nix
    ./services/stalonetray.nix
    ./services/status-notifier-watcher.nix
    ./services/swayidle.nix
    ./services/swaync.nix
    ./services/swayosd.nix
    ./services/swww.nix
    ./services/sxhkd.nix
    ./services/syncthing.nix
    ./services/systembus-notify.nix
    ./services/taffybar.nix
    ./services/tahoe-lafs.nix
    ./services/taskwarrior-sync.nix
    ./services/tldr-update.nix
    ./services/trayer.nix
    ./services/trayscale.nix
    ./services/twmn.nix
    ./services/udiskie.nix
    ./services/unclutter.nix
    ./services/unison.nix
    ./services/vdirsyncer.nix
    ./services/volnoti.nix
    ./services/window-managers/awesome.nix
    ./services/window-managers/bspwm/default.nix
    ./services/window-managers/fluxbox.nix
    ./services/window-managers/herbstluftwm.nix
    ./services/window-managers/hyprland.nix
    ./services/window-managers/i3-sway/i3.nix
    ./services/window-managers/i3-sway/sway.nix
    ./services/window-managers/i3-sway/swaynag.nix
    ./services/window-managers/river.nix
    ./services/window-managers/spectrwm.nix
    ./services/window-managers/wayfire.nix
    ./services/window-managers/xmonad.nix
    ./services/wlsunset.nix
    ./services/wluma.nix
    ./services/wob.nix
    ./services/wpaperd.nix
    ./services/xcape.nix
    ./services/xembed-sni-proxy.nix
    ./services/xidlehook.nix
    ./services/xscreensaver.nix
    ./services/xsettingsd.nix
    ./services/xsuspender.nix
    ./services/yubikey-agent.nix
    ./systemd.nix
    ./targets/darwin
    ./targets/generic-linux.nix
    ./wayland.nix
    ./xresources.nix
    ./xsession.nix
    ./misc/nix.nix
    (pkgs.path + "/nixos/modules/misc/assertions.nix")
    (pkgs.path + "/nixos/modules/misc/meta.nix")

    (lib.mkRemovedOptionModule [ "services" "password-store-sync" ] ''
      Use services.git-sync instead.
    '')
    (lib.mkRemovedOptionModule [ "services" "keepassx" ] ''
      KeePassX is no longer maintained.
    '')
  ] ++ lib.optional useNixpkgsModule ./misc/nixpkgs.nix
    ++ lib.optional (!useNixpkgsModule) ./misc/nixpkgs-disabled.nix;

  pkgsModule = { config, ... }: {
    config = {
      _module.args.baseModules = modules;
      _module.args.pkgsPath = lib.mkDefault
        (if lib.versionAtLeast config.home.stateVersion "20.09" then
          pkgs.path
        else
          <nixpkgs>);
      _module.args.pkgs = lib.mkDefault pkgs;
      _module.check = check;
      lib = lib.hm;
    } // lib.optionalAttrs useNixpkgsModule {
      nixpkgs.system = lib.mkDefault pkgs.stdenv.hostPlatform.system;
    };
  };

in modules ++ [ pkgsModule ]
