// This program was cloned from: https://github.com/vicmcantes/decodificador-binario-a-7-segmentos-hexadecimal
// License: Apache License 2.0

module CodHex7seg (
	input [3:0] h,
	output reg [6:0] S
);
	
	always @(h)
		begin
			case (h)
				4'b0000: S = 7'b0000001;   //0
				4'b0001: S = 7'b1001111;   //1
				4'b0010: S = 7'b0010010;   //2
				4'b0011: S = 7'b0000110;   //3
				4'b0100: S = 7'b1001100;   //4
				4'b0101: S = 7'b0100100;   //5
				4'b0110: S = 7'b0100000;   //6
				4'b0111: S = 7'b0001111;   //7
				4'b1000: S = 7'b0000000;   //8
				4'b1001: S = 7'b0000100;   //9
				4'b1010: S = 7'b0001000;   // A
            			4'b1011: S = 7'b1100000;   // B
            			4'b1100: S = 7'b0110001;   // C	
            			4'b1101: S = 7'b1000010;   // D
            			4'b1110: S = 7'b0110000;   // E
            			4'b1111: S = 7'b0111000;   // F				
				default: S = 7'b1001001;
			endcase
		end
endmodule
				
