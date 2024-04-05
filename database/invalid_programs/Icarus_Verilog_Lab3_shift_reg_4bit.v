`include "dff_sync_clear.v" //dff_sync_clear(d,clearb, clock, q)
module shift_reg_4bit(d, clk, rst, q);

    input d, clk, rst;
    output [3:0] q;
    wire rst;

    dff_sync_clear df3( d ,rst ,clk , q[3] );
    dff_sync_clear df2( q[3], rst, clk, q[2] );
    dff_sync_clear df1( q[2], rst, clk, q[1] );
    dff_sync_clear df0( q[1], rst, clk, q[0] );

endmodule