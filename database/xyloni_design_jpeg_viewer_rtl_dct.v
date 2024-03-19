module dct
(
	input	[2:0]i_Gxy,
	input	[2:0]i_Buv,
	output	[8:0]o_dct
);

wire	[8:0]w_dct[0:63];

wire	[8:0]w_p9807, w_p9238, w_p8314, w_p7071, w_p5555, w_p3826, w_p1950;
wire	[8:0]w_n9807, w_n9238, w_n8314, w_n7071, w_n5555, w_n3826, w_n1950;

assign	w_p9807	= 9'd251;
assign	w_p9238	= 9'd237;
assign	w_p8314	= 9'd213;
assign	w_p7071	= 9'd181;
assign	w_p5555	= 9'd142;
assign	w_p3826	= 9'd98;
assign	w_p1950	= 9'd50;

assign	w_n9807	= ~w_p9807+1'b1;
assign	w_n9238	= ~w_p9238+1'b1;
assign	w_n8314	= ~w_p8314+1'b1;
assign	w_n7071	= ~w_p7071+1'b1;
assign	w_n5555	= ~w_p5555+1'b1;
assign	w_n3826	= ~w_p3826+1'b1;
assign	w_n1950	= ~w_p1950+1'b1;

assign	w_dct[0]	= w_p7071;
assign	w_dct[1]	= w_p9807;
assign	w_dct[2]	= w_p9238;
assign	w_dct[3]	= w_p8314;
assign	w_dct[4]	= w_p7071;
assign	w_dct[5]	= w_p5555;
assign	w_dct[6]	= w_p3826;
assign	w_dct[7]	= w_p1950;

assign	w_dct[8]	= w_p7071;
assign	w_dct[9]	= w_p8314;
assign	w_dct[10]	= w_p3826;
assign	w_dct[11]	= w_n1950;
assign	w_dct[12]	= w_n7071;
assign	w_dct[13]	= w_n9807;
assign	w_dct[14]	= w_n9238;
assign	w_dct[15]	= w_n5555;

assign	w_dct[16]	= w_p7071;
assign	w_dct[17]	= w_p5555;
assign	w_dct[18]	= w_n3826;
assign	w_dct[19]	= w_n9807;
assign	w_dct[20]	= w_n7071;
assign	w_dct[21]	= w_p1950;
assign	w_dct[22]	= w_p9238;
assign	w_dct[23]	= w_p8314;

assign	w_dct[24]	= w_p7071;
assign	w_dct[25]	= w_p1950;
assign	w_dct[26]	= w_n9238;
assign	w_dct[27]	= w_n5555;
assign	w_dct[28]	= w_p7071;
assign	w_dct[29]	= w_p8314;
assign	w_dct[30]	= w_n3826;
assign	w_dct[31]	= w_n9807;

assign	w_dct[32]	= w_p7071;
assign	w_dct[33]	= w_n1950;
assign	w_dct[34]	= w_n9238;
assign	w_dct[35]	= w_p5555;
assign	w_dct[36]	= w_p7071;
assign	w_dct[37]	= w_n8314;
assign	w_dct[38]	= w_n3826;
assign	w_dct[39]	= w_p9807;

assign	w_dct[40]	= w_p7071;
assign	w_dct[41]	= w_n5555;
assign	w_dct[42]	= w_n3826;
assign	w_dct[43]	= w_p9807;
assign	w_dct[44]	= w_n7071;
assign	w_dct[45]	= w_n1950;
assign	w_dct[46]	= w_p9238;
assign	w_dct[47]	= w_n8314;

assign	w_dct[48]	= w_p7071;
assign	w_dct[49]	= w_n8314;
assign	w_dct[50]	= w_p3826;
assign	w_dct[51]	= w_p1950;
assign	w_dct[52]	= w_n7071;
assign	w_dct[53]	= w_p9807;
assign	w_dct[54]	= w_n9238;
assign	w_dct[55]	= w_p5555;

assign	w_dct[56]	= w_p7071;
assign	w_dct[57]	= w_n9807;
assign	w_dct[58]	= w_p9238;
assign	w_dct[59]	= w_n8314;
assign	w_dct[60]	= w_p7071;
assign	w_dct[61]	= w_n5555;
assign	w_dct[62]	= w_p3826;
assign	w_dct[63]	= w_n1950;

assign	o_dct	= w_dct[{i_Gxy, i_Buv}];

endmodule
