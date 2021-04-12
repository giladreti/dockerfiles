FROM ubuntu:20.10

RUN apt update && apt upgrade -y

# install essential tools
RUN apt install -y git curl wget vim

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
RUN mkdir -p ~/.local/bin && ln -s /usr/bin/batcat ~/.local/bin/bat

# install broot
RUN ~/.cargo/bin/cargo install broot

# install exa
RUN ~/.cargo/bin/cargo install exa

# enable oh-my-zsh
RUN sh -c "echo '\n# enable oh-my-zsh\nsource \$ZSH/oh-my-zsh.sh\n' >> ~/.zshrc"

# add .local/bin to path
RUN sh -c "echo '\n# add .local/bin to path\nexport PATH=~/.local/bin:\$PATH\n' >> ~/.zshrc"

# override entrypoint
ENTRYPOINT ["zsh"]
