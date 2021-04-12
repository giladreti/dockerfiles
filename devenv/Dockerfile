FROM ubuntu:20.10

# change workdir
WORKDIR ~

# update existing packages
RUN apt update && apt upgrade -y

# install essential tools
RUN apt install -y git curl wget neovim

# install zsh
RUN apt install -y zsh && chsh -s $(which zsh) && touch ~/.zshrc

# install oh-my-zsh
RUN curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash -s - --keep-zshrc
RUN sh -c "echo 'export ZSH=$HOME/.oh-my-zsh\n\nplugins=()\n' >> ~/.zshrc"

# install spaceship prompt
RUN curl -fsSL https://starship.rs/install.sh | bash -s - --yes

RUN sh -c "echo '\n# enable spaceship prompt\neval \"\$(starship init zsh)\"\n' >> ~/.zshrc"

# add oh-my-zsh plugins
# autosuggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

RUN sh -c "echo '\n# add autosuggestions plugin\nplugins+=(zsh-autosuggestions)\n' >> ~/.zshrc"

# enable various plugins
RUN sh -c "echo '\n# add various plugins\nplugins+=(colored-man-pages sudo)\n' >> ~/.zshrc"

# install z
RUN wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.z
RUN sh -c "echo '\n# add z plugin\nplugins+=(z)\n' >> ~/.zshrc"

# install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

RUN sh -c "echo '\n# add fzf plugin\nplugins+=(fzf)\n' >> ~/.zshrc"

# install rust
RUN curl https://sh.rustup.rs -sSf | sh -s - -y

# install c toolchain
RUN apt install -y build-essential cmake clang gdb

# install bat
RUN apt install -y bat
RUN mkdir -p ~/.local/bin && ln -s $(which batcat) ~/.local/bin/bat

# install broot
RUN ~/.cargo/bin/cargo install broot

# install exa
RUN ~/.cargo/bin/cargo install exa

# install fd
RUN apt install -y fd-find
RUN mkdir -p ~/.local/bin && ln -s $(which fdfind) ~/.local/bin/fd

# install python
RUN apt install -y python python-pip python3 python3-pip python-is-python3

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

# enable oh-my-zsh
RUN sh -c "echo '\n# enable oh-my-zsh\nsource \$ZSH/oh-my-zsh.sh\n' >> ~/.zshrc"

# add .local/bin to path
RUN sh -c "echo '\n# add .local/bin to path\nexport PATH=~/.local/bin:\$PATH\n' >> ~/.zshrc"

# override entrypoint
ENTRYPOINT ["zsh"]
