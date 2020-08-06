# Defined in - @ line 1
function l --wraps='ls -lah' --description 'alias l ls -lah'
  if which exa &> /dev/null
  exa -lahF $argv
  else
  ls -lahF $argv;
  end
end
