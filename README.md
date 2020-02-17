# Groctel's dotfiles

**Here are my dotfiles.
They are files made out of text on a directory tree with nothing.
Add them to your system if you want, I couldn't care less.** *Ron Swanson*

## Dotfiles manager

The files can be managed with `dotfiler.sh`, which accepts one of two arguments:

| ARGUMENT | DESCRIPTION                          |
| :------- | :----------------------------------- |
| `deploy` | Deploys dotfiles to the system.      |
| `pull`   | Copies dotfiles into the repository. |

This script read the dotfiles from `filelist` and both saves them to the repository and copies them into the home directory.
