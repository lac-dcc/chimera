`ifndef MUX_32bit
`define MUX_32bit
    `include "mux_2to1_8bit.v"          //mux_2to1_8bit( outp, inp1, inp2, sel );
    module mux_2to1_32bit( outp, inp1, inp2, sel );

        input [31:0] inp1, inp2;
        output [31:0] outp;
        input sel;

        genvar j;

        generate for(j = 0; j < 4; j = j+1) begin: mux_loop
                mux_2to1_8bit mx ( outp[ 8*j+7 : 8*j] , inp1[ 8*j+7 : 8*j], inp2[ 8*j+7 : 8*j], sel);
            end
        endgenerate

    endmodule
`endif