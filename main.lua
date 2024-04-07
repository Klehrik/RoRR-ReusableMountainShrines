-- Reusable Mountain Shrines v1.0.4
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..". Enjoy =)")
mods.on_all_mods_loaded(function() for k, v in pairs(mods) do if type(v) == "table" and v.hfuncs then Helper = v end end end)



-- ========== Main ==========

function manage_shrines(shrines)
    -- Reset mountain shrines after their animation finishes
    for i = 1, #shrines do
        local shrine = shrines[i]

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


gm.pre_script_hook(gm.constants.__input_system_tick, function()
    manage_shrines(Helper.find_active_instance_all(gm.constants.oShrineMountain))
    manage_shrines(Helper.find_active_instance_all(gm.constants.oShrineMountainS))
end)