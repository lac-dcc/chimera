// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module seven_seg_decoder (A,B,C,D,E,F,G,W,X,Y,Z);
	input W,X,Y,Z;
	output A,B,C,D,E,F,G;
	reg A,B,C,D,E,F,G;
	
	always @(W or X or Y or Z)
	begin 
		case ({W, X, Y, Z}) 
		
		4'b0000: {A,B,C,D,E,F,G} = 7'b0000001;
		4'b0001: {A,B,C,D,E,F,G} = 7'b1001111;
		4'b0010: {A,B,C,D,E,F,G} = 7'b0010010;
		4'b0011: {A,B,C,D,E,F,G} = 7'b0000110;
		4'b0100: {A,B,C,D,E,F,G} = 7'b1001100;
		4'b0101: {A,B,C,D,E,F,G} = 7'b0100100;
		4'b0110: {A,B,C,D,E,F,G} = 7'b0100000;
		4'b0111: {A,B,C,D,E,F,G} = 7'b0001111;
		4'b1000: {A,B,C,D,E,F,G} = 7'b0000000;
		4'b1001: {A,B,C,D,E,F,G} = 7'b0000100;
		4'b1010: {A,B,C,D,E,F,G} = 7'b0001000;
		4'b1011: {A,B,C,D,E,F,G} = 7'b1100000;
		4'b1100: {A,B,C,D,E,F,G} = 7'b0110001;
		4'b1101: {A,B,C,D,E,F,G} = 7'b1000010;
		4'b1110: {A,B,C,D,E,F,G} = 7'b0110000;
		4'b1111: {A,B,C,D,E,F,G} = 7'b0111000;
		
		endcase
	end
endmodule
			