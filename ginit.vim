if exists('g:GuiLoaded')
    GuiPopupmenu 0
    GuiTabline 0
   silent! set  guifont=JetBrains\ Mono:h14
    " GuiFont! Consolas:h14
    inoremap <silent>  <S-Insert>  <C-R>+
    cmap <S-Insert>  <C-R>+

endif
