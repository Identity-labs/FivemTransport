package.path = package.path .. ";../?.lua"

require "mocks/Citizen"
require "mocks/deferred"
require "client"
require "server"

print("running")

-- Defined Server side
Client.Callback("test", function(p1, p2)
  print("p1: " .. p1)
  print("p2: " .. p2)
  
  local p = promise:new()
  p:resolve('fooo')
  return p
end)

-- Call Client side
Server.Get("test", "arg1", "arg2"):next(function(response)
  print(response)
end)