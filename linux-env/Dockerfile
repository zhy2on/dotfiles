# A Linux build machine like the CI's: Ubuntu 24.04 with glibc and gcc, plus Rust and Java.
# Tools only: no source goes in, and nothing is built. ~/dev is mounted at the same path as on the
# Mac, so ZooKeeper, arcus-memcached and the rest are built and run by hand in its terminal.
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential autoconf automake libtool pkg-config perl \
        clang libclang-dev \
        cmake librocksdb-dev protobuf-compiler libprotobuf-dev libprotoc-dev \
        openjdk-17-jdk-headless \
        git gh curl ca-certificates netcat-openbsd \
        gdb vim less sudo trash-cli bash-completion net-tools \
    && rm -rf /var/lib/apt/lists/*

# Ubuntu 24.04 ships a user `ubuntu` with uid 1000; use it as `dev`, at home where the Mac user is,
# so that `cd` and ~ go where they do on the Mac. Only some of the Mac's home is mounted there; the
# rest of it (.bashrc, .cargo, ...) is this machine's own.
ARG HOST_HOME
RUN mkdir -p "$(dirname "$HOST_HOME")" \
    && usermod -l dev -d "$HOST_HOME" -m ubuntu && groupmod -n dev ubuntu \
    && echo 'dev ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dev \
    && mkdir -p /opt/arcus /opt/arcusdb && chown dev:dev /opt/arcus /opt/arcusdb

USER dev
RUN curl -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal \
        --component clippy,rustfmt,rust-src \
    && mkdir -p "$HOST_HOME/.cargo/registry" "$HOST_HOME/.config"
ENV PATH=$HOST_HOME/.cargo/bin:$PATH

# Git as on the Mac, by its own ~/.gitconfig: a link into ~/.dotfiles/git (mounted), with the ignore
# file it names. Its gh signs in to GitHub by the Mac's ~/.config/gh (mounted).
RUN mkdir -p "$HOST_HOME/.dotfiles/git" \
    && ln -s "$HOST_HOME/.dotfiles/git/gitconfig" "$HOST_HOME/.gitconfig" \
    && ln -s "$HOST_HOME/.dotfiles/git/gitignore_global" "$HOST_HOME/.gitignore_global"

# A typed `rm` moves to $DEV/.Trash-1000 (~/dev/.Trash-1000 on the Mac) rather than delete, as on
# the Mac; trash-list and trash-restore look there. Scripts and make still use the real rm.
RUN { echo "alias rm='trash-put'"; \
      echo 'alias trash-list="trash-list --trash-dir=$DEV/.Trash-1000"'; \
      echo 'alias trash-restore="trash-restore --trash-dir=$DEV/.Trash-1000"'; \
      echo 'PS1="\[\e[1;32m\]linux\[\e[0m\]:\w\$ "'; \
    } >> "$HOST_HOME/.bashrc"
