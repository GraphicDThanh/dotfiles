# Trung Ngo's Dotfiles

## Installation

This project helps to bootstrap a new machine with all dotfiles set up. Here is one liner installation

	curl -L https://raw.githubusercontent.com/trungngo/dotfiles/master/install | sh


or if you want to just test out the functionalities without messing up your local machine, you can vagrant up a new Ubuntu 16 box with all dotfiles installed for the `vagrant` user.

	cd ~
	git clone https://github.com/trungngo/dotfiles.git
	cd dotfiles
	vagrant up
	vagrant ssh


## Update 

In order to update to the latest version, please do
	
	cd ~/.dotfiles
	./install
	
## Features

### oh-my-zsh

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is my favorite plugin for `zsh` shell. This project will install:
	
* `~/.oh-my-zsh` 
	* The original source code of `oh-my-zsh` will be pulled from git at master branch.
* `~/.zshrc`
	* This is the original .zshrc from `oh-my-zsh`.
* `~/.local.zshrc`
	* Feels free to modify this file to provide your own's zsh settings.

### oh-my-vim

[oh-my-vim](https://github.com/liangxianzhe/oh-my-vim) is my favorite plugin for everyday vim. I do customize `oh-my-vim` a bit. This project will install

* `~/.oh-my-vim`
	* This is the original `oh-my-vim` source code pulled from git at master branch.
* `~/.vimrc`
	* This is the copy of the `vimrc` file of `oh-my-vim`. The tool just change the root directory to match the current linux user who is install this dotfiles.
* `~/.after.vimrc`
* `~/.before.vimrc`

### tmux

I use [tmux](https://tmux.github.io/) intensively with `vim`. This project install:

* `~/.tmux.conf`

### others

Here are some other tools that the project will install as-is:

* **[git]()**
* **[ranger](http://ranger.nongnu.org/)**
* **[curl]()**
* **[wget]()**




