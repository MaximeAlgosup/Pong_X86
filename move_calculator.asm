%define SCREENW 320
%define SCREENH 200
section .data
    xSpeed dw 8
    ySpeed dw 4

    tmpXPos dw 0
    tmpYPos dw 0

section .text
    moveBall:
        ;Simulate next ball position
        mov bx, [xPos]
        add bx, [xSpeed]

        mov cx, [yPos]
        add cx, [ySpeed]

        ; Check if ball collided with the r wall
        cmp bx, SCREENW-8
        jge ChangeXDir

        ; Check if ball collided with the l wall
        cmp bx, 0
        jle ChangeXDir

        mov [xPos], bx
        skipx:
        ; Check if ball collided with the bottom wall
        cmp cx, SCREENH-8
        jge ChangeYDir

        ; Check if ball collided with the top wall
        cmp cx, 0
        jle ChangeYDir

        mov [yPos], cx
        skipy:
            call setAbsPosition
            ret


    ; Change the direction of the ball on x axis
    ChangeXDir:
        mov dx, [xSpeed]
        imul dx, -1
        mov [xSpeed], dx
        jmp skipx

    ; Change the direction of the ball on y axis
    ChangeYDir:
        mov dx, [ySpeed]
        imul dx, -1
        mov [ySpeed], dx
        jmp skipy

    ; Set the absolute position of the ball (absolut in video memory)
    setAbsPosition:
        mov ax, [yPos]
        mov cx, SCREENW
        mul cx, 
        add ax, [xPos]
        mov [absPos], ax
        ret