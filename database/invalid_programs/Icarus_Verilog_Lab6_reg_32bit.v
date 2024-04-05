`ifndef REG_32BIT
`define REG_32BIT
`include "dff_sync_clear.v"         // d, clr, clk ,q
    module reg_32bit(
        output [31:0] q,
        input [31:0] d,
        input clk,
        input reset);

        genvar num;

        generate for (num = 0 ; num < 32 ; num = num + 1) begin: ffs
                dff_sync_clear dff( d[num], reset, clk, q[num] );
            end
        endgenerate
    endmodule
`endif