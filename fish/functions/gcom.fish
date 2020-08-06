# Defined in - @ line 1
function gcom --wraps='git checkout master' --description 'alias gcom=git checkout master'
  git checkout master $argv;
end
