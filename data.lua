local Data = require('__stdlib__/stdlib/data/data')

require('prototypes/adjustment-pad')
require('prototypes/styles')

Data {
    type = 'flying-text',
    name = 'picker-flying-text',
    flags = {'placeable-off-grid', 'not-on-map'},
    time_to_live = 150,
    speed = 0.05
}

Data {
    name = 'picker-buffer-corpse-instant',
    type = 'character-corpse',
    picture = Data.Sprites.empty_pictures(),
    selection_priority = 0,
    time_to_live = 1
}

Data {
    name = 'picker-buffer-corpse-inf',
    type = 'character-corpse',
    picture = Data.Sprites.empty_pictures(),
    selection_priority = 0,
    time_to_live = 2147483647
}
