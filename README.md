sudo -v \  
&& git clone https://github.com/caninojories/dotfiles.git \  
&& mkdir -p $HOME/.dotfiles \  
&& chown $USER $HOME/.dotfiles \  
&& cp -RXa dotfiles/ $HOME/.dotfiles \  
&& rm -rf dotfiles &>/dev/null

##Add the alias in your ~/.bashrc and source it.
echo "alias dotfiles='$HOME/.dotfiles/bootstrap.sh'" >> ~/.bashrc \  
&& . ~/.bashrc
