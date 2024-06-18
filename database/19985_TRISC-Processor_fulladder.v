// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - Full Adder
module fulladder (
	input ai, bi, cini,
	output reg si, couti);
		always @ (ai,bi,cini)
			case ({ai,bi,cini})
				3'b000: begin couti = 1'b0; si = 1'b0; end
				3'b001: begin couti = 1'b0; si = 1'b1; end
				3'b010: begin couti = 1'b0; si = 1'b1; end
				3'b011: begin couti = 1'b1; si = 1'b0; end
				3'b100: begin couti = 1'b0; si = 1'b1; end
				3'b101: begin couti = 1'b1; si = 1'b0; end
				3'b110: begin couti = 1'b1; si = 1'b0; end
				3'b111: begin couti = 1'b1; si = 1'b1; end
			endcase
endmodule
