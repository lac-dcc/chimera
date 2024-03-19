`include "module_32bitOR.v"
module test_32bitOR();
    
    reg [31:0] inp1, inp2;
    wire [31:0] out;
    module_32bitOR or32bit( out, inp1, inp2 );

    initial
        $monitor("in1 - %b",inp1," in2 - %b ", inp2 ," out - %b ",out);

    initial begin
        inp1 = 32'h3FFFFFFF;
        inp2 = 32'h5A000000;

        #100 inp1 = 32'hFFFFFFFF;
        #1000 $finish;
    end

endmodule