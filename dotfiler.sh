#!/bin/sh

# ==============================================================================
# DOTFILER
# ------------------------------------------------------------------------------
# This is a simple script to update  my dotfiles repository or my dotfiles from
# my repository.
#
# ARGUMENTS:           USE:
# deploy               Install dotfiles to your system
# pull                 Update repository dotfiles with system's
# ==============================================================================


# ==============================================================================
# READYN
# ------------------------------------------------------------------------------
# Prompts the user with a yes/no question.
# Returns 0 if the answer is yes and 1 otherwise.
# ------------------------------------------------------------------------------
# ARGS:
# - $1 -> String :
# ==============================================================================

confirm () {
	answer=-1

#	Force an answer from the user
	while [ $answer = -1 ]; do
	#	Print the question with format "Question? [Y/n]:"
		if [ "$1" = "yes" ]; then
			printf "%s? [Y/n]: " "$2";
		elif [ "$1" = "no" ]; then
			printf "%s? [y/N]: " "$2";
		else
			printf "%s? [y/n]: " "$1";
		fi;

		read -r yn;

	#	Read answer depending on the first character
		case $yn in
			[Yy]* )
				answer=0;
			break;;

			[Nn]* )
				answer=1;
			break;;

			*     )
			#	Different behaviour depending on answer priority
				if [ "$1" = "yes" ]; then
					answer=0;
				elif [ "$1" = "no" ]; then
					answer=1;
				else
					printf "%s? [y/n]: " "$1";
				fi;
			break;;
		esac
	done

	return $answer
}


# ==============================================================================
# INSTALL
# ------------------------------------------------------------------------------
# Forcibly deploys all the available dotfiles to the machine with the
# repositorie's file structure after a warning. Also deploys any missing
# dependencies from external sources.
# Use if you use the same structure as I do and have previously backed up your
# dotfiles.
# ==============================================================================

deploy () {
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
	fi

#	Dependencies deploy for ArchLinux only
	if confirm  "Install dotfiles' missing dependencies"; then
		curl -L git.io/antigen > ~/.antigen.zsh;
	fi
}


# ==============================================================================
# PULL
# ------------------------------------------------------------------------------
# Removes the repositorie's dotfiles directory, then pulls all known dotfiles
# from the system into the repository to pull them for a new commit.
# ==============================================================================

pull () {
	if confirm "yes" "Copy dotfiles from system to repository"; then
		rm -rf files
		mkdir files

		while read -r line; do
			directory="$(echo "$line" | sed 's/'"$(basename "$line")"'//')"

			mkdir -p files/"$directory"
			cp ~/"$line" files/"$directory"/"$(basename "$line")"
		done < filelist
	fi
}


# ==============================================================================
# MAIN ROUTINE
# ------------------------------------------------------------------------------
# Handles the execution of the program based on the args provided to it.
# If none or more than one are provided, it displays the help message.
# ==============================================================================

if [ "$1" = "deploy" ]; then
	deploy;
elif [ "$1" = "pull" ]; then
	pull;
else
	printf "Use with one of two arguments:\n%s\n%s\n" \
	       "- deploy: Deploys dotfiles to the system." \
	       "- pull:   Copies dotfiles into the repository."
fi
