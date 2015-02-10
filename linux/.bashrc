# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export GIT_PS1_SHOWDIRTYSTATE=1

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
  }

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }

#prompt
PS1="[\t][\h:\W]\$(parse_git_branch)\$ "

set -o vi
bind -m vi-insert "\C-l":clear-screen

# User specific aliases and functions

# enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias ls='ls -hF --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
#fi

#alias ls="ls --color -hFG"
alias ll="ls -ltr"
#export CLICOLOR=1
export LSCOLORS=gxbxcxdxCxegedabagacad
#export LSCOLORS=DxGxcxdxCxegedabagacad
alias la="ls -Fa"
alias lsd="ls -d -1 $PWD/*/"

#alias lsf=

alias rm="rm -i"
#alias rmold=:"rm *.o* OUTCAR CONTCAR OSZICAR CHG* DOSCAR EIGENVAL gofr *.bs h_on_left.data out  PCDAT WAVECAR  XDATCAR vasprun.xml IBZKPT"
#alias df="df -h"

#alias vim='gvim -v'
#alias vi='gvim -v'

alias fdate='date "+%Y_%m_%d"'
alias ftime='date "+%H_%M_%S"'

alias psa="ps -A"
alias psm="ps -A -m"

alias k9="kill -9"

alias bs="~/bin/xbs/xbsn in.bs"
alias qme="qstat -u smwahl"
alias units="~/bin/units -f  /home/swahl/packages/units-2.*/definitions.units"
alias git="~/packages/git-master/git"

alias cdw="cd ~/scr/workspace/"

alias sshp="ssh -Y smwahl@sfe2.nas.nasa.gov"
alias sshd="ssh -Y smwahl@login.nccs.nasa.gov"
alias sshs="ssh -Y swahl@sirens.berkeley.edu"

baribu="swahl@baribu.geo.berkeley.edu"
leipzig="swahl@mcc-411-2.geo.berkeley.edu"
dresden="swahl@dresden.geo.berkeley.edu:/media/data3/Sean_Wahl_leipzig_backup"
sirens="swahl@sirens.berkeley.edu"

# Use module function to customize baribu cluster environment...
module load intel/10.1.022 openmpi/1.8.4-intel-10.1.022

# added by Miniconda 3.8.3 installer
export PATH="/home/swahl/packages/miniconda/bin:$PATH"
