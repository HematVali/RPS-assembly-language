.data
draw_message:   .asciiz "This game is a draw"
user_win_message:       .asciiz "Congratulations, you have won"
lose_message:   .asciiz "I am sorry, you have lost"

.text

main:

    li  $a0, 1
    li  $a1, 2


    move    $t0, $a0
    move    $t1, $a1   

    sub     $t2, $t0, $t1

    li     $t7, 0
    blt    $t2, $t7, absoluteVal

end:
    li $t7 0
    beq    $t2, $t7, draw 

    li     $t7, 2
    beq    $t2, $t7, rock_scissor

    li     $t7, 1
    beq    $t2, $t7, draw

    j      wrong_input

absoluteVal:

    li   $t7, -1
    mult $t2, $t7
    mflo $t2

    j       end

draw:
    li $t6 100
    li     $v0, 10
    syscall


rock_scissor:

    beq    $t0, 0, user_win
    j      cpu_win

paper_chosen:

    beq    $t0, 0, cpu_win
    beq    $t0, 2, user_win
    beq    $t1, 0, user_win
    j      cpu_win

user_win:
    li $t6 1
    li $v0 10
    syscall
    

cpu_win:
    li $t6 -1
    li $v0 10
    syscall

final:
    li $v0 10
    syscall

wrong_input:
    li $v0 10
    syscall
