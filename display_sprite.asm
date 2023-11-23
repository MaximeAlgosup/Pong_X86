section .data
     ball db 0x00, 0x00, 0x28, 0x28, 0x28, 0x28, 0x00, 0x00
          db 0x00, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x00
          db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
          db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
          db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
          db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
          db 0x00, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x00
          db 0x00, 0x00, 0x28, 0x28, 0x28, 0x28, 0x00, 0x00

     blackBall db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

     xPos dw 160
     yPos dw 80

     lastXPos dw 0
     lastYPos dw 0

section .text
     displaySprite:
          ; erase last sprite
          mov di, [lastXPos]
          mov si, blackBall
          call drawBall
          ; draw new sprite
          mov si, ball
          mov di, [xPos]
          call drawBall

          ; save current position as last position
          mov [lastXPos], di

          ; move sprite
          mov ax, [xPos]
          add ax, 1
          mov [xPos], ax
          
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

