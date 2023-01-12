local M = {} -- The module to export

M = {
    -- misc
    sign_error = "",
    sign_warn = "",
    sign_hint = "",
    sign_info = "",
}

-- Make it accessible everywhere
_G.globals = M
-- Export the module
return M
