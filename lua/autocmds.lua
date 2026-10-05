require "nvchad.autocmds"

--reset configs when saving config file
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { 'init.lua', 'lua/config/**/*.lua' },
  callback = function(args)
    vim.cmd('source ' .. args.file)
    print('Reloaded ' .. args.file)
  end,
})

--place cursor where i were before closing
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

--highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

--auto create parent folde when creating file
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(event)
    local dir = vim.fn.fnamemodify(event.file, ':p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

--disable auto comment on new line
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

--rainbow parens
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'python', 'json', 'markdown' },
  callback = function()
    vim.wo.colorcolumn = '80'
  end,
})
--
-- --close neotree if no file is open
-- vim.api.nvim_create_autocmd('BufEnter', {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 then
--       local buf = vim.api.nvim_get_current_buf()
--       local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
--       if ft == 'neo-tree' then
--         vim.cmd 'quit'
--       end
--     end
--   end,
-- })
--


--equalize buffer size

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufWinLeave', 'VimResized' }, {
  group = vim.api.nvim_create_augroup('WindowManagement', { clear = true }),
  callback = function()
    vim.cmd 'wincmd =' -- Equalize window sizes
  end,
  desc = 'Auto-equalize window sizes on relevant events',
})


--set wezterm padding to 0
local autocmd = vim.api.nvim_create_autocmd

