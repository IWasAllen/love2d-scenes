local M = {}
M.path = nil

function M:change(path)
    if M.currentpath ~= nil then
        -- Unload the previous scene to save memory --
        package.loaded[M.currentpath] = nil
        collectgarbage()
    end

    M.currentpath = M.path .. "/" .. path
    M.current = require(M.currentpath)
    if M.current.load then M.current.load() end
end

return M
