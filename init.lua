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

require "furthestDrop.options" -- Basic built-in vim settings
require "furthestDrop.keymaps" -- Keybindings for efficiency
require "furthestDrop.plugins" -- Load and manage plugins with packer

-- Plugin Configs
require "furthestDrop.dashboard"
require "furthestDrop.gitsigns"
require "furthestDrop.cmp"
require "furthestDrop.lsp"
require "furthestDrop.treesitter"
require "furthestDrop.autopairs"
require "furthestDrop.comment"
require "furthestDrop.nvim-tree"
require "furthestDrop.cybu"
require "furthestDrop.lualine"
require "furthestDrop.toggleterm"
require "furthestDrop.telescope"
require "furthestDrop.project"

require "furthestDrop.colorscheme"
