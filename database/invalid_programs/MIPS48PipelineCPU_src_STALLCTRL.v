`include "marco.h"
`include "opcode.h"

module STALLCTRL(IR_D,IR_E,IR_M,stall);
    input [`i32] IR_D,IR_E,IR_M;
    output stall;

    DECODE D(.IR(IR_D)),
           E(.IR(IR_E)),
           M(.IR(IR_M));

    assign stall_b_type = 
        ( D.b_type === 1 && 
            (
              (
                ( E.cal_r_normal ||
                  E.cal_r_withSA || 
                  E.move_r ) &&
                (( IR_D[`rs] == IR_E[`rd] ) ||
                 ( IR_D[`rt] == IR_E[`rd] ) )
              )
              ||
              (
                ( E.ld    ||
                  E.cal_i ||
                  E.LUI ) &&
                (( IR_D[`rs] == IR_E[`rt] ) ||
                 ( IR_D[`rt] == IR_E[`rt] ) )
              )
              ||
              (
                ( M.ld ) &&
                (( IR_D[`rs] == IR_E[`rt] ) ||
                 ( IR_D[`rt] == IR_E[`rt] ) )
              )
            )
        );

    assign stall_b_zero = 
        ( D.b_zero === 1 && 
            (
              (
                ( E.cal_r_normal ||
                  E.cal_r_withSA || 
                  E.move_r ) &&
                ( IR_D[`rs] == IR_E[`rd] )
              ) 
              ||
              (
                ( E.ld    ||
                  E.cal_i ||
                  E.LUI ) &&
                ( IR_D[`rs] == IR_E[`rt] ) 
              )
              ||
              (
                ( M.ld ) &&
                ( IR_D[`rs] == IR_E[`rt] ) 
              )
            )
        );

    assign stall_jr = 
        ( D.jr === 1 && 
            (
              (
                ( E.cal_r_normal ||
                  E.cal_r_withSA || 
                  E.move_r ) &&
                ( IR_D[`rs] == IR_E[`rd] )
              ) 
              ||
              (
                ( E.ld    ||
                  E.cal_i ||
                  E.LUI ) &&
                ( IR_D[`rs] == IR_E[`rt] ) 
              ) 
              ||
              (
                ( M.ld ) &&
                ( IR_D[`rs] == IR_E[`rt] ) 
              )
            )
        );

    assign stall_ld = 
        ( E.ld === 1 &&
            (
              (
                ( D.ld           || 
                  D.st           || 
                  D.cal_r_normal ||
                  D.cal_r_MUL    ||
                  D.cal_i )&&
                ( IR_D[`rs] == IR_E[`rt] )
              )
              ||
              (
                ( D.cal_r )&&
                ( IR_D[`rd] == IR_E[`rt] )
              )
            )
        );
    assign stall = stall_b_type || 
                   stall_b_zero ||
                   stall_jr     ||
                   stall_ld     ;
endmodule
