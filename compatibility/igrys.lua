if mods["Igrys"] then
    local compatMods = {
        "maraxsis",
        "aai-industry",
    }

    local igrys_glass = data.raw["technology"]["igrys-glass-productivity"]

    if mods[compatMods[1]] then
        local maraxsis_glass = data.raw["technology"]["maraxsis-glass-productivity"]
        maraxsis_glass.enabled = false

        table.insert(igrys_glass.effects, {
            type = "change-recipe-productivity",
            recipe = "maraxsis-glass-panes",
            change = 0.1
        })
    end

    if mods[compatMods[2]] then
        table.insert(igrys_glass.effects, {
            type = "change-recipe-productivity",
            recipe = "glass",
            change = 0.1
        })
    end
end
