_wadb_completions() {
  if [[ "${#COMP_WORDS[@]}" != "2" ]]; then
    return
  fi

  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="pair --pair -p connect --connect -c"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}

complete -F _wadb_completions wadb
complete -F _wadb_completions wireless-adb
