// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns
module DP(input clk,pr_rst, rst, shen, ldAm, ldAl, ldBm, ldBl, ldP, lastbit, input [7:0] A, B, output [31:0] out);

	wire wm2 ;
	wire [2:0] sel;
	wire [16:0] regA;
	wire [15:0] regb, wm1, wp, wadd ;
	assign sel = regA[2:0] ;

	Reg17 RegA( .data(A), .clk(clk), .rst(rst), .ldm(ldAm), .ldl(ldAl), .lastbit(lastbit),
		 .shen(shen), .shdata(wadd[1:0]), .w(regA) ) ;

	Reg16 RegB( .data(B), .clk(clk), .rst(rst), .ldm(ldBm), .ldl(ldBl), .w(regb) );

	RegP P( .data({wadd[15], wadd[15], wadd[15:2]}), .clk(clk), .rst(rst|pr_rst), .ld(ldP), .w(wp) );

	MUX8to1 m1(.A(16'b 0), .B(regb), .C(regb), .D(regb << 1), .E( ~(regb << 1) ), 
		.F(~regb), .G(~regb), .H(16'b 0), .s(sel), .w(wm1));

	MUX8to1_1bit m2( .A(1'b0), .B(1'b0), .C(1'b0), .D(1'b0), .E(1'b1), 
		.F(1'b1), .G(1'b1), .H(1'b0), .s(sel), .w(wm2));

	AddSub Adder(.A(wm1), .B(wp), .ci(wm2), .co(), .w(wadd));
	assign out = {wp, regA[16:1]};

endmodule