module module_32bitAND( outp, in1, in2 );
    
    input [31:0] in1, in2;
    output [31:0] outp;
    assign outp = in1 & in2;

endmodule
