-- AstroCommunity imports managed by this dotfiles repository.
-- This file is intended to overlay an existing AstroNvim base config.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	-- Docker
	{ import = "astrocommunity.docker.lazydocker" },

	-- Packs
	{ import = "astrocommunity.pack.ansible" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.helm" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.terraform" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.vue" },
	{ import = "astrocommunity.pack.xml" },
	{ import = "astrocommunity.pack.yaml" },

	-- Markdown and LaTex
	{ import = "astrocommunity.markdown-and-latex.vimtex" },

	-- Recipes
	{ import = "astrocommunity.recipes.heirline-mode-text-statusline" },
}
