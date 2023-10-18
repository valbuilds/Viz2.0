
-- local socket = require("socket")
-- local server = assert(socket.bind("*", 51515))
-- local tcp = assert(socket.tcp())

-- print(socket._VERSION)
-- print(tcp)
-- --Get ip address
-- local ip, port = server:getsockname()

-- print("Connect to TCP " .. ip .. ":" .. port)

-- while 1 do

--  local client = server:accept()

--  local line, l2,l3 = client:receive()


--  print(line)
--   print(l2)
--    print(l3)


--  if line ~= nil then
--    love.thread.getChannel("tcpThreadData"):push(line)
--  end

-- end
