# bash initialization (this file is .bash_profile) - use .profile for others
# Derived from OpenBSD .profile, among others
# Also developed in /etc/profile.local for openSUSE,
#    but moved to home for simplicity in management (potentially GitHub)
# Settings in home directory won't be overwritten by possible upgrades.

[ -f ~/SHELL_TEST -o -f /etc/SHELL_TEST ] && export SHELL_TEST=true
[ "$SHELL_TEST" ] && echo ">> Shell is $SHELL (starting HOME/.bash_profile)"

# Handy function to attach directories to $PATH, but only if not already present.
pathmunge () {
    if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
       if [ "$2" = "after" ] ; then
          [ -d "$1" ] && PATH=$PATH:$1
       else
          [ -d "$1" ] && PATH=$1:$PATH
       fi
    fi
}

#
# Make path more comfortable
# Adapted from default openSUSE style by Don Ellis for Omnitec
# Essentially, the test for $UID == 0 has been removed.
#
### Set initial path; add HOME/bin if not root
PATH=/usr/local/bin:/usr/bin:/bin
# PATH=/bin:/usr/bin:/usr/local/bin 
if test "$HOME" != "/" ; then
    pathmunge $HOME/bin after
fi

### All userids receive same PATH setting
for dir in /opt/kde3/sbin /usr/local/sbin /usr/sbin /sbin
do
    pathmunge $dir
done

for dir in    /usr/X11/bin \
    /usr/bin/X11 \
    /usr/X11R6/bin \
    /var/lib/dosemu \
    /usr/games \
    /opt/bin \
    /opt/kde3/bin \
    /opt/kde2/bin \
    /opt/kde/bin \
    /usr/openwin/bin \
    /opt/cross/bin
do
    pathmunge $dir after
done
unset dir

export PATH HOME TERM

[ -f ~/.bashrc ] && . ~/.bashrc

[ "$SHELL_TEST" ] && echo "<< HOME/.bash_profile finished"
# End of HOME/.bash_profile
