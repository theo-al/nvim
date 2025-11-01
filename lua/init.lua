require "remap"
require "statuscolumn"

if vim.fn.exists('+winborder') == 1 then
    vim.o.winborder = "double"
end
