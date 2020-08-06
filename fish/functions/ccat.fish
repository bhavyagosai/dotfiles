# Defined in - @ line 1
function ccat --wraps='highlight --out-format=ansi' --description 'alias ccat=highlight --out-format=ansi'
  highlight --out-format=ansi $argv;
end
