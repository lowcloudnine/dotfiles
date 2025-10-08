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

To install the configuration for each module/directory:

```bash

stow <directory/module name>
```

For example: `stow nvim` will 'install' the configuration files for neovim into
`~/.config/nvim`.
