# .kshrc - personal ksh settings

[ -f ~/SHELL_TEST -o -f /etc/SHELL_TEST ] && export SHELL_TEST=true
[ "$SHELL_TEST" ] && echo "Running shell $SHELL (~/.kshrc)"

[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

[ -f /etc/ksh.kshrc ] && . /etc/ksh.kshrc



export VISUAL=vim
echo "\nFor bash shell, try 'do_bash'"

[ "$SHELL_TEST" ] && echo "Finished login process (~/.kshrc)"

:
