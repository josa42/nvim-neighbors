local M = {}

function M.setup()
  vim.cmd("command! Ejs   lua require('jg.neighbors').open('js')")
  vim.cmd("command! Etest lua require('jg.neighbors').open('test.js')")
  vim.cmd("command! Ecss  lua require('jg.neighbors').open('css')")
  vim.cmd("command! Tjs   lua require('jg.neighbors').open('js',      'tabedit')")
  vim.cmd("command! Ttest lua require('jg.neighbors').open('test.js', 'tabedit')")
  vim.cmd("command! Tcss  lua require('jg.neighbors').open('css',     'tabedit')")
  vim.cmd("command! Vjs   lua require('jg.neighbors').open('js',      'vsplit')")
  vim.cmd("command! Vtest lua require('jg.neighbors').open('test.js', 'vsplit')")
  vim.cmd("command! Vcss  lua require('jg.neighbors').open('css',     'vsplit')")
end

function M.open(ext, cmd)
  cmd = cmd or 'edit'
  local fname = vim.fn.substitute(vim.fn.expand('%:r'), '\\v\\.tests?', '', '')
  vim.cmd(cmd .. ' ' .. fname .. '.' .. ext)
end

return M
