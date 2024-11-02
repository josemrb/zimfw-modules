() {
  local -r target=${1}
  shift
  (( ${+commands[${1}]} )) || return 1
  if [[ ! ( -s ${target} && ${target} -nt ${commands[${1}]} ) ]]; then
    "${@}" >! ${target} || return 1
    zcompile -UR ${target}
  fi
  source ${target}
} ${0:h}/zoxide-init-zsh.zsh zoxide init zsh
