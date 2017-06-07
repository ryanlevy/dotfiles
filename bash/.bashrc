#color fixes
export PS1='\[\e[0;32m\]\h:\w $\[\e[m\] '

#make ls give colored output
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -G'
alias ll='ls -la -G' #long list
alias lsd="ls -d */" #show directories only
alias lld="ls -ld */" #show directories long format
alias llsd="lld"

# colorize grep
alias grep='grep --color=auto'

alias path='echo -e ${PATH//:/\\n}'
#continue downloaded files
alias wget='wget -c'
#typos
alias cd..='cd ..'
#use awk that outputs higher accuracy of digits
alias awkhq='awk -v OFMT=%.15g'
# Increase Bash history size. Allow 32^3*10 entries,~10 mb; the default is 500.
# optional ideas/further comments: http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE='327680';

# this omtis both duplicates from history, but omits commands that begin with space
# thus you can hide things from history with " command" easily
export HISTCONTROL='ignoreboth';

#save all bash commands to log files
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(hostname) $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

#check if a command exists, useful for crossplatform
exists () {
    type "$1" &> /dev/null ;
}

#------------------------
#	git alias
#------------------------
if exists git; then
  #gs is ghostscript unfortunately
  alias gst='git status '
  alias ga='git add '
  alias gc='git commit'
fi

#------------------------
#	Mac alias
#------------------------
if [ $(uname) = "Darwin" ]
then
	# Use Finder's Quick Look on a file (^C or space to close)
	alias ql='qlmanage -p 2>/dev/null'

	#bash-it sourced
	# Mute/Unmute the system volume. Plays nice with all other volume settings.
	alias mute="osascript -e 'set volume output muted true'"
	alias unmute="osascript -e 'set volume output muted false'"

	#Pin to the tail of long commands for an audible alert after long processes
	## curl link; lmk
	alias lmk="say 'Process complete.'"
fi
# Tree
#if tree doesn't exist, use a brute force method
#if it does, ignore .git and throw to less using colors
if [ ! -x "$(which tree 2>/dev/null)" ]
  then
	  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g' | less -FRX"
  else
	alias tree="tree -aC -I '.git' | less -FRX"	  
fi
#-------------------------
#	functions
#--------------------------
if [ $(uname) = "Darwin" ]
then
	# Open man page as PDF
	function manpdf() {
	 man -t "${1}" | open -f -a /Applications/Preview.app/
	}

	# Change working directory to the top-most Finder window location
	function cdf() { # short for `cdfinder`
		cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
	}
fi
# Extra many types of compressed packages
# Credit: http://nparikh.org/notes/zshrc.txt
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar -jxvf "$1"                        ;;
      *.tar.gz)   tar -zxvf "$1"                        ;;
      *.bz2)      bunzip2 "$1"                          ;;
      *.dmg)      hdiutil mount "$1"                    ;;
      *.gz)       gunzip "$1"                           ;;
      *.tar)      tar -xvf "$1"                         ;;
      *.tbz2)     tar -jxvf "$1"                        ;;
      *.tgz)      tar -zxvf "$1"                        ;;
      *.zip)      unzip "$1"                            ;;
      *.ZIP)      unzip "$1"                            ;;
      *.pax)      cat "$1" | pax -r                     ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      *.Z)        uncompress "$1"                       ;;
      *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
     echo "'$1' is not a valid file to extract"
  fi
}
#make a directory and enter it
function mkcd() {
  if [ ! -n "$1" ]; then
    echo "Forgot a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir -p $1 && cd $1
  fi
}
# removes all but matching params
# because it is dangerous, confirm dir 
#TODO:fix files with spaces in name
function rmbut(){
read -p "Delete all but $1 in ${PWD}? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "stop!"
else
    ls | grep -v $1 | xargs rm -r
fi
}

#setup lmod
if [ $(uname) = "Darwin" ] 
then
  source /usr/local/Cellar/lmod/5.9.3/init/bash
  module use ${HOME}/modulefiles
  export LMOD_COLORIZE="YES"
  #load default modules
  source ~/.modules
fi

if exists pass; then
  #load pass autocomplete
  source /usr/local/etc/bash_completion.d/pass
fi

#load homebrew autocompletion
for f in /usr/local/etc/bash_completion.d/*; do
    source $f
done
