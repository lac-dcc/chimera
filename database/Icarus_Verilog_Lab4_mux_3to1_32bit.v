`include "mux_2to1_32bit.v"             //mux_2to1_32bit( outp, inp1, inp2, sel );
module mux_3to1_32bit( outp, inp1, inp2, inp3, sel );
    
    input [31:0] inp1,inp2,inp3;
    output [31:0] outp;
    wire [31:0] temp1, temp2;
    input [1:0] sel;

    mux_2to1_32bit m1( temp1, inp1, inp2, sel[0] );
    mux_2to1_32bit m2( temp2, inp3, 32'b0, sel[0] );
    mux_2to1_32bit m3( outp, temp1, temp2, sel[1] );

endmodule