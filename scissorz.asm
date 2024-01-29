.data
draw_message DB 'This game is a draw$'
user_win DB 'Congratulations you have won$'
draw_message DB 'I am sorry you have lost$'

.code

main:
    li  $a0, 1
    li  $a1, 2

    move	$k0, $a0
    move	$k1, $a1  

    sub    $k3, $k0 ,$k1

    blt    $k3, 0, abs

    beq    $k3, 0, draw 

    beq    $k3, 2, rock_scissor

    beq    $k3, 1, draw

    j      wrong_input

abs:
    mult    $k3, -1
    mflo    $k3
    j       main_end

draw:
    la     $v0, 0

    j       final

rock_scissor:
    beq    $k0, 0, user_win
    j      cpu_win

paper_chosen:
    beq    $k0, 0, cpu_win
    beq    $k0, 2, user_win
    beq    $k1, 0, user_win
    j      cpu_win

user_win:
    la     $v0, 1
    j      final

cpu_win:
    la     $v0, -1
    j      final

final:


wrong_input:
