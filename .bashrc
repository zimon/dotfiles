# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# change zimon|z with your username
wd=`perl -e '$x=shift; $x=~ s/(\w).*?\//$1\//g; $x=~s/\/h\/(zimon|z)/~/; print $x;' "$PWD"`
PS1='\u@\h:$wd`if [ -d .git ]; then __git_ps1; fi`\$ '

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]]; then
	eval `dircolors -b ~/.dir_colors`
else
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep -Hni --color=auto '
	# eval `dircolors -b /etc/DIR_COLORS`
fi

export EDITOR=/usr/bin/vi

# defining function up to go lots of directorys up
function up {
[ "${1/[^0-9]/}" == "$1" ] && {
        local ups=""
        for i in $(seq 1 $1)
        do
                ups=$ups"../"
        done
        cd $ups
        } || echo "usage: up INTEGER"
}

# screen stuff
function precmd {
    case "$TERM" in
        screen)
        #set -o functrace
        trap 'echo -ne "\ek\$:${BASH_COMMAND:0:20}\e\\"' DEBUG
        # change zimon|z with your username
        wd=`perl -e '$x=shift; $x=~ s/(\w).*?\//$1\//g; $x=~s/\/h\/(zimon|z)/~/; print $x;' "$PWD"`
        echo -ne "\033k$wd\033\\"
        ;;
    esac
}
PROMPT_COMMAND=precmd

source ~/.aliases
