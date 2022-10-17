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

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("nvim-lsp-installer not found!")
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("furthestDrop.lsp.handlers").on_attach,
        capabilities = require("furthestDrop.lsp.handlers").capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require("furthestDrop.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("furthestDrop.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "pyright" then
        local pyright_opts = require("furthestDrop.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)