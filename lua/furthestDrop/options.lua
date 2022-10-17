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

vim.opt.number = true                           -- Show Line numbers
vim.opt.tabstop = 4                             -- Insert 2 spaces for a tab
vim.opt.shiftwidth = 4                          -- The number of spaces inserted for each indentation
vim.opt.expandtab = true                        -- Convert tabs to spaces
vim.opt.mouse = "a"                             -- Allow the mouse to be used in neovim

vim.opt.swapfile = false                        -- Creates a swapfile
vim.opt.writebackup = false                     -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.cmd [[set nobackup]]

vim.cmd [[set hidden]]
vim.opt.smartcase = true                        -- Smart case
vim.opt.cmdheight = 2                           -- More space in the neovim command line for displaying messages
vim.opt.smartindent = true                      -- Make indenting smarter again
vim.opt.timeoutlen = 500                        -- Shorten timeout length
vim.opt.showtabline = 2                         -- Enable tabs
vim.opt.updatetime = 300                        -- Faster update time
vim.opt.shortmess:append "c"                    -- Makes autocomplete run smoother
vim.opt.clipboard = "unnamedplus"               -- Allows neovim to access the system clipboard
vim.opt.conceallevel = 0                        -- Don't hide markdown syntax
vim.opt.fileencoding = "utf-8"                  -- Force UTF8 encoding
vim.opt.hlsearch = true                         -- Highlight search results
vim.opt.ignorecase = true                       -- Make searches non-case-sensitive
vim.opt.completeopt = { "menuone", "noselect" } -- Mostly just for cmp
vim.opt.pumheight = 10                          -- Sets popup menu height, don't worry you can still scroll internally within popup menus
vim.opt.splitbelow = true                       -- Force all horizontal splits to go below current window
vim.opt.splitright = true                       -- Force all vertical splits to go to the right of current window
vim.opt.cursorline = true                       -- Highlight the current line
vim.opt.wrap = false                            -- Display lines as one long line
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.termguicolors = true                    -- Set term gui colors (most terminals support this)
vim.opt.background = "dark"                     -- Makes some colorschemes work better and makes light color schemes run worse (haha get screwed light mode users)
vim.opt.showmode = false                        -- We don't need to see things like -- INSERT -- anymore
vim.opt.guifont = "JetBrainsMono NF:h12"        -- The font used in graphical neovim applications


vim.opt.timeoutlen = 1000                       -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- Enable persistent undo
vim.opt.updatetime = 300                        -- Faster completion (4000ms default)

vim.cmd [[set undodir=~/.vim/undo-dir]]
vim.opt.undofile = true
vim.opt.numberwidth = 2                         -- Set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- Always show the sign column, otherwise it would shift the text each time

vim.cmd [[set iskeyword+=-]]                    -- Consider words with a - in it as one word