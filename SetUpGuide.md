# Set Up Guide

## Preface

The sections are organized sequentially for installation order.

Until we download iTerm (officially, iTerm2), just use the native terminal.  After downloading iTerm we will move onto setting up zsh. Until then, good ol` bash should be fine.

If something is not working here, please first see the [README](./README.md). If that does not help, then open an issue.

## Symlinks

The directory structure for this project mimics my home directory. However, I do not want my home directory to be a git repository, so I create symlinks from my home directory to this project.

The script `setup_symlinks.sh` will set up all of the needed symlinks. It symlinks from the home directory to the current directory (so you need to run it from the project root directory - where the script is). It is not robust nor does it do any checks (it just overwrites), but that is good enough to get the job done.

```
# cd to the project root
./setup_symlinks.sh
```

For the rest of this guide, I assume the proper directory structure, i.e. I assume that these symlinks are set up or the files were extracted into your home directory.

## Homebrew

> Homebrew -- the missing package manager for macOS

Installation:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

See the [homebrew website](https://brew.sh) for more.

While we're here let's install some common commands I use across OS's and development environments<sup id='r1'>[1](#f1)</sup>. If you want to install all of these, just run the `install_commmon_brew.sh` script.

For productivity:

```
brew install thefuck
brew install imagemagick
```

For fun:

```
brew install fortune
brew install cowsay
brew install lolcat
```

## Fonts

Let's get some fancy fonts!

Well, just one really: Fira Code, specifically Nerd Font's patch. I have always used *Fira Code* since I first discovered the beautiful world of ligatures. There are other fonts with ligatures, so feel free to choose your own. However, in order to properly "plug-in" later, use something from [Nerd Fonts](https://nerdfonts.com). (Check out their [GitHub page](https://github.com/ryanoasis/nerd-fonts)! Devicons, Octicons, and more!)

If you ran the `install_common_brew.sh` script, then *Fira Code Nerd Font* has already been installed. Otherwise:

```
brew tap caskroom/fonts
brew cask install font-firacode-nerd-font-mono
```

If you would like to look up other fonts that can be installed this way, check [the font Caskroom](https://github.com/caskroom/homebrew-fonts). Just search for `nerd-font` [here](https://github.com/caskroom/homebrew-fonts/find/master).

*Note*: Prior to bash 4.2, unicode escape sequences are not understood. If this is the case, don't try something fun like `echo '\uf1d0 \uf1d1'` yet - we'll get to it later :wink:.

## Visual Studio Code

0. Go to [code.visualstudio](https://code.visualstudio.com) to download VS Code or use this [direct download link](https://go.microsoft.com/fwlink/?LinkID=534106). I use the stable build since the nightly one crashed too often for me. 
0. Follow the [Mac set-up guide](https://code.visualstudio.com/docs/setup/mac). Specifically, enable running `code` from the command line.
0. Set color palette - ***TODO!** - i.e. download settings file

And that's it.  I use bare-bones VS Code with no additional plugins (unless it recommends something to me - e.g. for python). Syntax highlighting and side-by-side markdown editing and preview are available out of the box.

## iTerm

0. Go to [iTerm2 Downloads](https://www.iterm2.com/downloads.html) and select the latest release.  I use the beta release because (a) I want the new features it has, and (b) it is pretty stable. *At the time of writing, this was 3.1.beta.8 - [direct download link](https://iterm2.com/downloads/beta/iTerm2-3_1_beta_8.zip)*.
0. macOS will automatically unzip the folder. *If not, unzip it yourself.*
0. Move `iTerm2.app` to your `Applications` folder (in Finder).
0. Open iTerm which should start with your default shell.
0. Open `Preferences` (`⌘` + `,`). *You should be on the first tab, "General".*
0. At the bottom under the option **Preferences**, check the box "Load preferences from a custom folder or URL" and then select the `.iterm2_settings` folder.  Alternatively, cancel the finder pop-up and manually enter the path (e.g. `Users/your_user/.iterm2_settings`).
0. Quit iTerm (`⌘` + `Q`) and reopen it for the settings to take effect.
0. *The settings should now be in effect - you should notice the new color scheme at the least.*

We will enable iTerm's *Shell Integration* feature after we set up our shell.

## zsh

We will be using zsh, specifically, [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh).  If you ran the `install_common_brew.sh` script, then all of these commands have been run. Otherwise, follow along!

First, let's install zsh itself.
 
```
brew install zsh zsh-completions
```

Then, we install Oh My Zsh.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Oops! Oh My Zsh just overwrote our `.zshrc` symlink.  That's fine though:

```
mv -f $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
```

Woohoo! It's working! Open a new session or source your `.zshrc`:

```
source ~/.zshrc
``` 

Uh-oh... Did you get an `(eval):1: command not found: iterm2_prompt_mark` error? That's fine! It is time to enable iTerm's *Shell Integration* feature. While we could follow [the full documentation](https://iterm2.com/documentation-shell-integration.html), all that is needed is the following command.

```
curl -L https://iterm2.com/misc/`basename $SHELL`_startup.in \
    -o ~/.iterm2_shell_integration.`basename $SHELL`
```

Re-source your `.zshrc` again and, *Voila!*, no more `iterm2_prompt_mark` error message. 

Finally, let's also update our login shell.

0. Open `System Preferences.app`
0. Go to "Users & Groups"
0. Click the lock icon and enter your password to unlock it
0. Right-click on your user and select "Advanced Options..."
0. Confirm that `/usr/local/bin/zsh` is the value for "Login shell"
0. Click "OK" and then click the lock icon again to lock it

---

 <sup id='f1'>1</sup> *Note: This is only formally tested once on a MacBook Pro running macOS High Sierra (beta 7). However, I did complete similar set-ups on a MacBook Pro running macOS Sierra and an Amazon Linux box running ???.* [↩](#r1)
