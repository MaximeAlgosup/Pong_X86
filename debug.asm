section .data
    passVar0 db 'Pass here 0 $'
    passVar1 db 'Pass here 1 $'
    passVar2 db 'Pass here 2 $'
    passVar3 db 'Pass here 3 $'
    passVar4 db 'Pass here 4 $'

section .text
    pass0:
        mov ah, 9
        mov dx, passVar0
        int 21h
        ret

    pass1:
        mov ah, 9
        mov dx, passVar1 
        int 21h
        ret

    pass2:
        mov ah, 9
        mov dx, passVar2 
        int 21h
        ret
    
    pass3:
        mov ah, 9
        mov dx, passVar3 
        int 21h
        ret

    pass4:
        mov ah, 9
        mov dx, passVar4 
        int 21h
        ret