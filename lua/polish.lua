-- Machine-specific settings are optional and deliberately excluded from Git.
-- Copy lua/local.example.lua to lua/local.lua on a machine that needs them.
local local_config = vim.fn.stdpath "config" .. "/lua/local.lua"
if (vim.uv or vim.loop).fs_stat(local_config) then require "local" end
