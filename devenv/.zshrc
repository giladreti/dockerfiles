export ZSH=/root/.oh-my-zsh

plugins=()


# enable spaceship prompt
eval "$(starship init zsh)"


# add autosuggestions plugin
plugins+=(zsh-autosuggestions)


# add various plugins
plugins+=(colored-man-pages sudo)


# add z plugin
plugins+=(z)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add fzf plugin
plugins+=(fzf)


# enable oh-my-zsh
source $ZSH/oh-my-zsh.sh


# add .local/bin to path
export PATH=~/.local/bin:$PATH

