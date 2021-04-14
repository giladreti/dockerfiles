# initialize omz
export ZSH=/root/.oh-my-zsh

plugins=(colored-man-pages sudo z zsh-autosuggestions)

# enable spaceship prompt
eval "$(starship init zsh)"

# add fzf plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
plugins+=(fzf)

# enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# add .local/bin to path
export PATH=~/.local/bin:$PATH

