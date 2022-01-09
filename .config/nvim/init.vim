"set termguicolors
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
" Longer update time (default is 4)
set updatetime=50
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>
"See invisible characters
set list listchars=tab:>\ ,trail:+,eol:$

"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]

" Tree-sitter based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Vim-plug
call plug#begin('~/.vim/plugged')

"Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'arcticicestudio/nord-vim'
"Plug 'gruvbox-community/gruvbox'
"Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'

" LSP and Autocompletes
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

call plug#end()

" Colorscheme
colorscheme nord

" Keymaps
let mapleader = " "
nnoremap <leader>p :lua require('telescope.builtin').grep_string({ serch = vim.fn.input("Grep For > ")})<CR>

" Plugin config
lua << EOF

require("bufferline").setup{}
require("lualine").setup()
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",

  highlight = {
    enable = true,
    custom_captures = {
      ["foo.bar"] = "Identifier",
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  },

  rainbow = {
    enable = true,
    extended_mode = true, 
    max_file_lines = nil,
  },

  autotag = {
    enable = true,
  }
}

EOF
