%define esca 27
%define arrowUp 48h
%define arrowDown 50h

section .data
    charBuffer db 'X'

section .text

    readKeyboard:
        ; Read next key in buffer:
        xor ax, ax
        int 16h

        ; Overwrite the first char in 'charDump' with received char:
        mov [charBuffer] ,al

        call charComp
        
        ret

    charComp:
        ; Compare the red char with ESCAPE (ASCII #27)
        cmp byte [charBuffer], esca
        je exit

        ; Compare the red char with ARROW UP (ASCII #38)
        cmp byte [charBuffer], arrowDown
        je exit
        
        call moveUp
        skipMoveUp:

        ret
