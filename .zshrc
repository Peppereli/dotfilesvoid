HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
alias sudo='doas'
# Load colors and set the prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# --- Aliases ---
# General aliases
alias ff="~/.config/fetch"
alias ls='ls --color=auto'
alias gpp='g++'
# Neovim config aliases
alias editsway='nvim ~/.config/sway/config'
alias editwaybar='nvim ~/.config/waybar/config.jsonc'
alias editwaycss='nvim ~/.config/waybar/style.css'
# --- Autocompletion ---
# Basic auto/tab complete
autoload -U compinit
zmodload zsh/complist
compinit
zstyle ':completion:*' menu select
_comp_options+=(globdots)
# --- Vi Mode and Cursor ---
# Enable Vi mode
bindkey -v
export KEYTIMEOUT=1
# Use Vim keys in the tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Custom function to change cursor shape based on vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q' # Block cursor for command mode
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]]; then
    echo -ne '\e[5 q' # Beam cursor for insert mode
  fi
}
zle -N zle-keymap-select
# Set initial cursor shape and update on each new prompt
function zle-line-init {
  zle -K viins # Ensure insert mode is the default
  echo -ne '\e[5 q'
}
zle -N zle-line-init
preexec() { echo -ne '\e[5 q' ;}

l () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
# --- Plugins ---
# Source plugins, suppressing errors
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
