#!/bin/bash

# Schauen ob zsh, wget und git installiert ist.
if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
				echo 'Alles wichtige bereits installiert.\n'
else # schauen für ubuntu/debian, arch und macos 
    sudo apt install -y zsh git wget || sudo pacman -S zsh git wget || sudo brew install git zsh wget ;
		echo "installation fertig."
fi

# Oh-my-zsh installieren.
echo "Oh-my-zsh wird installiert"
git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.config/zsh/oh-my-zsh

# Folder für Plugins und configs
mkdir -p ~/.config/zsh       # external plugins, things, will be instlled in here
# cp -f .zshrc ~/ # wird bereits vom git geholt.
cp -f zshrc.zsh ~/.config/zsh/


mkdir -p ~/.config/zsh/zshrc         # für config files
mkdir -p ~/.cache/zsh/                #  .zcompdump zsh completion cache files

if [ -f ~/.zcompdump ]; then
    mv ~/.zcompdump* ~/.cache/zsh/
fi

# install/update zsh-autosuggestions
if [ -d ~/.config/zsh/oh-my-zsh/plugins/zsh-autosuggestions ]; then
    cd ~/.config/zsh/oh-my-zsh/plugins/zsh-autosuggestions && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/oh-my-zsh/plugins/zsh-autosuggestions
fi
# install/update zsh-syntax-highlighting
if [ -d ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    cd ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
# update/install zsh-completions
if [ -d ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-completions ]; then
    cd ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-completions && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-completions ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-completions
fi
# update/install history substrung search
if [ -d ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-history-substring-search ]; then
    cd ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-history-substring-search && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-history-substring-search
fi


# INSTALL FONTS
echo "Installing Nerd Fonts"
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
fc-cache -fv ~/.fonts

#update/install powerlevel10k
if [ -d ~/.config/zsh/oh-my-zsh/custom/themes/powerlevel10k ]; then
    cd ~/.config/zsh/oh-my-zsh/custom/themes/powerlevel10k && git pull
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/oh-my-zsh/custom/themes/powerlevel10k
fi

if [ -d ~/.~/.config/zsh/fzf ]; then
    cd ~/.config/zsh/fzf && git pull
    ~/.config/zsh/fzf/install --all --key-bindings --completion --no-update-rc
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/zsh/fzf
    ~/.config/zsh/fzf/install --all --key-bindings --completion --no-update-rc
fi

if [ -d ~/.config/zsh/oh-my-zsh/custom/plugins/k ]; then
    cd ~/.config/zsh/oh-my-zsh/custom/plugins/k && git pull
else
    git clone --depth 1 https://github.com/supercrabtree/k ~/.config/zsh/oh-my-zsh/custom/plugins/k
fi

if [ -d ~/.config/zsh/marker ]; then
    cd ~/.config/zsh/marker && git pull
else
    git clone --depth 1 https://github.com/jotyGill/marker ~/.config/zsh/marker
fi

# source ~/.zshrc
echo -e "\nSudo access is needed to change default shell\n"

if chsh -s $(which zsh) && /bin/zsh ; then
    echo "Installation Successful, exit terminal and enter a new session"
else
    echo "Something is wrong"
fi 
exit
