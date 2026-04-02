local M = {}

local function get_visual_items(panel)
  local line_start = vim.fn.line 'v'
  local line_end = vim.fn.line '.'
  if line_start > line_end then
    line_start, line_end = line_end, line_start
  end

  local items = {}
  for line = line_start, line_end do
    local comp = panel.components.comp:get_comp_on_line(line)
    local item
    if comp and comp.name == 'file' then
      item = comp.context
    elseif comp and comp.name == 'dir_name' then
      item = comp.parent.context
    end
    if item and item.path then
      table.insert(items, item)
    end
  end
  return items
end

local function exit_visual()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
end

function M.visual_toggle_stage()
  local lib = require 'diffview.lib'
  local view = lib.get_current_view()
  if not view then return end

  local items = get_visual_items(view.panel)
  local to_stage = {}
  local to_unstage = {}

  for _, item in ipairs(items) do
    if item.kind == 'working' or item.kind == 'conflicting' then
      table.insert(to_stage, item.path)
    elseif item.kind == 'staged' then
      table.insert(to_unstage, item.path)
    end
  end

  if #to_stage > 0 then view.adapter:add_files(to_stage) end
  if #to_unstage > 0 then view.adapter:reset_files(to_unstage) end

  exit_visual()
  view:update_files()
end

function M.visual_restore_entry()
  local lib = require 'diffview.lib'
  local view = lib.get_current_view()
  if not view then return end

  local RevType = require('diffview.vcs.rev').RevType
  if view.right.type ~= RevType.LOCAL then
    require('diffview.utils').err 'The right side of the diff is not local! Aborting file restoration.'
    return
  end

  local items = get_visual_items(view.panel)
  if #items == 0 then return end

  local commit
  if view.left.type ~= RevType.STAGE then
    commit = view.left.commit
  end

  local dv_utils = require 'diffview.utils'
  for _, item in ipairs(items) do
    local bufid = dv_utils.find_file_buffer(item.path)
    if bufid and vim.bo[bufid].modified then
      dv_utils.err(("File '%s' is open with unsaved changes! Skipping."):format(item.path))
    else
      require('diffview.vcs.utils').restore_file(view.adapter, item.path, item.kind, commit)
    end
  end

  exit_visual()
  view:update_files()
end

return M
