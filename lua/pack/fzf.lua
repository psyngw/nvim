local G = require('G')
local M = {}

function M.config()
  G.g.fzf_preview_window = { 'right:50%', 'ctrl-/' }
  G.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
  G.g.fzf_layout = {
    window = {
      width = 0.9,
      height = 0.8
    }
  }
  G.cmd("com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}), <bang>0)")
  G.cmd("com! CHistory call CHistory()")
  G.cmd([[
    func! CHistory()
      call filter(v:oldfiles, "v:val =~ '^' . $PWD . '.*$'")
      call fzf#vim#history(fzf#vim#with_preview(), 0)
    endf
    ]])
  G.cmd([[
      set rtp+=~/.fzf
      set rtp+=/usr/bin/fzf
      set rtp+=/usr/local/opt/fzf
    ]])
  G.map({
    { 'n', '<LEADER>fr', ':Ag<cr>', { silent = true, noremap = true } },
    { 'n', '<LEADER>ff', ':Files<cr>', { silent = false, noremap = true } },
    { 'n', '<LEADER>fs', ':BLines<cr>', { silent = true, noremap = true } },
    { 'n', '<LEADER>fg', ':GFiles?<cr>', { silent = true, noremap = true } },
    { 'n', '<LEADER>fh', ':CHistory<cr>', { silent = true, noremap = true } },
    { 'n', '<LEADER>fb', ':Buffers<cr>', { silent = true, noremap = true } },
  })
end

function M.setup()
  -- do nothing
end

return M
