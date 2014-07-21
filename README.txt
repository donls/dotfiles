Dotfiles

Derived From: https://github.com/michaeljsmalley/dotfiles/blob/master/README.markdown
Previously by Michael Smalley, adapted by Don Ellis for Omnitec

This repository includes all of my custom dotfiles. They should be cloned to your home directory so that the path is ~/dotfiles/. The included setup script creates symlinks from your home directory to the files which are located in ~/dotfiles/.

The setup script is smart enough to back up your existing dotfiles into a ~/dotfiles_old/ directory if you already have any dotfiles of the same name as the dotfile symlinks being created in your home directory. (I've changed dotfiles_old to dotfiles_old$$ - DEE)

[MS notes on zsh preference]
I also prefer zsh as my shell of choice. As such, the setup script will also clone the oh-my-zsh repository from my GitHub. It then checks to see if zsh is installed. If zsh is installed, and it is not already configured as the default shell, the setup script will execute a chsh -s $(which zsh). This changes the default shell to zsh, and takes effect as soon as a new zsh is spawned or on next login.
[End notes on zsh]

So, to recap, the install script will:

Back up any existing dotfiles in your home directory to ~/dotfiles_old/
Create symlinks to the dotfiles in ~/dotfiles/ in your home directory
Clone the oh-my-zsh repository from my GitHub (for use with zsh)
Check to see if zsh is installed, if it isn't, try to install it.
If zsh is installed, run a chsh -s to set it as the default shell.

Installation (revised by DEE)

git clone git://github.com/donls/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
