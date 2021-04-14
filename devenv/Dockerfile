FROM ubuntu:20.10

# change workdir
WORKDIR /root

# update existing packages
RUN apt update && apt upgrade -y

# add locals
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# unminimize
RUN yes | unminimize

# install essential tools
RUN apt install -y git curl wget neovim sudo

# install zsh
RUN apt install -y zsh && chsh -s $(which zsh) && touch ~/.zshrc

# install oh-my-zsh
RUN curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash -s - --keep-zshrc

# install spaceship prompt
RUN curl -fsSL https://starship.rs/install.sh | bash -s - --yes

# install oh-my-zsh plugins
# autosuggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# z
RUN wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.z

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# install rust
RUN curl https://sh.rustup.rs -sSf | sh -s - -y
ENV PATH "/root/.cargo/bin:${PATH}"

# install c toolchain
RUN apt install -y build-essential cmake clang gdb

# install bat
RUN apt install -y bat
RUN mkdir -p ~/.local/bin && ln -s $(which batcat) ~/.local/bin/bat

# install broot
RUN cargo install broot && broot --install

# install exa
RUN cargo install exa

# install fd
RUN apt install -y fd-find
RUN mkdir -p ~/.local/bin && ln -s $(which fdfind) ~/.local/bin/fd

# install python
RUN apt install -y python3 python3-pip python-is-python3

# install ipython, ipdb
RUN pip3 install ipython ipdb

# install poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

# install strace, ltrace
RUN apt install -y strace ltrace

# binary exploitation stuff
# pwndbg
RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

# r2
RUN git clone https://github.com/radareorg/radare2 && cd radare2 && sys/install.sh

# pwntools
RUN pip3 install pwntools

# install man-db
RUN apt install -y man-db

# copy .zshrc
COPY .zshrc /root/.zshrc

# override entrypoint
ENTRYPOINT ["zsh"]

