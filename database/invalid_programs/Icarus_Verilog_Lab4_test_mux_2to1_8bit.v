`include "mux_2to1_8bit.v"            //mux_2to1_8bit( outp, inp1, inp2, sel );
module test_mux_2to1_8bit();
    reg [7:0] inp1, inp2;
    reg sel;
    wire [7:0] outp;

    mux_2to1_8bit mx(outp, inp1, inp2, sel);

    initial begin
        inp1=8'b10101010;
        inp2=8'b01010101;
        sel=1'b0;
        #100 sel=1'b1;
        #1000 $finish;
    end

    initial 
        $monitor(" inp1 = %b ", inp1, " inp2 = %b ", inp2, " sel = ", sel, " outp = %b", outp);
        
endmodule