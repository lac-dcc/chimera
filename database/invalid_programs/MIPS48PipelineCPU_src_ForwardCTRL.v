`include "marco.h"
`include "opcode.h"

module ForwardCTRL(IR_D,IR_E,IR_M,IR_W,RSD,RTD,RSE,RTE,RTM);
    input  [`i32] IR_D;
    input  [`i32] IR_E;
    input  [`i32] IR_M;
    input  [`i32] IR_W;
    output [ 2:0] RSD,RTD;
    output [ 1:0] RSE,RTE;
    output        RTM;

    DECODE D(.IR(IR_D)),
           E(.IR(IR_E)),
           M(.IR(IR_M)),
           W(.IR(IR_W));

    assign RTM = M.st && W.ld           && IR_M[`rt] == IR_W[`rt] ? 1 :
                 M.st && W.cal_r_normal && IR_M[`rt] == IR_W[`rd] ? 1 :
                 M.st && W.cal_r_withSA && IR_M[`rt] == IR_W[`rd] ? 1 :
                 M.st && W.cal_i        && IR_M[`rt] == IR_W[`rt] ? 1 :
                 M.st && W.LUI          && IR_M[`rt] == IR_W[`rt] ? 1 :
                 M.st && W.jl           && IR_M[`rt] == IR_W[`rd] ? 1 :
                 M.st && W.move_r       && IR_M[`rt] == IR_W[`rd] ? 1 :
                                                                    0 ;
    assign RTEIR = E.cal_r || E.st;                                                               
    assign RTE = RTEIR && M.cal_r_normal && IR_E[`rt] == IR_M[`rd] ? 1 :
                 RTEIR && M.cal_r_withSA && IR_E[`rt] == IR_M[`rd] ? 1 :
                 RTEIR && M.cal_i        && IR_E[`rt] == IR_M[`rt] ? 1 :
                 RTEIR && M.LUI          && IR_E[`rt] == IR_M[`rt] ? 1 :
                 RTEIR && M.move_r       && IR_E[`rt] == IR_M[`rd] ? 1 :
                 RTEIR && M.jl           && IR_E[`rt] == IR_M[`rd] ? 2 :
                 RTEIR && W.ld           && IR_E[`rt] == IR_W[`rt] ? 3 :
                 RTEIR && W.cal_r_normal && IR_E[`rt] == IR_W[`rd] ? 3 :
                 RTEIR && W.cal_r_withSA && IR_E[`rt] == IR_W[`rd] ? 3 :
                 RTEIR && W.cal_i        && IR_E[`rt] == IR_W[`rt] ? 3 :
                 RTEIR && W.LUI          && IR_E[`rt] == IR_W[`rt] ? 3 :
                 RTEIR && W.jl           && IR_E[`rt] == IR_W[`rd] ? 3 :
                 RTEIR && W.move_r       && IR_E[`rt] == IR_W[`rd] ? 3 :
                                                                     0 ;
    assign RSEIR = E.ld || E.st || E.cal_r || E.cal_i;
    assign RSE = RSEIR && M.cal_r_normal && IR_E[`rs] == IR_M[`rd] ? 1 :
                 RSEIR && M.cal_r_withSA && IR_E[`rs] == IR_M[`rd] ? 1 :
                 RSEIR && M.cal_i        && IR_E[`rs] == IR_M[`rt] ? 1 :
                 RSEIR && M.LUI          && IR_E[`rs] == IR_M[`rt] ? 1 :
                 RSEIR && M.move_r       && IR_E[`rs] == IR_M[`rd] ? 1 :
                 RSEIR && M.jl           && IR_E[`rs] == IR_M[`rd] ? 2 :
                 RSEIR && W.ld           && IR_E[`rs] == IR_W[`rt] ? 3 :
                 RSEIR && W.cal_r_normal && IR_E[`rs] == IR_W[`rd] ? 3 :
                 RSEIR && W.cal_r_withSA && IR_E[`rs] == IR_W[`rd] ? 3 :
                 RSEIR && W.cal_i        && IR_E[`rs] == IR_W[`rt] ? 3 :
                 RSEIR && W.LUI          && IR_E[`rs] == IR_W[`rt] ? 3 :
                 RSEIR && W.jl           && IR_E[`rs] == IR_W[`rd] ? 3 :
                 RSEIR && W.move_r       && IR_E[`rs] == IR_W[`rd] ? 3 :
                                                                     0 ;

    assign RTD = D.b_type && E.jl           && IR_D[`rt] == IR_E[`rd] ? 1 :
                 D.b_type && M.cal_r_normal && IR_D[`rt] == IR_M[`rd] ? 2 :
                 D.b_type && M.cal_r_withSA && IR_D[`rt] == IR_M[`rd] ? 2 :
                 D.b_type && M.cal_i        && IR_D[`rt] == IR_M[`rt] ? 2 :
                 D.b_type && M.LUI          && IR_D[`rt] == IR_M[`rt] ? 2 :
                 D.b_type && M.move_r       && IR_D[`rt] == IR_M[`rd] ? 2 :
                 D.b_type && M.jl           && IR_D[`rt] == IR_M[`rd] ? 3 :
                 D.b_type && W.ld           && IR_D[`rt] == IR_W[`rt] ? 4 :
                 D.b_type && W.cal_r_normal && IR_D[`rt] == IR_W[`rd] ? 4 :
                 D.b_type && W.cal_r_withSA && IR_D[`rt] == IR_W[`rd] ? 4 :
                 D.b_type && W.cal_i        && IR_D[`rt] == IR_W[`rt] ? 4 :
                 D.b_type && W.LUI          && IR_D[`rt] == IR_W[`rt] ? 4 :
                 D.b_type && W.jl           && IR_D[`rt] == IR_W[`rd] ? 4 :
                 D.b_type && W.move_r       && IR_D[`rt] == IR_W[`rd] ? 4 :
                                                                        0 ;

    assign RSDIR = D.b_type || D.b_zero || D.JALR || D.JR;                                                         
    assign RSD = RSDIR && E.jl           && IR_D[`rs] == IR_E[`rd] ? 1 :
                 RSDIR && M.cal_r_normal && IR_D[`rs] == IR_M[`rd] ? 2 :
                 RSDIR && M.cal_r_withSA && IR_D[`rs] == IR_M[`rd] ? 2 :
                 RSDIR && M.cal_i        && IR_D[`rs] == IR_M[`rt] ? 2 :
                 RSDIR && M.LUI          && IR_D[`rs] == IR_M[`rt] ? 2 :
                 RSDIR && M.move_r       && IR_D[`rs] == IR_M[`rd] ? 2 :
                 RSDIR && M.jl           && IR_D[`rs] == IR_M[`rd] ? 3 :
                 RSDIR && W.ld           && IR_D[`rs] == IR_W[`rt] ? 4 :
                 RSDIR && W.cal_r_normal && IR_D[`rs] == IR_W[`rd] ? 4 :
                 RSDIR && W.cal_r_withSA && IR_D[`rs] == IR_W[`rd] ? 4 :
                 RSDIR && W.cal_i        && IR_D[`rs] == IR_W[`rt] ? 4 :
                 RSDIR && W.LUI          && IR_D[`rs] == IR_W[`rt] ? 4 :
                 RSDIR && W.jl           && IR_D[`rs] == IR_W[`rd] ? 4 :
                 RSDIR && W.move_r       && IR_D[`rs] == IR_W[`rd] ? 4 :
                                                                     0 ;

endmodule
