# Defined in - @ line 1
function ls --wraps='ls -hN --color=auto --group-directories-first' --description 'alias ls=ls -hN --color=auto --group-directories-first'
  if which exa &> /dev/null
    command exa -hF
  else
    command ls -hNF --color=auto --group-directories-first $argv;
  end
end
