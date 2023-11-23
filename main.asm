org 100h

section .data
    ; Set clock to temporise the game loops
    base: equ 0xf9fe
    old_time: equ base+0x06

section .text
    main:
        call setVideoMode
        call clearScreen
        call gameLoop

        ; reset the keyboard buffer
        mov ax, 0C01h ; 
        int 21h

        ;dos box default video mode
        mov ax, 03h 
        int 21h
        ; End of the game
        int 20h
        
    ; Game loop
    gameLoop:
        ; Display the sprites
        call displaySprite

        ; Wait for the clock
        call waitClock
        ; Check if the game is over

        

        ; Read the keyboard
        jmp gameLoop
        ret


        
    waitClock:
        mov ax, 0000h
        int 1ah ; Read clock
        cmp dx, [old_time]
        je waitClock
        mov [old_time], dx
        ret

    setVideoMode:
       mov ah, 00h
       mov al, 13h
       int 10h 
       ret

    clearScreen:
        mov ax, 0xA000
        mov es, ax
        mov di, 0
        mov cx, 200*320
        rep stosb
        ret

    ; Import files to display sprites and read keyboard
    %include "display_sprite.asm"
    %include "keyboard_reader.asm"
    %include "debug.asm"