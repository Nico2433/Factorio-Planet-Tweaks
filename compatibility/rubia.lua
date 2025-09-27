if mods["rubia"] then
    local utils = require("utils")

    local compatMods = {
        "secretas"
    }

    -- If Secretas
    if mods[compatMods[1]] then
        -- Disables efficiency module 4
        local efficiency_module_tech = data.raw["technology"]["rubia-efficiency-module4"]
        efficiency_module_tech.enabled = false

        local efficiency_module = data.raw["module"]["rubia-efficiency-module4"]
        utils.hideItem(efficiency_module)
    end
end
