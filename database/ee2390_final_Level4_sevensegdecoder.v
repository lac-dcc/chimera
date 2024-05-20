// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// sevensegdecoder.v
// Structures count for 7-seg display
// Based off of Lab 04

`timescale 1ns / 1ps

module sevensegdecoder(Seg,HexVal);
	output 	[0:6] Seg;
	input 	[3:0] HexVal;
	reg 	[0:6] Seg;

	always @(HexVal)
	begin
		case(HexVal) // 0 = On | 1 = Off
			// 7'b(0)(1)(2)_(3)(4)(5)(6) corresponds to chart below
			4'h0: Seg = 7'b000_0001;
			4'h1: Seg = 7'b100_1111; //      
			4'h2: Seg = 7'b001_0010; //     
			4'h3: Seg = 7'b000_0110; // 
			4'h4: Seg = 7'b100_1100; //     
			4'h5: Seg = 7'b010_0100; // 
			4'h6: Seg = 7'b010_0000; //     
			4'h7: Seg = 7'b000_1111; //      
			4'h8: Seg = 7'b000_0000;
			4'h9: Seg = 7'b000_0100;
			default: Seg = 7'b000_0000; // default is all on rather than off (from lab 04)
		endcase
	end
endmodule
