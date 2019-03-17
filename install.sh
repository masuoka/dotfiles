#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    # [ "$f" = ".gitconfig.local.template" ] && continue
    # [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local

# emacs set up
# if which cask >/dev/null 2>&1; then
#   echo "setup .emacs.d..."
#   cd ${THIS_DIR}/.emacs.d
#   cask upgrade
#   cask install
# fi

# cd ~/dotfiles_installer/.zprezto/runcoms/

# setopt EXTENDED_GLOB

MY_DIR = "/Users/massu1221/dotfiles"

setopt EXTENDED_GLOB
for rcfile in "${MY_DIR}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# for f in *; do
#     [ "$f" = "README.md" ] && continue

#     ln -s "$f" ~/."$f"
# done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
