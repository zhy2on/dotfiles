# Global Claude Instructions

## 파일 삭제 규칙

- 파일/디렉토리 삭제 시 반드시 `rm`만 사용한다 (`rm -rf` 금지).
- `find -delete`, `find -exec rm`, `unlink` 등 Trash를 거치지 않는 삭제 명령어는 사용하지 않는다.
- 삭제가 필요한 상황에서 `rm`으로 처리가 어려우면, 사용자에게 방법을 물어본다.

## Git

- commit과 push는 어느 레포에서도 하지 않는다. 사용자가 직접 한다. 커밋 메시지와 명령만 추천한다.

## 공개 범위

- public 레포(dotfiles 등)나 외부 서비스에는 회사 코드나 private 레포의 정보를 넣지 않는다.

## dotfiles

- dotfiles는 `~/.dotfiles`(public 레포 `dotfiles`)에 고정한다. `~/.gitconfig`, `~/.gitignore_global`, `~/.claude/CLAUDE.md`, `~/.local/bin/{cmv,lx}`는 그쪽을 가리키는 symlink다.

## 도구

@~/.dotfiles/bin/CLAUDE.md

## 개발 환경

@~/.dotfiles/linux-env/CLAUDE.md
