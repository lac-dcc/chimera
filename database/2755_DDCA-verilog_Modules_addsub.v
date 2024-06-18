// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

module add16 ( 
    input[15:0] a, input[15:0] b, input cin, 
    output[15:0] sum, output cout );

endmodule

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

wire [31:0]subt;
assign subt = {32{sub}};
wire [31:0]temp;
assign temp = b ^ subt;
wire a1_a2;
add16 a1(a[15:0],temp[15:0],sub,sum[15:0],a1_a2);
add16 a2(a[31:16],temp[31:16],a1_a2,sum[31:16],);

endmodule
