function upgrade --wraps='sudo pacman -Syu' --description 'alias upgrade=sudo pacman -Syu'
  sudo pacman -Syu $argv
        
end
