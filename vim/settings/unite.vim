" Unite
let g:unite_options_direction = 'belowright'
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <silent> <leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <leader>G :<C-u>UniteWithCursorWord grep:. -buffer-name=search-buffer<CR>
nnoremap <leader>t :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file_rec<cr>
nnoremap <leader>r :<C-u>Unite -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>u :<C-u>Unite -buffer-name=buffer  buffer<cr>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif
