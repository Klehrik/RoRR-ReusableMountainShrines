-- Reusable Mountain Shrines v1.0.1
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..". Enjoy =)")
require("./helper")



-- ========== Main ==========

function manage_shrines(mshrines)
    if mshrines then
        for i = 1, #mshrines do
            local shrine = mshrines[i]

            -- Check for animation end
            if shrine.image_index >= 14.0 and shrine.image_speed > 0 then
                shrine.image_speed = -shrine.image_speed

            -- Check for reverse animation end
            elseif shrine.image_index <= 0.5 and shrine.image_speed < 0 then
                shrine.active = 0.0
                shrine.image_speed = 0.0
                shrine.image_index = 0.0

            end
        end
    end
end


gm.pre_script_hook(gm.constants.__input_system_tick, function()
    -- Reset mountain shrines after their animation finishes
    
    local mshrines = find_all_cinstance_type(gm.constants.oShrineMountain)
    manage_shrines(mshrines)

    mshrines = find_all_cinstance_type(gm.constants.oShrineMountainS)
    manage_shrines(mshrines)
end)