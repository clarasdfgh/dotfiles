# ==============================================================================
# FILESDEPLOY
# ------------------------------------------------------------------------------
# Forcibly deploys all the available dotfiles to the machine with the
# repositorie's file structure after a warning. Also deploys any missing
# dependencies from external sources.
# Use if you use the same structure as I do and have previously backed up your
# dotfiles.
# ==============================================================================

filesdeploy () {
	overwrite=0

	if confirm "yes" "Copy dotfiles fom repository to system"; then
	#	Confirm overwriting
		if confirm "no" "Overwrite existing files in system"; then
			overwrite=1;
		fi
	#	Deploy dotfiles line by line
		while read -r line; do
			dest="$line"

			if [ $overwrite = 0 ] && [ -e ~/"$line" ]; then
				dest="$(echo "$line" | sed 's/$/_/')"
			fi

			cp files/"$line" ~/"$dest"
		done < filelist
		ln -s ~/.vim/UltiSnips/tex.snippets ~/.vim/UltiSnips/plaintex.snippets
	fi

#	Dependencies deploy
	if confirm  "Install dotfiles' missing dependencies"; then
	#	Antigen (zsh plugin manager)
		curl -L git.io/antigen > ~/.antigen.zsh;
	#	Plug (vim plugin manager)
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		vim +"so ~/.vimrc" +PlugInstall +qall
	fi
}
