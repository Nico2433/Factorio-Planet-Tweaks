if mods["corrundum"] then
    -- Disable corrundum rocket fuel productivity
    local rocket_fuel_corr = data.raw["technology"]["rocket-fuel-catalysis-productivity-infinite"]
    rocket_fuel_corr.enabled = false

    -- Adds corrundum crafting recipe for rocket fuel to vanilla rocket fuel productivity
    local rocket_fuel = data.raw["technology"]["rocket-fuel-productivity"]
    table.insert(rocket_fuel.effects, {
        type = "change-recipe-productivity",
        recipe = "rocket-fuel-catalytic-chemistry",
        change = 0.1
    })
end
