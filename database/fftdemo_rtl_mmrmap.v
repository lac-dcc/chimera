////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	mmrmap.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	One of several false-color mapping functions
//
//	This has been sitting in my archives unused for a while.  I can't
//	remember where I first got it from.
//
////////////////////////////////////////////////////////////////////////////////
//
//
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	mmrmap(
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
	// Now define the color table(s) themselves
	// {{{
	////////////////////////////////////////////////////////////////////////
	//
	//
	initial begin
	rtbl[  0] = 8'h00; gtbl[  0] = 8'h00; btbl[  0] = 8'h00;
	rtbl[  1] = 8'h00; gtbl[  1] = 8'h00; btbl[  1] = 8'h00;
	rtbl[  2] = 8'h01; gtbl[  2] = 8'h01; btbl[  2] = 8'h00;
	rtbl[  3] = 8'h02; gtbl[  3] = 8'h02; btbl[  3] = 8'h00;
	rtbl[  4] = 8'h03; gtbl[  4] = 8'h03; btbl[  4] = 8'h00;
	rtbl[  5] = 8'h04; gtbl[  5] = 8'h04; btbl[  5] = 8'h00;
	rtbl[  6] = 8'h05; gtbl[  6] = 8'h05; btbl[  6] = 8'h00;
	rtbl[  7] = 8'h06; gtbl[  7] = 8'h06; btbl[  7] = 8'h00;
	rtbl[  8] = 8'h07; gtbl[  8] = 8'h07; btbl[  8] = 8'h00;
	rtbl[  9] = 8'h08; gtbl[  9] = 8'h08; btbl[  9] = 8'h00;
	rtbl[ 10] = 8'h09; gtbl[ 10] = 8'h09; btbl[ 10] = 8'h00;
	rtbl[ 11] = 8'h0a; gtbl[ 11] = 8'h0a; btbl[ 11] = 8'h00;
	rtbl[ 12] = 8'h0b; gtbl[ 12] = 8'h0b; btbl[ 12] = 8'h00;
	rtbl[ 13] = 8'h0c; gtbl[ 13] = 8'h0c; btbl[ 13] = 8'h00;
	rtbl[ 14] = 8'h0d; gtbl[ 14] = 8'h0d; btbl[ 14] = 8'h00;
	rtbl[ 15] = 8'h0e; gtbl[ 15] = 8'h0e; btbl[ 15] = 8'h00;
	rtbl[ 16] = 8'h0f; gtbl[ 16] = 8'h0f; btbl[ 16] = 8'h00;
	rtbl[ 17] = 8'h10; gtbl[ 17] = 8'h10; btbl[ 17] = 8'h01;
	rtbl[ 18] = 8'h11; gtbl[ 18] = 8'h11; btbl[ 18] = 8'h01;
	rtbl[ 19] = 8'h12; gtbl[ 19] = 8'h12; btbl[ 19] = 8'h01;
	rtbl[ 20] = 8'h13; gtbl[ 20] = 8'h13; btbl[ 20] = 8'h01;
	rtbl[ 21] = 8'h14; gtbl[ 21] = 8'h14; btbl[ 21] = 8'h01;
	rtbl[ 22] = 8'h15; gtbl[ 22] = 8'h15; btbl[ 22] = 8'h01;
	rtbl[ 23] = 8'h16; gtbl[ 23] = 8'h16; btbl[ 23] = 8'h02;
	rtbl[ 24] = 8'h17; gtbl[ 24] = 8'h17; btbl[ 24] = 8'h02;
	rtbl[ 25] = 8'h18; gtbl[ 25] = 8'h18; btbl[ 25] = 8'h02;
	rtbl[ 26] = 8'h19; gtbl[ 26] = 8'h19; btbl[ 26] = 8'h02;
	rtbl[ 27] = 8'h1a; gtbl[ 27] = 8'h1a; btbl[ 27] = 8'h02;
	rtbl[ 28] = 8'h1b; gtbl[ 28] = 8'h1b; btbl[ 28] = 8'h03;
	rtbl[ 29] = 8'h1c; gtbl[ 29] = 8'h1c; btbl[ 29] = 8'h03;
	rtbl[ 30] = 8'h1d; gtbl[ 30] = 8'h1d; btbl[ 30] = 8'h03;
	rtbl[ 31] = 8'h1e; gtbl[ 31] = 8'h1e; btbl[ 31] = 8'h03;
	rtbl[ 32] = 8'h1f; gtbl[ 32] = 8'h1f; btbl[ 32] = 8'h03;
	rtbl[ 33] = 8'h20; gtbl[ 33] = 8'h20; btbl[ 33] = 8'h04;
	rtbl[ 34] = 8'h21; gtbl[ 34] = 8'h21; btbl[ 34] = 8'h04;
	rtbl[ 35] = 8'h22; gtbl[ 35] = 8'h22; btbl[ 35] = 8'h04;
	rtbl[ 36] = 8'h23; gtbl[ 36] = 8'h23; btbl[ 36] = 8'h05;
	rtbl[ 37] = 8'h24; gtbl[ 37] = 8'h24; btbl[ 37] = 8'h05;
	rtbl[ 38] = 8'h25; gtbl[ 38] = 8'h25; btbl[ 38] = 8'h05;
	rtbl[ 39] = 8'h26; gtbl[ 39] = 8'h26; btbl[ 39] = 8'h05;
	rtbl[ 40] = 8'h27; gtbl[ 40] = 8'h27; btbl[ 40] = 8'h06;
	rtbl[ 41] = 8'h28; gtbl[ 41] = 8'h28; btbl[ 41] = 8'h06;
	rtbl[ 42] = 8'h29; gtbl[ 42] = 8'h29; btbl[ 42] = 8'h06;
	rtbl[ 43] = 8'h2a; gtbl[ 43] = 8'h2a; btbl[ 43] = 8'h07;
	rtbl[ 44] = 8'h2b; gtbl[ 44] = 8'h2b; btbl[ 44] = 8'h07;
	rtbl[ 45] = 8'h2c; gtbl[ 45] = 8'h2c; btbl[ 45] = 8'h07;
	rtbl[ 46] = 8'h2d; gtbl[ 46] = 8'h2d; btbl[ 46] = 8'h08;
	rtbl[ 47] = 8'h2e; gtbl[ 47] = 8'h2e; btbl[ 47] = 8'h08;
	rtbl[ 48] = 8'h2f; gtbl[ 48] = 8'h2f; btbl[ 48] = 8'h08;
	rtbl[ 49] = 8'h30; gtbl[ 49] = 8'h30; btbl[ 49] = 8'h09;
	rtbl[ 50] = 8'h31; gtbl[ 50] = 8'h31; btbl[ 50] = 8'h09;
	rtbl[ 51] = 8'h32; gtbl[ 51] = 8'h32; btbl[ 51] = 8'h0a;
	rtbl[ 52] = 8'h33; gtbl[ 52] = 8'h33; btbl[ 52] = 8'h0a;
	rtbl[ 53] = 8'h34; gtbl[ 53] = 8'h34; btbl[ 53] = 8'h0a;
	rtbl[ 54] = 8'h35; gtbl[ 54] = 8'h35; btbl[ 54] = 8'h0b;
	rtbl[ 55] = 8'h36; gtbl[ 55] = 8'h36; btbl[ 55] = 8'h0b;
	rtbl[ 56] = 8'h37; gtbl[ 56] = 8'h37; btbl[ 56] = 8'h0c;
	rtbl[ 57] = 8'h38; gtbl[ 57] = 8'h38; btbl[ 57] = 8'h0c;
	rtbl[ 58] = 8'h39; gtbl[ 58] = 8'h39; btbl[ 58] = 8'h0d;
	rtbl[ 59] = 8'h3a; gtbl[ 59] = 8'h3a; btbl[ 59] = 8'h0d;
	rtbl[ 60] = 8'h3b; gtbl[ 60] = 8'h3b; btbl[ 60] = 8'h0e;
	rtbl[ 61] = 8'h3c; gtbl[ 61] = 8'h3c; btbl[ 61] = 8'h0e;
	rtbl[ 62] = 8'h3d; gtbl[ 62] = 8'h3d; btbl[ 62] = 8'h0f;
	rtbl[ 63] = 8'h3e; gtbl[ 63] = 8'h3e; btbl[ 63] = 8'h0f;
	rtbl[ 64] = 8'h3f; gtbl[ 64] = 8'h3f; btbl[ 64] = 8'h0f;
	rtbl[ 65] = 8'h40; gtbl[ 65] = 8'h40; btbl[ 65] = 8'h10;
	rtbl[ 66] = 8'h41; gtbl[ 66] = 8'h41; btbl[ 66] = 8'h11;
	rtbl[ 67] = 8'h42; gtbl[ 67] = 8'h42; btbl[ 67] = 8'h11;
	rtbl[ 68] = 8'h43; gtbl[ 68] = 8'h43; btbl[ 68] = 8'h12;
	rtbl[ 69] = 8'h44; gtbl[ 69] = 8'h44; btbl[ 69] = 8'h12;
	rtbl[ 70] = 8'h45; gtbl[ 70] = 8'h45; btbl[ 70] = 8'h13;
	rtbl[ 71] = 8'h46; gtbl[ 71] = 8'h46; btbl[ 71] = 8'h13;
	rtbl[ 72] = 8'h47; gtbl[ 72] = 8'h47; btbl[ 72] = 8'h14;
	rtbl[ 73] = 8'h48; gtbl[ 73] = 8'h48; btbl[ 73] = 8'h14;
	rtbl[ 74] = 8'h49; gtbl[ 74] = 8'h49; btbl[ 74] = 8'h15;
	rtbl[ 75] = 8'h4a; gtbl[ 75] = 8'h4a; btbl[ 75] = 8'h15;
	rtbl[ 76] = 8'h4b; gtbl[ 76] = 8'h4b; btbl[ 76] = 8'h16;
	rtbl[ 77] = 8'h4c; gtbl[ 77] = 8'h4c; btbl[ 77] = 8'h17;
	rtbl[ 78] = 8'h4d; gtbl[ 78] = 8'h4d; btbl[ 78] = 8'h17;
	rtbl[ 79] = 8'h4e; gtbl[ 79] = 8'h4e; btbl[ 79] = 8'h18;
	rtbl[ 80] = 8'h4f; gtbl[ 80] = 8'h4f; btbl[ 80] = 8'h18;
	rtbl[ 81] = 8'h50; gtbl[ 81] = 8'h50; btbl[ 81] = 8'h19;
	rtbl[ 82] = 8'h51; gtbl[ 82] = 8'h51; btbl[ 82] = 8'h1a;
	rtbl[ 83] = 8'h52; gtbl[ 83] = 8'h52; btbl[ 83] = 8'h1a;
	rtbl[ 84] = 8'h53; gtbl[ 84] = 8'h53; btbl[ 84] = 8'h1b;
	rtbl[ 85] = 8'h54; gtbl[ 85] = 8'h54; btbl[ 85] = 8'h1c;
	rtbl[ 86] = 8'h55; gtbl[ 86] = 8'h55; btbl[ 86] = 8'h1c;
	rtbl[ 87] = 8'h56; gtbl[ 87] = 8'h56; btbl[ 87] = 8'h1d;
	rtbl[ 88] = 8'h57; gtbl[ 88] = 8'h57; btbl[ 88] = 8'h1e;
	rtbl[ 89] = 8'h58; gtbl[ 89] = 8'h58; btbl[ 89] = 8'h1e;
	rtbl[ 90] = 8'h59; gtbl[ 90] = 8'h59; btbl[ 90] = 8'h1f;
	rtbl[ 91] = 8'h5a; gtbl[ 91] = 8'h5a; btbl[ 91] = 8'h20;
	rtbl[ 92] = 8'h5b; gtbl[ 92] = 8'h5b; btbl[ 92] = 8'h21;
	rtbl[ 93] = 8'h5c; gtbl[ 93] = 8'h5c; btbl[ 93] = 8'h21;
	rtbl[ 94] = 8'h5d; gtbl[ 94] = 8'h5d; btbl[ 94] = 8'h22;
	rtbl[ 95] = 8'h5e; gtbl[ 95] = 8'h5e; btbl[ 95] = 8'h23;
	rtbl[ 96] = 8'h5f; gtbl[ 96] = 8'h5f; btbl[ 96] = 8'h23;
	rtbl[ 97] = 8'h60; gtbl[ 97] = 8'h60; btbl[ 97] = 8'h24;
	rtbl[ 98] = 8'h61; gtbl[ 98] = 8'h61; btbl[ 98] = 8'h25;
	rtbl[ 99] = 8'h62; gtbl[ 99] = 8'h62; btbl[ 99] = 8'h26;
	rtbl[100] = 8'h63; gtbl[100] = 8'h63; btbl[100] = 8'h27;
	rtbl[101] = 8'h64; gtbl[101] = 8'h64; btbl[101] = 8'h27;
	rtbl[102] = 8'h65; gtbl[102] = 8'h65; btbl[102] = 8'h28;
	rtbl[103] = 8'h66; gtbl[103] = 8'h66; btbl[103] = 8'h29;
	rtbl[104] = 8'h67; gtbl[104] = 8'h67; btbl[104] = 8'h2a;
	rtbl[105] = 8'h68; gtbl[105] = 8'h68; btbl[105] = 8'h2b;
	rtbl[106] = 8'h69; gtbl[106] = 8'h69; btbl[106] = 8'h2b;
	rtbl[107] = 8'h6a; gtbl[107] = 8'h6a; btbl[107] = 8'h2c;
	rtbl[108] = 8'h6b; gtbl[108] = 8'h6b; btbl[108] = 8'h2d;
	rtbl[109] = 8'h6c; gtbl[109] = 8'h6c; btbl[109] = 8'h2e;
	rtbl[110] = 8'h6d; gtbl[110] = 8'h6d; btbl[110] = 8'h2f;
	rtbl[111] = 8'h6e; gtbl[111] = 8'h6e; btbl[111] = 8'h30;
	rtbl[112] = 8'h6f; gtbl[112] = 8'h6f; btbl[112] = 8'h30;
	rtbl[113] = 8'h70; gtbl[113] = 8'h70; btbl[113] = 8'h31;
	rtbl[114] = 8'h71; gtbl[114] = 8'h71; btbl[114] = 8'h32;
	rtbl[115] = 8'h72; gtbl[115] = 8'h72; btbl[115] = 8'h33;
	rtbl[116] = 8'h73; gtbl[116] = 8'h73; btbl[116] = 8'h34;
	rtbl[117] = 8'h74; gtbl[117] = 8'h74; btbl[117] = 8'h35;
	rtbl[118] = 8'h75; gtbl[118] = 8'h75; btbl[118] = 8'h36;
	rtbl[119] = 8'h76; gtbl[119] = 8'h76; btbl[119] = 8'h37;
	rtbl[120] = 8'h77; gtbl[120] = 8'h77; btbl[120] = 8'h38;
	rtbl[121] = 8'h78; gtbl[121] = 8'h78; btbl[121] = 8'h39;
	rtbl[122] = 8'h79; gtbl[122] = 8'h79; btbl[122] = 8'h3a;
	rtbl[123] = 8'h7a; gtbl[123] = 8'h7a; btbl[123] = 8'h3b;
	rtbl[124] = 8'h7b; gtbl[124] = 8'h7b; btbl[124] = 8'h3c;
	rtbl[125] = 8'h7c; gtbl[125] = 8'h7c; btbl[125] = 8'h3d;
	rtbl[126] = 8'h7d; gtbl[126] = 8'h7d; btbl[126] = 8'h3e;
	rtbl[127] = 8'h7e; gtbl[127] = 8'h7e; btbl[127] = 8'h3f;
	rtbl[128] = 8'h7f; gtbl[128] = 8'h7f; btbl[128] = 8'h3f;
	rtbl[129] = 8'h80; gtbl[129] = 8'h80; btbl[129] = 8'h41;
	rtbl[130] = 8'h81; gtbl[130] = 8'h81; btbl[130] = 8'h42;
	rtbl[131] = 8'h82; gtbl[131] = 8'h82; btbl[131] = 8'h43;
	rtbl[132] = 8'h83; gtbl[132] = 8'h83; btbl[132] = 8'h44;
	rtbl[133] = 8'h84; gtbl[133] = 8'h84; btbl[133] = 8'h45;
	rtbl[134] = 8'h85; gtbl[134] = 8'h85; btbl[134] = 8'h46;
	rtbl[135] = 8'h86; gtbl[135] = 8'h86; btbl[135] = 8'h47;
	rtbl[136] = 8'h87; gtbl[136] = 8'h87; btbl[136] = 8'h48;
	rtbl[137] = 8'h88; gtbl[137] = 8'h88; btbl[137] = 8'h49;
	rtbl[138] = 8'h89; gtbl[138] = 8'h89; btbl[138] = 8'h4a;
	rtbl[139] = 8'h8a; gtbl[139] = 8'h8a; btbl[139] = 8'h4b;
	rtbl[140] = 8'h8b; gtbl[140] = 8'h8b; btbl[140] = 8'h4c;
	rtbl[141] = 8'h8c; gtbl[141] = 8'h8c; btbl[141] = 8'h4d;
	rtbl[142] = 8'h8d; gtbl[142] = 8'h8d; btbl[142] = 8'h4e;
	rtbl[143] = 8'h8e; gtbl[143] = 8'h8e; btbl[143] = 8'h4f;
	rtbl[144] = 8'h8f; gtbl[144] = 8'h8f; btbl[144] = 8'h50;
	rtbl[145] = 8'h90; gtbl[145] = 8'h90; btbl[145] = 8'h52;
	rtbl[146] = 8'h91; gtbl[146] = 8'h91; btbl[146] = 8'h53;
	rtbl[147] = 8'h92; gtbl[147] = 8'h92; btbl[147] = 8'h54;
	rtbl[148] = 8'h93; gtbl[148] = 8'h93; btbl[148] = 8'h55;
	rtbl[149] = 8'h94; gtbl[149] = 8'h94; btbl[149] = 8'h56;
	rtbl[150] = 8'h95; gtbl[150] = 8'h95; btbl[150] = 8'h57;
	rtbl[151] = 8'h96; gtbl[151] = 8'h96; btbl[151] = 8'h59;
	rtbl[152] = 8'h97; gtbl[152] = 8'h97; btbl[152] = 8'h5a;
	rtbl[153] = 8'h98; gtbl[153] = 8'h98; btbl[153] = 8'h5b;
	rtbl[154] = 8'h99; gtbl[154] = 8'h99; btbl[154] = 8'h5c;
	rtbl[155] = 8'h9a; gtbl[155] = 8'h9a; btbl[155] = 8'h5d;
	rtbl[156] = 8'h9b; gtbl[156] = 8'h9b; btbl[156] = 8'h5f;
	rtbl[157] = 8'h9c; gtbl[157] = 8'h9c; btbl[157] = 8'h60;
	rtbl[158] = 8'h9d; gtbl[158] = 8'h9d; btbl[158] = 8'h61;
	rtbl[159] = 8'h9e; gtbl[159] = 8'h9e; btbl[159] = 8'h62;
	rtbl[160] = 8'h9f; gtbl[160] = 8'h9f; btbl[160] = 8'h63;
	rtbl[161] = 8'ha0; gtbl[161] = 8'ha0; btbl[161] = 8'h65;
	rtbl[162] = 8'ha1; gtbl[162] = 8'ha1; btbl[162] = 8'h66;
	rtbl[163] = 8'ha2; gtbl[163] = 8'ha2; btbl[163] = 8'h67;
	rtbl[164] = 8'ha3; gtbl[164] = 8'ha3; btbl[164] = 8'h69;
	rtbl[165] = 8'ha4; gtbl[165] = 8'ha4; btbl[165] = 8'h6a;
	rtbl[166] = 8'ha5; gtbl[166] = 8'ha5; btbl[166] = 8'h6b;
	rtbl[167] = 8'ha6; gtbl[167] = 8'ha6; btbl[167] = 8'h6c;
	rtbl[168] = 8'ha7; gtbl[168] = 8'ha7; btbl[168] = 8'h6e;
	rtbl[169] = 8'ha8; gtbl[169] = 8'ha8; btbl[169] = 8'h6f;
	rtbl[170] = 8'ha9; gtbl[170] = 8'ha9; btbl[170] = 8'h70;
	rtbl[171] = 8'haa; gtbl[171] = 8'haa; btbl[171] = 8'h72;
	rtbl[172] = 8'hab; gtbl[172] = 8'hab; btbl[172] = 8'h73;
	rtbl[173] = 8'hac; gtbl[173] = 8'hac; btbl[173] = 8'h74;
	rtbl[174] = 8'had; gtbl[174] = 8'had; btbl[174] = 8'h76;
	rtbl[175] = 8'hae; gtbl[175] = 8'hae; btbl[175] = 8'h77;
	rtbl[176] = 8'haf; gtbl[176] = 8'haf; btbl[176] = 8'h78;
	rtbl[177] = 8'hb0; gtbl[177] = 8'hb0; btbl[177] = 8'h7a;
	rtbl[178] = 8'hb1; gtbl[178] = 8'hb1; btbl[178] = 8'h7b;
	rtbl[179] = 8'hb2; gtbl[179] = 8'hb2; btbl[179] = 8'h7d;
	rtbl[180] = 8'hb3; gtbl[180] = 8'hb3; btbl[180] = 8'h7e;
	rtbl[181] = 8'hb4; gtbl[181] = 8'hb4; btbl[181] = 8'h7f;
	rtbl[182] = 8'hb5; gtbl[182] = 8'hb5; btbl[182] = 8'h81;
	rtbl[183] = 8'hb6; gtbl[183] = 8'hb6; btbl[183] = 8'h82;
	rtbl[184] = 8'hb7; gtbl[184] = 8'hb7; btbl[184] = 8'h84;
	rtbl[185] = 8'hb8; gtbl[185] = 8'hb8; btbl[185] = 8'h85;
	rtbl[186] = 8'hb9; gtbl[186] = 8'hb9; btbl[186] = 8'h87;
	rtbl[187] = 8'hba; gtbl[187] = 8'hba; btbl[187] = 8'h88;
	rtbl[188] = 8'hbb; gtbl[188] = 8'hbb; btbl[188] = 8'h8a;
	rtbl[189] = 8'hbc; gtbl[189] = 8'hbc; btbl[189] = 8'h8b;
	rtbl[190] = 8'hbd; gtbl[190] = 8'hbd; btbl[190] = 8'h8d;
	rtbl[191] = 8'hbe; gtbl[191] = 8'hbe; btbl[191] = 8'h8e;
	rtbl[192] = 8'hbf; gtbl[192] = 8'hbf; btbl[192] = 8'h8f;
	rtbl[193] = 8'hc0; gtbl[193] = 8'hc0; btbl[193] = 8'h91;
	rtbl[194] = 8'hc1; gtbl[194] = 8'hc1; btbl[194] = 8'h93;
	rtbl[195] = 8'hc2; gtbl[195] = 8'hc2; btbl[195] = 8'h94;
	rtbl[196] = 8'hc3; gtbl[196] = 8'hc3; btbl[196] = 8'h96;
	rtbl[197] = 8'hc4; gtbl[197] = 8'hc4; btbl[197] = 8'h97;
	rtbl[198] = 8'hc5; gtbl[198] = 8'hc5; btbl[198] = 8'h99;
	rtbl[199] = 8'hc6; gtbl[199] = 8'hc6; btbl[199] = 8'h9a;
	rtbl[200] = 8'hc7; gtbl[200] = 8'hc7; btbl[200] = 8'h9c;
	rtbl[201] = 8'hc8; gtbl[201] = 8'hc8; btbl[201] = 8'h9d;
	rtbl[202] = 8'hc9; gtbl[202] = 8'hc9; btbl[202] = 8'h9f;
	rtbl[203] = 8'hca; gtbl[203] = 8'hca; btbl[203] = 8'ha0;
	rtbl[204] = 8'hcb; gtbl[204] = 8'hcb; btbl[204] = 8'ha2;
	rtbl[205] = 8'hcc; gtbl[205] = 8'hcc; btbl[205] = 8'ha4;
	rtbl[206] = 8'hcd; gtbl[206] = 8'hcd; btbl[206] = 8'ha5;
	rtbl[207] = 8'hce; gtbl[207] = 8'hce; btbl[207] = 8'ha7;
	rtbl[208] = 8'hcf; gtbl[208] = 8'hcf; btbl[208] = 8'ha8;
	rtbl[209] = 8'hd0; gtbl[209] = 8'hd0; btbl[209] = 8'haa;
	rtbl[210] = 8'hd1; gtbl[210] = 8'hd1; btbl[210] = 8'hac;
	rtbl[211] = 8'hd2; gtbl[211] = 8'hd2; btbl[211] = 8'had;
	rtbl[212] = 8'hd3; gtbl[212] = 8'hd3; btbl[212] = 8'haf;
	rtbl[213] = 8'hd4; gtbl[213] = 8'hd4; btbl[213] = 8'hb1;
	rtbl[214] = 8'hd5; gtbl[214] = 8'hd5; btbl[214] = 8'hb2;
	rtbl[215] = 8'hd6; gtbl[215] = 8'hd6; btbl[215] = 8'hb4;
	rtbl[216] = 8'hd7; gtbl[216] = 8'hd7; btbl[216] = 8'hb6;
	rtbl[217] = 8'hd8; gtbl[217] = 8'hd8; btbl[217] = 8'hb7;
	rtbl[218] = 8'hd9; gtbl[218] = 8'hd9; btbl[218] = 8'hb9;
	rtbl[219] = 8'hda; gtbl[219] = 8'hda; btbl[219] = 8'hbb;
	rtbl[220] = 8'hdb; gtbl[220] = 8'hdb; btbl[220] = 8'hbd;
	rtbl[221] = 8'hdc; gtbl[221] = 8'hdc; btbl[221] = 8'hbe;
	rtbl[222] = 8'hdd; gtbl[222] = 8'hdd; btbl[222] = 8'hc0;
	rtbl[223] = 8'hde; gtbl[223] = 8'hde; btbl[223] = 8'hc2;
	rtbl[224] = 8'hdf; gtbl[224] = 8'hdf; btbl[224] = 8'hc3;
	rtbl[225] = 8'he0; gtbl[225] = 8'he0; btbl[225] = 8'hc5;
	rtbl[226] = 8'he1; gtbl[226] = 8'he1; btbl[226] = 8'hc7;
	rtbl[227] = 8'he2; gtbl[227] = 8'he2; btbl[227] = 8'hc9;
	rtbl[228] = 8'he3; gtbl[228] = 8'he3; btbl[228] = 8'hcb;
	rtbl[229] = 8'he4; gtbl[229] = 8'he4; btbl[229] = 8'hcc;
	rtbl[230] = 8'he5; gtbl[230] = 8'he5; btbl[230] = 8'hce;
	rtbl[231] = 8'he6; gtbl[231] = 8'he6; btbl[231] = 8'hd0;
	rtbl[232] = 8'he7; gtbl[232] = 8'he7; btbl[232] = 8'hd2;
	rtbl[233] = 8'he8; gtbl[233] = 8'he8; btbl[233] = 8'hd4;
	rtbl[234] = 8'he9; gtbl[234] = 8'he9; btbl[234] = 8'hd5;
	rtbl[235] = 8'hea; gtbl[235] = 8'hea; btbl[235] = 8'hd7;
	rtbl[236] = 8'heb; gtbl[236] = 8'heb; btbl[236] = 8'hd9;
	rtbl[237] = 8'hec; gtbl[237] = 8'hec; btbl[237] = 8'hdb;
	rtbl[238] = 8'hed; gtbl[238] = 8'hed; btbl[238] = 8'hdd;
	rtbl[239] = 8'hee; gtbl[239] = 8'hee; btbl[239] = 8'hdf;
	rtbl[240] = 8'hef; gtbl[240] = 8'hef; btbl[240] = 8'he0;
	rtbl[241] = 8'hf0; gtbl[241] = 8'hf0; btbl[241] = 8'he2;
	rtbl[242] = 8'hf1; gtbl[242] = 8'hf1; btbl[242] = 8'he4;
	rtbl[243] = 8'hf2; gtbl[243] = 8'hf2; btbl[243] = 8'he6;
	rtbl[244] = 8'hf3; gtbl[244] = 8'hf3; btbl[244] = 8'he8;
	rtbl[245] = 8'hf4; gtbl[245] = 8'hf4; btbl[245] = 8'hea;
	rtbl[246] = 8'hf5; gtbl[246] = 8'hf5; btbl[246] = 8'hec;
	rtbl[247] = 8'hf6; gtbl[247] = 8'hf6; btbl[247] = 8'hee;
	rtbl[248] = 8'hf7; gtbl[248] = 8'hf7; btbl[248] = 8'hf0;
	rtbl[249] = 8'hf8; gtbl[249] = 8'hf8; btbl[249] = 8'hf2;
	rtbl[250] = 8'hf9; gtbl[250] = 8'hf9; btbl[250] = 8'hf4;
	rtbl[251] = 8'hfa; gtbl[251] = 8'hfa; btbl[251] = 8'hf6;
	rtbl[252] = 8'hfb; gtbl[252] = 8'hfb; btbl[252] = 8'hf8;
	rtbl[253] = 8'hfc; gtbl[253] = 8'hfc; btbl[253] = 8'hfa;
	rtbl[254] = 8'hfd; gtbl[254] = 8'hfd; btbl[254] = 8'hfc;
	end
	// }}}
endmodule
