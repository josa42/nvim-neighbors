local M = {}

-- TODO do not use config lib functions in plugins :-|
local command = require('jg.lib.command')

function M.setup()
  command.define('Ejs',   {}, function() M.open('js')      end)
  command.define('Etest', {}, function() M.open('test.js') end)
  command.define('Ecss',  {}, function() M.open('css')     end)
  command.define('Tjs',   {}, function() M.open('js',      'tabedit') end)
  command.define('Ttest', {}, function() M.open('test.js', 'tabedit') end)
  command.define('Tcss',  {}, function() M.open('css',     'tabedit') end)
  command.define('Vjs',   {}, function() M.open('js',      'vsplit')  end)
  command.define('Vtest', {}, function() M.open('test.js', 'vsplit')  end)
  command.define('Vcss',  {}, function() M.open('css',     'vsplit')  end)
end

function M.open(ext, cmd)
  cmd = cmd or 'edit'
  local fname = vim.fn.substitute(vim.fn.expand('%:r'), '\\v\\.tests?', '', '')
  vim.cmd(cmd .. ' ' .. fname .. '.' .. ext)
end

return M
