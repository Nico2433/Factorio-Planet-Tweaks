if mods["metal-and-stars"] then
    local utils = require("utils")

    local compatMods = {
        "castra",
        "planet-muluna",
        "OCs_ammo_casting",
        "cupric-asteroids",
    }

    local bullet_productivity = data.raw["technology"]["bullet-productivity"]

    -- Adds basic bullets and shotgun ammo to bullet productivity
    utils.extendTable(bullet_productivity.effects, {
        {
            type = "change-recipe-productivity",
            recipe = "firearm-magazine",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "shotgun-shell",
            change = 0.1
        },
        {
            type = "change-recipe-productivity",
            recipe = "piercing-shotgun-shell",
            change = 0.1
        }
    })

    -- If Castra
    if mods[compatMods[1]] then
        -- Disables railgun ammo productivity because they are already on castra heavy ammo productivity
        local railgun_ammo_productivity = data.raw["technology"]["railgun-ammo-productivity"]
        railgun_ammo_productivity.enabled = false
        -- Disables rocket ammo productivity because castra already have explosive ammo productivity
        local rocket_ammo_productivity = data.raw["technology"]["rocket-ammo-productivity"]
        rocket_ammo_productivity.enabled = false

        -- Moves bullets productivity to castra
        bullet_productivity.prerequisites = { "battlefield-science-pack" }
        bullet_productivity.unit = {
            count_formula = "1.5^L*1000",
            ingredients = {
                { "military-science-pack",    1 },
                { "space-science-pack",       1 },
                { "battlefield-science-pack", 1 }
            },
            time = 60,
        }

        -- Adds castra crafting to bullets productivity
        utils.extendTable(bullet_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "firearm-magazine-nickel",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "piercing-rounds-catalyzing",
                change = 0.1
            },
        })
    end

    -- If Muluna
    if mods[compatMods[2]] then
        -- Disable thruster fuel productivity because Muluna alreaddy have theirs
        local thruster_productivity = data.raw["technology"]["space-fuel-productivity"]
        thruster_productivity.enabled = false
    end

    -- If Ammo casting
    if mods[compatMods[3]] then
        -- Adds casting to bullets productivity
        utils.extendTable(bullet_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "casting-firearm-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-shotgun-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-piercing-shotgun-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "tungsten-shotgun-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-tungsten-shotgun-shell",
                change = 0.1
            }
        })
    end

    -- If Cupric asteroids
    if mods[compatMods[4]] then
        -- Adds smart rounds to bullet productivity
        utils.extendTable(bullet_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "smart-rounds-magazine",
                change = 0.1
            },
        })
    end
end
