function git_current_branch
  eval "command git symbolic-ref --quiet HEAD 2> /dev/null" | read -l ref
  if [ $status != 0 ]
    [ $status == 128 ] and return  # no git repo.
    eval "command git rev-parse --short HEAD 2> /dev/null or return" | read -l ref
  end
  builtin string trim --left --chars=refs/heads/ $ref
end
