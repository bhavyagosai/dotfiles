# Defined in - @ line 1
function glgao --wraps='git log --graph --all --oneline' --description 'alias glgao=git log --graph --all --oneline'
  git log --graph --all --oneline $argv;
end
