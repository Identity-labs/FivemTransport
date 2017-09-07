local TC = {}
_G["Server"] = TC
local wait = {}
local uniqId = 0

TC.Get = function(name, ...)
  local currentId = uniqId
  local args = {...}
  uniqId = uniqId + 1
  local p = promise.new()
  wait[name .. currentId] = {
    p = p,
    r = GetGameTimer()
  }
  TriggerServerEvent("ProxyServer:Get", name, currentId, args)
  return p
end

RegisterNetEvent("ProxyClient:Response")
AddEventHandler("ProxyClient:Response", function(name, currentId, response)
  if wait[name .. currentId] ~= nil then
    wait[name .. currentId].p:resolve(response)
    wait[name .. currentId] = nil
  end
end) 