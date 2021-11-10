local M = {}

function M.setup()
  vim.cmd("command! Ejs   lua require('jg.file-neightbors').open('js')")
  vim.cmd("command! Etest lua require('jg.file-neightbors').open('test.js')")
  vim.cmd("command! Ecss  lua require('jg.file-neightbors').open('css')")
  vim.cmd("command! Tjs   lua require('jg.file-neightbors').open('js',      'tabedit')")
  vim.cmd("command! Ttest lua require('jg.file-neightbors').open('test.js', 'tabedit')")
  vim.cmd("command! Tcss  lua require('jg.file-neightbors').open('css',     'tabedit')")
  vim.cmd("command! Vjs   lua require('jg.file-neightbors').open('js',      'vsplit')")
  vim.cmd("command! Vtest lua require('jg.file-neightbors').open('test.js', 'vsplit')")
  vim.cmd("command! Vcss  lua require('jg.file-neightbors').open('css',     'vsplit')")
end

function M.open(ext, cmd)
  cmd = cmd or 'edit'
  local fname = vim.fn.substitute(vim.fn.expand('%:r'), '\\v\\.tests?', '', '')
  vim.cmd(cmd .. ' ' .. fname .. '.' .. ext)
end

return M
