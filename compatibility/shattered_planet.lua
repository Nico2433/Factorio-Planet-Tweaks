if mods["skewer_shattered_planet"] then
    local utils = require("utils")

    ----------------------- RECIPES -----------------------
    -- Change modules recipes to give vanilla modules
    local speed_module_rec = data.raw["recipe"]["ske_speed_module_3"]
    local efficiency_module_rec = data.raw["recipe"]["ske_efficiency_module_3"]
    local productivity_module_rec = data.raw["recipe"]["ske_production_module_3"]

    speed_module_rec.results = {
        { type = "item", name = "speed-module-3", amount = 1 }
    }

    efficiency_module_rec.results = {
        { type = "item", name = "efficiency-module-3", amount = 1 }
    }

    productivity_module_rec.results = {
        { type = "item", name = "productivity-module-3", amount = 1 }
    }

    ----------------------- MODULES -----------------------
    -- Disable duplicated modules
    local speed_module = data.raw["module"]["speed-module-3-shattered"]
    local efficiency_module = data.raw["module"]["efficiency-module-3-shattered"]
    local productivity_module = data.raw["module"]["productivity-module-3-shattered"]

    utils.hideItem(speed_module)
    utils.hideItem(efficiency_module)
    utils.hideItem(productivity_module)
end
