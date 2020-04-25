# My config files
Dedicated to recopilate all my configuration files, principaly to my termux because i need wipe my android phone so this configurations are tested on termux app.

# Files 
## .zshrc
I use oh-my-zsh and the .zshrc file is used for any terminal configuration and alias and functions than i use.

## gretting.md
This is my welcome message inside of termux, is showed by `cat .grettings` inside the end to a .zshrc is in md format because i use it for TODOs and remember things and md in the mk forman is better to read.

## nvim/init.vim
This is my nvim config with all plugins i use
coc plugins need to install this extension by :CocInstall ...
* coc-vue
* coc-tsserver
* coc-json
* coc-ultisnipps
* coc-paits

## coc/ultisnips
This is the snippets than i created

# Symlinks
All configurations pretents to be simlink to a respective file or directory inside termux.

```
ln -s ~/.zshrc ~/my-configs/.zshrc
#Not lint the directory because minpack add plugins in the directory or add a .gitignore
ln -s ~/.config/nvim/init.vim ~/configs/nvim/init.vim
ln -s ~/.config/coc/ultisnips/ ~/configs/coc/ultisnips
```

# TODOS
* add gitignores
* make a install script
* make a update script
