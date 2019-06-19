-------------------------------------------------------------------------------
--[[on-tick queue]] --
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

--Cycle through the array stored in global one time per tick and perform remote.call with the mod name and function name provided during "queue_add"
local function queue_tick()
    if global.queue then
        local index, queue
        index, queue = next(global.queue, global.current_index)
        if not index then
            index, queue = next(global.queue, nil)
        end
        if index then
            if remote.interfaces[queue.interface] and remote.interfaces[queue.interface][queue.func_name] then
                remote.call(queue.interface, queue.func_name)
            else
                Interface.queue_remove(queue.interface, queue.func_name)
            end
            global.current_index = index
        end
    end
end

--Add a mod to the queue. Initializes the queue system if it isn't running. A mod calls remote.call and provides a table with name and f_name parameters, and it is stored in a global array.
--@tparam name The name of the calling mod
--@tparam f_name The name of the function assigned to the interface in the remote mod
Interface['queue_add'] = function(interface, func_name)
    if not global.queue then
        global.queue = {}
        Event.register(defines.events.on_tick, queue_tick)
    end
    global.queue[interface .. '_' .. func_name] = {interface = interface, func_name = func_name}
    return true
end

--Remove a mod from the queue. Searches for the relevant mod by the provided name from the remote.call and removes the entry from the queue. Also makes sure index stays within bounds. Also unregisters the on_tick handler if the queue is empty.
--@tparam name The name of the calling mod
Interface['queue_remove'] = function(interface, func_name)
    if global.queue then
        global.queue[interface .. '_' .. func_name] = nil
        global.current_index = nil
        if not next(global.queue) then -- Check if queue is empty
            global.queue = nil
            Event.remove(defines.events.on_tick, queue_tick) -- Unregister event handler if empty
        end
        return true
    end
    return false
end

local function on_load()
    if global.queue then
        Event.register(defines.events.on_tick, queue_tick)
    end
end
Event.on_load(on_load)
