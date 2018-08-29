local interface = require('__stdlib__/stdlib/scripts/interface')
require('utils/adjustment-pad').register_events()

if require('__PickerAtheneum__/config').DEBUG then
    log(script.mod_name .. ' Developer Debug mode enabled')
    require('__stdlib__/stdlib/core').create_stdlib_globals()
    require('__stdlib__/stdlib/scripts/quickstart')
end

commands.add_command('Picker.write-all', {'picker.write-all'}, interface.dump_all)
remote.add_interface(script.mod_name, interface)
