# deprecated

This repository is no longer maintained. Please refer to [https://github.com/kimchanhyung98/dotfiles](https://github.com/kimchanhyung98/dotfiles).

1. Install Homebrew and Set Environment Variables:

      ```shell
      echo >> ~/.zprofile
      if [[ $(uname -m) == 'arm64' ]]; then
        HOMEBREW_PATH="/opt/homebrew/bin"
      else
        HOMEBREW_PATH="/usr/local/bin"
      fi
      
      echo "eval \"\$($HOMEBREW_PATH/brew shellenv)\"" >> ~/.zprofile
      eval "\$($HOMEBREW_PATH/brew shellenv)"
      ```

2. Install Chezmoi and Apply dotfiles

      ```shell
      brew install chezmoi
      chezmoi init kimchanhyung98
      chezmoi apply
      ```
