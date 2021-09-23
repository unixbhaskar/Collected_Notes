
setlocal iskeyword=@,48-57,_,192-255,#,-
syntax match sshknownhostpubkey "AAAA[0-9a-zA-Z+/]\+[=]\{0,2}"
highlight def link sshknownhostkey Special

syntax keyword sshalg ssh-rsa
hi def link sshalg  Identifier

syntax match sshknownhostip "\<\(\d\{1,3}\.\)\{3}\d\{1,3}\>"
hi def link sshknownhostip Constant