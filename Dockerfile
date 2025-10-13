FROM debian:stable-slim

ARG proxy
ARG no_proxy
ARG http_proxy=$proxy
ARG https_proxy=$proxy

ARG TARGETARCH
RUN case "${TARGETARCH}" in \
      amd64) DL_ARCH="x86_64" ;; \
      arm64) DL_ARCH="arm64" ;; \
      *) echo "Unsupported arch: ${TARGETARCH}" && exit 1 ;; \
    esac \
    && echo "$DL_ARCH" > /dl_arch

RUN apt update && apt install -y \
    curl \
    wget \
    tar \
    unzip \
    git \
    build-essential \
    ripgrep \
    fd-find \
    golang-go \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV PYENV_ROOT=/usr/local/pyenv
ENV PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
RUN git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT} \
    && pyenv install -l | grep -E "^\s*(3\.[0-9]+\.[0-9]+)$" | tail -1 | xargs pyenv install \
    && pyenv global $(pyenv versions --bare | tail -1) \
    && rm -rf ~/.pyenv/cache/*


ENV NVM_DIR=/usr/local/nvm
RUN mkdir -p $NVM_DIR \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN echo 'export NVM_DIR=/usr/local/nvm' >> /etc/bash.bashrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /etc/bash.bashrc \
    && echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> /etc/bash.bashrc
SHELL ["/bin/bash", "-ic"]
RUN nvm install --lts \
    && nvm alias default lts/* \
    && NODE_PATH=$(nvm which default) \
    && ln -s $NODE_PATH /usr/bin/node \
    && ln -s ${NODE_PATH/node/npm} /usr/bin/npm \
    && ln -s ${NODE_PATH/node/npx} /usr/bin/npx

ENV PATH=$PATH:/root/.cargo/bin
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable \
    && rustup install stable \
    && cargo install testing-language-server \
    && cargo install testing-ls-adapter \
    && rm -rf ~/.cargo/registry/cache

RUN NVIM=nvim-linux-$(cat /dl_arch) \
    && wget https://github.com/neovim/neovim/releases/download/stable/${NVIM}.tar.gz \
    && tar -zxvf ${NVIM}.tar.gz \
    && mv ${NVIM}/bin/nvim /usr/bin/nvim \
    && mv ${NVIM}/lib/nvim /usr/lib/nvim \
    && mv ${NVIM}/share/nvim/ /usr/share/nvim \
    && rm -rf ${NVIM} \
    && rm ${NVIM}.tar.gz

RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 \
    && update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 \
    && update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 

COPY . /root/.config/nvim

RUN nvim --headless "+Lazy! sync --wait" +qa
RUN nvim --headless "+AutoCocUpdate" +qa

VOLUME /app
WORKDIR /app
