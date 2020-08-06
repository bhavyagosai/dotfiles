# Defined in - @ line 1
function battery --wraps='cat /sys/class/power_supply/BAT?/capacity' --description 'alias battery=cat /sys/class/power_supply/BAT?/capacity'
  cat /sys/class/power_supply/BAT?/capacity $argv;
end
