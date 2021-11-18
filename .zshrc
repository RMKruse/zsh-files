# Powerlevel10k Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Farben.
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Editor.
EDITOR=vim

# Zsh Einstellungen.
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

# Basic auto/tab completion.
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

bindkey '^ ' autosuggest-accept

# Load Zeuch immer zu letzt.
source /home/rkruse/.config/zsh/oh-my-zsh/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# source /home/rkruse/.config/zsh/oh-my-zsh/custom/zsh-completions/zsh-completions.zsh 2>/dev/null
source /home/rkruse/.config/zsh/oh-my-zsh/custom/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source /home/rkruse/.config/zsh/oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /home/rkruse/.config/zsh/oh-my-zsh/plugins/autojump/autojump.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
