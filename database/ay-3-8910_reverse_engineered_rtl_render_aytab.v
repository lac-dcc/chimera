module aytab
(
	input  wire [ 3:0] in,
	output wire [15:0] out
);
	wire [15:0] tbl [0:15];

	assign tbl[ 0] = 16'h0000;
	assign tbl[ 1] = 16'h0290;
	assign tbl[ 2] = 16'h03B0;
	assign tbl[ 3] = 16'h0560;
	assign tbl[ 4] = 16'h07E0;
	assign tbl[ 5] = 16'h0BB0;
	assign tbl[ 6] = 16'h1080;
	assign tbl[ 7] = 16'h1B80;
	assign tbl[ 8] = 16'h2070;
	assign tbl[ 9] = 16'h3480;
	assign tbl[10] = 16'h4AD0;
	assign tbl[11] = 16'h5F70;
	assign tbl[12] = 16'h7E10;
	assign tbl[13] = 16'hA2A0;
	assign tbl[14] = 16'hCE40;
	assign tbl[15] = 16'hFFFF;


	assign out = tbl[in];

endmodule

