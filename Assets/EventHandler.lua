-- Define a global table to hold all events and their listeners
_EVENTS = {}

-- Function to create an event if it doesn't already exist
function createEvent(eventName)
    if not _EVENTS[eventName] then
        _EVENTS[eventName] = { listeners = {} }
    end
end

-- Function to fire an event, calling all registered listeners with the provided arguments
function fireEvent(eventName, ...)
    if _EVENTS[eventName] then
        for _, listener in ipairs(_EVENTS[eventName].listeners) do
            listener(...)
        end
    end
end

-- Function to connect a listener to an event
function connectEvent(eventName, listener)
    if not _EVENTS[eventName] then
        createEvent(eventName)
    end

    table.insert(_EVENTS[eventName].listeners, listener)
end