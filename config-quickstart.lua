-- Settings used for the quickstart script,
-- if an item doesn't exist it is ignored.
local items, equipment
if script.active_mods['EditorExtensions'] then
    items = {
        ['ee-infinity-chest'] = 50,
        ['ee-infinity-pipe'] = 50,
        ['ee-infinity-heat-interface'] = 50,
        ['ee-infinity-accumulator'] = 50,
        ['construction-robot'] = 50,
        ['pipe'] = 50,
        ['fast-inserter'] = 50
    }
    equipment = {
        'ee-infinity-fusion-reactor-equipment',
        'ee-super-personal-roboport-equipment',
        'belt-immunity-equipment'
    }
else
    items = {
        ['infinity-chest'] = 50,
        ['infinity-pipe'] = 50,
        ['heat-interface'] = 50,
        ['construction-robot'] = 50,
        ['pipe'] = 50,
        ['fast-inserter'] = 50
    }
    equipment = {
        'fusion-reactor-equipment',
        'personal-roboport-mk2-equipment',
        'belt-immunity-equipment'
    }
end

return {
    cheat_mode = true,
    always_day = true,
    power_armor = 'power-armor-mk2',
    equipment = equipment,
    destroy_everything = true,
    disable_rso_starting = true,
    disable_rso_chunk = true,
    floor_tile = 'lab-dark-1',
    floor_tile_alt = 'lab-dark-2',
    ore_patches = true,
    water_tiles = true,
    custom_bp_string = false,
    default_bp_string = true,
    area_box = {{-250, -250}, {250, 250}},
    chunk_bounds = true,
    center_map_tag = true,
    setup_power = true,
    items = items
}
