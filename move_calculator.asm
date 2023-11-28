%define SCREENW 320
%define SCREENH 200
section .data
    ballXSpeed dw 4
    ballYSpeed dw 2

    playerPadSpeed dw 2

section .text
    moveBall:
        ;Simulate next ball position
        mov bx, [ballXPos]
        add bx, [ballXSpeed]

        mov cx, [ballYPos]
        add cx, [ballYSpeed]

        ; Check if ball collided with the r wall
        cmp bx, SCREENW-8
        jge ChangeXDir

        ; Check if ball collided with the l wall
        cmp bx, 0
        jle ChangeXDir

        mov [ballXPos], bx
        skipx:
        ; Check if ball collided with the bottom wall
        cmp cx, SCREENH-8
        jge ChangeYDir

        ; Check if ball collided with the top wall
        cmp cx, 0
        jle ChangeYDir

        mov [ballYPos], cx
        skipy:
            call setBallAbsPosition
            ret


    ; Change the direction of the ball on x axis
    ChangeXDir:
        mov dx, [ballXSpeed]
        imul dx, -1
        mov [ballXSpeed], dx
        jmp skipx

    ; Change the direction of the ball on y axis
    ChangeYDir:
        mov dx, [ballYSpeed]
        imul dx, -1
        mov [ballYSpeed], dx
        jmp skipy

    ; Set the absolute position of the ball (absolut in video memory)
    setBallAbsPosition:
        mov ax, [ballYPos]
        mov cx, SCREENW
        mul cx, 
        add ax, [ballXPos]
        mov [ballAbsPos], ax
        ret

    ; Move up the player pad
    moveUp:
        mov ax, [playerPadYPos]
        sub ax, [playerPadSpeed]
        mov [playerPadYPos], ax
        ret

    ; Move down the player pad
    moveDown:
        mov ax, [playerPadYPos]
        add ax, [playerPadSpeed]
        mov [playerPadYPos], ax
        ret

    ; Set the absolute position of the player pad (absolut in video memory)
    setPlayerPadAbsPosition:
        mov ax, [playerPadYPos]
        mov cx, SCREENW
        mul cx, 
        mov [playerPadAbsPos], ax
        ret