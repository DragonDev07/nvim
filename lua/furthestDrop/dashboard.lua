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

local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  vim.notify("Dashboard not found!")
  return
end

dashboard.preview_file_path = '~/.config/nvim/ascii/dash.cat'
dashboard.preview_file_height = 8
dashboard.preview_file_width = 85
dashboard.preview_command = "cat | lolcat -F 0.3"

dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Find  File                              ",
    shortcut = '<Leader> f f',
    action = "Telescope find_files",
  },
  {
    icon = "  ",
    desc = "New file                                ",
    shortcut = '<Leader> e n',
    action = "enew",
  },
  {
    icon = "  ",
    desc = "Find Word                               ", 
    shortcut = '<Leader> f w',
    command = "Telescope live_grep",
  },
  {
    icon = "  ",
    desc = "Update Packer Plugins                   ",
    shortcut = '<Leader> p u',
  },
  {
    icon = "  ",
    desc = "Open Nvim config                        ",
    shortcut = '<Leader> e v',
    action = "tabnew $MYVIMRC | tcd %:p:h",
  },
}

local plugins = #vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1) -- Get # of startup-loaded plugins.
local total_plugins = #vim.fn.globpath("~/.local/share/nvim/site/pack/packer/opt", "*", 0, 1) --Get # of lazyloaded plugins

dashboard.custom_footer = { "異 Packer loaded " .. plugins - 1 .. " out of " .. plugins + total_plugins .. " plugins" } -- Show plugins loaded message