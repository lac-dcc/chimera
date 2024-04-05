`include "marco.h"
`include "opcode.h"

module MEMCTRL(IR,BE,DMWe);
    input  [`i32] IR;
    output [3:0]      BE;
    output DMWe;

    assign BE = (IR[`op]==`SW) ? 4'b1111:
                (IR[`op]==`SH) ? 4'b1100:
                (IR[`op]==`SB) ? 4'b1000:
                                 4'bxxxx;
    assign DMWe = (IR[`op]==`SW) || (IR[`op]==`SH) || (IR[`op]==`SB) ;

endmodule
