#Terminal Greeting

time=''

if [ $(date +%H) -lt 12 ]; then
	time='good morning'
elif [ $(date +%H) -lt 18 ]; then
	time='good afternoon'
else
	time='good evening'
fi

echo -e "\e[96mHello\e[39m \e[94m$(whoami)\e[39m, ${time}. "
echo -e "Today is \e[91m$(date)\e[39m"
echo
echo "Loading you personal settings..."
echo

# Prompt
PS1='\[\033[01;91m\]\w\[\033[00m\] \[\033[01;33m\]$\[\033[00m\] '

# Environemnt Paths
export GOPATH=$HOME/Code/go
export PATH=$PATH:/usr/lib/dart/bin:/usr/local/:/usr/local/go/bin:$GOPATH/bin:/usr/local/share/scala/bin:/usr/bin/mongodb/bin

export BASHRC=$HOME/Code/github/dotfiles/.bashrc
#Aliases

alias reload='source $BASHRC'
alias settings='vim $BASHRC'
alias lsa='ls -lhXG'
alias cl='clear'
alias grep='grep --color=auto'
alias ping='ping -c 5'
alias diff='colordiff'
alias bye='exit'
alias install='sudo apt-get install'
alias update='sudo apt-get -qq update && sudo apt-get upgrade'
alias node='node --harmony --use-strict'
alias redshift='redshift -l 35.292350:-120.684928 -t 4500:1500 -v'
alias chrome='google-chrome'
alias g='git'

# Functions

# --- replaces need to ls after cd.
c() {
	cd $1 && ls --color=auto
}

# --- moves files to trash folder.
del() {
	mv $1 ~/.local/share/Trash/files
}

# --- moves .jscsrc, .jshint, and other dotfiles to folder.
devcnf() {
	cp ~/projects/github/dotfiles/.jscsrc $1
	cp ~/projects/github/dotfiles/.jshintrc $1
	cp ~/projects/github/dotfiles/.babelrc $1
	cp ~/projects/github/dotfiles/.gitconfig $1
}

repo() {
	c ~/projects/github/$1
}

# --- scans filesystem 3 levels deep, history, packages and binaries.
scan() {

	#find $1 -name "$3"
	echo -e "\n\e[32mSearching Filesystem...\e[39m"
	find . -maxdepth 3 -name "$1*"
	
	echo -e "\n\e[36mSearching History...\e[39m"
        history | grep "$1"
        echo

	echo -e "\n\e[34mSearching Packages...\e[39m"
	apt-cache pkgnames | grep -i "$1" | sort

	echo -e "\n\e[33mSearching History...\e[39m"
	history | grep "$1"
	echo

	echo -e "\n\e[31mSearching Binaries...\e[39m"
	whereis "$1"

}

# --- displays system info briefly.
system() {
	echo -e "\e[36m"
	printf "\nCPU: "
	cat /proc/cpuinfo | grep "model name"  | head -1 | awk  '{ for(i = 4; i <= NF; i++) printf "%s", $i }'
	printf "\n"

	echo -e "\e[32m"
	uname -a | awk '{ printf "Kernel: %s ", $3 }'
	printf "\n"

	echo -e "\e[31m"
	uptime | awk '{ printf "Uptime: %s %s", $3, $4 }' | sed 's/,//g' 
	printf "\n\n"
	
	echo -e "\e[34m"
	sensors | grep Core | head -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
   	sensors | grep Core | grep "Core 1:" | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
	sensors | grep Core | grep "Core 2:" | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
	sensors | grep Core | tail -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
	printf "\n"

	echo -e "\e[35m"
	ifconfig | awk '/inet addr/{print "IP: " substr($2,6)}'
	printf "\n"
}

# --- a general extraction function for most files. 
pry () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "Sorry, I don't know how to extract: $1'..." ;;
       esac
   else
       echo "'$1' is not a valid file."
   fi
 }




# Miscellaneous

# -- Colorful Manual Pages
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan 








