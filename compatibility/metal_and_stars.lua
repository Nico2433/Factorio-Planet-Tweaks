if mods["metal-and-stars"] then
    local utils = require("utils")

    local compatMods = {
        "castra",
        "planet-muluna",
        "OCs_ammo_casting",
        "cupric-asteroids",
    }

    local bullet_productivity = data.raw["technology"]["bullet-productivity"]

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

    if mods[compatMods[1]] then
        local railgun_ammo_productivity = data.raw["technology"]["railgun-ammo-productivity"]
        railgun_ammo_productivity.enabled = false
        local rocket_ammo_productivity = data.raw["technology"]["rocket-ammo-productivity"]
        rocket_ammo_productivity.enabled = false

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

    if mods[compatMods[2]] then
        local thruster_productivity = data.raw["technology"]["space-fuel-productivity"]
        thruster_productivity.enabled = false
    end

    if mods[compatMods[3]] then
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

    if mods[compatMods[4]] then
        utils.extendTable(bullet_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "smart-rounds-magazine",
                change = 0.1
            },
        })
    end
end
