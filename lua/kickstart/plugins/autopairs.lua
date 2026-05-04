-- autopairs
-- https://github.com/windwp/nvim-autopairs
--
-- VSCode-like behavior: when you type an opening bracket/quote, the matching
-- closing one is inserted automatically and the cursor stays in the middle.
-- Pressing the same closer where one already exists "jumps over" it instead
-- of inserting a duplicate, and <BS> on an empty pair removes both sides.
--
-- Treesitter is consulted (`check_ts = true`) so we don't auto-pair inside
-- strings/comments where it would be annoying (e.g. typing an apostrophe in
-- an English comment). blink.cmp handles auto-inserting `()` after function
-- completions via its own `auto_brackets`, so no completion integration is
-- needed here.

---@module 'lazy'
---@type LazySpec
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    check_ts = true,
    -- Per-filetype lists of treesitter node types in which auto-pairing
    -- should be suppressed. If a filetype is absent, `check_ts` is a no-op
    -- for it (it falls back to the non-treesitter rules, which are still
    -- pretty good thanks to `ignored_next_char` and the built-in "no quote
    -- pair after a word char" rule).
    --
    -- Verify node names for a filetype with `:InspectTree` or `:Inspect`
    -- (cursor on the relevant token).
    ts_config = {
      lua = { 'string', 'source' },
      javascript = { 'string', 'template_string' },
      javascriptreact = { 'string', 'template_string' },
      typescript = { 'string', 'template_string' },
      tsx = { 'string', 'template_string' },
      python = { 'string' },
      go = { 'interpreted_string_literal', 'raw_string_literal' },
      bash = { 'string' },
      html = { 'attribute_value' },
      json = { 'string', 'string_content' },
      yaml = { 'string_scalar', 'block_scalar' },
      markdown = { 'code_span' },
    },
    disable_filetype = {
      'TelescopePrompt',
      'spectre_panel',
      'snacks_picker_input',
      'vim',
    },
    enable_check_bracket_line = true,
    ignored_next_char = "[%w%.%'%\"%`%$]",
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'", '`' },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      before_key = 'h',
      after_key = 'l',
      cursor_pos_before = true,
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      manual_position = true,
      highlight = 'Search',
      highlight_grey = 'Comment',
    },
  },
}
