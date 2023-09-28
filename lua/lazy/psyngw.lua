local G = require('G')
local M = {}

function M.config()
  G.map({
    { 'n', 's',  '<plug>(SubversiveSubstitute)',     { noremap = false } },
    { 'n', 'ss', '<plug>(SubversiveSubstituteLine)', {} },
  })
  -- G.g.rainbow_active = 1
  -- Auto pairs
  G.cmd([[
    let g:AutoPairsShortcutToggle = '<M-P>'
    let g:AutoPairsFlyMode = 1
  ]])
  -- Rainbow
  G.cmd([[
      let g:rainbow_active = 1
      let g:rainbow_conf = {
      \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \	'operators': '_,_',
      \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \	'separately': {
      \		'*': {},
      \		'tex': {
      \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \		},
      \		'lisp': {
      \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \		},
      \		'vim': {
      \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \		},
      \		'html': {
      \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \		},
      \		'css': 0,
      \		'nerdtree': 0,
      \	}
      \}
  ]])

  -- My config
  G.cmd('let g:handle_space_words_enable=0')
  G.cmd('source ~/.config/nvim/cursor.vim')
end

function M.setup()
  -- nothing
end

return M
