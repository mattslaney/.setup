-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_create_autocmd({"InsertEnter"}, {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "#241616" })
    end
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "#181616" } )
    end
})
