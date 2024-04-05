`ifndef MUX_8bit
`define MUX_8bit
`include "mux_2to1.v"           //mux2to1( out, sel, in1, in2 );
    module mux_2to1_8bit( outp, inp1, inp2, sel );
        input [7:0] inp1, inp2;
        input sel;
        output [7:0] outp;

        genvar j;

        generate for (j = 0; j<=7; j = j+1) begin: mux_loop
            mux_2to1 m1(outp[j], sel, inp1[j], inp2[j]);
        end
        endgenerate
    endmodule
`endif