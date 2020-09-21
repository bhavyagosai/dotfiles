# Defined in - @ line 1
function clpbrd --wraps='xclip -selection clipboard' --description 'alias clpbrd=xclip -selection clipboard'
  xclip -selection clipboard $argv;
end
