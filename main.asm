org 100h

section .data
    ball db 0x00, 0x00, 0x0f, 0x0f, 0x0f, 0x0f, 0x00, 0x00
        db 0x00, 0x0f, 0x03, 0x03, 0x03, 0x03, 0x0f, 0x00
        db 0x0f, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x0f
        db 0x0f, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x0f
        db 0x0f, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x0f
        db 0x0f, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x0f
        db 0x00, 0x0f, 0x03, 0x03, 0x03, 0x03, 0x0f, 0x00
        db 0x00, 0x00, 0x0f, 0x0f, 0x0f, 0x0f, 0x00, 0x00
        
    xPos dw 0h ; x position of the ball
    yPos dw 0h ; y position of the ball

section .text
    main:
        mov ah, 00h ; set video mode requirement
        mov al, 13h ; set video mode option o 320 x 200 256 colors
        int 10h

        mov si, ball
        ; set start x position of the ball
        mov [xPos], word 160
        ; set start y position of the ball
        add ax, 320*96
        add ax, [xPos]
        mov [xPos], ax
        sub [xPos], byte 16
        ; main loop
        call clearScreen
        mov bx, 0
        .gameLoop:
           call clearScreen
            mov di, [xPos]
            call drawBall
            mov cx, 0xffff
            .waitloop: 
                loop .waitloop
            call moveUp
            inc bx
            cmp bx, 50
            jne .gameLoop
            

        ;reset the keyboard buffer and then wait for a keypress :
        mov ax, 0C01h ; 
        int 21h

        ;dos box default video mode
        mov ax, 03h 
        int 21h
        int 20h ;quit

    ; wait function
    waitFunction:
        mov cx, 0xffff
        .waitLoop:
            loop .waitLoop
        ret

    clearScreen:
        mov ax, 0xA000
        mov es, ax
        mov di, 0
        mov cx, 200*320
        rep stosb
        ret

    drawBall:
        mov ax, 0xA000
        mov es, ax
        mov dx, 8
        .eachLine:
            mov cx, 8
            rep movsb
            add di, 320-8
            dec dx
            jnz .eachLine
        ret
    
    moveUp:
        sub [xPos], word 320
        ret