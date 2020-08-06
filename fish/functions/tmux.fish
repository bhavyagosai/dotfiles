# Defined in - @ line 1
function tmux --wraps='tmux -f /home/panda/.config/tmux/tmux.conf' --description 'alias tmux=tmux -f /home/panda/.config/tmux/tmux.conf'
 command tmux -f /home/panda/.config/tmux/tmux.conf $argv;
end
