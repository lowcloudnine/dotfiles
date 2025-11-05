# For debugging, set to False for minimal messaging
$XONSH_SHOW_TRACEBACK = True
$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True

# -------------------------------------
# Imports
# -------------------------------------

import platform
from pathlib import Path

import psutil
from rich import print

# -------------------------------------
# Environment Variables
# -------------------------------------

def display_current_dir():
    """Used to alias pwd."""
    print(str(Path.cwd()))

# -------------------------------------
# Environment Variables
# -------------------------------------

$SHELL_TYPE = "best"
$STARSHIP_CONFIG = Path(__file__).parent / "starship_xonsh.toml"
$VI_MODE = True

# ---- Path
$PATH.insert(0, "$HOME/.local/bin")
$PATH.append("$HOME/.cargo/bin")
$PATH.append("$HOME/go/bin")

# -------------------------------------
# Load Xontribs
# -------------------------------------

xontrib load coreutils
xontrib load prompt_starship
xontrib load sh
xontrib load argcomplete

# ---- Configurations for Xontribs
$XLSD_SORT_METHOD = "directories_first"

# -------------------------------------
# Aliases
# -------------------------------------

# Which neovim configuration to use
# This is the directory name in ~/.config
# $NVIM_APPNAME = "AstroNvim"

# aliases['nvim'] = "$HOME/.local/bin/nvim"
aliases['vi'] = "nvim"
aliases['vim'] = "nvim"
aliases["ovi"] = "/bin/vi"

aliases['cat'] = "batcat"
aliases['ls'] = "eza"
aliases['ll'] = "eza -al"
aliases["fd"] = "fdfind -E snap"
aliases["pwd"] = display_current_dir 
aliases["tree"] = "tree -C -I '.git'"

aliases["ldock"] = "lazydocker"
aliases["lgit"] = "lazygit"

# ---- Python Env Activates
aliases["dev"] = "source-bash $HOME/.envs/dev/bin/activate"
# aliases["spark"] = "source-bash $HOME/.envs/spark/bin/activate"

# ---- kubectl aliases
# aliases["mkctl"] = "microk8s kubectl"

# -------------------------------------
# Node Version Manager, Node and NPM
# -------------------------------------

$NVM_DIR = "/home/wodan/.nvm"
source-bash $NVM_DIR/nvm.sh
# nvm use stable

# -------------------------------------
# Activate a Default Python Env
# -------------------------------------

source-bash $HOME/.envs/dev/bin/activate
