
# Enable colors and change prompt:
autoload -U colors && colors

# Enable git status
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT="%{$fg[yellow]%}\$vcs_info_msg_0_%{$reset_color%}"
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

#PS1="%B%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[blue]%}%~%{$reset_color%}$%b "
PROMPT="%B%{$fg[blue]%}%25<…<%~%<< $% %{$reset_color%}%b "
#PS1='%15<..<%~%<<%# '
#%(4~|.../%3~|%~)
#%(5~|%-1~/…/%3~|%4~)
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=00}:${(s.:.)LS_COLORS}")';
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

## vi mode
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect 'k' vi-up-line-or-history

# Change cursor shape for different vi modes.#
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi}
#zle -N zle-keymap-select
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[1 q"
#}
#zle -N zle-line-init
#echo -ne '\e[1 q' # Use beam shape cursor on startup.
# Use beam shape cursor for each new prompt.
#preexec() { echo -ne '\e[1 q' ;}

alias \
  mdisk="udisksctl mount -b $1" \
  ip="ip a" \
  mkdir="mkdir -p" \
  grep="grep --color=auto" \
  diff="diff --color=auto" \
  update="yay -Syu" \
  unins="yay -Rns" \
  search="yay -Ss" \
  vim="nvim" \
  v="nvim" \
  vimdiff="nvim -d" \
  ls="ls --color" \
  gcl="git clone" \
  gbg="git log --graph --simplify-by-decoration --pretty=format:'%d' --all" \
  mc="minicom" \
  pc="picocom"
  # poweroff="systemctl hibernate"
  md () {
      mkdir -p "$@"
      cd "$@"
  }



# Load zsh-syntax-highlighting; should be last.
source ~/.config/zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
source ~/.config/zsh/plugins/colorize/colorize.plugin.zsh
#source ~/.config/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/history-substring-search/history-substring-search.zsh

# bindings for history-substring-search
# putting them here since zsh-syntax-highlighting
# complained
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Change zsh-syntax-highlighting color
# ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
# ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
