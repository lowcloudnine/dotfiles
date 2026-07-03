---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>Oc"] = false,
          ["<Leader>tc"] = { "<cmd>CodexToggle<CR>", desc = "Toggle Codex" },
        },
      },
    },
  },
}
