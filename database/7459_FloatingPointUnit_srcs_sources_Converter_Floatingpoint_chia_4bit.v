// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License

module chia_4bit(
input cp,
input [3:0]a,
output [3:0]b,
output c
);
wire [3:0]a1;
//assign a1=4'b0110;
assign a1=(cp==1'b1)?(4'b0110):(4'b0000);
FA FA[3:0](.a(a[3:0]), .b(a1[3:0]), .cin(1'b0), .s(b) ,.cout(c) );

endmodule 


