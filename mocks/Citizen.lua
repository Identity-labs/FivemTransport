local events = {}
local netEvents = {}
local serverEvents = {}
_G['source'] = 1

function RegisterNetEvent(name)
  netEvents[name] = true
end
function RegisterServerEvent(name)
  serverEvents[name] = true
end
function AddEventHandler(name, cb)
  events[name] = cb
end
function TriggerClientEvent(name, source, ...)
  if netEvents[name] and events[name] then
    events[name](...)
  end
end
function TriggerServerEvent(name, ...)
  if serverEvents[name] and events[name] then
    events[name](...)
  end
end

function GetGameTimer()
  return os.time()
end