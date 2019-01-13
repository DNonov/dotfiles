" Disable ALE for all python files
:ALEDisable

" Django make migrations
nnoremap <leader>jm :! python3.7 manage.py makemigrations<CR>

" Django migrate
nnoremap <leader>jmi :! python3.7 manage.py migrate<CR>

" Django test
nnoremap <leader>jt :! python3.7 manage.py test<CR>
