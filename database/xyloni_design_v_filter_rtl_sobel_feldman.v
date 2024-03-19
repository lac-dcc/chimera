module sobel_feldman
#(
	parameter	Y_DEPTH	= 8
)
(
	input	i_arst,
	input	i_pclk,
	
	input	[Y_DEPTH-1:0]i_pixel_11_01,
	input	[Y_DEPTH-1:0]i_pixel_00_01,
	input	[Y_DEPTH-1:0]i_pixel_01_01,
	
	
	output	[Y_DEPTH-1:0]o_pixel
);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// x -1  0 +1  y
//
//   -1  0  1 -1
//   -2  0  2  0
//   -1  0  1 +1
//
//   -1 -2 -1 -1
//    0  0  0  0
//    1  2  1 +1
//
//	PL_11_11_2P		PL_11_00_1P		PL_11_01_0P
//	PL_00_11_2P		PL_00_00_1P		PL_00_01_0P
//	PL_01_11_2P		PL_01_00_1P		PL_01_01_0P
//
//					GX_11_11_3P		GX_11_00_2P		GX_11_01_1P
//					GX_00_11_3P		GX_00_00_2P		GX_00_01_1P
//					GX_01_11_3P		GX_01_00_2P		GX_01_01_1P
//										0
//									GXS_11_4P						GX_11_01_2P		GXS_11_5P
//									GXS_00_4P						GX_00_01_2P     GXS_00_5P	GXS_00_6P	GXS_00_7P
//									GXS_01_4P						GX_01_01_2P		GXS_01_5P	GXS_01_6P
//
//					GY_11_11_3P		GY_11_00_2P		GY_11_01_1P
//					GY_00_11_3P		GY_00_00_2P		GY_00_01_1P		0
//					GY_01_11_3P		GY_01_00_2P		GY_01_01_1P
//
//									GYS_11_4P						GY_11_01_2P		GYS_11_5P
//									GYS_00_4P						GY_00_01_2P		GYS_00_5P	GYS_00_6P	GYS_00_7P
//									GYS_01_4P						GY_01_01_2P		GYS_01_5P	GYS_01_6P
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

reg		[Y_DEPTH-1:0]r_p_11_00_1P, r_p_11_11_2P;
reg		[Y_DEPTH-1:0]r_p_00_00_1P, r_p_00_11_2P;
reg		[Y_DEPTH-1:0]r_p_01_00_1P, r_p_01_11_2P;

reg		[Y_DEPTH+2-1:0]r_gx_11_01_2P;
reg		[Y_DEPTH+2-1:0]r_gx_00_01_2P;
reg		[Y_DEPTH+2-1:0]r_gx_01_01_2P;

reg		[Y_DEPTH+2-1:0]r_gxs_11_4P, r_gxs_11_5P;
reg		[Y_DEPTH+2-1:0]r_gxs_00_4P, r_gxs_00_5P, r_gxs_00_6P, r_gxs_00_7P;
reg		[Y_DEPTH+2-1:0]r_gxs_01_4P, r_gxs_01_5P, r_gxs_01_6P;

reg		[Y_DEPTH+2-1:0]r_gy_11_01_2P;
reg		[Y_DEPTH+2-1:0]r_gy_00_01_2P;
reg		[Y_DEPTH+2-1:0]r_gy_01_01_2P;

reg		[Y_DEPTH+2-1:0]r_gys_11_4P, r_gys_11_5P;
reg		[Y_DEPTH+2-1:0]r_gys_00_4P, r_gys_00_5P, r_gys_00_6P, r_gys_00_7P;
reg		[Y_DEPTH+2-1:0]r_gys_01_4P, r_gys_01_5P, r_gys_01_6P;

reg		[Y_DEPTH+2-1:0]r_gxs_00_8P;
reg		[Y_DEPTH+2-1:0]r_gys_00_8P;

reg		[Y_DEPTH+2-1:0]r_g_9P;
reg		[Y_DEPTH-1:0]r_g_10P;

wire	[Y_DEPTH+2-1:0]w_gx_11_01_1P, w_gx_11_00_2P, w_gx_11_11_3P;
wire	[Y_DEPTH+2-1:0]w_gx_00_01_1P, w_gx_00_00_2P, w_gx_00_11_3P;
wire	[Y_DEPTH+2-1:0]w_gx_01_01_1P, w_gx_01_00_2P, w_gx_01_11_3P;

wire	[Y_DEPTH+2-1:0]w_gy_11_01_1P, w_gy_11_00_2P, w_gy_11_11_3P;
wire	[Y_DEPTH+2-1:0]w_gy_00_01_1P, w_gy_00_00_2P, w_gy_00_11_3P;
wire	[Y_DEPTH+2-1:0]w_gy_01_01_1P, w_gy_01_00_2P, w_gy_01_11_3P;

assign	w_gx_11_00_2P	= {Y_DEPTH+2{1'b0}};
assign	w_gx_00_00_2P	= {Y_DEPTH+2{1'b0}};
assign	w_gx_01_00_2P	= {Y_DEPTH+2{1'b0}};

assign	w_gy_00_01_1P	= {Y_DEPTH+2{1'b0}};
assign	w_gy_00_00_2P	= {Y_DEPTH+2{1'b0}};
assign	w_gy_00_11_3P	= {Y_DEPTH+2{1'b0}};

////////////////////////////////////////////////////////////////
// x - 1

multi_n1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gx_11_11
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(r_p_11_11_2P),
	.o_q	(w_gx_11_11_3P)
);

multi_n2_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gx_00_11
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(r_p_00_11_2P),
	.o_q	(w_gx_00_11_3P)
);

multi_n1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gx_01_11
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(r_p_01_11_2P),
	.o_q	(w_gx_01_11_3P)
);

////////////////////////////////////////////////////////////////
// x + 1

multi_p1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gx_11_01
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(i_pixel_11_01),
	.o_q	(w_gx_11_01_1P)
);

multi_p2_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gx_00_01
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(i_pixel_00_01),
	.o_q	(w_gx_00_01_1P)
);

multi_p1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gx_01_01
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(i_pixel_01_01),
	.o_q	(w_gx_01_01_1P)
);

////////////////////////////////////////////////////////////////
// y - 1

multi_n1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gy_11_11
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(r_p_11_11_2P),
	.o_q	(w_gy_11_11_3P)
);

multi_n2_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gy_11_00
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(r_p_11_00_1P),
	.o_q	(w_gy_11_00_2P)
);

multi_n1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gy_11_01
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(i_pixel_11_01),
	.o_q	(w_gy_11_01_1P)
);

////////////////////////////////////////////////////////////////
// y + 1

multi_p1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gy_01_11
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(r_p_01_11_2P),
	.o_q	(w_gy_01_11_3P)
);

multi_p2_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gy_01_00
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(r_p_01_00_1P),
	.o_q	(w_gy_01_00_2P)
);

multi_p1_ext2
#(
	.D_WIDTH(Y_DEPTH)
)
inst_gy_01_01
(
	.i_arst	(i_arst),
	.i_clk	(i_pclk),
	.i_d	(i_pixel_01_01),
	.o_q	(w_gy_01_01_1P)
);

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_p_11_00_1P	<= {Y_DEPTH{1'b0}};
		r_p_11_11_2P	<= {Y_DEPTH{1'b0}};
		r_p_00_00_1P	<= {Y_DEPTH{1'b0}};
		r_p_00_11_2P	<= {Y_DEPTH{1'b0}};
		r_p_01_00_1P	<= {Y_DEPTH{1'b0}};
		r_p_01_11_2P	<= {Y_DEPTH{1'b0}};
		
		////////////////////////////////
		
		r_gx_11_01_2P	<= {Y_DEPTH+2{1'b0}};
		r_gx_00_01_2P	<= {Y_DEPTH+2{1'b0}};
		r_gx_01_01_2P	<= {Y_DEPTH+2{1'b0}};
		
		r_gxs_11_4P		<= {Y_DEPTH+2{1'b0}};
		r_gxs_00_4P		<= {Y_DEPTH+2{1'b0}};
		r_gxs_01_4P		<= {Y_DEPTH+2{1'b0}};
		
		r_gxs_11_5P		<= {Y_DEPTH+2{1'b0}};
		r_gxs_00_5P		<= {Y_DEPTH+2{1'b0}};
		r_gxs_01_5P		<= {Y_DEPTH+2{1'b0}};
		
		r_gxs_00_6P		<= {Y_DEPTH+2{1'b0}};
		r_gxs_01_6P		<= {Y_DEPTH+2{1'b0}};
		
		r_gxs_00_7P		<= {Y_DEPTH+2{1'b0}};
		
		////////////////////////////////
		
		r_gy_11_01_2P	<= {Y_DEPTH+2{1'b0}};
		r_gy_00_01_2P	<= {Y_DEPTH+2{1'b0}};
		r_gy_01_01_2P	<= {Y_DEPTH+2{1'b0}};
		
		r_gys_11_4P		<= {Y_DEPTH+2{1'b0}};
		r_gys_00_4P		<= {Y_DEPTH+2{1'b0}};
		r_gys_01_4P		<= {Y_DEPTH+2{1'b0}};
		
		r_gys_11_5P		<= {Y_DEPTH+2{1'b0}};
		r_gys_00_5P		<= {Y_DEPTH+2{1'b0}};
		r_gys_01_5P		<= {Y_DEPTH+2{1'b0}};
		
		r_gys_00_6P		<= {Y_DEPTH+2{1'b0}};
		r_gys_01_6P		<= {Y_DEPTH+2{1'b0}};
		
		r_gys_00_7P		<= {Y_DEPTH+2{1'b0}};
		
		////////////////////////////////
		
		r_gxs_00_8P		<= {Y_DEPTH+2{1'b0}};
		r_gys_00_8P		<= {Y_DEPTH+2{1'b0}};
		
		r_g_9P			<= {Y_DEPTH+2{1'b0}};
		r_g_10P			<= {Y_DEPTH{1'b0}};
	end
	else
	begin
		r_p_11_00_1P	<= i_pixel_11_01;
		r_p_00_00_1P	<= i_pixel_00_01;
		r_p_01_00_1P	<= i_pixel_01_01;
		
		r_p_11_11_2P	<= r_p_11_00_1P;
		r_p_00_11_2P	<= r_p_00_00_1P;
		r_p_01_11_2P	<= r_p_01_00_1P;
		
		////////////////////////////////
		
		r_gx_11_01_2P	<= w_gx_11_01_1P;
		r_gx_00_01_2P	<= w_gx_00_01_1P;
		r_gx_01_01_2P	<= w_gx_01_01_1P;
		
		////////////////////////////////
		
		r_gxs_11_4P		<= w_gx_11_00_2P + w_gx_11_11_3P;
		r_gxs_00_4P		<= w_gx_00_00_2P + w_gx_00_11_3P;
		r_gxs_01_4P		<= w_gx_01_00_2P + w_gx_01_11_3P;
		
		r_gxs_11_5P		<= r_gxs_11_4P + r_gx_11_01_2P;
		r_gxs_00_5P		<= r_gxs_00_4P + r_gx_00_01_2P;
		r_gxs_01_5P		<= r_gxs_01_4P + r_gx_01_01_2P;
		
		r_gxs_00_6P		<= r_gxs_00_5P + r_gxs_11_5P;
		r_gxs_01_6P		<= r_gxs_01_5P;
		
		r_gxs_00_7P		<= r_gxs_00_6P + r_gxs_01_6P;
		
		////////////////////////////////
		
		r_gy_11_01_2P	<= w_gy_11_01_1P;
		r_gy_00_01_2P	<= w_gy_00_01_1P;
		r_gy_01_01_2P	<= w_gy_01_01_1P;
		
		////////////////////////////////
		
		r_gys_11_4P		<= w_gy_11_00_2P + w_gy_11_11_3P;
		r_gys_00_4P		<= w_gy_00_00_2P + w_gy_00_11_3P;
		r_gys_01_4P		<= w_gy_01_00_2P + w_gy_01_11_3P;
		
		r_gys_11_5P		<= r_gys_11_4P + r_gy_11_01_2P;
		r_gys_00_5P		<= r_gys_00_4P + r_gy_00_01_2P;
		r_gys_01_5P		<= r_gys_01_4P + r_gy_01_01_2P;
		
		r_gys_00_6P		<= r_gys_00_5P + r_gys_11_5P;
		r_gys_01_6P		<= r_gys_01_5P;
		
		r_gys_00_7P		<= r_gys_00_6P + r_gys_01_6P;
		
		////////////////////////////////
		
		if (r_gxs_00_7P[Y_DEPTH+2-1])
			r_gxs_00_8P	<= ~r_gxs_00_7P + 1'b1;
		else
			r_gxs_00_8P	<= r_gxs_00_7P;
		
		if (r_gys_00_7P[Y_DEPTH+2-1])
			r_gys_00_8P	<= ~r_gys_00_7P + 1'b1;
		else
			r_gys_00_8P	<= r_gys_00_7P;
		
		r_g_9P	<= r_gxs_00_8P + r_gys_00_8P;
		
		if (r_g_9P[Y_DEPTH+2-1] || r_g_9P[Y_DEPTH+2-2])
			r_g_10P	<= {Y_DEPTH{1'b0}};
		else
//			r_g_10P	<= {Y_DEPTH{1'b1}} - r_g_9P[Y_DEPTH-1:0];
			r_g_10P	<= r_g_9P[Y_DEPTH-1:0];
	end
end

assign	o_pixel	= r_g_10P;

endmodule
