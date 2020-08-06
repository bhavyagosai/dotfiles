# Defined in - @ line 1
function rm --wraps='rm -v' --description 'alias rm=rm -v'
 command rm -v $argv;
end
