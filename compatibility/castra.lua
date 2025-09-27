if mods["castra"] then
    local utils = require("utils")

    local compatMods = {
        "metal-and-stars",
        "Cerys-Moon-of-Fulgora",
        "OCs_ammo_casting",
        "vtk-cannon-turret",
    }

    local ammo_productivity = data.raw["technology"]["physical-ammo-productivity"]
    local explosives_productivity = data.raw["technology"]["explosive-ammo-productivity"]

    -- If Metal and stars
    if mods[compatMods[1]] then
        local removeAmmo = {
            "firearm-magazine",
            "firearm-magazine-nickel",
            "piercing-rounds-magazine",
            "piercing-rounds-catalyzing",
            "uranium-rounds-magazine",
            "shotgun-shell",
            "piercing-shotgun-shell"
        }

        -- Remove bullets productivity from physical ammo productivity (Physical ammo productivity -> Heavy ammo productivity)
        for _, recipe_name in ipairs(removeAmmo) do
            utils.removeFromTable(ammo_productivity.effects, recipe_name, "recipe")
        end

        utils.extendTable(ammo_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "explosive-cannon-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "explosive-uranium-cannon-shell",
                change = 0.1
            },
        })

        local removeExplosives = {
            "artillery-shell",
            "explosive-cannon-shell",
            "explosive-uranium-cannon-shell"
        }

        -- Remove some explosives from explosives productivity because they are already added to heavy ammo productivity
        for _, recipe_name in ipairs(removeExplosives) do
            utils.removeFromTable(explosives_productivity.effects, recipe_name, "recipe")
        end

        -- Adds metal and stars gauss rockets to productivity
        utils.extendTable(explosives_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "gauss-rocket",
                change = 0.1
            },
        })
    end

    -- If Cerys
    if mods[compatMods[2]] then
        -- Disable engine productivity because cerys have theirs
        local engine_productivity = data.raw["technology"]["engine-productivity"]
        engine_productivity.enabled = false
    end

    -- If Ammo casting
    if mods[compatMods[3]] then
        -- Adds all ammo casting recipes
        utils.extendTable(ammo_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "casting-cannon-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-explosive-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-uranium-cannon-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-explosive-uranium-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "tungsten-cannon-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-tungsten-cannon-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-artillery-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "heavy-artillery-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-heavy-artillery-shell",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-railgun-ammo",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "tungsten-railgun-ammo",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-tungsten-railgun-ammo",
                change = 0.1
            },
        })

        utils.extendTable(explosives_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "bio-rocket",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "bio-explosive-rocket",
                change = 0.1
            },
        })
    end

    -- If Cannon turrets
    if mods[compatMods[4]] then
        -- Adds all cannon turrets recipes
        utils.extendTable(ammo_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "explosive-cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "uranium-cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "explosive-uranium-cannon-shell-magazine",
                change = 0.1
            },
        })
    end

    -- If Metal and stars | Ammo casting
    if mods[compatMods[1]] and mods[compatMods[3]] then
        -- Adds casting of metal and stars rockets
        utils.extendTable(explosives_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "casting-gauss-rocket",
                change = 0.1
            },
        })
    end

    -- If Ammo casting | Cannon turrets
    if mods[compatMods[3]] and mods[compatMods[4]] then
        -- Adds casting of cannon turrets magazines
        utils.extendTable(ammo_productivity.effects, {
            {
                type = "change-recipe-productivity",
                recipe = "casting-cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-explosive-cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-uranium-cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-explosive-uranium-cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "tungsten-cannon-shell-magazine",
                change = 0.1
            },
            {
                type = "change-recipe-productivity",
                recipe = "casting-tungsten-cannon-shell-magazine",
                change = 0.1
            }
        })
    end
end
