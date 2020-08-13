# Defined in - @ line 1
function l --wraps='ls -lah' --description 'alias l ls -lah'
  if which exa &> /dev/null
    exa -lhF --group-directories-first $argv
  else
    ls -lhF $argv;
  end
end
