-- Muluna changes are here because can't modify it on data stage
if mods["planet-muluna"] then
    local compatMods = {
        "janus"
    }

    -- If Janus
    if mods[compatMods[1]] then
        local thruster_productivity = data.raw["technology"]["thruster-fuel-productivity"]

        -- Adds afterburner fuel to thruster fuel productivity
        table.insert(thruster_productivity.effects, {
            type = "change-recipe-productivity",
            recipe = "janus-thruster-fuel",
            change = 0.1
        })
    end
end
