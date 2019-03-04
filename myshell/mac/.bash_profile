# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/kpy/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/kpy/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kpy/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/kpy/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
alias ll='ls -alF'
alias grep='grep --color'
alias gits='git status -uno'
alias cs='sh -x ~/myshell/cs.sh'

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "无文件要提交，干净的工作区" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h:\w\[\e[1;36m\]$(parse_git_branch)\[\e[0m\]$ '
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi
source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
export PATH=/Users/kpy/anaconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
HISTFILESIZE=100000
