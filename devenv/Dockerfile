FROM ubuntu:20.10

# change workdir
WORKDIR /root

# update existing packages
RUN apt update && apt upgrade -y

# set locals
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# unminimize
RUN yes | unminimize

# some basic tools
RUN apt install -y git curl wget sudo

# zsh
RUN apt install -y zsh && chsh -s $(which zsh) && touch ~/.zshrc

# oh-my-zsh
RUN curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash -s - --keep-zshrc

# zsh autosuggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zoxide
RUN curl -sS https://webinstall.dev/zoxide | bash

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# rust
RUN curl https://sh.rustup.rs -sSf | sh -s - -y
ENV PATH "/root/.cargo/bin:${PATH}"

# c toolchain
RUN apt install -y build-essential cmake clang gdb

# bat
RUN apt install -y bat
RUN mkdir -p ~/.local/bin && ln -s $(which batcat) ~/.local/bin/bat

# broot
RUN cargo install broot && broot --install

# exa
RUN cargo install exa

# fd
RUN apt install -y fd-find
RUN mkdir -p ~/.local/bin && ln -s $(which fdfind) ~/.local/bin/fd

# python
RUN apt install -y python3 python3-pip python-is-python3

# ipython, ipdb, ptipython
RUN pip3 install ipython ipdb ptipython

# poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

# strace, ltrace
RUN apt install -y strace ltrace

# binary exploitation stuff
# pwndbg
RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

# r2
RUN git clone https://github.com/radareorg/radare2 && cd radare2 && sys/install.sh

# pwntools
RUN pip3 install pwntools

# man-db
RUN apt install -y man-db

# tmux
RUN apt install -y tmux

# p10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# software-properties-common
RUN apt install -y software-properties-common

# neovim
RUN apt-add-repository -y ppa:neovim-ppa/unstable && apt-get update && apt-get install -y neovim

# python venv
RUN apt install -y python3-venv

# nvim plugins
RUN git clone https://github.com/NvChad/NvChad ~/.config/nvim &&\
	nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

# tmux config
RUN cd && git clone https://github.com/gpakosz/.tmux.git &&\
	ln -s -f .tmux/.tmux.conf &&\
	cp .tmux/.tmux.conf.local .

# rip
RUN cargo install rm-improved

# ripgrep
RUN apt install -y ripgrep

# delta
RUN cargo install git-delta

# hexyl, xxd
RUN apt install -y hexyl xxd

# jq
RUN apt install -y jq

# go
RUN rm -rf /usr/local/go &&\
	wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz -O /tmp/go1.16.4.linux-amd64.tar.gz &&\
	tar -C /usr/local -xzf /tmp/go1.16.4.linux-amd64.tar.gz
ENV PATH "${PATH}:/usr/local/go/bin"

# yq
RUN GO111MODULE=on go get github.com/mikefarah/yq/v4

# dust
RUN cargo install du-dust

# copy .zshrc, .p10k.zsh
COPY .zshrc /root/.zshrc
COPY .p10k.zsh /root/.p10k.zsh

# override entrypoint
ENTRYPOINT ["tmux", "-2"]

