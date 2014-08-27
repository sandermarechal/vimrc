" Search class/function definition
:nmap gx yiw/\(class\<bar>function\)\s\+<C-R>"<CR>

" Show PHP function signature
inoremap <buffer> <C-S> <ESC>:!grep '^ \?\w\+ <C-R>=expand("<cword>")<CR>(' <C-R>=globpath(&rtp, 'php-funcsummary.txt')<CR><CR>
nnoremap <buffer> <C-S> :!grep '^ \?\w\+ <C-R>=expand("<cword>")<CR>(' <C-R>=globpath(&rtp, 'php-funcsummary.txt')<CR><CR>

" Map <CTRL>-a to alignment function
vnoremap <buffer> <C-a> :call PhpAlign()<CR>
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" Map ; to add ; to the end of the line, when missing
noremap <buffer> ; :s/\([^;]\)$/\1;/<cr>

" Omnicompletion
au FileType php set omnifunc=phpcomplete#CompletePHP

" Tag jumping
nnoremap <silent> <buffer> <C-]> :<C-u>call phpcomplete#JumpToDefinition('normal')<CR>
nnoremap <silent> <buffer> <C-W><C-]> :<C-u>call phpcomplete#JumpToDefinition('split')<CR>

" {{{ Alignment

func! PhpAlign() range
    let l:paste = &g:paste
    let &g:paste = 0

    let l:line        = a:firstline
    let l:endline     = a:lastline
    let l:maxlength = 0
    while l:line <= l:endline
                " Skip comment lines
                if getline (l:line) =~ '^\s*\/\/.*$'
                        let l:line = l:line + 1
                        continue
                endif
                " \{-\} matches ungreed *
        let l:index = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\S\{0,1}=\S\{0,1\}\s.*$', '\1', "") 
        let l:indexlength = strlen (l:index)
        let l:maxlength = l:indexlength > l:maxlength ? l:indexlength : l:maxlength
        let l:line = l:line + 1
    endwhile
    
        let l:line = a:firstline
        let l:format = "%s%-" . l:maxlength . "s %s %s"
    
        while l:line <= l:endline
                if getline (l:line) =~ '^\s*\/\/.*$'
                        let l:line = l:line + 1
                        continue
                endif
        let l:linestart = substitute (getline (l:line), '^\(\s*\).*', '\1', "")
        let l:linekey   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\1', "")
        let l:linesep   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\2', "")
        let l:linevalue = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\3', "")

        let l:newline = printf (l:format, l:linestart, l:linekey, l:linesep, l:linevalue)
        call setline (l:line, l:newline)
        let l:line = l:line + 1
    endwhile
    let &g:paste = l:paste
endfunc

" }}} 

" {{{ Find namespace

func! PhpNamespace(suffix)
    let l:lnr = 0
    while l:lnr < line('$')
        let l:str = matchstr(getline(l:lnr), '^\s*namespace\s\+[^;]\+')
        if len(l:str)
            return substitute(l:str, '^\s*namespace\s\+', '', '') . a:suffix 
        endif
        let l:lnr = l:lnr + 1
    endwhile

    return ''
endfunc

" }}} 

" {{{ Convert path to namespace

let g:php_source_prefixes = ['src/main/php/', 'src/main/', 'src/', 'lib/']

func! PathToNamespace(path)
    let l:path = a:path
    for l:prefix in g:php_source_prefixes
        let l:offset = strridx(l:path, l:prefix)
        if l:offset > -1
            let l:path = strpart(l:path, l:offset + strlen(l:prefix))
            break
        endif
    endfor
    return substitute(l:path, '/', '\\', 'g')
endfunc

" }}} 
