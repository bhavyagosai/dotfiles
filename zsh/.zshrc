# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# # Created by newuser for 5.8
# PROMPT='%F{208}%n%f in %F{226}%~%f -> '
eval "$(starship init zsh)"

zstyle ':completion:*' menu select

autoload -U compinit && compinit -u

bindkey -v
export KEYTIMEOUT=1

bindkey '^R' history-incremental-pattern-search-backward

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

autoload -U promptinit; promptinit

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Control bindings for programs
bindkey -s "^g" "lc\n"
bindkey -s "^h" "history 1\n"
bindkey -s "^l" "clear\n"
bindkey -s "^d" "dlfile\n"

# Include hidden files.
_comp_options+=(globdots)
