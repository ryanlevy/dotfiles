# stolen from bruno-
# bash function that switches sessions
function tma() {
  if [ -z "$TMUX" ]; then
    # not in tmux
    tmux attach-session -t $1
  else
    # inside tmux
    tmux switch-client -t $1
 fi
}
# tmux session tab complete function
function _tmux_complete_session() {
  local IFS=$'\n'
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "$(tmux -q list-sessions | cut -f 1 -d ':')" -- "${cur}") )
}
complete -F _tmux_complete_session tma
