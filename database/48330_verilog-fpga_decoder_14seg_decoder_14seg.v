// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231104

`default_nettype none
module Decoder14seg(
	input wire Clock,
	input wire Reset,
	input wire Enable_i,
	input wire [ 7:0] Data_i,
	output reg [13:0] Segments_o
);
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Segments_o <= 14'b00000000000000;
		end else if(Enable_i) begin
			case(Data_i)
			//                         NMLKJIHGFEDCBA
			8'h00:	 Segments_o <= 14'b00000000000000;
			" ":	 Segments_o <= 14'b00000000000000;
			"\"":	 Segments_o <= 14'b00000000100010;
			"'":	 Segments_o <= 14'b00000100000000;
			"(":	 Segments_o <= 14'b10001000000000;
			")":	 Segments_o <= 14'b00100010000000;
			"*":	 Segments_o <= 14'b11111111000000;
			"+":	 Segments_o <= 14'b01010101000000;
			",":	 Segments_o <= 14'b00100000000000;
			"-":	 Segments_o <= 14'b00010001000000;
			".":	 Segments_o <= 14'b01000000000000;
			"/":	 Segments_o <= 14'b00101000000000;
			"0":	 Segments_o <= 14'b00000000111111;
			"1":	 Segments_o <= 14'b00001000000110;
			"2":	 Segments_o <= 14'b00010001011011;
			"3":	 Segments_o <= 14'b00010000001111;
			"4":	 Segments_o <= 14'b00010001100110;
			"5":	 Segments_o <= 14'b00010001101101;
			"6":	 Segments_o <= 14'b00010001111101;
			"7":	 Segments_o <= 14'b01001000000001;
			"8":	 Segments_o <= 14'b00010001111111;
			"9":	 Segments_o <= 14'b00010001101111;
			":":	 Segments_o <= 14'b11111111111111;
			";":	 Segments_o <= 14'b11111111111111;
			"<":	 Segments_o <= 14'b10001000000000;
			"=":	 Segments_o <= 14'b00010001001000;
			">":	 Segments_o <= 14'b00100010000000;
			"A":	 Segments_o <= 14'b00010001110111;
			"B":	 Segments_o <= 14'b01010100001111;
			"C":	 Segments_o <= 14'b00000000111001;
			"D":	 Segments_o <= 14'b01000100001111;
			"E":	 Segments_o <= 14'b00000001111001;
			"F":	 Segments_o <= 14'b00000001110001;
			"G":	 Segments_o <= 14'b00010000111101;
			"H":	 Segments_o <= 14'b00010001110110;
			"I":	 Segments_o <= 14'b01000100001001;
			"J":	 Segments_o <= 14'b00000000011110;
			"K":	 Segments_o <= 14'b10001001110000;
			"L":	 Segments_o <= 14'b00000000111000;
			"M":	 Segments_o <= 14'b00001010110110;
			"N":	 Segments_o <= 14'b10000010110110;
			"O":	 Segments_o <= 14'b00000000111111;
			"P":	 Segments_o <= 14'b00010001110011;
			"Q":	 Segments_o <= 14'b10000000111111;
			"R":	 Segments_o <= 14'b10010001110011;
			"S":	 Segments_o <= 14'b00010001101101;
			"T":	 Segments_o <= 14'b01000100000001;
			"U":	 Segments_o <= 14'b00000000111110;
			"V":	 Segments_o <= 14'b00101000110000;
			"W":	 Segments_o <= 14'b10100000110110;
			"X":	 Segments_o <= 14'b10101010000000;
			"Y":	 Segments_o <= 14'b01001010000000;
			"Z":	 Segments_o <= 14'b00101000001001;
			default: Segments_o <= 14'b11111111111111;
			endcase
		end
	end
	
endmodule
`default_nettype wire
