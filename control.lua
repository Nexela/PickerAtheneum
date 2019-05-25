local interface = require('__stdlib__/stdlib/scripts/interface')
require('utils/adjustment-pad').register_events()

if require('__PickerAtheneum__/config').DEBUG then
    local Event = require('__stdlib__/stdlib/event/event')
    local function reload(event)
        local player = game.players[event.player_index]
        player.clear_console()
        game.print('Reloading Mods')
        game.reload_mods()
    end
    log(script.mod_name .. ' Developer Debug mode enabled')
    commands.add_command('Picker.reload', 'Reset', reload)
    require('__stdlib__/stdlib/core').create_stdlib_globals()
    require('__stdlib__/stdlib/scripts/quickstart').register_events()
    Event.register('picker-reload-mods', reload)
    Event.register('picker-dump-data', interface.dump_all)
end

commands.add_command('Picker.write-all', {'picker.write-all'}, interface.dump_all)

remote.add_interface(script.mod_name, interface)
