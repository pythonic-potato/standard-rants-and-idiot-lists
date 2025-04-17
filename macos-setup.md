# General
+ Move dock to right hand side of screen
+ Set lower left hot corner to lock screen
+ Install Chrome
+ Map left `Shift` key to `Ctrl`
+ Remove all but the following from the dock:
  + Finder
  + Launchpad
  + Chrome
  + iTerm2

# Dev environment setup
+ Work through the following sections of Sourabh Bajaj's [Mac OS setup guide](https://sourabhbajaj.com/mac-setup):
  + Xcode
  + Homebrew
  + iTerm2
    + Adding too many bells and whistles (e.g. `Oh My Zsh`) slows terminal startup to a crawl.  I just install `tree` and `ack`, and set my default profile colors to a dark-ish, medium-contrast scheme (e.g. `firewatch`).
  + Emacs
    + Use the Emacs Mac port version
    + Use `emacs -nw` to use in-terminal, or plain `emacs` to open as a new application window.
  + Git
    + Generate a global `.gitignore` file using [gitignore.io](https://www.gitignore.io/?templates=macos) with Python, Emacs, LaTex, Markdown, VSCode, and MacOS options.
  + GitHub authentication setup
    + Create/update SSH config and add new SSH key to GitHub account, per [these instructions.](https://sourabhbajaj.com/mac-setup/Git/#:~:text=SSH%20Config%20for%20GitHub)

+ Follow [Raphael Hoogvliets'](https://medium.com/marvelous-mlops/the-rightway-to-install-python-on-a-mac-f3146d9d9a32) to install Python without turning your [laptop into a Superfund site.](https://xkcd.com/1987)


## Approximate terminal inputs for dev env setup.

_May not work precisely as written, so maxima caveat emptor._

```
xcode-select --install

<Go take a break... or a vacation.  It's a big download.>

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc

<restart terminal session>

brew tap railwaycat/emacsmacport
brew install --cask rectangle google-chrome docker visual-studio-code emacs-mac

brew install git
git config --global user.name "pythonic-potato"
git config --global user.email "nice-try-hackers@hotmail.com"
git config --global init.defaultBranch = "main"
git config --global core.excludesfile ~/.gitignore

<GitHub SSH config steps...>

brew install pyenv pyenv-virtualenv



```