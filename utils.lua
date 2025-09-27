local utils = {}

utils.hideItem = function(item)
    item.hidden = true
    item.hidden_in_factoriopedia = true
end

utils.extendTable = function(insert, content)
    for _, value in ipairs(content) do
        table.insert(insert, value)
    end
end

utils.removeFromTable = function(tableRem, content, searchKey)
    for i = #tableRem, 1, -1 do
        local item = tableRem[i]

        local shouldRemove = false

        if searchKey then
            if item[searchKey] == content then
                shouldRemove = true
            end
        else
            if item == content then
                shouldRemove = true
            end
        end

        if shouldRemove then
            table.remove(tableRem, i)
        end
    end
end

utils.applyNumberModifier = function(numberString, modifier)
    -- Extract numbers (including decimals) from the string
    local numbers = {}

    -- Find all numbers in the string
    for num in numberString:gmatch("%d+%.?%d*") do
        table.insert(numbers, tonumber(num))
    end

    if #numbers == 0 then
        return numberString -- Return original if no numbers found
    end

    -- Parse the modifier
    local operation = modifier:sub(1, 1)
    local modifierValue = tonumber(modifier:sub(2))

    -- Apply modifier to all numbers found
    local index = 1
    local result = numberString:gsub("%d+%.?%d*", function(match)
        local number = numbers[index]
        index = index + 1

        if operation == "+" then
            number = number + modifierValue
        elseif operation == "-" then
            number = number - modifierValue
        elseif operation == "*" then
            number = number * modifierValue
        elseif operation == "/" then
            number = number / modifierValue
        elseif operation == "^" then
            number = number ^ modifierValue
        else
            return match -- Return original if invalid operation
        end

        return tostring(number)
    end)

    return result
end

utils.replicateIngredients = function(sourceRecipe, modifier, overrides)
    local original = data.raw.recipe[sourceRecipe].ingredients
    local newIngredients = {}

    for _, ingredient in ipairs(original) do
        local newIngredient = table.deepcopy(ingredient)

        -- Check if this ingredient has a specific override
        if overrides and overrides[newIngredient.name] then
            newIngredient.amount = overrides[newIngredient.name]
        else
            -- Apply general modifier
            local operation = modifier:sub(1, 1)
            local modifierValue = tonumber(modifier:sub(2))

            if operation == "+" then
                newIngredient.amount = newIngredient.amount + modifierValue
            elseif operation == "-" then
                newIngredient.amount = newIngredient.amount - modifierValue
            elseif operation == "*" then
                newIngredient.amount = newIngredient.amount * modifierValue
            elseif operation == "/" then
                newIngredient.amount = newIngredient.amount / modifierValue
            end
        end

        table.insert(newIngredients, newIngredient)
    end

    return newIngredients
end

utils.janus = {}

utils.janus.make_rotated_animation_variations_from_sheet = function(variation_count, sheet) --makes remnants work with more than 1 variation
    local result = {}

    local function set_y_offset(variation, i)
        local frame_count = variation.frame_count or 1
        local line_length = variation.line_length or frame_count
        if (line_length < 1) then
            line_length = frame_count
        end

        local height_in_frames = math.floor((frame_count * variation.direction_count + line_length - 1) / line_length)
        variation.y = variation.height * (i - 1) * height_in_frames
    end

    for i = 1, variation_count do
        local variation = util.table.deepcopy(sheet)

        if variation.layers then
            for _, layer in pairs(variation.layers) do
                set_y_offset(layer, i)
            end
        else
            set_y_offset(variation, i)
        end

        table.insert(result, variation)
    end
    return result
end

return utils
