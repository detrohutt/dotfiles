
return {  -- lazy.nvim
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find Files", ":Telescope find_files<CR>"),
            dashboard.button("e", " " .. " New Files", ":ene <BAR> startinsert<CR>"),
            dashboard.button("r", " " .. " Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", " " .. " Find Text", ":Telescope live_grep<CR>"),
            dashboard.button("c", " " .. " Nvim Config", [[<cmd>PossessionLoad config<CR>]]),
            dashboard.button("z", "鈴" .. " Lazy", ":Lazy<CR>"),
            dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            (function()
                local group = { type = "group", opts = { spacing = 1 } }
                group.val = {
                    { type = "text", val = "Sessions", opts = { position = "center" } }
                }
                for i, session in pairs(require('possession.query').as_list()) do
                    local button = dashboard.button(tostring(i), "勒 " .. session.name, "<cmd>PossessionLoad " .. session.name .. "<cr>")
                    table.insert(group.val, button)
                end
                return group
            end)(),
        }
        return dashboard
    end,
    config = function(_, dashboard)
        require("alpha").setup(dashboard.opts)
    end,
}
