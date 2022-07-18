export XDG_CACHE_HOME=${HOME}/.cache/
export XDG_CONFIG_HOME=$HOME/.config/
export XDG_CURRENT_DESKTOP=Unity
export XDG_CURRENT_DESKTOP=river
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_SESSION_DESKTOP=river
export XDG_SESSION_TYPE=wayland

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export GTK_USE_PORTAL=0
export GDK_BACKEND=wayland
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GOPROXY=direct
export LEIN_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/lein"
export LESSHISTFILE="-"
export MOZ_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME:-$HOME/.config}/java"

export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat --theme Nord -l man -p'"

[[ -d "$HOME/.bin" ]] && PATH="$HOME/.bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.cargo/bin" ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -d "/usr/local/share/go/bin" ]] && PATH="/usr/local/share/go/bin:$PATH"
[[ -d "$HOME/.config/yarn/global/node_modules/.bin" ]] && PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ -z $WAYLAND_DISPLAY && $(tty) = "/dev/tty1" ]]; then
	exec dbus-run-session river -log-level debug > /tmp/river-${timestamp}.log 2>&1
fi
