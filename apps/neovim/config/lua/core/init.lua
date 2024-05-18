require("core.set")
require("core.remap")
require("core.lazy")

--[[
-- Load flake config if it exists
--]]
local ok, _ = pcall(require, 'flake.init')
if ok then
    print("Loaded flake config")
end

