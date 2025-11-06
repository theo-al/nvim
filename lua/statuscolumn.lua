if vim.fn.exists('+statuscolumn') == 0 then return end

local fold = function() return "%C" end
local sign = function() return "%s" end

local right = function() return "%="  end
local left  = function() return "%-=" end

local v = vim.v
local absolute_number = function() return v.lnum    end
local relative_number = function() return v.relnum  end
local virtual_number  = function() return v.virtnum end

local number = function()
    local abs = absolute_number()
    local rel = relative_number()
    local vir = virtual_number()
    if vir ~= 0 then return "" end
    if rel ~= 0 then return rel
                else return left()..abs..right()
    end
end

function render_statuscol()
    vim.api.nvim_set_hl(0, "NONE", { fg = "NONE" });
    local text = table.concat({
        fold(),
        right(),
        number(),
        " ",
        sign(),
    })
    return text
end

vim.o.statuscolumn="%!v:lua.render_statuscol()"

vim.api.nvim_create_autocmd("TermOpen", {
    group = "TermFixes",
    callback = function() vim.wo.statuscolumn = "" end,
})
