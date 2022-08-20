
#################################################
#               Custom Prompt                   #
#################################################

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[blue]%}%25<…<%~%<< $% %{$reset_color%}%b "


#################################################
#               History Settings                #
#################################################

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS


#################################################
#                 Old Config                    #
#################################################

# Basic auto/tab complete: (All replaced by zsh-autocomplete plugin)
#autoload -U compinit
#zstyle ':completion:*' menu select
#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=00}:${(s.:.)LS_COLORS}")';
#zmodload zsh/complist
#compinit
#_comp_options+=(globdots)		# Include hidden files.

## vi mode
#bindkey -v
#export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -v '^?' backward-delete-char
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


#################################################
#                   Aliases                     #
#################################################

alias \
  mdisk="udisksctl mount -b $1" \
  mkdir="mkdir -p" \
  grep="grep --color=auto" \
  diff="diff --color=auto" \
  vim="nvim" \
  vimdiff="nvim -d" \
  ls="ls --color" \
  gcl="git clone" \
  git-status="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
  xi="doas xbps-install -y" \
  xq="xbps-query -Rs" \
  xr="doas xbps-remove -Ro" \
  rm="rm -i"
  # poweroff="systemctl hibernate"
  md () {
      mkdir -p "$@"
      cd "$@"
  }


#################################################
#               Sourcing Plugins                #
#################################################

# Load zsh-syntax-highlighting; should be last.
source ~/.config/zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
source ~/.config/zsh/plugins/colorize/colorize.plugin.zsh
#source ~/.config/zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
#source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/history-substring-search/history-substring-search.zsh


#################################################
#               zsh-autocomplete                #
#################################################

# no:  Tab inserts the top completion.
# yes: Tab first inserts a substring common to all listed completions, if any.
zstyle ':autocomplete:*' insert-unambiguous yes

# complete-word: (Shift-)Tab inserts the top (bottom) completion.
# menu-complete: Press again to cycle to next (previous) completion.
# menu-select:   Same as `menu-complete`, but updates selection in menu.
# ⚠️ NOTE: This setting can NOT be changed at runtime.
zstyle ':autocomplete:*' widget-style menu-select

# no:  Tab uses Zsh's completion system only.
# yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# ⚠️ NOTE: This setting can NOT be changed at runtime and requires that you
# have installed Fzf's shell extensions.
zstyle ':autocomplete:*' fzf-completion no

zstyle ':autocomplete:*' fzf-completion no
# no:  Tab uses Zsh's completion system only.
# yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# ⚠️ NOTE: This setting can NOT be changed at runtime and requires that you
# have installed Fzf's shell extensions.


#################################################
#                    Misc                       #
#################################################

# bindings for history-substring-search
# putting them here since zsh-syntax-highlighting
# complained
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

# Change zsh-syntax-highlighting color
# ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
# ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
