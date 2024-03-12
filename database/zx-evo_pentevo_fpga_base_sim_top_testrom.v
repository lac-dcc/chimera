// bin2v output
// 

module bin2v(

	input  wire [ 9:0] in_addr,

	output reg  [ 7:0] out_word

);

	always @*
	case( in_addr )

		10'h0: out_word = 8'h01;
		10'h1: out_word = 8'hf7;
		10'h2: out_word = 8'h3f;

		10'h3: out_word = 8'h3e;
		10'h4: out_word = 8'h80;

		10'h5: out_word = 8'hED;
		10'h6: out_word = 8'h79; // 3ff7<=BF


		10'h7: out_word = 8'h00;
		10'h8: out_word = 8'h06;
		10'h9: out_word = 8'h7F;
		10'hA: out_word = 8'h3e;
		10'hB: out_word = 8'b01111010;
		10'hC: out_word = 8'hED;
		10'hD: out_word = 8'h79;

		10'hE: out_word = 8'h06;
		10'hF: out_word = 8'hBF;
		10'h10: out_word = 8'h3E;
		10'h11: out_word = 8'b01111101;
		10'h12: out_word = 8'hED;
		10'h13: out_word = 8'h79;

		10'h14: out_word = 8'h06;
		10'h15: out_word = 8'hFF;
		10'h16: out_word = 8'h3E;
		10'h17: out_word = 8'b01111111;
		10'h18: out_word = 8'hED;
		10'h19: out_word = 8'h79;

		10'h1A: out_word = 8'h01;
		10'h1B: out_word = 8'h77;
		10'h1C: out_word = 8'hFD;
		10'h1D: out_word = 8'h3E;
		10'h1E: out_word = 8'hAB;
		10'h1F: out_word = 8'hED;
		10'h20: out_word = 8'h79;

		10'h21: out_word = 8'h21;
		10'h22: out_word = 8'h00;
		10'h23: out_word = 8'h01;
		10'h24: out_word = 8'h11;
		10'h25: out_word = 8'h00;
		10'h26: out_word = 8'h60;
		10'h27: out_word = 8'h01;
		10'h28: out_word = 8'h00;
		10'h29: out_word = 8'h01;
		10'h2A: out_word = 8'hED;
		10'h2B: out_word = 8'hB0;

		10'h2C: out_word = 8'hC3;
		10'h2D: out_word = 8'h00;
		10'h2E: out_word = 8'h60;
		




		10'h100: out_word = 8'h01;
		10'h101: out_word = 8'h77;
		10'h102: out_word = 8'hff;
		10'h103: out_word = 8'h3e;
		10'h104: out_word = 8'hab;
		10'h105: out_word = 8'hed;
		10'h106: out_word = 8'h79;

		10'h107: out_word = 8'h3e;
		10'h108: out_word = 8'h01;
		10'h109: out_word = 8'hd3;
		10'h10a: out_word = 8'hbf;

		10'h10b: out_word = 8'h01;
		10'h10c: out_word = 8'hf7;
		10'h10d: out_word = 8'hee;
		10'h10e: out_word = 8'h3e;
		10'h10f: out_word = 8'h80;
		10'h110: out_word = 8'hed;
		10'h111: out_word = 8'h79;

		10'h112: out_word = 8'h06;
		10'h113: out_word = 8'hde;
		10'h114: out_word = 8'h3e;
		10'h115: out_word = 8'h01;
		10'h116: out_word = 8'hed;
		10'h117: out_word = 8'h79;

		10'h118: out_word = 8'h06;
		10'h119: out_word = 8'hbe;
		10'h11a: out_word = 8'h3e;
		10'h11b: out_word = 8'h22;
		10'h11c: out_word = 8'hed;
		10'h11d: out_word = 8'h78;


		default: out_word = 8'hFF;

	endcase

endmodule
