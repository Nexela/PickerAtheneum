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
Event.remove(global.queue_token,function_to_call_each_turn)
global.queue_token = nil
--NO STD LIB-------------------------------------------------------------------
remote.call("PickerAtheneum","queue_remove",{token = global.queue_token})
script.on_event(global.queue_token,nil)
global.queue_token = nil

To handle registration properly on_load use:
--STDLIB-----------------------------------------------------------------------
Event.on_load(
    function()
        if global.queue_token then
                local token = remote.call("PickerAtheneum","queue_reestablish",{mod_name = "YourModName_QueuedTaskAbbreviation"}) --The additional queued task abbreviation allows you to queue multiple things within the same mod
                global.queue_token = token
                Event.register(token, function_to_call_each_turn)
        end
    end
)
--NO STD LIB-------------------------------------------------------------------
script.on_load(
    function()
        if global.queue_token then
                local token = remote.call("PickerAtheneum","queue_reestablish",{mod_name = "YourModName_QueuedTaskAbbreviation"}) --The additional queued task abbreviation allows you to queue multiple things within the same mod
                global.queue_token = token
                script.on_event(token, function_to_call_each_turn)
        end
    end
)
]]

local Event = require('__stdlib__/stdlib/event/event')
local Interface = require('__stdlib__/stdlib/scripts/interface')

local function queue_tick()
    local i = global.current_index
    i = i + 1
    if i > #global.queue then
        i = 1
    end
    Event.raise_event(global.queue[i].token, {stuff = true})
end

local function queue_initialize()
    global.queue = {}
    global.tokens_leased = {}
    global.running = true
    global.current_index = 1
    Event.register(defines.events.on_tick, queue_tick)
end


Interface['queue_add'] = function(data)
    if not global.running then
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
    for index,token in pairs(global.queue) do
        if token == r_token then
            if index > global.current_index then
                global.current_index = global.current_index - 1
            end
            table.remove(global.queue, index)
        end
    end
    global.tokens_leased[r_token] = nil
    if global.queue and not next(global.queue) then
        global.queue = {}
        global.running = false
        Event.remove(defines.events.on_tick, queue_tick)
    end
end


Interface['queue_reestablish'] = function(data)
    return global.tokens_leased[data.mod_name]
end


Event.on_load(
    function()
        global.running = global.running or false
        if global.running then
            queue_initialize()
            for _,queue_data in pairs(global.queue) do
                queue_data.token = Event.generate_event_name(queue_data.mod_name .. '_queue_event')
                global.tokens_leased[queue_data.mod_name] = queue_data.token
            end
        end
    end
)
