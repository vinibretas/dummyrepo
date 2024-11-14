echo "└── Sourced /home/vinibretas/.bash_completions/py-ntfy.sh"
#log_time "File: ~/.bash_completions/py-ntfy.sh Line: $LINENO" 8
_py_ntfy_completion() {
    local IFS=$'
'
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _PY_NTFY_COMPLETE=complete_bash $1 ) )
    return 0
}

complete -o default -F _py_ntfy_completion py-ntfy
#log_time "File: ~/.bash_completions/py-ntfy.sh Line: $LINENO" 8
