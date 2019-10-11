local http = require("httplib")

local function log_with_newlines(str)
    local index = 1

    while true do
        local newline = string.find(str, '\n', index, true)
       
        if newline == nil then
            client.log(string.sub(str, index))
            break
        end

        local sub = string.sub(str, index, newline-1)
        index = newline+1

        client.log(sub)
    end
end

local function callback(body)
    client.log("[HTTP-Callback] Body length: "..string.len(body))
    client.log("[HTTP-Callback] Body: ")
    log_with_newlines(body)
end

http.get("https://httpbin.org/get", callback)
http.post("https://httpbin.org/post", { a = "b", c = "d" }, callback)
