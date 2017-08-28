# connorjs

Configuration files for `@connorjs` (e.g. `zshrc`).

The directory structure is set up to mimic my home directory<sup id=r_readme>[1](#f_readme)</sup>. I then use symlinks pointing to these files from my home directory (or subdirectories).

## ZSH

I use [*Oh My Zsh*](https://github.com/robbyrussell/oh-my-zsh). My custom folder for *Oh My Zsh* is included under `.zsh_custom/`. The special file `untracked.zsh` allows for custom/personal aliases and functions that are not tracked by the git repo.

### Theme

I use [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) for my theme (prompt). Since it is not packaged with *Oh My Zsh*, I use a git submodule.  Newer versions of git should automatically initialize submodules, but older versions require you to explicitly tell git to download the submodules<sup id='r_submodules'>[2](#f_submodules)</sup>.

```
git submodule update --init --recursive
```

---

<sup id="f_readme">1</sup> With the exception of this `README.md` (which would not be in my home directory, since it is meant purely for this repo). [⏎](#r_readme)

<sup id="f_submodules">2</sup> See ["Working with submodules"](https://github.com/blog/2104-working-with-submodules) GitHub blog post. [⏎](#r_submodules)