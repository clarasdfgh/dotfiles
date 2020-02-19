# ==============================================================================
# CONFIRM
# ------------------------------------------------------------------------------
# Prompts the user with a yes/no question. If priority for "yes" or "no" is
# specified, an empty string or any answer other than the not prioritised one
# will be interpreted as the prioritised one.
#
# Returns 0 if the answer is yes and 1 otherwise.
# ------------------------------------------------------------------------------
# ARGS:
# - $1 -> String : Either "yes" or "no" to set the answer priority or the
#                  question string if no priority is specified.
# - $2 -> String : The question string if priority is specified.
# ==============================================================================

confirm () {
	answer=-1

#	Force an answer from the user
	while :; do
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
					break;
				elif [ "$1" = "no" ]; then
					answer=1;
					break;
				fi;
		esac
	done

	return $answer
}

