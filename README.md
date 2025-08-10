# .dotfiles

Personal dotfiles and configurations.

## Setup

### Setup Script Example

1. `cd ~/Dev`
2. `git clone git@github.com:rteammco/dotfiles.git; cd dotfiles`
3. Modify the file paths (`shellrc=$HOME/.zshrc` and `vimrc=$HOME/.vimrc`) at the top of the `setup` file  as needed
4. `./setup` and follow the setup instructions - each step is optional

### Manual Setup

1. Add `source /path/to/dotfiles/shellrc` to e.g. `.zshrc`
2. `cp path/to/dotfiles/vim/vimrc ~/.vimrc`