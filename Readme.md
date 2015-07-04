# dotfiles
Here are some of the dotfiles for most of my systems. 
> _"You make the dotfiles, and the dotfiles make you"_.

I use [gnu stow](http://www.gnu.org/software/stow/) to manage them. Stow provides a clean and portable way to symlink all of the dotfiles to the appropriate directory

## Installation/Usage
Simply run:
```
$ cd ~ 
$ git clone http://github.com/ryanlevy/dotfiles
$ cd dotfiles
$ ./link.sh
````
### Uninstall:
```
$ cd dotfiles
$ ./remove.sh
```
and if you're feeling brave:
```
cd ..
rm -rf dotfiles
```
### Sync
If there are changes from the repository
```
$ git pull
$ ./rescan.sh
```
## What it's doing
The directory setup is something like:
```
├── .gitignore
├── bash
│   └── .bashrc
├── link.sh
├── remove.sh
├── rescan.sh
└── vim
    ├── .vim
    │   └── colors
    │       ├── desert.vim
    │       ├── monokai.vim
    │       └── solarized.vim
    └── .vimrc
```
Simply put the folder name as the application and any dotfiles inside, then stow will symlink them:
```
$ ls -al ~ | grep rc
lrwxr-xr-x    1 ryanlevy  staff     .bashrc -> dotfiles/bash/.bashrc
lrwxr-xr-x    1 ryanlevy  staff     .vimrc -> dotfiles/vim/.vimrc
```

[More of a tutorial](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) or [here](http://taihen.org/managing-dotfiles-with-gnu-stow/).

## Other packages
Helpful things to have installed beforehand:
* brew
* stow ([clone from source ](https://savannah.gnu.org/git/?group=stow), or `brew install stow`)
* tree (`brew install tree` if on mac)
