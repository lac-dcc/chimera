// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module prim_secded_39_32_dec (
	in,
	d_o,
	syndrome_o,
	err_o
);
	input [38:0] in;
	output wire [31:0] d_o;
	output wire [6:0] syndrome_o;
	output wire [1:0] err_o;
	wire single_error;
	assign syndrome_o[0] = ((((((((((((in[32] ^ in[2]) ^ in[3]) ^ in[7]) ^ in[8]) ^ in[14]) ^ in[15]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[23]) ^ in[24]) ^ in[28]) ^ in[29];
	assign syndrome_o[1] = (((((((((((((in[33] ^ in[3]) ^ in[6]) ^ in[8]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[17]) ^ in[19]) ^ in[21]) ^ in[25]) ^ in[27]) ^ in[29]) ^ in[30]) ^ in[31];
	assign syndrome_o[2] = (((((((((((((in[34] ^ in[0]) ^ in[5]) ^ in[7]) ^ in[9]) ^ in[10]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[16]) ^ in[22]) ^ in[23]) ^ in[26]) ^ in[27]) ^ in[31];
	assign syndrome_o[3] = (((((((((((((in[35] ^ in[0]) ^ in[1]) ^ in[4]) ^ in[6]) ^ in[9]) ^ in[11]) ^ in[12]) ^ in[14]) ^ in[22]) ^ in[23]) ^ in[25]) ^ in[28]) ^ in[29]) ^ in[30];
	assign syndrome_o[4] = (((((((((((in[36] ^ in[0]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[11]) ^ in[17]) ^ in[20]) ^ in[24]) ^ in[26]) ^ in[27]) ^ in[30];
	assign syndrome_o[5] = (((((((((((((in[37] ^ in[1]) ^ in[2]) ^ in[4]) ^ in[6]) ^ in[10]) ^ in[13]) ^ in[14]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21]) ^ in[22]) ^ in[26];
	assign syndrome_o[6] = ((((((((((((((in[38] ^ in[1]) ^ in[5]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[11]) ^ in[17]) ^ in[18]) ^ in[20]) ^ in[21]) ^ in[24]) ^ in[25]) ^ in[28]) ^ in[31];
	assign d_o[0] = (syndrome_o == 7'h1c) ^ in[0];
	assign d_o[1] = (syndrome_o == 7'h68) ^ in[1];
	assign d_o[2] = (syndrome_o == 7'h31) ^ in[2];
	assign d_o[3] = (syndrome_o == 7'h13) ^ in[3];
	assign d_o[4] = (syndrome_o == 7'h38) ^ in[4];
	assign d_o[5] = (syndrome_o == 7'h54) ^ in[5];
	assign d_o[6] = (syndrome_o == 7'h2a) ^ in[6];
	assign d_o[7] = (syndrome_o == 7'h45) ^ in[7];
	assign d_o[8] = (syndrome_o == 7'h43) ^ in[8];
	assign d_o[9] = (syndrome_o == 7'h4c) ^ in[9];
	assign d_o[10] = (syndrome_o == 7'h64) ^ in[10];
	assign d_o[11] = (syndrome_o == 7'h58) ^ in[11];
	assign d_o[12] = (syndrome_o == 7'h0e) ^ in[12];
	assign d_o[13] = (syndrome_o == 7'h26) ^ in[13];
	assign d_o[14] = (syndrome_o == 7'h29) ^ in[14];
	assign d_o[15] = (syndrome_o == 7'h07) ^ in[15];
	assign d_o[16] = (syndrome_o == 7'h25) ^ in[16];
	assign d_o[17] = (syndrome_o == 7'h52) ^ in[17];
	assign d_o[18] = (syndrome_o == 7'h61) ^ in[18];
	assign d_o[19] = (syndrome_o == 7'h23) ^ in[19];
	assign d_o[20] = (syndrome_o == 7'h70) ^ in[20];
	assign d_o[21] = (syndrome_o == 7'h62) ^ in[21];
	assign d_o[22] = (syndrome_o == 7'h2c) ^ in[22];
	assign d_o[23] = (syndrome_o == 7'h0d) ^ in[23];
	assign d_o[24] = (syndrome_o == 7'h51) ^ in[24];
	assign d_o[25] = (syndrome_o == 7'h4a) ^ in[25];
	assign d_o[26] = (syndrome_o == 7'h34) ^ in[26];
	assign d_o[27] = (syndrome_o == 7'h16) ^ in[27];
	assign d_o[28] = (syndrome_o == 7'h49) ^ in[28];
	assign d_o[29] = (syndrome_o == 7'h0b) ^ in[29];
	assign d_o[30] = (syndrome_o == 7'h1a) ^ in[30];
	assign d_o[31] = (syndrome_o == 7'h46) ^ in[31];
	assign single_error = ^syndrome_o;
	assign err_o[0] = single_error;
	assign err_o[1] = ~single_error & |syndrome_o;
endmodule