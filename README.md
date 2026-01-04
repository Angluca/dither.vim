#### Vim plugin for dither language
https://github.com/LingDong-/dither-lang
```vim
Plug 'angluca/dither.vim'
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

