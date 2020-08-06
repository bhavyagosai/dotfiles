set fish_greeting ""

begin
    set --local AUTOJUMP_PATH $XDG_CONFIG_HOME/fish/functions/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

fish_vi_key_bindings
