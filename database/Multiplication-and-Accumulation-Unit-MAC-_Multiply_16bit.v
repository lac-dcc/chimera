// This program was cloned from: https://github.com/Nilesh002/Multiplication-and-Accumulation-Unit-MAC-
// License: MIT License

module mul16(a,b,p);
input [15:0]a,b;
output [31:0]p;

wire [15:0]q1,q2,q3,q4;
wire [15:0]w1;
wire [23:0]w2,w3,w4;

mul8 a1(a[7:0] ,b[7:0] ,q1[15:0]);
mul8 a2(a[15:8],b[7:0] ,q2[15:0]);
mul8 a3(a[7:0] ,b[15:8],q3[15:0]);
mul8 a4(a[15:8],b[15:8],q4[15:0]);

adder16 g1({8'b00,q1[15:8]},q2[15:0],w1[15:0]);
adder24 g2({q4[15:0],8'b00},{8'b00,q3[15:0]},w2[23:0]);
adder24 g3(w2,{8'b00,w1[15:0]},w4[23:0]);

assign p[7:0]=q1[7:0];
assign p[31:8]=w4[23:0];

endmodule
