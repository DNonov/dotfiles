" Disable ALE for all python files
:ALEDisable

" Django make migrations
nnoremap <leader>dmm :! python3.7 manage.py makemigrations<CR>

" Django migrate
nnoremap <leader>dm :! python3.7 manage.py migrate<CR>

" Django migrate
nnoremap <leader>dcs :! python3.7 manage.py collectstatic<CR>

" Django test
nnoremap <leader>dt :! python3.7 manage.py test<CR>
