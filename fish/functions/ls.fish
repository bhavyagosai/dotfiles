# Defined in - @ line 1
function ls --wraps='ls -hN --color=auto --group-directories-first' --description 'alias ls=ls -hN --color=auto --group-directories-first'
  if which exa &> /dev/null
    exa -hF --sort=extension --group-directories-first $argv
  else
    command ls -hNF --color=auto --sort=extension $argv;
  end
end
