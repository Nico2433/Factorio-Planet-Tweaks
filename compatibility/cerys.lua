if mods["Cerys-Moon-of-Fulgora"] then
    local utils = require("utils")

    local compatMods = {
        "secretas"
    }

    if mods[compatMods[1]] then
        ----------------------- OVERCLOCK MODULE -----------------------
        local overclock_module_tech = data.raw["technology"]["cerys-overclock-module"]
        local overclock_module_rec = data.raw["recipe"]["cerys-overclock-module"]
        local overclock_module = data.raw["module"]["cerys-overclock-module"]

        overclock_module_tech.enabled = false
        overclock_module_rec.enabled = false
        utils.hideItem(overclock_module_rec)
        utils.hideItem(overclock_module)

        ----------------------- RADIOACTIVE MODULE -----------------------
        local radioactive_module_tech = data.raw["technology"]["cerys-radioactive-module"]
        local radioactive_module_charged_rec = data.raw["recipe"]["cerys-radioactive-module-charged"]
        local radioactive_module_recharge_rec = data.raw["recipe"]["cerys-radioactive-module-recharging"]
        local radioactive_module_charged = data.raw["module"]["cerys-radioactive-module-charged"]
        local radioactive_module_decayed = data.raw["module"]["cerys-radioactive-module-decayed"]

        radioactive_module_tech.enabled = false
        radioactive_module_charged_rec.enabled = false
        radioactive_module_recharge_rec.enabled = false
        utils.hideItem(radioactive_module_charged_rec)
        utils.hideItem(radioactive_module_charged)
        utils.hideItem(radioactive_module_recharge_rec)
        utils.hideItem(radioactive_module_decayed)

        ----------------------- RADIOACTIVE INSERTER -----------------------
        local radioactive_inserter_rec = data.raw["recipe"]["cerys-radiation-proof-inserter"]
        local radioactive_inserter = data.raw["item"]["cerys-radiation-proof-inserter"]

        radioactive_inserter_rec.enabled = false
        utils.hideItem(radioactive_inserter_rec)
        utils.hideItem(radioactive_inserter)
    end
end
