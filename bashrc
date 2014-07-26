# $HOME/.bashrc

# If this isn't an interactive shell, skip initialization
[ -z "$PS1" ] && return

[ -f ~/SHELL_TEST -o -f /etc/SHELL_TEST ] && export SHELL_TEST=true
[ "$SHELL_TEST" ] && echo "Running shell $SHELL (starting ~/.bashrc)"

# Omnitec Standard /etc/bash.bashrc (SuSE) or /etc/bashrc (RH)
# Derived from /etc/bash.bashrc by D Ellis for Omnitec
# If global bashrc exists at /etc/bash.bashrc, source it in
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc
[ -f /etc/bashrc ] && . /etc/bashrc             ## CentOS

# If set: do not follow sym links
# set -P
#

umask 002
set history=10000
export VISUAL=vim
export PAGER=less
export LESS='-CeM'
# vim:ts=4:sw=4

# Other prompting for root
_t=""
if test "$UID" -eq 0  ; then
    _u="\h"
    # _p=" #"
else
    _u="\u@\h"
    # _p=">"
    if test \( "$TERM" = "xterm" -o "${TERM#screen}" != "$TERM" \) \
        -a -z "$EMACS" -a -z "$MC_SID" -a -n "$DISPLAY"
    then
        _t="\$(ppwd \l)"
    fi
    if test -n "$restricted" ; then
        _t=""
    fi
fi
case "$(declare -p PS1 2> /dev/null)" in
*-x*PS1=*)
    ;;
*)
    # With full path on prompt
#        PS1="\n${_t}${_u}:\w\n\$ "
#        # With short path on prompt
#        PS1="${_t}${_u}:\$(spwd)${_p} "
#        # With physical path even if reached over sym link
#        PS1="${_t}${_u}:\$(pwd -P)${_p} "
    ;;
esac

# Colored root prompt (see bugzilla #144620)
if test "$UID" -eq 0 -a -t ; then
    _color="01;31m"     # Red
#        _bred="$(path tput bold 2> /dev/null; path tput setaf 1 2> /dev/null)"
#        _sgr0="$(path tput sgr0 2> /dev/null)"
#        unset _bred _sgr0
else
    _color="01;32m"     # Green
fi

# PS1="\n\[\033[$_color\]\u\[\033[00m\]@\h:\[\033[01;34m\]\w\[\033[00m\]\n\\$ "

[ "$SHELL_TEST" ] && echo "	Setting PS1 for userid $UID in HOME/.bashrc"
case $(basename $SHELL) in
    "bash" )
	# This variant sets $/# prompt to color also
	# PS1="\n\[\033[$_color\]\u\[\033[00m\]@\h:\[\033[01;34m\]\w\[\033[00m\] (\s)\n\[\033[$_color\]\\$\[\033[00m\] "
	PS1="\n\[\033[$_color\]\u\[\033[00m\]@\h:\[\033[01;34m\]\w\[\033[00m\] (\s)(original in .bashrc)\n\\$ "
	alias do_ksh='[ -x /bin/ksh ] && (export SHELL=/bin/ksh; export ENV=$HOME/.kshrc; exec -l ksh )'
	echo "    For ksh shell, try 'do_ksh'"
        ;;

    "zsh" )
        echo "Running z shell"
        ;;

    "ksh" ) 
	# PS1='\n\e[1;31\]m\u\e[0m\]@\h:\w (\s)\n\$ '
	# This variant set $/# prompt to color also
	# PS1="\n\e[$_color\]\u\e[00m\]@\h:\e[01;34m\]\w\e[00m\] (\s)\n\e[$_color\]\\$\e[00m\] "
	# Set prompt to $ or # depending on root or not
	case $(id -u) in
		0) _who='# ';;
		*) _who='$ ';;
	esac

	# PS1="\n\e[$_color\]\u\e[00m\]@\h:\e[01;34m\]\w\e[00m\] (\s)\n${_who}"
	PS1="\n\e[$_color\]\u\e[00m\]@\h:\e[01;34m\]\w\e[00m\] (\s)(reset in .bashrc)\n\\$ "
	alias do_bash='[ -x /usr/local/bin/bash ] && (export SHELL=/usr/local/bin/bash ; exec bash -l )'
	echo "\nFor bash shell, try 'do_bash'"
        ;;      
esac

# unset _u _p _t
unset _u _t _color

# End of custom PS1 settings

if test "$UID" -eq 0 -a -t ; then
	export PKG_PATH=ftp://apollo.omnitec.net/OpenBSD/`uname -a | cut -d" " -f 3`/packages/`uname -a | cut -d" " -f 5`/
	alias   pkg_find="echo ls | ftp -a $PKG_PATH | sed 's/.*\ //g' | grep -i "
fi

# Source aliases in from home/.bash_alias
[ -r ~/.bash_alias ] && . ~/.bash_alias

# Set vi mode for history editing
set -o vi

[ "$SHELL_TEST" ] && echo "<< ~/.bashrc finishing"

# End of ~/.bashrc
