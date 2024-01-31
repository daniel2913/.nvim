local augend = require("dial.augend")
require("dial.config").augends:register_group{
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
  },
  typescript = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.new{ elements = {"let", "const"} },
  },
  visual = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.alpha,
    augend.constant.alias.Alpha,
  },
}

-- change augends in VISUAL mode
vim.keymap.set("v", "<C-k>", require("dial.map").inc_visual("visual"), {noremap = true})
vim.keymap.set("v", "<C-j>", require("dial.map").dec_visual("visual"), {noremap = true})
vim.keymap.set("i", "<C-k>", require("dial.map").inc_normal("visual"), {noremap = true})
vim.keymap.set("i", "<C-j>", require("dial.map").dec_normal("visual"), {noremap = true})

