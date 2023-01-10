export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:/home/shaun/.local/bin:$HOME/.emacs.d/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/eclipse/bin/x86_64_linux:/var/lib/flatpak/exports/bin:$HOME/go/bin/:$HOME/.cargo/bin
export STARSHIP_CONFIG=/home/shaun/.config/starship/starship.toml
# (or local/share/flatpak/exports/bin) 
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

DISABLE_AUTO_TITLE="false"

#source /home/shaun/.config/broot/launcher/bash/br

setopt appendhistory
# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
 zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
comp_options+=(globdots)		# Include hidden files.
#
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
##
# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"
#
# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-termsupport"
#
# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "Aloxaf/fzf-tab"
#zsh_add_plugin "marlonrichert/zsh-autocomplete"
#zsh_add_completion "esc/conda-zsh-completion" false

compdef _precommand devour

[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"

#compinit

#change background colour for newly opened terminals
#(cat ~/.cache/wal/sequences &)

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

alias sudo='sudo -v; sudo '
# Edit line in vim with ctrl-e:

source /usr/share/fzf/key-bindings.zsh
#source /usr/share/fzf/completion.zsh
autoload edit-command-line; zle -N edit-command-line
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
#eval "$(mcfly init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
