local previewers = require('telescope.previewers')

-- Don't preview large files
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    file_ignore_patterns = {
     "node_modules", "build", "dist", "yarn.lock", "^.git/"
   },
  },
}

require('telescope').load_extension('notify')
require('telescope').load_extension('projects')
require("telescope").load_extension("live_grep_args")
