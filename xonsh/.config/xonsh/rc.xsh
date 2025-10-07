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
$PATH.insert(0, "/home/wodan/.local/bin")
$PATH.append("/home/wodan/.cargo/bin")
$PATH.append("/home/wodan/go/bin")
# $PATH.append("/home/wodan/.local/jdk/bin")
# $PATH.append("/home/wodan/.local/maven/bin")

# -------------------------------------
# Load Xontribs
# -------------------------------------

# $XONSH_COLOR_STYLE = 'material'
xontrib load coreutils
xontrib load prompt_starship
xontrib load sh
xontrib load argcomplete

# ---- Configurations for Xontribs
$XLSD_SORT_METHOD = "directories_first"

# ---- Java Env Vars
# $JAVA_HOME = "/home/wodan/.local/jdk"

# -------------------------------------
# Aliases
# -------------------------------------

# Which neovim configuration to use
# This is the directory name in ~/.config
# $NVIM_APPNAME = "AstroNvim"

# aliases['nvim'] = "/home/wodan/.local/bin/nvim"
aliases['vi'] = "nvim"
aliases['vim'] = "nvim"
aliases["ovi"] = "/bin/vi"

aliases['cat'] = "bat"
aliases['ls'] = "eza"
aliases['ll'] = "eza -al"
aliases["fd"] = "fdfind -E snap"
aliases["pwd"] = display_current_dir 

aliases["ldock"] = "lazydocker"
aliases["lgit"] = "lazygit"

# ---- Python Env Activates
aliases["dev"] = "source-bash /home/wodan/.envs/dev/bin/activate"
aliases["qtile"] = "source-bash /home/wodan/.envs/qtile/bin/activate"
aliases["py12"] = "source-bash /home/wodan/.envs/py12/bin/activate"
aliases["spark"] = "source-bash /home/wodan/.envs/spark/bin/activate"
# aliases["ops"] = "source-bash /home/wodan/.envs/ops/bin/activate"
# aliases["dj"] = "source-bash /home/wodan/.envs/dj/bin/activate"

# ---- kubectl aliases
# aliases["mkctl"] = "microk8s kubectl"

# -------------------------------------
# Node Version Manager, Node and NPM
# -------------------------------------

$NVM_DIR = "/home/wodan/.config/nvm"
source-bash $NVM_DIR/nvm.sh

# -------------------------------------
# Activate a Default Python Env
# -------------------------------------

source-bash /home/wodan/.envs/dev/bin/activate

