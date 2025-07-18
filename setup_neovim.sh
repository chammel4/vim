#! /bin/bash

sudo apt install ripgrep -y
sudo apt install fd-find -y

# BEGIN install Nerd Fonts
set -euo pipefail

fonts_dir="$HOME/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
	mkdir -p "$fonts_dir"
fi

for font in "$@"; do
	zip_file="$font.zip"
	download_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$zip_file"
	echo "Downloading $download_url"
	wget -O "/tmp/$zip_file" "$download_url"
	unzip "/tmp/$zip_file" -d "/tmp/$font/"
	mv /tmp/$font/*.ttf $fonts_dir
	rm "/tmp/$zip_file"
	rm "/tmp/$font/" -rf
done

fc-cache -fv
# END install Nerd Fonts

git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim || true

# copy my custom files to nvim directories
 
cp init.lua ~/.config/nvim/
cp debug.lua ~/.config/nvim/lua/kickstart/plugins/

echo "setup script complete"
