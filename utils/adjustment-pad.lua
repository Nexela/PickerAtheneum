-------------------------------------------------------------------------------
--[Adjustment Pad]--
-------------------------------------------------------------------------------
local Pad = {}
local Event = require('__stdlib__/stdlib/event/event')
local lib = require('__PickerAtheneum__/utils/lib')

function Pad.register_events()
    local adjustment_pad = Event.generate_event_name('adjustment_pad')

    Event.register(
        'adjustment-pad-increase',
        function(event)
            script.raise_event(adjustment_pad, event)
        end
    )

    Event.register(
        'adjustment-pad-decrease',
        function(event)
            script.raise_event(adjustment_pad, event)
        end
    )

    local interface = require('__stdlib__/stdlib/scripts/interface')
    interface['get_adjustment_pad_id'] = function()
        return Event.generate_event_name('adjustment_pad')
    end
    interface['get_or_create_adjustment_pad'] = Pad.get_or_create_adjustment_pad
    return Pad
end

function Pad.remove_gui(player, frame_name, flow_name)
    flow_name = flow_name or 'picker'
    local main_flow = lib.get_or_create_main_left_flow(player, flow_name)
    return main_flow[frame_name] and main_flow[frame_name].destroy()
end

function Pad.get_or_create_adjustment_pad(player, name, flow_name) -- return gui
    name = name or 'adjustment_pad'
    flow_name = flow_name or 'picker'
    local main_flow = lib.get_or_create_main_left_flow(player, flow_name)

    local gui = main_flow[name .. '_frame_main']
    if not gui then
        gui = main_flow.add {type = 'frame', name = name .. '_frame_main', direction = 'horizontal', style = 'adjustment_pad_frame_style'}
        local flow = gui.add {type = 'flow', name = name .. '_flow', direction = 'horizontal', style = 'adjustment_pad_flow_style'}
        flow.add {type = 'label', name = name .. '_label', caption = {name .. '-gui.label-caption'}, tooltip = {name .. '-tooltip.label-caption'}, style = 'heading_2_label'}
        flow.add {type = 'textfield', name = name .. '_text_box', text = 0, style = 'adjustment_pad_text_style'}
        --Up/Down buttons
        local button_flow = flow.add {type = 'flow', name = name .. '_button_flow', direction = 'vertical', style = 'adjustment_pad_button_flow_style'}
        button_flow.add {type = 'sprite-button', name = name .. '_btn_up', style = 'close_button', sprite = 'adjustment_pad_button_plus', hovered_sprite = 'adjustment_pad_button_plus_dark', clicked_sprite = 'adjustment_pad_button_plus_dark'}
        button_flow.add {type = 'sprite-button', name = name .. '_btn_dn', style = 'close_button', sprite = 'adjustment_pad_button_minus', hovered_sprite = 'adjustment_pad_button_minus_dark', clicked_sprite = 'adjustment_pad_button_minus_dark'}
        --Reset button
        flow.add {type = 'sprite-button', name = name .. '_btn_reset', tooltip = {name .. '-tooltip.label-reset'}, style = 'adjustment_pad_btn_reset_style', sprite = 'utility/reset'}
    end
    return gui[name .. '_flow']
end

return Pad
