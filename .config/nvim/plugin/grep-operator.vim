nnoremap <leader>st :source %<cr>
nnoremap <leader>cN :cprevious<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cc :ccl<cr>

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>
inoremap <c-j> <esc><right>:call <SID>PrintCompletionHint()<cr>

function! s:PrintCompletionHint()
    let saved_unamed_registor = @@
    normal! yba
	echo @@
	let @@ = saved_unamed_registor
endfunction

function! s:GrepOperator(type)
    let saved_unamed_registor = @@
	if      a:type ==# 'v'
		" echom visual mode
		normal! `<v`>y
	elseif  a:type ==# 'char'
		" echom normal mode
		normal! `[v`]y
	else
		return
	endif
    echom "searching for this pattern: " . @@	
	silent execute "grep! -R " . shellescape(@@) . " ."
    let @@ = saved_unamed_registor
	copen
endfunction
