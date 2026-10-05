vim.api.nvim_create_user_command('Makexec', function()
  vim.cmd("!chmod +x %")
end, { desc = 'Make a bash file executable' })

vim.api.nvim_create_user_command('Cfg', function()
  vim.cmd("cd ~/.config/nvim")
  vim.cmd("e .")
end, {})


local execution_commands = {
  sh = "!%",
  node = '!node "%"',
  python = "!python3 %",
  javascript = "!node %",
}

vim.api.nvim_create_user_command('Run', function()
  local buffer_type = vim.bo.filetype
  if execution_commands[buffer_type] ~= nil then
    vim.cmd(execution_commands[buffer_type])
  end
end, { desc = "execute current buffer" })


vim.api.nvim_create_user_command('Cmd', function()
  vim.cmd("Telescope commands")
end, { desc = "Shows user commands" })
