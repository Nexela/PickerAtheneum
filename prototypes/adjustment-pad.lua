-- 'consuming'
-- available options:
-- none: default if not defined
-- all: if this is the first input to get this key sequence then no other inputs listening for this sequence are fired
-- script-only: if this is the first *custom* input to get this key sequence then no other *custom* inputs listening for this sequence are fired.
----Normal game inputs will still be fired even if they match this sequence.
-- game-only: The opposite of script-only: blocks game inputs using the same key sequence but lets other custom inputs using the same key sequence fire.
data:extend {
    {
        type = 'custom-input',
        name = 'adjustment-pad-increase',
        key_sequence = 'PAD +',
        linked_game_control = 'larger-terrain-building-area'
    },
    {
        type = 'custom-input',
        name = 'adjustment-pad-decrease',
        key_sequence = 'PAD -',
        linked_game_control = 'smaller-terrain-building-area'
    }
}

data:extend {
    {
        type = 'font',
        name = 'adjustment_pad-button-font',
        from = 'default',
        size = 8
    }
}

local style = data.raw['gui-style'].default

style.adjustment_pad_frame_style = {
    type = 'frame_style',
    parent = 'frame',
    maximal_height = 33,
    minimal_height = 33,
    top_padding = 0,
    left_padding = 6,
    right_padding = 6,
    bottom_padding = 0
}

style.adjustment_pad_label_style = {
    type = 'label_style',
    parent = 'label',
    maximal_width = 90,
    minimal_width = 90
}

style.adjustment_pad_text_style = {
    type = 'textbox_style',
    parent = 'number_textfield',
    maximal_width = 42,
    minimal_width = 42,
    maximal_height = 24,
    minimal_height = 24,
    font = 'default-small'
}

style.adjustment_pad_table_style = {
    type = 'table_style',
    parent = 'table',
    cell_spacing = 0,
    top_padding = 0,
    left_padding = 0,
    right_padding = 0,
    bottom_padding = 0,
    horizontal_spacing = 0,
    vertical_spacing = 0
}

style.adjustment_pad_btn_small_style = {
    type = 'button_style',
    parent = 'button',
    maximal_height = 14,
    minimal_height = 14,
    maximal_width = 20,
    minimal_width = 20,
    font = 'adjustment_pad-button-font',
    left_click_sound = {
        {
            filename = '__core__/sound/gui-click.ogg',
            volume = 1
        }
    }
}

style.adjustment_pad_btn_up = {
    type = 'button_style',
    parent = 'adjustment_pad_btn_small_style',
    default_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        position = {0, 0},
        size = {20, 14},
        scale = 1
    },
    hovered_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        position = {20, 0},
        size = {20, 14},
        scale = 1
    },
    clicked_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        position = {20, 0},
        size = {20, 14},
        scale = 1
    }
}

style.adjustment_pad_btn_dn = {
    type = 'button_style',
    parent = 'adjustment_pad_btn_small_style',
    default_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        size = {20, 14},
        position = {0, 14},
        scale = 1
    },
    hovered_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        size = {20, 14},
        position = {20, 14},
        scale = 1
    },
    clicked_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        size = {20, 14},
        position = {20, 14},
        scale = 1
    }
}

style.adjustment_pad_btn_reset = {
    type = 'button_style',
    parent = 'button',
    maximal_height = 28,
    minimal_height = 28,
    maximal_width = 20,
    minimal_width = 20,
    font = 'adjustment_pad-button-font',
    left_click_sound = {
        {
            filename = '__core__/sound/gui-click.ogg',
            volume = 1
        }
    },
    default_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        size = {20, 28},
        position = {40, 0},
        scale = 1
    },
    hovered_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        size = {20, 28},
        position = {60, 0},
        scale = 1
    },
    clicked_graphical_set = {
        filename = '__PickerAtheneum__/graphics/small-btns.png',
        priority = 'extra-high-no-scale',
        size = {20, 28},
        position = {60, 0},
        scale = 1
    }
}
