// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire signwire;
wire [15:0]sel0;
wire [15:0]sel1;
add16 adder(a[15:0],b[15:0],1'b0,sum[15:0],signwire);
add16 num0(a[31:16],b[31:16],1'b0,sel0,);
add16 num01(a[31:16],b[31:16],1'b1,sel1,);

assign sum[31:16] = signwire? sel1 : sel0;

endmodule

module add16 ( 
    input[15:0] a, input[15:0] b, input cin, 
    output[15:0] sum, output cout );

endmodule