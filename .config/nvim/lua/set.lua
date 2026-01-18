-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and spaces
vim.opt.tabstop = 4      -- Number of spaces for a tab
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4   -- Number of spaces for indentation
vim.opt.expandtab = true -- Use spaces instead of tabs

-- Visual settings
vim.opt.cursorline = true   -- Highlight the current line
vim.opt.cursorcolumn = true -- Highlight the current column
vim.opt.wrap = false        -- Don't wrap lines
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "140"

-- Search settings
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true  -- Override ignorecase if uppercase letters in search
vim.opt.hlsearch = false  -- Disable search highlighting

-- Undo settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
