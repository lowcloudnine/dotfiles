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
# ---- fzf
skip_dirs = ".git,.venv,.idea,.vscode,__pycache__,node_modules,target"
$FZF_DEFAULT_OPTS = " ".join([
    "--style full",
    f"--walker-skip {skip_dirs}", 
    "--preview 'bat -n --color=always {}' ",
    "--bind 'ctrl-/:change-preview-window(|hidden)'",
])

# ---- Path
$PATH.insert(0, "$HOME/.local/bin")
$PATH.append("$HOME/.cargo/bin")
$PATH.append("$HOME/go/bin")

# -------------------------------------
# Load Xontribs
# -------------------------------------

xontrib load argcomplete
xontrib load coreutils
xontrib load "fzf-widgets"
xontrib load prompt_starship
xontrib load sh

# ---- Configurations for Xontribs
$XLSD_SORT_METHOD = "directories_first"

# ---- fzf widgets configuration
$fzf_history_binding = "c-r"  # Ctrl+R
$fzf_ssh_binding = "c-s"      # Ctrl+S
$fzf_file_binding = "c-t"      # Ctrl+T
$fzf_dir_binding = "c-g"      # Ctrl+G

$fzf_find_command = "fd"
$fzf_find_dirs_command = "fd -t d"

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
aliases["tree"] = "tree -C -I '.git' -I '__pycache__' -I '*.egg-info'"

aliases["ldock"] = "lazydocker"
aliases["lgit"] = "lazygit"

# ---- Python Env Activates
aliases["dev"] = "source-bash $HOME/.envs/dev/bin/activate"

# ---- kubectl aliases # if using microk8s
# aliases["mkctl"] = "microk8s kubectl"

# -------------------------------------
# Flatpak Stuff
# -------------------------------------

$XDG_DATA_DIRS.append("/var/lib/flatpak/exports/share")
$XDG_DATA_DIRS.append("/home/wodan/.local/share/flatpak/exports/share")

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
