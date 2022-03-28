local M = {}
local l = {}

function M.setup()
  local cmds = {
    E = 'edit',
    T = 'tabedit',
    V = 'vsplit',
  }

  local actions = {
    test = 'test.js',
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
  local fname = vim.fn.substitute(vim.fn.expand('%:r'), '\\v\\.tests?', '', '')
  vim.cmd(cmd .. ' ' .. fname .. '.' .. ext)
end

function l.cmd(ext, cmd)
  return function()
    M.open(ext, cmd)
  end
end

return M
