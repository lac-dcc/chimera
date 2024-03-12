module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    assign out = (sel == 1) ? b : a;
endmodule
