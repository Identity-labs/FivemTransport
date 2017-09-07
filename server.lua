local TS = {}
_G["Client"] = TS
local callbacks = {}
local uniqId = 0

TS.Callback = function(name, cb)
  callbacks[name] = cb
end

RegisterServerEvent("ProxyServer:Get")
AddEventHandler("ProxyServer:Get", function(name, currentId, args)
  local Source = source
  if callbacks[name] then
    args = args or {}
    callbacks[name](table.unpack(args)):next(function(response)
      TriggerClientEvent("ProxyClient:Response", Source, name, currentId, response)
    end)
  end
end) 