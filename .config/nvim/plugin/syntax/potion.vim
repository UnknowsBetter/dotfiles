if exists("b:current_syntax")
		finish
endif

augroup potionSyntaxMakeup
		autocmd!
		autocmd FileType *.pn :syntax keyword potionKeyword to times loop while
		autocmd FileType *.pn :syntax keyword potionKeyword if elsif else
		autocmd FileType *.pn :syntax keyword potionKeyword class return
		autocmd FileType *.pn :syntax keyword potionFunction print join string
		autocmd FileType *.pn :syntax match potionComment '\v#.*$'

		autocmd FileType *.pn :syntax match potionOperator "\v\*"
		autocmd FileType *.pn :syntax match potionOperator "\v/"
		autocmd FileType *.pn :syntax match potionOperator "\v\+"
		autocmd FileType *.pn :syntax match potionOperator "\v-"
		autocmd FileType *.pn :syntax match potionOperator "\v\?"
		autocmd FileType *.pn :syntax match potionOperator "\v\*\="
		autocmd FileType *.pn :syntax match potionOperator "\v/\="
		autocmd FileType *.pn :syntax match potionOperator "\v\+\="
		autocmd FileType *.pn :syntax match potionOperator "\v-\="
augroup END

highlight link potionKeyword Keyword
highlight link potionFunction function
highlight link potionComment Comment
highlight link potionOperator Operator

echom "potion syntax"

let b:current_syntax = "potion"
