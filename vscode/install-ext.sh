#!/usr/bin/env bash
echo "Installing VS Code Extensions..."

# ── AI ──────────────────────────────────────────────────────────────
code --install-extension anthropic.claude-code

# ── 테마 ────────────────────────────────────────────────────────────
code --install-extension arcticicestudio.nord-visual-studio-code
code --install-extension github.github-vscode-theme

# ── Git ─────────────────────────────────────────────────────────────
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph

# ── C/C++ ───────────────────────────────────────────────────────────
code --install-extension franneck94.c-cpp-runner         # 팩 미포함, 빠른 실행
code --install-extension ms-vscode.cpptools-extension-pack  # cpptools + cmake + themes +
devtools 포함
code --install-extension vadimcn.vscode-lldb             # 팩 미포함, LLDB 디버거

# ── Java / Spring ────────────────────────────────────────────────────
code --install-extension vscjava.vscode-java-pack        # java + debug + test + dependency
  + maven 포함
code --install-extension vscjava.vscode-gradle           # java-pack 미포함, 별도 필요
code --install-extension vmware.vscode-boot-dev-pack     # spring-boot + initializr +
dashboard 포함

# ── 원격 개발 ────────────────────────────────────────────────────────
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode.remote-explorer

# ── Docker / 컨테이너 ────────────────────────────────────────────────
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-azuretools.vscode-containers
