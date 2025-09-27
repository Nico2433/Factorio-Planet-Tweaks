if mods["janus"] then
    local utils                    = require("utils")

    ----------------------- TIME DISTORTER -----------------------
    -- Adds module slots to time distorter
    local time_distorter           = data.raw["assembling-machine"]["janus-time-distorter"]
    time_distorter.module_slots    = 1
    time_distorter.allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" }

    ----------------------- RECIPES -----------------------
    local recipes                  = {
        "janus-simple-oil",
        "janus-shiftite-to-iron",
        "janus-shiftite-to-copper",
        "janus-shiftite-to-stone",
        "janus-shiftite-to-water",
        "janus-shiftite-to-coal",
        "janus-shiftite-to-crude-oil",
        "janus-shiftite-to-concrete",
        "janus-shiftite-to-steel-plate",
        "janus-shiftite-to-electronic-circuit",
        "janus-shiftite-to-advanced-circuit",
        "janus-shiftite-to-processing-unit",
        "janus-shiftite-to-low-density-structure",
        "janus-shiftite-to-rocket-fuel",
        "janus-shiftite-to-refined-concrete",
        "janus-shiftite-to-tungsten-carbide",
        "janus-shiftite-to-tungsten-plate",
        "janus-shiftite-to-calcite",
        "janus-shiftite-to-holmium-plate",
        "janus-containment-unit",
        "janus-time-science-pack",
        "janus-thruster-fuel"
    }

    local liquids                  = { "oil", "water", "thruster%-fuel" }

    -- Enable productivity for intermediate recipes
    for _, recipeName in ipairs(recipes) do
        local recipe = data.raw["recipe"][recipeName]

        if recipe then
            recipe.allow_productivity = true

            local matches = false
            for _, ending in ipairs(liquids) do
                if string.find(recipeName, ending .. "$") then
                    matches = true
                    break
                end
            end

            if matches then
                recipe.allow_quality = false
            end
        end
    end

    ----------------------- BULK INSERTER -----------------------
    -- Adds a time shifted bulk inserter
    local bulk_inserter_time_shifted                           = table.deepcopy(data.raw["inserter"]["bulk-inserter"])

    bulk_inserter_time_shifted.name                            = "janus-bulk-inserter"
    bulk_inserter_time_shifted.insert_position                 = { 1.2, 0 }
    bulk_inserter_time_shifted.subgroup                        = "janus-time-shifted"
    bulk_inserter_time_shifted.minable.result                  = "janus-bulk-inserter"
    bulk_inserter_time_shifted.next_upgrade                    = nil
    bulk_inserter_time_shifted.allow_custom_vectors            = true

    bulk_inserter_time_shifted.hand_base_picture.filename      =
    "__nayfall-planet-tweaks__/assets/janus/bulk-inserter/time-shifted-bulk-inserter-hand-base.png"
    bulk_inserter_time_shifted.hand_closed_picture.filename    =
    "__nayfall-planet-tweaks__/assets/janus/bulk-inserter/time-shifted-bulk-inserter-hand-closed.png"
    bulk_inserter_time_shifted.hand_open_picture.filename      =
    "__nayfall-planet-tweaks__/assets/janus/bulk-inserter/time-shifted-bulk-inserter-hand-open.png"
    bulk_inserter_time_shifted.platform_picture.sheet.filename =
    "__nayfall-planet-tweaks__/assets/janus/bulk-inserter/time-shifted-bulk-inserter-platform.png"

    ----- REMNANTS -----
    bulk_inserter_time_shifted_corpse                          = {
        type = "corpse",
        name = "janus-bulk-inserter-remnants",
        icon = "__base__/graphics/icons/bulk-inserter.png",
        hidden_in_factoriopedia = true,
        flags = { "placeable-neutral", "not-on-map" },
        subgroup = "inserter-remnants",
        order = "a-f-a",
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_width = 1,
        tile_height = 1,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        animation = utils.janus.make_rotated_animation_variations_from_sheet(4,
            {
                filename =
                "__nayfall-planet-tweaks__/assets/janus/bulk-inserter/time-shifted-bulk-inserter-remnants.png",
                line_length = 1,
                width = 132,
                height = 96,
                direction_count = 1,
                shift = util.by_pixel(3, -1.5),
                scale = 0.5
            })
    }

    ----- ITEM -----
    local bulk_inserter_time_shifted_item                      = table.deepcopy(data.raw["item"]["bulk-inserter"])
    bulk_inserter_time_shifted_item.name                       = "janus-bulk-inserter"
    bulk_inserter_time_shifted_item.place_result               = "janus-bulk-inserter"
    bulk_inserter_time_shifted_item.subgroup                   = "janus-time-shifted"
    bulk_inserter_time_shifted_item.icon                       =
    "__nayfall-planet-tweaks__/assets/janus/bulk-inserter/time-shifted-bulk-inserter-icon.png"

    ----- RECIPE -----
    local bulk_inserter_recipe                                 = {
        auto_recycle = false,
        type = "recipe",
        name = "janus-bulk-inserter",
        subgroup = "janus-time-shifted",
        category = "janus-shiftite",
        ingredients = {
            { type = "item", name = "bulk-inserter",        amount = 1 },
            { type = "item", name = "janus-shiftite-alpha", amount = 5 },
            { type = "item", name = "janus-shiftite-beta",  amount = 3 },
            { type = "item", name = "janus-shiftite-omega", amount = 1 }
        },
        energy_required = 3,
        results = { { type = "item", name = "janus-bulk-inserter", amount = 1 } },
        enabled = false
    }

    data:extend({ bulk_inserter_time_shifted, bulk_inserter_time_shifted_corpse, bulk_inserter_time_shifted_item,
        bulk_inserter_recipe })

    ----------------------- STACK INSERTER -----------------------
    -- Adds a time shifted stack inserter
    local stack_inserter_time_shifted                           = table.deepcopy(data.raw["inserter"]["stack-inserter"])

    stack_inserter_time_shifted.name                            = "janus-stack-inserter"
    stack_inserter_time_shifted.insert_position                 = { 1.2, 0 }
    stack_inserter_time_shifted.subgroup                        = "janus-time-shifted"
    stack_inserter_time_shifted.minable.result                  = "janus-stack-inserter"
    stack_inserter_time_shifted.next_upgrade                    = nil
    stack_inserter_time_shifted.allow_custom_vectors            = true

    stack_inserter_time_shifted.hand_base_picture.filename      =
    "__nayfall-planet-tweaks__/assets/janus/stack-inserter/time-shifted-stack-inserter-hand-base.png"
    stack_inserter_time_shifted.hand_closed_picture.filename    =
    "__nayfall-planet-tweaks__/assets/janus/stack-inserter/time-shifted-stack-inserter-hand-closed.png"
    stack_inserter_time_shifted.hand_open_picture.filename      =
    "__nayfall-planet-tweaks__/assets/janus/stack-inserter/time-shifted-stack-inserter-hand-open.png"
    stack_inserter_time_shifted.platform_picture.sheet.filename =
    "__nayfall-planet-tweaks__/assets/janus/stack-inserter/time-shifted-stack-inserter-platform.png"

    ----- REMNANTS -----
    stack_inserter_time_shifted_corpse                          = {
        type = "corpse",
        name = "janus-stack-inserter-remnants",
        icon = "__space-age__/graphics/icons/stack-inserter.png",
        hidden_in_factoriopedia = true,
        flags = { "placeable-neutral", "not-on-map" },
        subgroup = "inserter-remnants",
        order = "a-h-a",
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_width = 1,
        tile_height = 1,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        animation = utils.janus.make_rotated_animation_variations_from_sheet(4,
            {
                filename =
                "__nayfall-planet-tweaks__/assets/janus/stack-inserter/time-shifted-stack-inserter-remnants.png",
                line_length = 1,
                width = 132,
                height = 96,
                direction_count = 1,
                shift = util.by_pixel(3, -1.5),
                scale = 0.5
            })
    }

    ----- ITEM -----
    local stack_inserter_time_shifted_item                      = table.deepcopy(data.raw["item"]["stack-inserter"])
    stack_inserter_time_shifted_item.name                       = "janus-stack-inserter"
    stack_inserter_time_shifted_item.place_result               = "janus-stack-inserter"
    stack_inserter_time_shifted_item.subgroup                   = "janus-time-shifted"
    stack_inserter_time_shifted_item.icon                       =
    "__nayfall-planet-tweaks__/assets/janus/stack-inserter/time-shifted-stack-inserter-icon.png"

    ----- RECIPE -----
    local stack_inserter_recipe                                 = {
        auto_recycle = false,
        type = "recipe",
        name = "janus-stack-inserter",
        subgroup = "janus-time-shifted",
        category = "janus-shiftite",
        ingredients = {
            { type = "item", name = "stack-inserter",       amount = 1 },
            { type = "item", name = "janus-shiftite-alpha", amount = 5 },
            { type = "item", name = "janus-shiftite-beta",  amount = 3 },
            { type = "item", name = "janus-shiftite-omega", amount = 1 }
        },
        energy_required = 3,
        results = { { type = "item", name = "janus-stack-inserter", amount = 1 } },
        enabled = false
    }

    data:extend({ stack_inserter_time_shifted, stack_inserter_time_shifted_corpse, stack_inserter_time_shifted_item,
        stack_inserter_recipe })

    ----------------------- TECHNOLOGY -----------------------
    -- Adds new inserters to technology
    local time_shifted_tech = data.raw["technology"]["janus-fast-inserter"]
    utils.extendTable(time_shifted_tech.effects, {
        { type = "unlock-recipe", recipe = "janus-bulk-inserter" },
        {
            type = "unlock-recipe",
            recipe =
            "janus-stack-inserter"
        }
    })
end
