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

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }

    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer not found!")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)         -- Start packer
    use "wbthomason/packer.nvim"            -- Have packer manage itself

    use "glepnir/dashboard-nvim"            -- Cool login screen when no file or directory is specified

    use "nvim-lua/popup.nvim"               -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"             -- Useful lua functions used by many plugins
    use "mfussenegger/nvim-dap"             -- Debugging support
    use "vimsence/vimsence"                 -- Discord status

    -- Buffers & Statusline!
    use "ghillb/cybu.nvim"
    use "akinsho/bufferline.nvim"
    use "nvim-lualine/lualine.nvim"

    -- Nvim-Tree
    use "kyazdani42/nvim-tree.lua"          -- Better file search tree
    use "kyazdani42/nvim-web-devicons"      -- Nerdfont icons suport

    -- Completion
    use "hrsh7th/nvim-cmp"                  -- Main Completion Plugin
    use "hrsh7th/cmp-buffer"                -- Buffer Completion
    use "hrsh7th/cmp-path"                  -- Path Completion
    use "hrsh7th/cmp-nvim-lsp"              -- Completion using Neovim's built in LSP
    use "hrsh7th/cmp-nvim-lua"              -- Completion using Lua API
    use "hrsh7th/cmp-cmdline"               -- Completion for Vim's command line
    use "petertriho/cmp-git"                -- Git Completion
    use "saadparwaiz1/cmp_luasnip"          -- Snippet Completion
    use "windwp/nvim-autopairs"             -- Auto close bracket pairs
    -- TODO:
    -- use {"tzachar/cmp-tabnine", opt = true, run = "./install.sh", config = function() require('furthestDrop.tabnine') end} --tabnine ai, takes up more resources
    
    -- Commenting
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Tresitter Syntax Highlighting
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
    use "p00f/nvim-ts-rainbow"

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippet Engine
    use "rafamadriz/friendly-snippets" -- A whole bunch of premade snippets

    -- LSP
    use "neovim/nvim-lspconfig" 
    use "williamboman/nvim-lsp-installer"
    use 'mfussenegger/nvim-jdtls'
    -- TODO:
    -- use {"saecki/crates.nvim", event = { "BufRead Cargo.toml" }, config = function() require('crates').setup() end, } --rust crate tools and features

    -- Telescope Fuzzy Finding
    use {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = function () require'furthestDrop.telescope' end}

    -- Toggle Term!
    use "akinsho/toggleterm.nvim"
    -- use {"akinsho/toggleterm.nvim", cmd = {"ToggleTerm"}, keys = "<C-\\>", config = function() require'furthestDrop.toggleterm' end} -- quick in-edditor terminal

    -- Markdown previews
    use {"iamcco/markdown-preview.nvim", ft = {"md", "markdown", "MD"}} -- preview markdown files

    -- Which Key
    use { "folke/which-key.nvim", keys = "<Space>", config = function() require"furthestDrop.whichkey" end }

    -- Themes
    use 'folke/tokyonight.nvim'

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
