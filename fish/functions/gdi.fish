# Defined in - @ line 1
function gdi --wraps='git diff' --description 'alias gdi=git diff'
  git diff $argv;
end
