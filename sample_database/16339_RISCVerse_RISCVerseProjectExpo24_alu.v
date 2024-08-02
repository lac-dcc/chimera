// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module alu(
	input clk,
	input [31:0]r1,
	input [31:0]r2,
	input [3:0]alu_control_decode,
	output [31:0]out
	);
	
reg [31:0] out_reg;
wire cout = 1'b0;	

wire [31:0]add_res;
wire [31:0]sub_res;
wire [31:0]sll_res;
wire [31:0]slt_res;
wire [31:0]xor_res;
wire [31:0]srl_res;
wire [31:0]sra_res;
wire [31:0]or_res;
wire [31:0]and_res;

assign shift = r2[4:0];
assign msb = r1[31];

add32bit u0(r1, r2, 1'b0, add_res, cout);
add32bit u1(r1,( ~r2 + 32'b1) , 1'b0, sub_res, cout);
assign sll_res = r1 << shift;
assign xor_res = r1 ^ r2 ;
assign srl_res = r1 >> shift; 
assign sra_res = r1 >>> shift;
assign or_res = r1 | r2 ;
assign and_res = r1 & r2 ;
 
// ALU Signals
parameter dum_sig = 4'b0000;
parameter add_sig = 4'b0001;
parameter sub_sig = 4'b0010;
parameter sll_sig = 4'b0011;
parameter slt_sig = 4'b0100;
parameter xor_sig = 4'b0101;
parameter srl_sig = 4'b0110;
parameter sra_sig = 4'b0111;
parameter or_sig  = 4'b1000;
parameter and_sig = 4'b1001;

always@(posedge clk)
begin
	case(alu_control_decode)
		add_sig: out_reg = add_res;
		sub_sig: out_reg = sub_res;
		sll_sig: out_reg = sll_res;
		xor_sig: out_reg = xor_res;
		srl_sig: out_reg = srl_res;
		sra_sig: out_reg = sra_res;
		or_sig: out_reg = or_res;
		and_sig: out_reg = and_res;
	endcase
end

assign out = out_reg;
endmodule


module add32bit( a, b, cin, s, cout);
input [31:0]a,b;
input cin;
output [31:0]s;
output cout;
wire [2:0]c;

add16bit A16B1( a[15:0], b[15:0], cin, s[15:0], c[0]);
add16bit A16B2( a[31:16], b[31:16], c[0], s[31:16], cout);
endmodule

module add16bit( a, b, cin, s, cout);
input [15:0]a,b;
input cin;
output [15:0]s;
output cout;
wire [2:0]c;

add4bit A4B1( a[3:0], b[3:0], cin, s[3:0], c[0]);
add4bit A4B2( a[7:4], b[7:4], c[0], s[7:4], c[1]);
add4bit A4B3( a[11:8], b[11:8], c[1], s[11:8], c[2]);
add4bit A4B4( a[15:12], b[15:12], c[2], s[15:12], cout);
endmodule

module add4bit( a, b, cin, s, cout);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire c[2:0];

fa FA1(a[0],b[0],cin, s[0], c[0]);
fa FA2(a[1],b[1],c[0], s[1], c[1]);
fa FA3(a[2],b[2],c[1], s[2], c[2]);
fa FA4(a[3],b[3],c[2], s[3], cout);
endmodule

module fa(a, b, cin, s, cout);
input a, b, cin;
output s, cout;
wire t1, t2, t3;

xor G1(t1, a, b);
xor G2(s, t1, cin);
and G3(t2 , a, b);
and G4(t3, t1, cin);
or G5(cout, t2, t3);
endmodule

