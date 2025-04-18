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

## Python
First, install a virtual environment manager (`pyenv`) so you can run multiple versions on Python on the same machine.  Then, install a package manager that plays well with virtual environments (`Pipenv`) to maintain project-specific package dependencies.

To quote Bruno Michetti:
> If you use Pyenv, the pipenv install command will use the global Python version of your system. But as you know, you can specify a local Python version in your project. For example:
>
> pyenv local 3.8.8
>
> And, if you want to use that local Python version, you can indicate that to Pipenv by executing:
>
> pipenv install --python 3.8.

+ Follow [Raphael Hoogvliets' guide](https://medium.com/marvelous-mlops/the-rightway-to-install-python-on-a-mac-f3146d9d9a32) to install `pyenv` and `pyenv-virtualenv`.

+ Follow [Bruno Michetti's guide](https://www.rootstrap.com/blog/how-to-manage-your-python-projects-with-pipenv-pyenv) to install `pipenv`.

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
pyenv install 3.13.0

brew install pipenv



```