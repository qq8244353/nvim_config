local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        -- null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.clang_format.with({
        --     args = {"--style", "{ IndentWidth: 4 }"}
        -- }),
        null_ls.builtins.formatting.lua_format
        -- null_ls.builtins.code_actions.gomodifytags,
        -- null_ls.builtins.formatting.astyle.with({
        --     extra_args = {
        --         "--style=google", "--pad-oper", "--add-one-line-braces",
        --         "--pad-header", "--pad-comma"
        --     }
        -- })
        -- null_ls.builtins.diagnostics.golangci_lint,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use this instead
                    vim.lsp.buf.format({bufnr = bufnr})
                    -- vim.lsp.buf.formatting_sync()
                end
            })
        end
        if client.server_capabilities.documentHighlightProvider then
            vim.api
                .nvim_create_augroup("lsp_document_highlight", {clear = true})
            vim.api.nvim_clear_autocmds {
                buffer = bufnr,
                group = "lsp_document_highlight"
            }
            vim.api.nvim_create_autocmd("CursorHold", {
                callback = vim.lsp.buf.document_highlight,
                buffer = bufnr,
                group = "lsp_document_highlight",
                desc = "Document Highlight"
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
                callback = vim.lsp.buf.clear_references,
                buffer = bufnr,
                group = "lsp_document_highlight",
                desc = "Clear All the References"
            })
        end
    end
})
