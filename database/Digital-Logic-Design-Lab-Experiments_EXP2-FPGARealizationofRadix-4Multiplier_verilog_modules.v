// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ns/1ns 
`timescale 1ns/1ns
module Reg16(input [7:0] data, input clk, rst, ldm, ldl, output reg [15:0] w);
	always@(posedge clk) begin	
		if (rst) 
			w <= 16'b 0 ;
		else if (ldm)
			w[15:8] <= data ;
		else if (ldl)
			w[7:0] <= data ;
			
	end
endmodule 

module Reg17(input [7:0] data, input clk, rst, ldm, ldl, lastbit, shen, input [1:0] shdata, output reg [16:0] w) ;
	always@(posedge clk) begin	
		if (rst)
			w <= 17'b 0 ;
		else if (ldm)
			w[16:9] <= data ;
		else if (ldl)
			w[8:1] <= data ;
		else if (shen) 
			w = { shdata, w[16:2] } ;

		if (lastbit)
			w[0] <= 1'b 0 ;

	end
	
endmodule


module RegP(input [15:0] data, input clk, rst, ld, output reg [15:0] w);
	always@(posedge clk) begin	
		if (rst)
			w <= 16'b 0 ;
		else if (ld)
			w <= data ;
	end
endmodule 


module AddSub(input [15:0] A, B, input ci, output co, output [15:0] w);
	assign {co, w} = A + B + ci ;
endmodule


module MUX8to1(input [15:0] A, B, C, D, E, F, G, H, input [2:0] s, output [15:0] w);
	assign w = (s == 0) ? (A) :
		(s == 1) ? (B) :
		(s == 2) ? (C) :
		(s == 3) ? (D) :
		(s == 4) ? (E) :
		(s == 5) ? (F) :
		(s == 6) ? (G) :
		(s == 7) ? (H) : 16'b z ;

endmodule

module MUX8to1_1bit(input A, B, C, D, E, F, G, H, input [2:0] s, output w);
	assign w = (s == 0) ? (A) :
		(s == 1) ? (B) :
		(s == 2) ? (C) :
		(s == 3) ? (D) :
		(s == 4) ? (E) :
		(s == 5) ? (F) :
		(s == 6) ? (G) :
		(s == 7) ? (H) : 1'b z ;

endmodule