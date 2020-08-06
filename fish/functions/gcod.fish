# Defined in - @ line 1
function gcod --wraps='git checkout develop' --description 'alias gcod=git checkout develop'
  git checkout develop $argv;
end
