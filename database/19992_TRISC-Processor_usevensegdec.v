// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - 4 bit unsigned binary to seven segment dec
	module usevensegdec (
	input w, x, y, z,
	output reg a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2);
	always @ (w, x, y, z) begin
		case ({w, x, y, z})
			4'b0000: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110000001; //0
			4'b0001: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111111001111; //1
			4'b0010: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110010010; //2
			4'b0011: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110000110; //3
			4'b0100: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111111001100; //4
			4'b0101: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110100100; //5
			4'b0110: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110100000; //6
			4'b0111: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110001111; //7
			4'b1000: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110000000; //8
			4'b1001: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b11111110001100; //9
			4'b1010: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b10011110000001; //10
			4'b1011: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b10011111001111; //11
			4'b1100: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b10011110010010; //12
			4'b1101: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b10011110000110; //13
			4'b1110: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b10011111001100; //14
			4'b1111: {a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2} = 14'b10011110100100; //15
		endcase
	end
endmodule 

