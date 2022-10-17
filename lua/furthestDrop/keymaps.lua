--[[
 ______          _   _               _   _____                 _____ __ __________   
|  ____|        | | | |             | | |  __ \               | ____/_ |____  \ \ \  
| |__ _   _ _ __| |_| |__   ___  ___| |_| |  | |_ __ ___  _ __| |__  | |   / / \ \ \ 
|  __| | | | '__| __| '_ \ / _ \/ __| __| |  | | '__/ _ \| '_ \___ \ | |  / /   > > >
| |  | |_| | |  | |_| | | |  __/\__ \ |_| |__| | | | (_) | |_) |__) || | / /   / / / 
|_|   \__,_|_|   \__|_| |_|\___||___/\__|_____/|_|  \___/| .__/____/ |_|/_/   /_/_/  
                                                         | |                         
                                                         |_|                         
--]]

local opts = { noremap = true, silent = true }              -- Global keymap settings
local keymap = vim.api.nvim_set_keymap                      -- Shorten function name
keymap("", "<Space>", "<Nop>", opts)                        -- Remap space as leader key

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Splits
keymap("n", "<leader>sp", ":split<CR>", opts)               -- Horrizontal split
keymap("n", "<leader>sv", ":vsplit<CR>", opts)              -- Vertical split

-- Window navigation without Ctrl+L
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize Splits with arrow keys
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Open root config (init.lua)
keymap("n", "<leader>cg", ":e $MYVIMRC<CR>", opts)

-- ToggleTerm
keymap("n", "<S-T>", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_SIMPLE()<CR>", opts)

-- Opens nvim tree file explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Buffers
keymap("n", "<C-]>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-[>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-S-[>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<C-S-]>", ":BufferLineMoveNetx<CR>", opts)
keymap("n", "<leader>te", ":BufferLineSortByExtension<CR>", opts)
keymap("n", "<leader>tb", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>td", ":BufferLineSortByDirectory<CR>", opts)
keymap("n", "<leader>tc", ":BufferLinePickClose<CR>", opts)

-- Packer Loads
keymap("n", "<leader>lg", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_LAZYGIT()<CR>", opts) -- see visualized git info in popup with Lazygit
keymap("n", "<leader>ht", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_HTOP()<CR>", opts) -- see system resource usage with HTOP in pop-up
keymap("n", "<leader>py", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_PYTHON()<CR>", opts) -- open pop up with python interactive terminal
keymap("n", "<leader>fg", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_NCDU()<CR>", opts) -- See file sizes in current dir
keymap("n", "<leader>lt", ":PackerLoad toggleterm.nvim<CR>:lua _TOGGLE_LUATERM()<CR>", opts) -- open pop-up with lua interactive terminal
keymap("n", "<leader>pt", ":PackerLoad telescope.nvim<CR>", opts) -- load telescope
keymap("n", "<leader>ai", ":PackerLoad cmp-tabnine<CR>", opts) -- ACTIVATE THE POWER OF TABNINE (and start using more resources)

-- Telescope Fuzzy Finder
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", opts) -- Fuzzy search for strings of characters in vurrent directory with Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Fuzzy search for files in current directory with preview via telescope
keymap("n", "<leader>tm", ":Telescope man_pages<CR>", opts) -- Look through man pages

-- Packer
keymap("n", "<leader>pu", ":PackerUpdate<CR>", opts) -- Update all packer plugins
keymap("n", "<leader>ps", ":PackerSync<CR>", opts) -- Update and compile packer
keymap("n", "<leader>pc", ":PackerCompile<CR>", opts) -- Compile packer to apply all set packages and settings in plugins.lua

-- Go to Dashboard
keymap("n", "<leader>hd", ":Dashboard<CR>",opts) -- go to Dashboard

-- LSP
keymap("n", "<leader>ll", ":LspInstallInfo<CR>", opts) -- list language servers, find info, insttall and update
keymap("n", "<leader>li", ":LspInstall<CR>", opts) -- Install language server for current file format
keymap("n", "<leader>lr", ":LspRestart<CR>", opts) -- Restart LSP if it's not working


keymap("n", "<leader>ev", ":tabnew $MYVIMRC | tcd %:p:h<CR>", opts) -- Open Nvim config files
keymap("n", "<leader>en", ":enew<CR>", opts) -- make a new file

-- Move indents with < and >
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text Up and Down with Alt-J and Alt-K
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Pasting
keymap("v", "p", '"_dP', opts) --Make pasting work better, use p to paste in visual mode

-- Terminal Mode --
keymap("t", ";;", "<C-\\><C-N>", opts) -- make ;; go to normal mode in terminal

-- Quit ALL!
keymap("n", "<leader>qqq", ":qall<CR>", opts)
