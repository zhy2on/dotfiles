# Linux 개발 환경 (dev-linux)

- 개발 폴더는 `~/dev`다. 편집, Claude Code, git은 macOS에서 하고, 빌드, 실행, 테스트, ZooKeeper와 클러스터 구성은 Linux 컨테이너 `dev-linux`(Ubuntu 24.04, glibc)에서 한다. Mac에서는 빌드하지 않는다.
- 컨테이너에는 `lx`로 들어간다. 지금 폴더 그대로 셸이 열리고, `lx <명령>`은 명령 하나만 실행한다. 컨테이너가 멈춰 있으면 `lx`가 띄운다.
- 컨테이너 설정은 `~/.dotfiles/linux-env/`(Dockerfile, compose.yml)에 있다. 고친 뒤에는 `docker compose -f ~/.dotfiles/linux-env/compose.yml up -d --build`로 다시 만든다.
- `~/dev`는 컨테이너에 Mac과 같은 경로로 mount돼 있고, 컨테이너의 홈도 Mac과 같은 경로다.
- 빌드 결과물은 소스 자리(공유 폴더)에 생긴다. Mac의 rust-analyzer는 `target/rust-analyzer/`를 따로 쓴다.
- 컨테이너를 다시 만들어도 남는 곳은 `~/dev`와 volume(`$PREFIX`=/opt/arcus, `$ARCUSDB_INSTALL_PATH`=/opt/arcusdb, `~/.cargo/registry`)뿐이다. 직접 설치하는 것(ZooKeeper 등)과 그 데이터는 volume 아래에 두고, apt 패키지는 Dockerfile에 추가한다.
- 컨테이너 안에서 직접 치는 `rm`은 `$DEV/.Trash-1000`(`~/dev/.Trash-1000`)으로 옮기는 alias다. 스크립트와 make의 `rm`은 실제로 지운다.
- SSH 세션에서는 Docker가 키체인에 접근하지 못해 이미지 받기가 실패할 수 있다. 베이스 이미지가 이미 있으면 빌드는 된다.
