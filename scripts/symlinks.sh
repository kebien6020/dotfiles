#!/usr/bin/env sh
DOT=$HOME/.dotfiles

rm $HOME/.bashrc; ln -s $DOT/runcom/.bashrc $HOME/.bashrc
rm $HOME/.inputrc; ln -s $DOT/runcom/.inputrc $HOME/.inputrc
rm $HOME/.gitconfig; ln -s $DOT/git/.gitconfig $HOME/.gitconfig
rm $HOME/.vimrc; ln -s $DOT/vim/.vimrc $HOME/.vimrc
rm $HOME/.tmux.conf; ln -s $DOT/tmux/.tmux.conf $HOME/.tmux.conf
rm $HOME/.config/nvim; ln -s $DOT/nvim/ $HOME/.config/nvim
rm $HOME/.config/alacritty/alacritty.{yml,toml}; mkdir -p $HOME/.config/alacritty; ln -s $DOT/terminal/alacritty.toml $HOME/.config/alacritty/alacritty.toml
rm -r $HOME/.config/wezterm; ln -sf $DOT/wezterm/ $HOME/.config/wezterm
