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

local ok, cybu = pcall(require, "cybu")
if not ok then
    vim.notify("Cybu not found!")
    return
end
cybu.setup {
  position = {
    relative_to = "win", -- win, editor, cursor
    anchor = "topright", -- topleft, topcenter, topright,
    -- centerleft, center, centerright,
    -- bottomleft, bottomcenter, bottomright
    -- vertical_offset = 10, -- vertical offset from anchor in lines
    -- horizontal_offset = 0, -- vertical offset from anchor in columns
    -- max_win_height = 5, -- height of cybu window in lines
    -- max_win_width = 0.5, -- integer for absolute in columns
    -- float for relative to win/editor width
  },
  display_time = 1750, -- time the cybu window is displayed
  style = {
    path = "relative", -- absolute, relative, tail (filename only)
    border = "rounded", -- single, double, rounded, none
    separator = " ", -- string used as separator
    prefix = "…", -- string used as prefix for truncated paths
    padding = 1, -- left & right padding in number of spaces
    hide_buffer_id = true,
    devicons = {
      enabled = true, -- enable or disable web dev icons
      colored = true, -- enable color for web dev icons
    },
  },
}
-- vim.keymap.set("n", "<up>", "<Plug>(CybuPrev)")
-- vim.keymap.set("n", "<down>", "<Plug>(CybuNext)")
vim.keymap.set("n", "<A-h>", "<Plug>(CybuPrev)")
vim.keymap.set("n", "<A-l>", "<Plug>(CybuNext)")