// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

module Hexdisplay (input [3:0] digit, output reg [6:0] displ);
	
	always @ (digit)
		case (digit)
		4'd0: displ = 7'b100_0000;
		4'd1: displ = 7'b111_1001;
		4'd2: displ = 7'b010_0100;
		4'd3: displ = 7'b011_0000;
		4'd4: displ = 7'b001_1001;
		4'd5: displ = 7'b001_0010;
		4'd6: displ = 7'b000_0010;
		4'd7: displ = 7'b111_1000;
		4'd8: displ = 7'b000_0000;
		4'd9: displ = 7'b001_0000;
		4'hA: displ = 7'b000_1000;
		4'hB: displ = 7'b000_0011;
		4'hC: displ = 7'b100_0110;
		4'hD: displ = 7'b010_0001;
		4'hE: displ = 7'b000_0110;
		4'hF: displ = 7'b000_1110;
			
			default: displ = 7'b1111111;
		endcase
endmodule