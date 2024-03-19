module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    reg [7:0]index;
    assign     out[3:0] = in[4*sel+:4];
endmodule

