# Defined in - @ line 1
function l --wraps='ls -lah' --description 'alias l ls -lah'
  ls -lahF $argv;
end
