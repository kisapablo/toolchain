set clipboard+=unnamedplus
set number
set termguicolors
set ruler
set nowrap
set noshowmode
vmap <S-Tab> <gv
vmap <Tab> >gv
nmap <silent> cvi :TSHighlightCapturesUnderCursor<CR>
nmap <silent> = :horizontal split<CR>
nmap <silent> + :vertical split<CR>
nmap <silent> <M-Left> :tabprevious<CR>
nmap <silent> <M-Right> :tabnext<CR>

nmap <silent> <C-F8> :DapToggleBreakpoint<CR>

nmap <silent> <F7> :DapStepInto<CR>
nmap <silent> <F8> :DapStepOver<CR>
nmap <silent> <F9> :DapContinue<CR>
nmap <silent> <C-F9> :RustRun<CR>
nmap <silent> псс gcc

call plug#begin()

Plug 'f-person/auto-dark-mode.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'emakman/nvim-latex-previewer'

Plug 'aveplen/ruscmd.nvim'

"Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'kshenoy/vim-signature'

Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'neovim/nvim-lspconfig'
"Completion plugin 
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

Plug 'L3MON4D3/LuaSnip'

" Plug 'simrat39/rust-tools.nvim'
Plug 'mrcjkb/rustaceanvim'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/plenary.nvim'

Plug 'github/copilot.vim'

" Plug 'olimorris/codecompanion.nvim', { 'tag': 'v16.3.0' }
Plug 'rmagatti/auto-session'
" After installing, add this to your init.vim:

"colorscheme
"Plug 'doums/darcula'
"
" The colorscheme for nvim
"Plug 'tanvirtin/monokai.nvim' " Plug 'dylanaraps/wal.vim'
"
"Plug 'b0o/schemastore.nvim' 
"json schame store
"Plug 'xiantang/darcula-dark.nvim'
"Branch visualizer

Plug 'https://gitlab.com/itaranto/plantuml.nvim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'briones-gabriel/darcula-solid.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'pocco81/AutoSave.nvim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Database management plugins
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion' "Optional

" Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
Plug 'tpope/vim-sleuth'

Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

Plug 'f-person/git-blame.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" Plug 'saecki/crates.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'smartpde/telescope-recent-files'
Plug 'nvim-treesitter/nvim-treesitter', { 'do' : ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'sindrets/diffview.nvim'
Plug 'Hoffs/omnisharp-extended-lsp.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'saecki/crates.nvim'

Plug 'rust-sailfish/sailfish', { 'rtp': 'syntax/vim' }

Plug 'kenn7/vim-arsync'

" vim-arsync depedencies
Plug 'prabirshrestha/async.vim'


Plug 'nvim-treesitter/nvim-treesitter-context' 

call plug#end()

"Plugin configuration
set termguicolors
highlight rustLifetime guifg=#20999d
lua << EOF
require('go').setup()

local vim = vim

require('auto-dark-mode').setup({
set_dark_mode = function()
    vim.cmd("colorscheme darcula-solid-idea")
    end,
set_light_mode = function()
    vim.cmd("colorscheme zellner")
end,
update_interval = 3000,
fallback = "dark"
})
-- require("spellwarn").setup({
--     event = { -- event(s) to refresh diagnostics on
--         "CursorHold",
--         "InsertLeave",
--         "TextChanged",
--         "TextChangedI",
--         "TextChangedP",
--     },
--     enable = true, -- enable diagnostics on startup
--     ft_config = { -- spellcheck method: "cursor", "iter", or boolean
--         alpha   = false,
--         help    = false,
--         lazy    = false,
--         lspinfo = false,
--         mason   = false,
--     },
--     ft_default = true, -- default option for unspecified filetypes
--     max_file_size = nil, -- maximum file size to check in lines (nil for no limit)
--     severity = { -- severity for each spelling error type (false to disable diagnostics for that type)
--         spellbad   = "WARN",
--         spellcap   = "HINT",
--         spelllocal = "HINT",
--         spellrare  = "INFO",
--     },
--     prefix = "possible misspelling(s): ", -- prefix for each diagnostic message
--     diagnostic_opts = { severity_sort = true }, -- options for diagnostic display
-- })
-- vim.opt.spell = true
-- vim.opt.spelllang = {'en_us', 'en_gb', 'ru'}
    
vim.cmd("colorscheme darcula-solid-idea")

ts_context = require'treesitter-context'
ts_context.setup {
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  multiwindow = false, -- Enable multiwindow support.
  max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 10, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

require('Comment').setup()
vim.g.mapleader = ' '
local rainbow_delimiters = require 'rainbow-delimiters'

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}
vim.keymap.set("n", "<C-M-p>", [[<cmd>horizontal resize -2<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "cvd", [[<cmd>horizontal resize +2<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "<C-M-[>", [[<cmd>vertical resize -5<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "<C-M-]>", [[<cmd>vertical resize +5<cr>]]) -- make the window smaller horizontally by pressing shift and -
vim.keymap.set("n", "<TAB>", "<C-W><C-W>")

vim.keymap.set("n", "<M-5>", function()  
    -- local widgets = require('dapui')
    -- local sidebar = widgets.sidebar(widgets.scopes)
    -- sidebar.open()
    require("dapui").toggle()
end,
opts)

local is_debug_enabled = false
-- vim.keymap.set("n", "<S-F9>", function()
--         is_debug_enabled = not is_debug_enabled
--         vim.cmd (":RustLsp debuggables<CR>")
-- end,
-- opts)
vim.api.nvim_set_keymap('n', '<S-F9>', '', {noremap = true, silent = true, callback = function()
    -- Custom logic for debugging tests
    vim.cmd(':RustLsp debuggables')
    -- Additional custom logic here if needed
end})

vim.keymap.set("n", "<C-F2>", function()
        is_debug_enabled = false
        vim.cmd ("DapTerminate")
end,
opts)


-- nmap <silent> <S-F9> :RustDebuggables<CR>

require('lsp_config')
require("nvim-autopairs").setup {}
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
local state = 0 --not opened
local printer = function()
    if state == 0 then
        state = 1
        vim.cmd ("DiffviewOpen")
    else
        state = 0
        vim.cmd ("DiffviewClose")
    end
end

_git_history_state = 0
local git_history_printer = function()
    if _git_history_state == 0 then 
        _git_history_state = 1
        vim.cmd ("DiffviewFileHistory")
    else
        _git_history_state = 0
        vim.cmd ("DiffviewClose")
    end
end

vim.keymap.set('n', '<M-0>', printer)
vim.keymap.set('n', '<M-9>', git_history_printer)
local nvim_tree_attach = function(bufnr)
    local api = require "nvim-tree.api"
    
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true, 
        }
      end
    
vim.keymap.set('n', ' ',   api.tree.change_root_to_node,        opts('CD'))
vim.keymap.set('n', '<C-PageUp>', api.tree.change_root_to_parent,        opts('Up'))
      -- default mappings
api.config.mappings.default_on_attach(bufnr)
vim.keymap.del('n', '<Tab>', { buffer = bufnr })
      -- custom mappings
--       vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end
-- OR setup with some options
require("nvim-tree").setup({
  update_focused_file = {
        enable = true     
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = nvim_tree_attach
})

local function show_documentation()
    local filetype = vim.bo.filetype
    if filetype == "vim" or filetype == "help" then
        vim.cmd('h '..vim.fn.expand('<cword>'))
    elseif filetype == "man" then
        vim.cmd('Man '..vim.fn.expand('<cword>'))
    elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
        require('crates').show_popup()
    else
        vim.lsp.buf.hover()
    end
end

vim.keymap.set('n', 'K', show_documentation, { silent = true })

vim.keymap.set("n", "<S-F6>", function() vim.lsp.buf.rename() end, opts)

vim.keymap.set("n", "<C-M-l>", function() vim.lsp.buf.format() end, { desc = "Format buffer",  })
vim.keymap.set("n", "g]", function() vim.lsp.buf.implementation() end, { desc = "Go to implementation of chosen one", })
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition", })

vim.keymap.set("n", "<F2>", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "<S-F2>", function() vim.diagnostic.goto_prev() end, opts)

require("telescope").load_extension("recent_files")
local crates = require('crates')

vim.api.nvim_set_keymap("n", "<C-e>",
[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], 
{noremap = true, silent = true})

local builtin = require('telescope.builtin')
local workspace_symbols_opt = {
    symbols = {
       "interface",
       "class",
       "struct"
    }
}
--builtin.lsp_workspace_symbols(workspace_symbols_opt)
vim.keymap.set('n', '<C-F12>', builtin.lsp_document_symbols, {})
-- vim.keymap.set('n', 'cvi', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', 'cve', builtin.find_files, {})
vim.keymap.set('n', 'cvf', builtin.live_grep, {})
vim.keymap.set('n', 'cvq', builtin.quickfix, {})
vim.keymap.set('n', 'cvo', crates.show_features_popup, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})

vim.keymap.set('n', '<leader>ci', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>co', builtin.lsp_outgoing_calls, {})

vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
require('auto-save').setup({
    execution_message = {
            message = function()
                return ''
            end,
        }
})

require('dapui').setup({
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 10
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
})
--
-- vim.keymap.set("n", "<C-M-o>", function() vim.lsp.buf.format() end, { desc = "Remove unused import", })
-- vim.keymap.set(
-- 	{ "n", "o", "x" },
-- 	"w",
-- 	"<cmd>lua require('spider').motion('w')<CR>",
-- 	{ desc = "Spider-w" }
-- )
-- vim.keymap.set(
-- 	{ "n", "o", "x" },
-- 	"e",
-- 	"<cmd>lua require('spider').motion('e')<CR>",
-- 	{ desc = "Spider-e" }
-- )
-- vim.keymap.set(
-- 	{ "n", "o", "x" },
-- 	"b",
-- 	"<cmd>lua require('spider').motion('b')<CR>",
-- 	{ desc = "Spider-b" }
-- )
vim.api.nvim_create_autocmd('FileType', {
    pattern = "dts",
    callback = function (ev)
        vim.lsp.start({
            name = 'dts-lsp',
            cmd = {'dts-lsp'},
            root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1]),
        })
    end
})

vim.keymap.set("n", "c]", function()
  ts_context.go_to_context(vim.v.count1)
end, { silent = true })

require('ruscmd').setup{
}

vim.api.nvim_set_hl(0, 'LspInlayHint', {
  fg = '#7f7f7f', -- Light gray foreground (adjust to your theme)
  bg = 'NONE',     -- Transparent background
})


require('gitblame').setup()
require('plantuml').setup()
require('crates').setup {
    lsp = {
        enabled = true,
        on_attach = function(client, bufnr)
            -- the same on_attach function as for your other language servers
            -- can be ommited if you're using the `LspAttach` autocmd
        end,
        actions = true,
        completion = true,
        hover = true,
    },
}


vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
    ["*"] = true,
    -- ["markdown"] = false,
}

local function disable_copilot_without_vpn(service_name)
  -- Run systemctl to check service status
  local handle = io.popen("systemctl is-active --quiet " .. service_name .. " && echo 'active' || echo 'inactive'")
  if not handle then
    return
  end

  local result = handle:read("*a")
  handle:close()

  -- Trim whitespace from result
  result = result:gsub("%s+", "")

  if result == "inactive" then
    vim.notify(service_name .. " is not running, disabling Copilot for current buffer", vim.log.levels.INFO)
    vim.cmd('Copilot disable')
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    disable_copilot_without_vpn('wg-quick@wg0.service')
  end,
  desc = "Check systemd service status on Neovim startup",
})

vim.o.sessionoptions="blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_use_nerd_fonts = 1

local left_menu_mode = 'tree'
local is_left_menu_open = false

local code_action = function()
    if left_menu_mode == 'tree' then
        vim.lsp.buf.code_action()
    elseif left_menu_mode == 'db' then
        vim.api.nvim_input('\\<Plug>(DBUI_ExecuteQuery)')
    end
end

vim.keymap.set("n", "<M-CR>", code_action, opts)
vim.keymap.set("v", "<M-CR>", code_action, opts)


local toggle_db_view = function()
    local api = require("nvim-tree.api")

    if left_menu_mode == 'tree' then
        if api.tree.is_visible() then
            api.tree.close()
        end

        left_menu_mode = 'db'
        -- by default dbui will open left menu
        vim.cmd("DBUI")

        if not is_left_menu_open then
            vim.cmd("DBUIToggle")
        end
    elseif left_menu_mode == 'db' then
        vim.cmd("DBUIClose")
        if is_left_menu_open then
            api.tree.open()
        end

        left_menu_mode = 'tree'
    end
end 

local toggle_left_menu =  function()
    if left_menu_mode == 'tree' then
        local api = require("nvim-tree.api")
        if api.tree.is_visible() then
            api.tree.close()
        else
            api.tree.open()
        end
    elseif left_menu_mode == 'db' then
        vim.cmd("DBUIToggle")
    end
end

local function focus_left_menu()
    if left_menu_mode == 'tree' then
        local api = require("nvim-tree.api")
        is_left_menu_open = true
        if api.tree.is_visible() then
            api.tree.focus()
        else
            api.tree.open()
            api.tree.focus()
        end
    end
end

-- vim.keymap.set("n", "<F4>", [[<cmd>DBUI<cr>]])
vim.keymap.set("n", "<F4>", toggle_db_view, { desc = "Open DBUI" })

vim.keymap.set('n', '<M-1>', toggle_left_menu, { noremap = true, silent = true })
vim.keymap.set('n', '<M-F1>', focus_left_menu, { noremap = true, silent = true })

local function on_session_save() 
            require('nvim-tree.api').tree.close()

            is_left_menu_open = false
end

local function on_session_restore()
            local api = require "nvim-tree.api"
            -- Update NvimTree's root to the current working directory
            api.tree.change_root(vim.fn.getcwd())
            -- Optionally, find and focus the current buffer's file
            api.tree.find_file({ open = true, focus = true })

            is_left_menu_open = true
end

require('auto-session').setup({
    log_level = 'warn',
    auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '/' },
    -- post_restore_cmds = { 'NvimTreeOpen' }, -- Open NvimTree after restoring session
    -- pre_save_cmds = { 'NvimTreeClose' }, -- Close NvimTree before saving session
    post_restore_cmds = {
        function()
            on_session_restore()
        end,
    },
    pre_save_cmds = {
        -- Close NvimTree before saving to avoid session conflicts
        function()
            on_session_save()
        end,
    },
    cwd_change_handling = true,

    session_lens = {
      load_on_setup = true, -- Initialize on startup (requires Telescope)
      picker_opts = nil,
      -- Table passed to Telescope / Snacks to configure the picker. See below for more information
      -- mappings = {
      --   -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
      --   delete_session = { "i", "<C-D>" },
      --   alternate_session = { "i", "<C-S>" },
      --   copy_session = { "i", "<C-Y>" },
      -- },

      session_control = {
        control_dir = vim.fn.stdpath "data" .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
        control_filename = "session_control.json", -- File name of the session control file
      },
    },
})

vim.keymap.set('n', 'cvx', ':AutoSession search<CR>', {})

local function check_and_install_ls_emmet()
  -- Get g:plug_home (default: ~/.local/share/nvim/plugged for Neovim)
  local plug_home = vim.g.plug_home or vim.fn.stdpath('data') .. '/plugged'
  local ls_emmet_dir = plug_home .. '/ls_emmet'
  local ls_emmet_bin = ls_emmet_dir .. '/node_modules/.bin/ls_emmet'

  -- Check if ls_emmet binary exists
  if vim.fn.executable(ls_emmet_bin) == 0 then
    print("ls_emmet not found, installing in " .. ls_emmet_dir .. "...")
    -- Create directory if it doesn't exist
    vim.fn.mkdir(ls_emmet_dir, "p")
    -- Run npm install in the ls_emmet directory
    local result = vim.fn.system({"npm", "install", "ls_emmet", "--prefix", ls_emmet_dir})
    if vim.v.shell_error == 0 then
      print("ls_emmet installed successfully in " .. ls_emmet_dir)
    else
      vim.api.nvim_err_writeln("Failed to install ls_emmet. Error: " .. result ..
        "\nPlease run 'npm install ls_emmet --prefix " .. ls_emmet_dir .. "' manually.")
    end
  end

  return ls_emmet_bin
end

-- Run the check on Neovim startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    check_and_install_ls_emmet()
  end,
})


local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { check_and_install_ls_emmet(), '--stdio' };
      filetypes = {
        'html',
        'css',
        'scss',
        'javascriptreact',
        'typescriptreact',
        'haml',
        'xml',
        'xsl',
        'pug',
        'slim',
        'sass',
        'stylus',
        'less',
        'sss',
        'hbs',
        'handlebars',
      };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

lspconfig.ls_emmet.setup { capabilities = capabilities }

-- Function for search and replace with Telescope
local function telescope_search_replace()
  -- Prompt for the word to find
  local find = vim.fn.input("Find: ")
  if find == "" then return end

  -- Prompt for the replacement word
  local replace = vim.fn.input("Replace with: ")
  if replace == "" then return end

  -- Escape special characters for the substitute command
  local esc_find = vim.fn.escape(find, '/')
  local esc_replace = vim.fn.escape(replace, '/')

  -- Load Telescope modules
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  -- Open Telescope live_grep with prefilled search and custom mapping
  require("telescope.builtin").live_grep({
    default_text = find,
   attach_mappings = function(prompt_bufnr, map)
      map("i", "<M-CR>", function()
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selections = picker:get_multi_selection()

        -- If no selections, use all entries; otherwise, use selected entries
        if #selections == 0 then
          actions.send_to_qflist(prompt_bufnr)
        else
          -- Populate quickfix with only selected entries
          local qf_entries = {}
          for _, entry in ipairs(selections) do
            table.insert(qf_entries, {
              filename = entry.filename,
              lnum = entry.lnum,
              col = entry.col,
              text = entry.text,
            })
          end
          vim.fn.setqflist(qf_entries)
        end

        -- Close Telescope
        actions.close(prompt_bufnr)

        -- Execute the replacement across quickfix entries
        local command = string.format("cfdo %%s/%s/%s/g | update", esc_find, esc_replace)
        vim.cmd(command)
      end)
      -- Return true to preserve default Telescope mappings
      return true
    end,
  })
end

-- Set the keybinding for 'cvr' in normal mode
vim.keymap.set("n", "cvr", telescope_search_replace, { desc = "Search and replace across project" })

EOF

autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
