`include "mux_3to1_32bit.v"         //mux3to1_32bit( outp, inp1, inp2, inp3, sel )
module test_mux_3to1_32bit();

    reg [31:0] in1, in2, in3;
    reg [1:0] sel;
    wire [31:0] outp;

    mux_3to1_32bit mx( outp, in1, in2, in3, sel );
    
    initial begin
        $monitor(" in1: %b",in1," in2: %b", in2," in3: %b", in3," sel: %b", sel," out: %b", outp);
    end
    
    initial begin
        in1 = 32'b0;
        in2 = 32'b11111111111111111111111111111111;
        in3 = {16'b0, 16'b1111111111111111};

        sel = 2'b00;
        #10 sel = 2'b01;
        #100 sel = 2'b10;
        #500 sel = 2'b11;

        #1000 $finish;

    end

endmodule