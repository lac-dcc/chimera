////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	midmap.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	One of several false-color mapping functions
//
//	Another colormap implemented from data lying around in my archives.
//
////////////////////////////////////////////////////////////////////////////////
//
//
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	midmap (
		// {{{
		input	wire	[7:0]	i_pixel,
		output	reg	[7:0]	o_r, o_g, o_b
		// }}}
	);

	// Local declarations
	// {{{
	reg	[7:0]	rtbl	[0:255];
	reg	[7:0]	gtbl	[0:255];
	reg	[7:0]	btbl	[0:255];
	// }}}

	always @(*)
	begin
		o_r = rtbl[i_pixel];
		o_g = gtbl[i_pixel];
		o_b = btbl[i_pixel];
	end

	////////////////////////////////////////////////////////////////////////
	//
	// Now define the tables themselves
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial begin
	rtbl[  0] = 8'h00; gtbl[  0] = 8'h00; btbl[  0] = 8'h26;
	rtbl[  1] = 8'h00; gtbl[  1] = 8'h00; btbl[  1] = 8'h29;
	rtbl[  2] = 8'h00; gtbl[  2] = 8'h00; btbl[  2] = 8'h2d;
	rtbl[  3] = 8'h00; gtbl[  3] = 8'h00; btbl[  3] = 8'h30;
	rtbl[  4] = 8'h00; gtbl[  4] = 8'h00; btbl[  4] = 8'h34;
	rtbl[  5] = 8'h00; gtbl[  5] = 8'h00; btbl[  5] = 8'h37;
	rtbl[  6] = 8'h00; gtbl[  6] = 8'h00; btbl[  6] = 8'h3b;
	rtbl[  7] = 8'h00; gtbl[  7] = 8'h00; btbl[  7] = 8'h3e;
	rtbl[  8] = 8'h00; gtbl[  8] = 8'h00; btbl[  8] = 8'h42;
	rtbl[  9] = 8'h00; gtbl[  9] = 8'h00; btbl[  9] = 8'h45;
	rtbl[ 10] = 8'h00; gtbl[ 10] = 8'h00; btbl[ 10] = 8'h49;
	rtbl[ 11] = 8'h00; gtbl[ 11] = 8'h00; btbl[ 11] = 8'h4c;
	rtbl[ 12] = 8'h00; gtbl[ 12] = 8'h00; btbl[ 12] = 8'h50;
	rtbl[ 13] = 8'h00; gtbl[ 13] = 8'h00; btbl[ 13] = 8'h53;
	rtbl[ 14] = 8'h00; gtbl[ 14] = 8'h00; btbl[ 14] = 8'h57;
	rtbl[ 15] = 8'h00; gtbl[ 15] = 8'h00; btbl[ 15] = 8'h5a;
	rtbl[ 16] = 8'h00; gtbl[ 16] = 8'h00; btbl[ 16] = 8'h5e;
	rtbl[ 17] = 8'h00; gtbl[ 17] = 8'h00; btbl[ 17] = 8'h61;
	rtbl[ 18] = 8'h00; gtbl[ 18] = 8'h00; btbl[ 18] = 8'h65;
	rtbl[ 19] = 8'h00; gtbl[ 19] = 8'h00; btbl[ 19] = 8'h68;
	rtbl[ 20] = 8'h00; gtbl[ 20] = 8'h00; btbl[ 20] = 8'h6c;
	rtbl[ 21] = 8'h00; gtbl[ 21] = 8'h00; btbl[ 21] = 8'h6f;
	rtbl[ 22] = 8'h00; gtbl[ 22] = 8'h00; btbl[ 22] = 8'h73;
	rtbl[ 23] = 8'h00; gtbl[ 23] = 8'h00; btbl[ 23] = 8'h76;
	rtbl[ 24] = 8'h00; gtbl[ 24] = 8'h00; btbl[ 24] = 8'h7a;
	rtbl[ 25] = 8'h00; gtbl[ 25] = 8'h00; btbl[ 25] = 8'h7d;
	rtbl[ 26] = 8'h00; gtbl[ 26] = 8'h01; btbl[ 26] = 8'h80;
	rtbl[ 27] = 8'h00; gtbl[ 27] = 8'h04; btbl[ 27] = 8'h81;
	rtbl[ 28] = 8'h00; gtbl[ 28] = 8'h07; btbl[ 28] = 8'h82;
	rtbl[ 29] = 8'h00; gtbl[ 29] = 8'h0a; btbl[ 29] = 8'h84;
	rtbl[ 30] = 8'h00; gtbl[ 30] = 8'h0d; btbl[ 30] = 8'h85;
	rtbl[ 31] = 8'h00; gtbl[ 31] = 8'h10; btbl[ 31] = 8'h86;
	rtbl[ 32] = 8'h00; gtbl[ 32] = 8'h13; btbl[ 32] = 8'h87;
	rtbl[ 33] = 8'h00; gtbl[ 33] = 8'h16; btbl[ 33] = 8'h88;
	rtbl[ 34] = 8'h00; gtbl[ 34] = 8'h19; btbl[ 34] = 8'h89;
	rtbl[ 35] = 8'h00; gtbl[ 35] = 8'h1d; btbl[ 35] = 8'h8b;
	rtbl[ 36] = 8'h00; gtbl[ 36] = 8'h20; btbl[ 36] = 8'h8c;
	rtbl[ 37] = 8'h00; gtbl[ 37] = 8'h23; btbl[ 37] = 8'h8d;
	rtbl[ 38] = 8'h00; gtbl[ 38] = 8'h26; btbl[ 38] = 8'h8e;
	rtbl[ 39] = 8'h00; gtbl[ 39] = 8'h29; btbl[ 39] = 8'h8f;
	rtbl[ 40] = 8'h00; gtbl[ 40] = 8'h2c; btbl[ 40] = 8'h91;
	rtbl[ 41] = 8'h00; gtbl[ 41] = 8'h2f; btbl[ 41] = 8'h92;
	rtbl[ 42] = 8'h00; gtbl[ 42] = 8'h32; btbl[ 42] = 8'h93;
	rtbl[ 43] = 8'h00; gtbl[ 43] = 8'h35; btbl[ 43] = 8'h94;
	rtbl[ 44] = 8'h00; gtbl[ 44] = 8'h38; btbl[ 44] = 8'h95;
	rtbl[ 45] = 8'h00; gtbl[ 45] = 8'h3c; btbl[ 45] = 8'h97;
	rtbl[ 46] = 8'h00; gtbl[ 46] = 8'h3f; btbl[ 46] = 8'h98;
	rtbl[ 47] = 8'h00; gtbl[ 47] = 8'h42; btbl[ 47] = 8'h99;
	rtbl[ 48] = 8'h00; gtbl[ 48] = 8'h45; btbl[ 48] = 8'h9a;
	rtbl[ 49] = 8'h00; gtbl[ 49] = 8'h48; btbl[ 49] = 8'h9b;
	rtbl[ 50] = 8'h00; gtbl[ 50] = 8'h4b; btbl[ 50] = 8'h9d;
	rtbl[ 51] = 8'h00; gtbl[ 51] = 8'h4e; btbl[ 51] = 8'h9e;
	rtbl[ 52] = 8'h00; gtbl[ 52] = 8'h51; btbl[ 52] = 8'h9f;
	rtbl[ 53] = 8'h00; gtbl[ 53] = 8'h54; btbl[ 53] = 8'ha0;
	rtbl[ 54] = 8'h00; gtbl[ 54] = 8'h57; btbl[ 54] = 8'ha1;
	rtbl[ 55] = 8'h00; gtbl[ 55] = 8'h5a; btbl[ 55] = 8'ha2;
	rtbl[ 56] = 8'h00; gtbl[ 56] = 8'h5e; btbl[ 56] = 8'ha4;
	rtbl[ 57] = 8'h00; gtbl[ 57] = 8'h61; btbl[ 57] = 8'ha5;
	rtbl[ 58] = 8'h00; gtbl[ 58] = 8'h64; btbl[ 58] = 8'ha6;
	rtbl[ 59] = 8'h00; gtbl[ 59] = 8'h67; btbl[ 59] = 8'ha7;
	rtbl[ 60] = 8'h00; gtbl[ 60] = 8'h6a; btbl[ 60] = 8'ha8;
	rtbl[ 61] = 8'h00; gtbl[ 61] = 8'h6d; btbl[ 61] = 8'haa;
	rtbl[ 62] = 8'h00; gtbl[ 62] = 8'h70; btbl[ 62] = 8'hab;
	rtbl[ 63] = 8'h00; gtbl[ 63] = 8'h73; btbl[ 63] = 8'hac;
	rtbl[ 64] = 8'h00; gtbl[ 64] = 8'h76; btbl[ 64] = 8'had;
	rtbl[ 65] = 8'h00; gtbl[ 65] = 8'h79; btbl[ 65] = 8'hae;
	rtbl[ 66] = 8'h00; gtbl[ 66] = 8'h7d; btbl[ 66] = 8'hb0;
	rtbl[ 67] = 8'h00; gtbl[ 67] = 8'h80; btbl[ 67] = 8'hb1;
	rtbl[ 68] = 8'h00; gtbl[ 68] = 8'h83; btbl[ 68] = 8'hb2;
	rtbl[ 69] = 8'h00; gtbl[ 69] = 8'h86; btbl[ 69] = 8'hb3;
	rtbl[ 70] = 8'h00; gtbl[ 70] = 8'h89; btbl[ 70] = 8'hb4;
	rtbl[ 71] = 8'h00; gtbl[ 71] = 8'h8c; btbl[ 71] = 8'hb6;
	rtbl[ 72] = 8'h00; gtbl[ 72] = 8'h8f; btbl[ 72] = 8'hb7;
	rtbl[ 73] = 8'h00; gtbl[ 73] = 8'h92; btbl[ 73] = 8'hb8;
	rtbl[ 74] = 8'h00; gtbl[ 74] = 8'h95; btbl[ 74] = 8'hb9;
	rtbl[ 75] = 8'h00; gtbl[ 75] = 8'h98; btbl[ 75] = 8'hba;
	rtbl[ 76] = 8'h00; gtbl[ 76] = 8'h9b; btbl[ 76] = 8'hbb;
	rtbl[ 77] = 8'h00; gtbl[ 77] = 8'h9f; btbl[ 77] = 8'hbd;
	rtbl[ 78] = 8'h00; gtbl[ 78] = 8'ha2; btbl[ 78] = 8'hbe;
	rtbl[ 79] = 8'h00; gtbl[ 79] = 8'ha5; btbl[ 79] = 8'hbf;
	rtbl[ 80] = 8'h00; gtbl[ 80] = 8'ha7; btbl[ 80] = 8'hbd;
	rtbl[ 81] = 8'h00; gtbl[ 81] = 8'ha8; btbl[ 81] = 8'hb9;
	rtbl[ 82] = 8'h00; gtbl[ 82] = 8'ha9; btbl[ 82] = 8'hb5;
	rtbl[ 83] = 8'h00; gtbl[ 83] = 8'haa; btbl[ 83] = 8'hb1;
	rtbl[ 84] = 8'h00; gtbl[ 84] = 8'hab; btbl[ 84] = 8'had;
	rtbl[ 85] = 8'h00; gtbl[ 85] = 8'hac; btbl[ 85] = 8'ha9;
	rtbl[ 86] = 8'h00; gtbl[ 86] = 8'had; btbl[ 86] = 8'ha5;
	rtbl[ 87] = 8'h00; gtbl[ 87] = 8'hae; btbl[ 87] = 8'ha1;
	rtbl[ 88] = 8'h00; gtbl[ 88] = 8'haf; btbl[ 88] = 8'h9d;
	rtbl[ 89] = 8'h00; gtbl[ 89] = 8'hb0; btbl[ 89] = 8'h99;
	rtbl[ 90] = 8'h00; gtbl[ 90] = 8'hb1; btbl[ 90] = 8'h95;
	rtbl[ 91] = 8'h00; gtbl[ 91] = 8'hb2; btbl[ 91] = 8'h92;
	rtbl[ 92] = 8'h00; gtbl[ 92] = 8'hb3; btbl[ 92] = 8'h8e;
	rtbl[ 93] = 8'h00; gtbl[ 93] = 8'hb4; btbl[ 93] = 8'h8a;
	rtbl[ 94] = 8'h00; gtbl[ 94] = 8'hb5; btbl[ 94] = 8'h86;
	rtbl[ 95] = 8'h00; gtbl[ 95] = 8'hb6; btbl[ 95] = 8'h82;
	rtbl[ 96] = 8'h00; gtbl[ 96] = 8'hb7; btbl[ 96] = 8'h7e;
	rtbl[ 97] = 8'h00; gtbl[ 97] = 8'hb8; btbl[ 97] = 8'h7a;
	rtbl[ 98] = 8'h00; gtbl[ 98] = 8'hba; btbl[ 98] = 8'h76;
	rtbl[ 99] = 8'h00; gtbl[ 99] = 8'hbb; btbl[ 99] = 8'h72;
	rtbl[100] = 8'h00; gtbl[100] = 8'hbc; btbl[100] = 8'h6e;
	rtbl[101] = 8'h00; gtbl[101] = 8'hbd; btbl[101] = 8'h6a;
	rtbl[102] = 8'h00; gtbl[102] = 8'hbe; btbl[102] = 8'h66;
	rtbl[103] = 8'h00; gtbl[103] = 8'hbf; btbl[103] = 8'h62;
	rtbl[104] = 8'h00; gtbl[104] = 8'hc0; btbl[104] = 8'h5e;
	rtbl[105] = 8'h00; gtbl[105] = 8'hc1; btbl[105] = 8'h5a;
	rtbl[106] = 8'h00; gtbl[106] = 8'hc2; btbl[106] = 8'h56;
	rtbl[107] = 8'h00; gtbl[107] = 8'hc3; btbl[107] = 8'h52;
	rtbl[108] = 8'h00; gtbl[108] = 8'hc4; btbl[108] = 8'h4e;
	rtbl[109] = 8'h00; gtbl[109] = 8'hc5; btbl[109] = 8'h4a;
	rtbl[110] = 8'h00; gtbl[110] = 8'hc6; btbl[110] = 8'h47;
	rtbl[111] = 8'h00; gtbl[111] = 8'hc7; btbl[111] = 8'h43;
	rtbl[112] = 8'h00; gtbl[112] = 8'hc8; btbl[112] = 8'h3f;
	rtbl[113] = 8'h00; gtbl[113] = 8'hc9; btbl[113] = 8'h3b;
	rtbl[114] = 8'h00; gtbl[114] = 8'hca; btbl[114] = 8'h37;
	rtbl[115] = 8'h00; gtbl[115] = 8'hcb; btbl[115] = 8'h33;
	rtbl[116] = 8'h00; gtbl[116] = 8'hcc; btbl[116] = 8'h2f;
	rtbl[117] = 8'h00; gtbl[117] = 8'hce; btbl[117] = 8'h2b;
	rtbl[118] = 8'h00; gtbl[118] = 8'hcf; btbl[118] = 8'h27;
	rtbl[119] = 8'h00; gtbl[119] = 8'hd0; btbl[119] = 8'h23;
	rtbl[120] = 8'h00; gtbl[120] = 8'hd1; btbl[120] = 8'h1f;
	rtbl[121] = 8'h00; gtbl[121] = 8'hd2; btbl[121] = 8'h1b;
	rtbl[122] = 8'h00; gtbl[122] = 8'hd3; btbl[122] = 8'h17;
	rtbl[123] = 8'h00; gtbl[123] = 8'hd4; btbl[123] = 8'h13;
	rtbl[124] = 8'h00; gtbl[124] = 8'hd5; btbl[124] = 8'h0f;
	rtbl[125] = 8'h00; gtbl[125] = 8'hd6; btbl[125] = 8'h0b;
	rtbl[126] = 8'h00; gtbl[126] = 8'hd7; btbl[126] = 8'h07;
	rtbl[127] = 8'h00; gtbl[127] = 8'hd8; btbl[127] = 8'h03;
	rtbl[128] = 8'h00; gtbl[128] = 8'hd9; btbl[128] = 8'h00;
	rtbl[129] = 8'h03; gtbl[129] = 8'hd9; btbl[129] = 8'h00;
	rtbl[130] = 8'h07; gtbl[130] = 8'hd9; btbl[130] = 8'h00;
	rtbl[131] = 8'h0b; gtbl[131] = 8'hd8; btbl[131] = 8'h00;
	rtbl[132] = 8'h0e; gtbl[132] = 8'hd8; btbl[132] = 8'h00;
	rtbl[133] = 8'h12; gtbl[133] = 8'hd8; btbl[133] = 8'h00;
	rtbl[134] = 8'h16; gtbl[134] = 8'hd8; btbl[134] = 8'h00;
	rtbl[135] = 8'h1a; gtbl[135] = 8'hd7; btbl[135] = 8'h00;
	rtbl[136] = 8'h1d; gtbl[136] = 8'hd7; btbl[136] = 8'h00;
	rtbl[137] = 8'h21; gtbl[137] = 8'hd7; btbl[137] = 8'h00;
	rtbl[138] = 8'h25; gtbl[138] = 8'hd7; btbl[138] = 8'h00;
	rtbl[139] = 8'h29; gtbl[139] = 8'hd6; btbl[139] = 8'h00;
	rtbl[140] = 8'h2c; gtbl[140] = 8'hd6; btbl[140] = 8'h00;
	rtbl[141] = 8'h30; gtbl[141] = 8'hd6; btbl[141] = 8'h00;
	rtbl[142] = 8'h34; gtbl[142] = 8'hd6; btbl[142] = 8'h00;
	rtbl[143] = 8'h38; gtbl[143] = 8'hd5; btbl[143] = 8'h00;
	rtbl[144] = 8'h3b; gtbl[144] = 8'hd5; btbl[144] = 8'h00;
	rtbl[145] = 8'h3f; gtbl[145] = 8'hd5; btbl[145] = 8'h00;
	rtbl[146] = 8'h43; gtbl[146] = 8'hd5; btbl[146] = 8'h00;
	rtbl[147] = 8'h47; gtbl[147] = 8'hd4; btbl[147] = 8'h00;
	rtbl[148] = 8'h4a; gtbl[148] = 8'hd4; btbl[148] = 8'h00;
	rtbl[149] = 8'h4e; gtbl[149] = 8'hd4; btbl[149] = 8'h00;
	rtbl[150] = 8'h52; gtbl[150] = 8'hd4; btbl[150] = 8'h00;
	rtbl[151] = 8'h56; gtbl[151] = 8'hd3; btbl[151] = 8'h00;
	rtbl[152] = 8'h59; gtbl[152] = 8'hd3; btbl[152] = 8'h00;
	rtbl[153] = 8'h5d; gtbl[153] = 8'hd3; btbl[153] = 8'h00;
	rtbl[154] = 8'h61; gtbl[154] = 8'hd3; btbl[154] = 8'h00;
	rtbl[155] = 8'h65; gtbl[155] = 8'hd2; btbl[155] = 8'h00;
	rtbl[156] = 8'h68; gtbl[156] = 8'hd2; btbl[156] = 8'h00;
	rtbl[157] = 8'h6c; gtbl[157] = 8'hd2; btbl[157] = 8'h00;
	rtbl[158] = 8'h70; gtbl[158] = 8'hd2; btbl[158] = 8'h00;
	rtbl[159] = 8'h74; gtbl[159] = 8'hd1; btbl[159] = 8'h00;
	rtbl[160] = 8'h77; gtbl[160] = 8'hd1; btbl[160] = 8'h00;
	rtbl[161] = 8'h7b; gtbl[161] = 8'hd1; btbl[161] = 8'h00;
	rtbl[162] = 8'h7f; gtbl[162] = 8'hd1; btbl[162] = 8'h00;
	rtbl[163] = 8'h83; gtbl[163] = 8'hd0; btbl[163] = 8'h00;
	rtbl[164] = 8'h86; gtbl[164] = 8'hd0; btbl[164] = 8'h00;
	rtbl[165] = 8'h8a; gtbl[165] = 8'hd0; btbl[165] = 8'h00;
	rtbl[166] = 8'h8e; gtbl[166] = 8'hd0; btbl[166] = 8'h00;
	rtbl[167] = 8'h92; gtbl[167] = 8'hcf; btbl[167] = 8'h00;
	rtbl[168] = 8'h95; gtbl[168] = 8'hcf; btbl[168] = 8'h00;
	rtbl[169] = 8'h99; gtbl[169] = 8'hcf; btbl[169] = 8'h00;
	rtbl[170] = 8'h9d; gtbl[170] = 8'hcf; btbl[170] = 8'h00;
	rtbl[171] = 8'ha1; gtbl[171] = 8'hce; btbl[171] = 8'h00;
	rtbl[172] = 8'ha4; gtbl[172] = 8'hce; btbl[172] = 8'h00;
	rtbl[173] = 8'ha8; gtbl[173] = 8'hce; btbl[173] = 8'h00;
	rtbl[174] = 8'hac; gtbl[174] = 8'hce; btbl[174] = 8'h00;
	rtbl[175] = 8'hb0; gtbl[175] = 8'hcd; btbl[175] = 8'h00;
	rtbl[176] = 8'hb3; gtbl[176] = 8'hcd; btbl[176] = 8'h00;
	rtbl[177] = 8'hb7; gtbl[177] = 8'hcd; btbl[177] = 8'h00;
	rtbl[178] = 8'hbb; gtbl[178] = 8'hcd; btbl[178] = 8'h00;
	rtbl[179] = 8'hbf; gtbl[179] = 8'hcc; btbl[179] = 8'h00;
	rtbl[180] = 8'hc1; gtbl[180] = 8'hcb; btbl[180] = 8'h00;
	rtbl[181] = 8'hc3; gtbl[181] = 8'hca; btbl[181] = 8'h00;
	rtbl[182] = 8'hc5; gtbl[182] = 8'hc8; btbl[182] = 8'h00;
	rtbl[183] = 8'hc7; gtbl[183] = 8'hc6; btbl[183] = 8'h00;
	rtbl[184] = 8'hc9; gtbl[184] = 8'hc5; btbl[184] = 8'h00;
	rtbl[185] = 8'hcb; gtbl[185] = 8'hc3; btbl[185] = 8'h00;
	rtbl[186] = 8'hcd; gtbl[186] = 8'hc2; btbl[186] = 8'h00;
	rtbl[187] = 8'hce; gtbl[187] = 8'hc0; btbl[187] = 8'h00;
	rtbl[188] = 8'hd0; gtbl[188] = 8'hbf; btbl[188] = 8'h00;
	rtbl[189] = 8'hd2; gtbl[189] = 8'hbd; btbl[189] = 8'h00;
	rtbl[190] = 8'hd4; gtbl[190] = 8'hbc; btbl[190] = 8'h00;
	rtbl[191] = 8'hd6; gtbl[191] = 8'hba; btbl[191] = 8'h00;
	rtbl[192] = 8'hd8; gtbl[192] = 8'hb9; btbl[192] = 8'h00;
	rtbl[193] = 8'hda; gtbl[193] = 8'hb7; btbl[193] = 8'h00;
	rtbl[194] = 8'hdc; gtbl[194] = 8'hb6; btbl[194] = 8'h00;
	rtbl[195] = 8'hde; gtbl[195] = 8'hb4; btbl[195] = 8'h00;
	rtbl[196] = 8'he0; gtbl[196] = 8'hb2; btbl[196] = 8'h00;
	rtbl[197] = 8'he2; gtbl[197] = 8'hb1; btbl[197] = 8'h00;
	rtbl[198] = 8'he4; gtbl[198] = 8'haf; btbl[198] = 8'h00;
	rtbl[199] = 8'he6; gtbl[199] = 8'hae; btbl[199] = 8'h00;
	rtbl[200] = 8'he7; gtbl[200] = 8'hac; btbl[200] = 8'h00;
	rtbl[201] = 8'he9; gtbl[201] = 8'hab; btbl[201] = 8'h00;
	rtbl[202] = 8'heb; gtbl[202] = 8'ha9; btbl[202] = 8'h00;
	rtbl[203] = 8'hed; gtbl[203] = 8'ha8; btbl[203] = 8'h00;
	rtbl[204] = 8'hef; gtbl[204] = 8'ha6; btbl[204] = 8'h00;
	rtbl[205] = 8'hf1; gtbl[205] = 8'ha5; btbl[205] = 8'h00;
	rtbl[206] = 8'hf3; gtbl[206] = 8'ha3; btbl[206] = 8'h00;
	rtbl[207] = 8'hf5; gtbl[207] = 8'ha2; btbl[207] = 8'h00;
	rtbl[208] = 8'hf7; gtbl[208] = 8'ha0; btbl[208] = 8'h00;
	rtbl[209] = 8'hf9; gtbl[209] = 8'h9e; btbl[209] = 8'h00;
	rtbl[210] = 8'hfb; gtbl[210] = 8'h9d; btbl[210] = 8'h00;
	rtbl[211] = 8'hfd; gtbl[211] = 8'h9b; btbl[211] = 8'h00;
	rtbl[212] = 8'hff; gtbl[212] = 8'h9a; btbl[212] = 8'h00;
	rtbl[213] = 8'hff; gtbl[213] = 8'h97; btbl[213] = 8'h00;
	rtbl[214] = 8'hff; gtbl[214] = 8'h94; btbl[214] = 8'h00;
	rtbl[215] = 8'hff; gtbl[215] = 8'h90; btbl[215] = 8'h00;
	rtbl[216] = 8'hff; gtbl[216] = 8'h8d; btbl[216] = 8'h00;
	rtbl[217] = 8'hff; gtbl[217] = 8'h89; btbl[217] = 8'h00;
	rtbl[218] = 8'hff; gtbl[218] = 8'h86; btbl[218] = 8'h00;
	rtbl[219] = 8'hff; gtbl[219] = 8'h82; btbl[219] = 8'h00;
	rtbl[220] = 8'hff; gtbl[220] = 8'h7f; btbl[220] = 8'h00;
	rtbl[221] = 8'hff; gtbl[221] = 8'h7b; btbl[221] = 8'h00;
	rtbl[222] = 8'hff; gtbl[222] = 8'h77; btbl[222] = 8'h00;
	rtbl[223] = 8'hff; gtbl[223] = 8'h74; btbl[223] = 8'h00;
	rtbl[224] = 8'hff; gtbl[224] = 8'h70; btbl[224] = 8'h00;
	rtbl[225] = 8'hff; gtbl[225] = 8'h6d; btbl[225] = 8'h00;
	rtbl[226] = 8'hff; gtbl[226] = 8'h69; btbl[226] = 8'h00;
	rtbl[227] = 8'hff; gtbl[227] = 8'h66; btbl[227] = 8'h00;
	rtbl[228] = 8'hff; gtbl[228] = 8'h62; btbl[228] = 8'h00;
	rtbl[229] = 8'hff; gtbl[229] = 8'h5f; btbl[229] = 8'h00;
	rtbl[230] = 8'hff; gtbl[230] = 8'h5b; btbl[230] = 8'h00;
	rtbl[231] = 8'hff; gtbl[231] = 8'h58; btbl[231] = 8'h00;
	rtbl[232] = 8'hff; gtbl[232] = 8'h54; btbl[232] = 8'h00;
	rtbl[233] = 8'hff; gtbl[233] = 8'h51; btbl[233] = 8'h00;
	rtbl[234] = 8'hff; gtbl[234] = 8'h4d; btbl[234] = 8'h00;
	rtbl[235] = 8'hff; gtbl[235] = 8'h4a; btbl[235] = 8'h00;
	rtbl[236] = 8'hff; gtbl[236] = 8'h46; btbl[236] = 8'h00;
	rtbl[237] = 8'hff; gtbl[237] = 8'h43; btbl[237] = 8'h00;
	rtbl[238] = 8'hff; gtbl[238] = 8'h3f; btbl[238] = 8'h00;
	rtbl[239] = 8'hff; gtbl[239] = 8'h3b; btbl[239] = 8'h00;
	rtbl[240] = 8'hff; gtbl[240] = 8'h38; btbl[240] = 8'h00;
	rtbl[241] = 8'hff; gtbl[241] = 8'h34; btbl[241] = 8'h00;
	rtbl[242] = 8'hff; gtbl[242] = 8'h31; btbl[242] = 8'h00;
	rtbl[243] = 8'hff; gtbl[243] = 8'h2d; btbl[243] = 8'h00;
	rtbl[244] = 8'hff; gtbl[244] = 8'h2a; btbl[244] = 8'h00;
	rtbl[245] = 8'hff; gtbl[245] = 8'h26; btbl[245] = 8'h00;
	rtbl[246] = 8'hff; gtbl[246] = 8'h23; btbl[246] = 8'h00;
	rtbl[247] = 8'hff; gtbl[247] = 8'h1f; btbl[247] = 8'h00;
	rtbl[248] = 8'hff; gtbl[248] = 8'h1c; btbl[248] = 8'h00;
	rtbl[249] = 8'hff; gtbl[249] = 8'h18; btbl[249] = 8'h00;
	rtbl[250] = 8'hff; gtbl[250] = 8'h15; btbl[250] = 8'h00;
	rtbl[251] = 8'hff; gtbl[251] = 8'h11; btbl[251] = 8'h00;
	rtbl[252] = 8'hff; gtbl[252] = 8'h0e; btbl[252] = 8'h00;
	rtbl[253] = 8'hff; gtbl[253] = 8'h0a; btbl[253] = 8'h00;
	rtbl[254] = 8'hff; gtbl[254] = 8'h07; btbl[254] = 8'h00;
	end
	// }}}
endmodule
