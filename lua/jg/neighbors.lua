local M = {}
local l = {}

function M.setup()
  local cmds = {
    E = 'edit',
    T = 'tabedit',
    V = 'vsplit',
    X = 'split',
  }

  local actions = {
    src = '{ext}',
    test = 'test.{ext}',
    js = 'js',
    css = 'css',
  }

  for key, cmd in pairs(cmds) do
    for action, ext in pairs(actions) do
      vim.api.nvim_add_user_command(key .. action, l.cmd(ext, cmd), {})
    end
  end
end

function M.open(ext, cmd)
  cmd = cmd or 'edit'
  ext = vim.fn.substitute(ext, '\\v\\{ext\\}', vim.fn.expand('%:e'), '')

  local fname = vim.fn.substitute(vim.fn.expand('%:r'), '\\v[._]tests?', '', '')
  local sep = ext == 'test.go' and '_' or '.'

  vim.cmd(cmd .. ' ' .. fname .. sep .. ext)
end

function l.cmd(ext, cmd)
  return function()
    M.open(ext, cmd)
  end
end

return M
