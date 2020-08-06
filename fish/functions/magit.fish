# Defined in - @ line 1
function magit --wraps='nvim -c MagitOnly' --description 'alias magit=nvim -c MagitOnly'
  nvim -c MagitOnly $argv;
end
