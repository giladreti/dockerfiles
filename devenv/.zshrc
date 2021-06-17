# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# initialize omz
export ZSH=/root/.oh-my-zsh

plugins=(colored-man-pages sudo zsh-autosuggestions)

# choose powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# add fzf plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
plugins+=(fzf)

# enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# add .local/bin to path
export PATH=~/.local/bin:$PATH

# add go to path
export PATH=$HOME/go/bin:$PATH

# enable zoxide
eval "$(zoxide init zsh)"

# enable broot
source /root/.config/broot/launcher/bash/br

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# choose nvim as a default editor
export EDITOR=`which nvim`

