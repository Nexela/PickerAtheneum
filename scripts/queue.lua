-------------------------------------------------------------------------------
--[[on-tick queue]]--
-------------------------------------------------------------------------------
-- Concept designed and code written by TheStaplergun (staplergun on mod portal)
-- STDLib and code reviews provided by Nexela
--[[

To add your mod to the queue copy the following code somewhere in your mod at a point where it's been determined that the work needs to be distributed:
--STDLIB-----------------------------------------------------------------------
local token = remote.call("PickerAtheneum","queue_add",{mod_name = "YourModName_QueuedTaskAbbreviation"}) --The additional queued task abbreviation allows you to queue multiple things within the same mod
global.queue_token = token
Event.register(token, function_to_call_each_turn)
--NO STD LIB-------------------------------------------------------------------
local token = remote.call("PickerAtheneum","queue_add",{mod_name = "YourModName_QueuedTaskAbbreviation"}) --The additional queued task abbreviation allows you to queue multiple things within the same mod
global.queue_token = token
script.on_event(token, function_to_call_each_turn)


To remove your mod from the queue and de-register the listener, add this code somewhere in your mod once the work is done:
--STDLIB-----------------------------------------------------------------------
remote.call("PickerAtheneum","queue_remove",{token = global.queue_token})
--NO STD LIB-------------------------------------------------------------------
remote.call("PickerAtheneum","queue_remove",{token = global.queue_token})

]]

local Event = require('__stdlib__/stdlib/event/event')
local Interface = require('__stdlib__/stdlib/scripts/interface')

local function queue_tick()
    local i = global.current_index
    local q = global.queue
    remote.call(q[i].name,q[i].f_name)
    i = i + 1
    if i > #global.queue then
        i = 1
    end
    global.current_index = i
end

local function queue_initialize()
    global.queue = {}
    global.running = true
    global.current_index = 1
    Event.register(defines.events.on_tick, queue_tick)
end


Interface['queue_add'] = function(data)
    if not global.running then
        queue_initialize()
    end
    local q = global.queue
    q[#q + 1] = {
        name = data.name,
        f_name = data.f_name
    }
    return true
end

Interface['queue_remove'] = function(data)
    for i,q_pos in pairs(global.queue) do
        if data.name == q_pos.name then
            if (i > global.current_index) or (i > #global.queue) then
                global.current_index = global.current_index - 1
            end
            table.remove(global.queue, i)
        end
    end
    if not next(global.queue) then
        global.queue = {}
        global.running = false
        Event.remove(defines.events.on_tick, queue_tick)
    end
end

local function on_load()
    if global.running then
        Event.register(defines.events.on_tick,queue_tick)
    end
end
Event.on_load(on_load)
