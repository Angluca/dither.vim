#### Vim plugin for dither language
https://github.com/LingDong-/dither-lang  

Install using [vim-plug](https://github.com/junegunn/vim-plug) and [clangd](https://github.com/clangd/clangd/releases)
```vim
Plug 'angluca/dither.vim'

" set $DITHER_ROOT to vimrc or .zshrc
au FileType dither let $DITHER_ROOT = ~/path/to/dither-lang
```
Set lsp if you want
```vim
Plug 'yegappan/lsp'

setl omnifunc=LspOmniFunc
au filetype dither call LspAddServer([#{
            \    name: 'dither',
            \    filetype: ['dither'],
            \    path: 'clangd',
            \    args: ['--background-index']
            \  }])
```

quickly run use `:make`

