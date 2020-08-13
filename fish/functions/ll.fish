# Defined in - @ line 1
function ll --wraps='exa -laFh' --description 'alias ll exa -laFh'
  if which exa &> /dev/null
    exa -laFh $argv;
  else
    ls -laFh $argv;
  end
end
