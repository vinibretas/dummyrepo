# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
interactive_echo() {
    if [[ $- == *i* ]]; then
        echo "$@"
    fi
}


interactive_echo "Sourced /home/vinibretas/.bashrc"
interactive_echo "│"
# Initialize a variable to hold the last logged time
last_time=0

# Function to log execution time with milliseconds and optional padding
log_time() {
    local msg="$1"
    local padding_level="${2:-0}"  # Default to 0 if no padding level is provided
    local padding=""
    
    # Create the padding string based on the padding level
    for ((i = 0; i < padding_level; i++)); do
        padding+=" "
    done

    local current_time=$(date +%s.%N)  # Get current time in seconds.nanoseconds

    # Calculate elapsed time since the last log
    if (( $(echo "$last_time == 0" | bc -l) )); then
        local duration=0  # First call, duration is 0
    else
        local duration=$(echo "($current_time - $last_time) * 1000" | bc)  # Calculate duration in milliseconds
    fi

    # Update last_time with the current time
    last_time=$current_time

    # Print the log with the specified padding
    printf "${padding}#$(global_counter) - $msg - dt: $duration\n\n"
}


#log_time "File: .bashrc Line: $LINENO" 1

case $- in
    *i*) ;;
      *) return;;
esac
#log_time "File: .bashrc Line: $LINENO" 1

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
#log_time "File: .bashrc Line: $LINENO" 1

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
#log_time "File: .bashrc Line: $LINENO" 1

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#log_time "File: .bashrc Line: $LINENO" 1
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
#log_time "File: .bashrc Line: $LINENO" 1

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
#log_time "File: .bashrc Line: $LINENO" 1
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
#log_time "File: .bashrc Line: $LINENO" 1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
#log_time "File: .bashrc Line: $LINENO" 1

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#log_time "File: .bashrc Line: $LINENO" 1
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#log_time "File: .bashrc Line: $LINENO" 1
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#log_time "File: .bashrc Line: $LINENO" 1
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#log_time "File: .bashrc Line: $LINENO" 1

#log_time "File: .bashrc Line: $LINENO" 1
source ~/.git-prompt.sh
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
#log_time "File: .bashrc Line: $LINENO" 1



sps() {
    current_path=$(pwd)
    IFS='/' read -ra path_array <<< "$current_path"
    path_length=${#path_array[@]}
    
    # Check if the path has less than or equal to 3 directories
    if [ "$path_length" -le 3 ]; then
        interactive_echo "$current_path"
    else
        abbreviated_path="/"
        # Abbreviate all directories except the last three
        for ((i=1; i<=($path_length-3); i++)); do
            abbreviated_path="${abbreviated_path}${path_array[i]:0:1}/"
        done
        # Add the last three directories to the abbreviated path
        for ((i=($path_length-2); i<$path_length; i++)); do
            abbreviated_path="${abbreviated_path}${path_array[i]}/"
        done
        interactive_echo "$abbreviated_path"
    fi
}


# PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
# export PS1="\033[92m\u\033[0m\033[96m@\033[93m$DEVICE\033[91m:\033[95m\w\033[91m$\033[0m "

# export PS1="\[$(tput bold)\]\[\033[38;5;31m\]@\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]:\[$(tput sgr0)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;12m\](\$(git branch --show-current))\[$(tput sgr0)\] \[$(tput sgr0)\]"

# export PS1="\!\[$(tput bold)\]\[\033[38;5;31m\]@\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]:\[$(tput sgr0)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;12m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \[$(tput sgr0)\]"

# export PS1="\033[94m\u\033[0m\033[96m@\033[93m$DEVICE\033[91m:\033[95m\w\033[91m$\033[0m " # main one
# PS1='\u:$(eval "sps") \$ '

# PS1='\033[94m\u\033[0m\033[96m@\033[93m$DEVICE\033[91m:\033[95m$(eval 'sps")\033[91m$\033[0m " # main one
# PS1='\033[94m\u\033[0m\033[96m@\033[93m$DEVICE\033[91m:\033[95m$(eval sps)\033[91m$(git branch 2>/dev/null | grep -e '\''^\*'\'' | sed -e '\''s/^\* //'\'')\033[91m$\033[0m '
# PS1='\033[94m\u\033[0m\033[96m@\033[93m$DEVICE\033[91m:\033[95m$(eval sps)\033[91m$(git branch 2>/dev/null | grep -e '\''^\*'\'' | sed -e '\''s/^\* / (\033[92m/'\'')\033[92m)\033[91m$\033[0m '
# PS1='\033[94m\u\033[0m\033[96m@\033[93m$DEVICE\033[91m:\033[95m$(eval sps)\033[91m$(git branch 2>/dev/null | grep -e '\''^\*'\'' | sed -e '\''s/^\* / (\033[92m/'\'' | sed -e '\''s/$/\033[92m)/'\'')\033[91m\$\033[0m '
# PS1='\[\033[94m\]\u\[\033[0m\]\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)\[\033[91m\] $(git branch 2>/dev/null | grep -e '\''^\*'\'' | sed -e '\''s/^\* /\[\033[91m\](\[\033[92m\]/'\'')\[\033[91m\])\[\033[91m\]\$\[\033[0m\] '

# PS1='\[\033[94m\]\u\[\033[0m\]\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)$(git rev-parse --abbrev-ref HEAD 2>/dev/null | sed '\''s/.*/ \[\033[91m\](\[\033[93m&\[\033[91m\])/'\'')\[\033[91m\]\$\[\033[0m\] '
# PS1='\[\033[94m\]\u\[\033[0m\]\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)\[\033[91m\]$(git rev-parse --abbrev-ref HEAD 2>/dev/null | sed '\''s/.*/\[\033[91m\](\[\033[93m&\[\033[91m\])/'\'')\[\033[91m\]\$\[\033[0m\] '

# PS1='\[\033[94m\]\u\[\033[0m\]\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)\[\033[91m\]$(git rev-parse --show-toplevel 2>/dev/null | xargs -I {} basename {} | sed '\''s/.*/\[\033[91m\][\[\033[94m&\[\033[91m\]]/'\'')$(git rev-parse --abbrev-ref HEAD 2>/dev/null | sed '\''s/.*/\[\033[91m\](\[\033[93m&\[\033[91m\])/'\'')\[\033[91m\]\$\[\033[0m\] '

# Function to get the current Git repository name without formatting
# git_repo_name() {
#     git rev-parse --show-toplevel 2>/dev/null | xargs -I {} basename {}
# }

# Function to get the remote repository name
# git_repo_name() {
#     remote_url=$(git remote get-url origin 2>/dev/null)
#     if [ -n "$remote_url" ]; then
#         # Extract the repo name from the URL, removing any .git suffix
#         echo "$remote_url" | sed -E 's/.*[:\/]([^\/]+)\.git/\1/'
#     fi
# }

# # Function to get the current Git branch name
# git_branch_name() {
#     git rev-parse --abbrev-ref HEAD 2>/dev/null
# }


# # Function to check if there are uncommitted changes
# git_dirty_status() {
#     git diff --quiet || echo "*"
# }

# # Function to check for untracked files
# git_untracked_files() {
#     git ls-files --others --exclude-standard | grep -q . && echo "?"
# }

# # Function to check if there are staged changes
# git_staged_changes() {
#     git diff --cached --quiet || echo "+"
# }

# Main PS1 using conditional formatting for repo and branch
# PS1='\[\033[94m\]\u\[\033[0m\]\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)$(repo=$(git_repo_name) && [ -n "$repo" ] && printf "\[\033[91m\][\[\033[94m%s\[\033[91m\]]" "$repo")$(branch=$(git_branch_name) && [ -n "$branch" ] && printf "\[\033[91m\](\[\033[93m%s\[\033[91m\])" "$branch")\[\033[91m\]\$\[\033[0m\] '

# Main PS1 using conditional formatting for repo, branch, and git status indicators
# PS1='\[\033[94m\]\u\[\033[0m\]\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)$(repo=$(git_repo_name) && [ -n "$repo" ] && printf "\[\033[91m\][\[\033[94m%s\[\033[91m\]]" "$repo")$(branch=$(git_branch_name) && [ -n "$branch" ] && printf "\[\033[91m\](\[\033[93m%s\[\033[91m\])" "$branch")$(dirty=$(git_dirty_status) && [ -n "$dirty" ] && printf "\[\033[93m%s" "$dirty")$(untracked=$(git_untracked_files) && [ -n "$untracked" ] && printf "\[\033[93m%s" "$untracked")$(staged=$(git_staged_changes) && [ -n "$staged" ] && printf "\[\033[92m%s" "$staged")\[\033[91m\]\$\[\033[0m\] '

# Function to check if we're inside a Git repository
inside_git_repo() {
    git rev-parse --is-inside-work-tree &>/dev/null
}

# Function to get the remote repository name
git_repo_name() {
    if inside_git_repo; then
        remote_url=$(git remote get-url origin 2>/dev/null)
        if [ -n "$remote_url" ]; then
            echo "$remote_url" | sed -E 's/.*[:\/]([^\/]+)\.git/\1/'
        fi
    fi
}

# Function to get the current Git branch name
git_branch_name() {
    if inside_git_repo; then
        git rev-parse --abbrev-ref HEAD 2>/dev/null
    fi
}

# Function to check if there are uncommitted changes
git_dirty_status() {
    if inside_git_repo; then
        git diff --quiet || echo "*"
    fi
}

# Function to check for untracked files
git_untracked_files() {
    if inside_git_repo; then
        git ls-files --others --exclude-standard | grep -q . && echo "?"
    fi
}

# Function to check if there are staged changes
git_staged_changes() {
    if inside_git_repo; then
        git diff --cached --quiet || echo "+"
    fi
}
# Function to show if we're ahead or behind the remote branch
git_ahead_behind() {
    if inside_git_repo; then
        local status=$(git rev-list --left-right --count @{u}...HEAD 2>/dev/null)
        if [ -n "$status" ]; then
            local ahead=$(echo $status | awk '{print $2}')
            local behind=$(echo $status | awk '{print $1}')
            if [[ "$ahead" =~ ^[0-9]+$ ]] && [ "$ahead" -gt 0 ]; then
                echo "↑$ahead"
            fi
            if [[ "$behind" =~ ^[0-9]+$ ]] && [ "$behind" -gt 0 ]; then
                echo "↓$behind"
            fi
        fi
    fi
}


# Function to check merge status
git_merge_status() {
    if inside_git_repo; then
        if [ -f "$(git rev-parse --git-dir)/MERGE_HEAD" ]; then
            echo "MERGING"
        fi
    fi
}

# Function to check for rebase status
git_rebase_status() {
    if inside_git_repo; then
        if [ -d "$(git rev-parse --git-dir)/rebase-apply" ]; then
            echo "REBASE"
        fi
    fi
}

# Function to check for stashed changes
git_stash_status() {
    if inside_git_repo; then
        local stash_count=$(git stash list | wc -l)
        if [ "$stash_count" -gt 0 ]; then
            echo "STASHED"
        fi
    fi
}

# Function to check detached HEAD status
git_detached_status() {
    if inside_git_repo; then
        git symbolic-ref -q HEAD >/dev/null || echo "DETACHED"
    fi
}


PS1='$(sudo -n true 2>/dev/null && printf "\[\033[91m\](\[\033[93m\]sudo\[\033[91m\])")'\
'\[\033[94m\]\u\[\033[0m\]'\
'\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)'\
\
'$(repo=$(git_repo_name) && [ -n "$repo" ] && printf "\[\033[91m\][\[\033[94m%s\[\033[91m\]]" "$repo")'\
'$(branch=$(git_branch_name) && [ -n "$branch" ] && printf "\[\033[91m\](\[\033[93m%s\[\033[91m\])" "$branch")'\
\
'$(ahead_behind=$(git_ahead_behind) && [ -n "$ahead_behind" ] && printf "\[\033[33m%s" "$ahead_behind")'\
'$(dirty=$(git_dirty_status) && [ -n "$dirty" ] && printf "\[\033[35m%s" "$dirty")'\
'$(untracked=$(git_untracked_files) && [ -n "$untracked" ] && printf "\[\033[96m%s" "$untracked")'\
'$(staged=$(git_staged_changes) && [ -n "$staged" ] && printf "\[\033[92m%s" "$staged")'\
\
'$(merge_status=$(git_merge_status) && [ -n "$merge_status" ] && printf "\[\033[35m%s" "$merge_status")'\
'$(rebase_status=$(git_rebase_status) && [ -n "$rebase_status" ] && printf "\[\033[33m%s" "$rebase_status")'\
'$(stash_status=$(git_stash_status) && [ -n "$stash_status" ] && printf "\[\033[33m%s" "$stash_status")'\
'$(detached_status=$(git_detached_status) && [ -n "$detached_status" ] && printf "\[\033[36m%s" "$detached_status")'\
\
'\[\033[91m\]\$\[\033[0m\] '


# PS1='\[\033[94m\]\u\[\033[0m\]'\
# '\[\033[96m\]@\[\033[93m\]$DEVICE\[\033[91m\]:\[\033[95m\]$(eval sps)'\
# \
# '$(repo=$(git_repo_name) && [ -n "$repo" ] && printf "\[\033[91m\][\[\033[94m%s\[\033[91m\]]" "$repo")'\
# '$(branch=$(git_branch_name) && [ -n "$branch" ] && printf "\[\033[91m\](\[\033[93m%s\[\033[91m\])" "$branch")'\
# \
# '$(ahead_behind=$(git_ahead_behind) && [ -n "$ahead_behind" ] && printf "\[\033[33m%s" "$ahead_behind")'\
# '$(dirty=$(git_dirty_status) && [ -n "$dirty" ] && printf "\[\033[35m%s" "$dirty")'\
# '$(untracked=$(git_untracked_files) && [ -n "$untracked" ] && printf "\[\033[96m%s" "$untracked")'\
# '$(staged=$(git_staged_changes) && [ -n "$staged" ] && printf "\[\033[92m%s" "$staged")'\
# \
# '$(merge_status=$(git_merge_status) && [ -n "$merge_status" ] && printf "\[\033[35m%s" "$merge_status")'\
# '$(rebase_status=$(git_rebase_status) && [ -n "$rebase_status" ] && printf "\[\033[33m%s" "$rebase_status")'\
# '$(stash_status=$(git_stash_status) && [ -n "$stash_status" ] && printf "\[\033[33m%s" "$stash_status")'\
# '$(detached_status=$(git_detached_status) && [ -n "$detached_status" ] && printf "\[\033[36m%s" "$detached_status")'\
# \
# '\[\033[91m\]\$\[\033[0m\] '






# export PS1="\[$(tput bold)\]\[\033[38;5;31m\]@\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]:\[$(tput sgr0)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[\033[38;5;12m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\] \[$(tput sgr0)\]"




#log_time "File: .bashrc Line: $LINENO" 1

#[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
#eval "$(atuin init bash)"


#log_time "File: .bashrc Line: $LINENO" 1

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


#log_time "File: .bashrc Line: $LINENO" 1
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH=$PATH:/usr/local/go/bin

#log_time "File: .bashrc Line: $LINENO" 1

source /home/vinibretas/.bash_completions/py-ntfy.sh

#log_time "File: .bashrc Line: $LINENO" 1
#printf "#$(global_counter --reset) - File: .bashrc, Line $LINENO - OK \n\n"
export EDITOR=vim
export VISUAL=vim


# eval "$(starship init bash)"
