`include "marco.h"
`include "opcode.h"

module DECODE(
    input [`i32] IR,
    output zero_extend,sign_extend,
           ld,st,cal_r,cal_r_normal,cal_r_MUL,cal_r_withSA,
           cal_i,LUI,b_type,b_zero,branch,J,JAL,JALR,JR,MFHI,MFLO,
           move_r,jump,jl,jr,ju
);

    assign ld = ((IR[`op] == `LB ) ||
                 (IR[`op] == `LBU) ||
                 (IR[`op] == `LH ) ||
                 (IR[`op] == `LHU) ||
                 (IR[`op] == `LW ));
   
    assign st = ((IR[`op] == `SB) ||
                 (IR[`op] == `SH) ||
                 (IR[`op] == `SW));

    assign cal_r_normal = ((IR[`op] == `R_type) && 
                           ((IR[`funct] == `ADD )||
                            (IR[`funct] == `ADDU)||
                            (IR[`funct] == `SUB )||
                            (IR[`funct] == `SUBU)||
                            (IR[`funct] == `SLLV)||
                            (IR[`funct] == `SRLV)||
                            (IR[`funct] == `SRAV)||
                            (IR[`funct] == `AND )||
                            (IR[`funct] == `OR  )||
                            (IR[`funct] == `XOR )||
                            (IR[`funct] == `NOR )||
                            (IR[`funct] == `SLT )||
                            (IR[`funct] == `SLTU)));
    assign cal_r_MUL    = ((IR[`op] == `R_type) && 
                           ((IR[`funct] == `MULT )||
                            (IR[`funct] == `MULTU)||
                            (IR[`funct] == `DIV  )||
                            (IR[`funct] == `DIVU)));
    assign cal_r_withSA = ((IR[`op] == `R_type) && 
                           ((IR[`funct] == `SLL)||
                            (IR[`funct] == `SRL)||
                            (IR[`funct] == `SRA)));
    
    assign cal_i  = ('h08<=IR[`op])&&(IR[`op]<='h0e);// THE ONLY ONE INEQUALITY
    
    assign LUI    = IR[`op] == `LUI;
//    assign LUI = IR[`op] == `LUI; hehehehehe huanlu
    assign b_type = ((IR[`op] == `BEQ ) ||
                     (IR[`op] == `BNQ ));

    assign b_zero = ((IR[`op] == `BLEZ) ||
                     (IR[`op] == `BGTZ) ||
                     (IR[`op] == `BLTZ) ||
                     (IR[`op] == `BGEZ));
    
    assign J      = (IR[`op] == `J);
    assign JAL    = (IR[`op] == `JAL);
    assign JALR   = ((IR[`op] == `R_type) && (IR[`funct] == `JALR));
    assign JR     = ((IR[`op] == `R_type) && (IR[`funct] == `JR  ));

    assign MFHI   = ((IR[`op] == `R_type) && (IR[`funct] == `MFHI));
    assign MFLO   = ((IR[`op] == `R_type) && (IR[`funct] == `MFLO));

    assign branch = b_type || b_zero;
    assign jump   = J      || JAL || JALR || JR;
    assign ju     = J      || JR  ;
    assign jl     = JAL    || JALR;
    assign jr     = JALR   || JR  ;
    assign move_r = MFHI   || MFLO;
    assign cal_r  = cal_r_normal || cal_r_MUL ||cal_r_withSA;
    assign zero_extend = ((IR[`op] == `ANDI) ||
                          (IR[`op] == `ORI ) ||
                          (IR[`op] == `XORI));
    assign sign_extend = ! zero_extend;
    
    assign WBTnew = ld           || cal_r_normal ||
                    cal_r_withSA || cal_i        ||
                    LUI          || jl           ||
                    move_r       ;


endmodule
