# dotfiles

This is a conversion of my runcons project/repository to something more
managable, centralized and easier to maintain, I hope. From the runcons
[README.md](https://github.com/lowcloudnine/runcons/blob/master/README.md):

> This is a collection of run control files (rc files) for various linux/unix
> like operating systems with GNU utilities or something similar. The full
> meaning of rc is apparently
> [debatable](http://askubuntu.com/questions/23482/what-does-rc-in-bashrc-nanorc-stand-for).
> I'll go with 'run controls' or runcons as the files here are mostly for run
> configuration/control of other programs such as bash, vi and conda.

The methods and storage of these files is inspired and maybe adopted
from [Derek Taylor's](https://gitlab.com/dwt1/dotfiles). I was also inpsired
by [typecraft.dev's](https://www.youtube.com/@typecraft_dev) video on
[stow](https://www.youtube.com/watch?v=NoFiYOqnC4o).

One of the goals of this project is to document all the tools I use and the
appropriate links to them for future reference. As I add and drop tools this
becomes a central location for doing so and taking notes on and about said tools.

## Usage / Installation

This repository is organized as GNU Stow packages. Each top-level directory is
stowed from the repository root into the parent directory, which is usually
`$HOME`.

Available packages:

| Package | Purpose |
| --- | --- |
| `bin` | Personal helper scripts installed into `~/.local/bin`. |
| `fastfetch` | Fastfetch display configuration and logo assets. |
| `git` | Global Git configuration and commit message template. |
| `kitty` | Kitty terminal configuration. |
| `nvim` | AstroNvim community plugin overlay; assumes a separate AstroNvim base config. |
| `py_libs` | Python development environment requirements. |
| `xonsh` | Xonsh shell configuration and Starship prompt files. |
| `zellij` | Zellij terminal multiplexer configuration. |

The `bootstrap` helper wraps the Stow commands below and defaults to a dry run:

```bash
./bootstrap
./bootstrap --dry-run nvim xonsh
./bootstrap --install git kitty
./bootstrap --unstow nvim
```

Use `./bootstrap --list` to print the package list. `--install` and `--unstow`
ask for confirmation unless `--yes` is passed.

Preview changes before installing a package:

```bash
stow -n -v <package>
```

For example, `stow -n -v nvim` shows what would be linked into
`~/.config/nvim` without changing anything.

The `nvim` package intentionally manages only
`~/.config/nvim/lua/community.lua`. Install AstroNvim separately first, then
stow this package to manage the AstroCommunity imports. If
`~/.config/nvim/lua/community.lua` already exists as a regular file, back up
that single file or use the `--adopt` flow below.

If the dry run reports conflicts, that means files already exist where Stow
wants to create symlinks. Back up or move those files first, then run the dry
run again. For example:

```bash
mv ~/.config/nvim/lua/community.lua ~/.config/nvim/lua/community.lua.bak
stow -n -v nvim
```

If the existing files are the versions you want to keep and bring into this
repository, use Stow's adopt mode carefully:

```bash
stow --adopt -n -v <package>
stow --adopt <package>
git diff
```

`--adopt` moves existing target files into this repository and replaces them
with symlinks, so always inspect the dry run and review `git diff` afterward.

Install a package after the dry run is clean:

```bash
stow <package>
```

Remove a package's symlinks:

```bash
stow -D <package>
```

## Local Overrides

Shared packages should avoid machine-specific absolute paths. Prefer `$HOME`,
tool defaults, or config-directory-relative paths where the tool supports them.

Use the untracked `local/` directory for machine-specific notes, scratch config,
or override packages that should not be committed. If a local override becomes
useful across machines, move it into a named Stow package and document it in the
table above.
