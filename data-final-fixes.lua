if require('__PickerAtheneum__/config').DEBUG then
    log('Making developer debug entities')
    require('__stdlib__/stdlib/data/developer/developer').make_test_entities()
end
