local G = require('G')
local M = {}

function M.config()
  G.g.coc_global_extensions = {
    'coc-json',
    'coc-html', 'coc-css',
    'coc-clangd',
    'coc-go',
    'coc-sumneko-lua',
    'coc-vimlsp',
    'coc-sh', 'coc-db',
    'coc-pyright',
    'coc-toml',
    'coc-prettier',
    'coc-snippets', 'coc-pairs', 'coc-word',
    'coc-translator',
  }
  G.cmd("command! -nargs=? Fold :call CocAction('fold', <f-args>)")
  G.cmd("hi! link CocPum Pmenu")
  G.cmd("hi! link CocMenuSel PmenuSel")
  function _G.show_docs()
    local cw = G.fn.expand('<cword>')
    if G.fn.index({ 'vim', 'help' }, G.bo.filetype) >= 0 then
      G.api.nvim_command('h ' .. cw)
    elseif G.api.nvim_eval('coc#rpc#ready()') then
      G.fn.CocActionAsync('doHover')
    else
      G.api.nvim_command('!' .. G.o.keywordprg .. ' ' .. cw)
    end
  end

  -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
  G.api.nvim_create_augroup("CocGroup", {})
  G.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
  })
  -- Update signature help on jump placeholder
  G.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
  })
  G.map({
    { 'i', '<a-w>', "<c-o>:call CocActionAsync('showSignatureHelp')<cr>", { noremap = true } },
    { 'n', '<a-w>', ":call CocActionAsync('doHover')<cr>", { silent = true } },
    { 'n', '<LEADER>y', ':<C-u>CocList -A --normal yank<cr>', { silent = true } },
    { 'n', '<F2>', '<Plug>(coc-rename)', { silent = true } },
    { 'n', 'gd', '<Plug>(coc-definition)', { silent = true } },
    { 'n', 'gy', '<Plug>(coc-type-definition)', { silent = true } },
    { 'n', 'gi', '<Plug>(coc-implementation)', { silent = true } },
    { 'n', 'gr', '<Plug>(coc-references)', { silent = true } },
    { 'n', 'tt', ':CocOutline<cr>', { silent = true } },
    { "i", "<c-j>", "<Plug>(coc-snippets-expand-jump)", {} },
    -- { 'x', 'if', '<Plug>(coc-funcobj-i)', {silent = true} },
    -- { 'o', 'if', '<Plug>(coc-funcobj-i)', {silent = true} },
    -- { 'x', 'af', '<Plug>(coc-funcobj-a)', {silent = true} },
    -- { 'o', 'af', '<Plug>(coc-funcobj-a)', {silent = true} },
    -- { 'x', 'ic', '<Plug>(coc-classobj-i)', {silent = true} },
    -- { 'o', 'ic', '<Plug>(coc-classobj-i)', {silent = true} },
    -- { 'x', 'ac', '<Plug>(coc-classobj-a)', {silent = true} },
    -- { 'o', 'ac', '<Plug>(coc-classobj-a)', {silent = true} },
    -- { 'n', 'K', ':call CocAction("doHover")<cr>', {silent = true} },
    -- {"n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true}},
    -- { 'i', '<c-f>', "coc#pum#visible() ? '<c-y>' : '<c-f>'", {silent = true, expr = true} },
    { 'i', '<TAB>',
      "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()",
      { silent = true, noremap = true, expr = true } },
    { 'i', '<s-tab>', "coc#pum#visible() ? coc#pum#prev(1) : \"\\<s-tab>\"",
      { silent = true, noremap = true, expr = true } },
    { 'i', '<cr>', "coc#pum#visible() ? coc#pum#confirm() : \"\\<c-g>u\\<cr>\\<c-r>=coc#on_enter()\\<cr>\"",
      { silent = true, noremap = true, expr = true } },
    -- { 'i', '<c-y>', "coc#pum#visible() ? coc#pum#confirm() : '<c-y>'", {silent = true, noremap = true, expr = true} },
    -- { 'n', '<F3>', ":silent CocRestart<cr>", {silent = true, noremap = true} },
    -- { 'n', '<F4>', "get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'", {silent = true, noremap = true, expr = true} },
    { 'n', '<F9>', ":CocCommand snippets.editSnippets<cr>", { silent = true, noremap = true } },
    -- { 'n', '<c-e>', ":CocList --auto-preview diagnostics<cr>", {silent = true} },
    { 'n', 'ts', "<Plug>(coc-translator-p)", { silent = true } },
    { 'v', 'ts', "<Plug>(coc-translator-pv)", { silent = true } },
    { 'n', '<LEADER>-', "<Plug>(coc-diagnostic-prev)", { silent = true } },
    { 'n', '<LEADER>=', "<Plug>(coc-diagnostic-next)", { silent = true } },
    -- { 'n', '(', "<Plug>(coc-git-prevchunk)", {silent = true} },
    -- { 'n', ')', "<Plug>(coc-git-nextchunk)", {silent = true} },
    -- { 'n', '\\g', ":call coc#config('git.addGBlameToVirtualText',  !get(g:coc_user_config, 'git.addGBlameToVirtualText', 0)) | call nvim_buf_clear_namespace(bufnr(), -1, line('.') - 1, line('.'))<cr>", {silent = true} },
    { 'x', '=', 'CocHasProvider("formatRange") ? "<Plug>(coc-format-selected)" : "="',
      { silent = true, noremap = true, expr = true } },
    { 'n', '=', 'CocHasProvider("formatRange") ? "<Plug>(coc-format-selected)" : "="',
      { silent = true, noremap = true, expr = true } },
  })
end

function M.setup()
  -- do nothing
end

return M
