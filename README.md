sudo -v && git clone https://github.com/caninojories/dotfiles.git \
&& mkdir -p $HOME/.dotfiles \
&& chown $USER $HOME/.dotfiles \
&& cp -RXa dotfiles/ $HOME/.dotfiles \
&& rm -rf dotfiles
