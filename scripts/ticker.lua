local Event = require('__stdlib__/stdlib/event/event')
local Queue = require('__stdlib__/stdlib/misc/queue')

local tick_options = {
    protected_mode = true,
    skip_valid = true
}

local function on_tick()
    if global.tick_queue then
        local queue = global.tick_queue()
        if queue then
            if queue.ran_once then
                return queue.func and queue.func(queue.params)
            else
                queue.ran_once = true
                global.tick_queue(queue)
            end
        else
            global.tick_queue = nil
            Event.remove(defines.events.on_tick, on_tick)
        end
    else
        Event.remove(defines.events.on_tick, on_tick)
    end
end

local function add_tick(queue)
    if queue.func then
        if not global.tick_queue then
            global.tick_queue = Queue()
            Event.on_event(defines.events.on_tick, on_tick, nil, nil, tick_options)
        end
        global.tick_queue(queue)
    end
end

-- Start the ticker in on_load if needed
local function on_load()
    if global.tick_queue then
        Queue.load(global.tick_queue)
        Event.register(defines.events.on_tick, on_tick, nil, nil, tick_options)
    end
end
Event.on_load(on_load)

return add_tick
