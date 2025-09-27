if mods["Paracelsin"] then
    local utils = require("utils")

    local compatMods = {
        "Moshine"
    }

    if mods[compatMods[1]] then
        ----------------------- TECHNOLOGY -----------------------
        local big_solar_energy_tech = data.raw["technology"]["big-solar-energy"]
        local big_accumulator_tech = data.raw["technology"]["electric-energy-big-accumulators"]

        local solar_matrix_tech = data.raw["technology"]["solar-matrix"]
        local accumulator_v2_tech = data.raw["technology"]["accumulator-v2"]

        solar_matrix_tech.unit = big_solar_energy_tech.unit
        solar_matrix_tech.prerequisites = big_solar_energy_tech.prerequisites
        big_solar_energy_tech.enabled = false

        accumulator_v2_tech.unit = big_accumulator_tech.unit
        accumulator_v2_tech.prerequisites = big_accumulator_tech.prerequisites
        big_accumulator_tech.enabled = false

        ----------------------- RECIPES -----------------------
        local modifier = "/4"

        local big_solar_panel_rec = data.raw["recipe"]["big-solar-panel"]
        local big_accumulator_rec = data.raw["recipe"]["big-accumulator"]

        local solar_matrix_rec = data.raw["recipe"]["solar-matrix"]
        local accumulator_v2_rec = data.raw["recipe"]["accumulator-v2"]

        solar_matrix_rec.category = "electronics"
        solar_matrix_rec.surface_conditions = big_solar_panel_rec.surface_conditions
        solar_matrix_rec.ingredients = utils.replicateIngredients("big-solar-panel", modifier)
        utils.hideItem(big_solar_panel_rec)

        accumulator_v2_rec.category = "electronics"
        accumulator_v2_rec.surface_conditions = big_accumulator_rec.surface_conditions
        accumulator_v2_rec.ingredients = utils.replicateIngredients("big-accumulator", modifier)
        utils.hideItem(big_accumulator_rec)

        ----------------------- PROPERTIES -----------------------
        local big_solar_panel_props = data.raw["solar-panel"]["big-solar-panel"]
        local big_accumulator_props = data.raw["accumulator"]["big-accumulator"]

        local solar_matrix = data.raw["solar-panel"]["solar-matrix"]
        local accumulator_v2 = data.raw["accumulator"]["accumulator-v2"]

        solar_matrix.production = utils.applyNumberModifier(big_solar_panel_props.production, modifier)

        accumulator_v2.energy_source.buffer_capacity = utils.applyNumberModifier(
            big_accumulator_props.energy_source.buffer_capacity, modifier)
        accumulator_v2.energy_source.input_flow_limit = utils.applyNumberModifier(
            big_accumulator_props.energy_source.buffer_capacity, modifier)
        accumulator_v2.energy_source.output_flow_limit = utils.applyNumberModifier(
            big_accumulator_props.energy_source.output_flow_limit, modifier)
    end
end
