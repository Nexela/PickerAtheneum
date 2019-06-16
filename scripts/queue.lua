local Event = require('__stdlib__/stdlib/event/event')
local Interface = require('__stdlib__/stdlib/scripts/interface')

global.queue = {}
global.tokens_leased = {}
global.running = false
global.current_index = 1

local function queue_tick()
    local i = global.current_index
    i = i + 1
    if i > #global.queue then
        i = 1
    end
    Event.dispatch(global.queue[i].token, nil)
end

local function queue_initialize()
    Event.register(defines.events.on_tick, queue_tick)
end

Interface['queue_add'] = function(data)
    if not global.running then
        global.running = true
        queue_initialize()
    end
    local new_token = Event.generate_event_name(data.mod_name .. '_queue_event')
    --queue_generate_token()
    local q = global.queue
    q[#q + 1] = {
        mod_name = data.mod_name,
        token = new_token
    }
    global.tokens_leased[data.mod_name] = new_token
    return new_token
end

Interface['queue_remove'] = function(data)
    local r_token = data.token
    for index,token in global.queue do
        if token == r_token then
            if index > global.current_index then
                global.current_index = global.current_index - 1
            end
            table.remove(global.queue, index)
        end
    end
    global.tokens_leased[r_token] = nil
    if not next(global.queue) then
        global.queue = {}
        Event.remove(defines.events.on_tick, queue_tick)
    end
end

Interface['queue_reestablish'] = function(data)
    return global.tokens_leased[data.mod_name]
end


Event.on_load(
    function()
        if global.running then
            queue_initialize()
            for _,queue_data in pairs(global.queue) do
                queue_data.token = Event.generate_event_name(queue_data.mod_name .. '_queue_event')
                global.tokens_leased[queue_data.mod_name] = queue_data.token
            end
        end
    end
)
