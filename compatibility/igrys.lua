if mods["Igrys"] then
    local compatMods = {
        "maraxsis",
        "aai-industry",
    }

    local igrys_glass = data.raw["technology"]["igrys-glass-productivity"]

    -- If Maraxsis
    if mods[compatMods[1]] then
        -- Disable Maraxsis glass productivity
        local maraxsis_glass = data.raw["technology"]["maraxsis-glass-productivity"]
        maraxsis_glass.enabled = false

        -- Adds Maraxsis glass to Igrys glass productivity
        table.insert(igrys_glass.effects, {
            type = "change-recipe-productivity",
            recipe = "maraxsis-glass-panes",
            change = 0.1
        })
    end

    -- If aai industry
    if mods[compatMods[2]] then
        -- Adds aai industry glass to Igrys glass productivity
        table.insert(igrys_glass.effects, {
            type = "change-recipe-productivity",
            recipe = "glass",
            change = 0.1
        })
    end
end
