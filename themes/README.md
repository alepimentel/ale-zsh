Ale ZSH Theme
=============

This theme is an improvement to the fino theme, which is included in Oh My Zsh.

What does it show?
------------------

- User & Hostname (hostname is only displayed while connected to a remote host, through SSH)
- Git status
- Current branch / SHA1 in detached head state
- Dirty working directory (✔/✘)
- Working directory

Compatibility
-------------
The theme should work with [Oh My Zsh](http//ohmyz.sh) and [Prezto](https://github.com/sorin-ionescu/prezto). If it doesn't, please contact me.

Installation
------------
  1. Clone the repository:

        git clone https://apimentelr@bitbucket.org/apimentelr/.ale-zsh.git ale.zsh

  2. Create a symlink to the theme file:

  2.1 If you're using Oh My Zsh:

  Run `ln -s ~/.ale-zsh/themes/ale.zsh-theme ~/.ohmyzsh/themes/ale.zsh-theme`
  Load the theme in ~/.zshrc.

  2.2 If you're using Prezto:

  Run `ln -s ~/ale.zsh/themes/ale.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_ale_setup`
  Load the theme in ~/.zpreztorc.

  3. Run `source ~/.zshrc` to reload update the prompt.

Future Work
-----------
I do not plan to update the theme anymore. :)
