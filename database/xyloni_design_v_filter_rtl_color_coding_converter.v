// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

// Require sRGB

module color_coding_converter
#(
	parameter	R_DEPTH	= 5,
	parameter	G_DEPTH	= 5,
	parameter	B_DEPTH	= 5,
	parameter	Y_DEPTH	= 5,
	parameter	U_DEPTH	= 5,
	parameter	V_DEPTH	= 5,
	parameter	RGB2YUV_TWOCOMP_WIDTH	= 6,
	parameter	YUV2RGB_TWOCOMP_WIDTH	= 7,
	parameter	Y_OFFSET	= 8'd16,
	// 16 for BT.601 Studio swing
	// 0 for BT.601 Full swing
	// 0 for JPEG YCbCr
	parameter	OUTPUT_REG	= "TRUE",
	
	parameter	ROM_A00	= "rom_a00.mem",
	parameter	ROM_A01	= "rom_a01.mem",
	parameter	ROM_A02	= "rom_a02.mem",
	parameter	ROM_A10	= "rom_a10.mem",
	parameter	ROM_A11	= "rom_a11.mem",
	parameter	ROM_A12	= "rom_a12.mem",
	parameter	ROM_A20	= "rom_a20.mem",
	parameter	ROM_A21	= "rom_a21.mem",
	parameter	ROM_A22	= "rom_a22.mem"
)
(
	input	i_arst,
	input	i_pclk,
	
	input	i_rgb2yuv_de,
	input	[R_DEPTH-1:0]i_rgb2yuv_r,
	input	[G_DEPTH-1:0]i_rgb2yuv_g,
	input	[B_DEPTH-1:0]i_rgb2yuv_b,
	output	o_rgb2yuv_de,
	output	[Y_DEPTH-1:0]o_rgb2yuv_y,
	output	[U_DEPTH-1:0]o_rgb2yuv_u,
	output	[V_DEPTH-1:0]o_rgb2yuv_v,
	
	input	i_yuv2rgb_de,
	input	[Y_DEPTH-1:0]i_yuv2rgb_y,
	input	[U_DEPTH-1:0]i_yuv2rgb_u,
	input	[V_DEPTH-1:0]i_yuv2rgb_v,
	output	o_yuv2rgb_de,
	output	[R_DEPTH-1:0]o_yuv2rgb_r,
	output	[G_DEPTH-1:0]o_yuv2rgb_g,
	output	[B_DEPTH-1:0]o_yuv2rgb_b
);

reg		r_rgb2yuv_de_P;
reg		r_yuv2rgb_de_P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rom_a02_dout1_P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_rom_a02_dout2_P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rom_a12_dout1_P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_rom_a12_dout2_P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_rom_a21_dout2_P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rom_a22_dout1_P;

reg		r_rgb2yuv_de_1P;
reg		[R_DEPTH-1:0]r_rgb2yuv_r_1P;
reg		[G_DEPTH-1:0]r_rgb2yuv_g_1P;
reg		[B_DEPTH-1:0]r_rgb2yuv_b_1P;
//reg		r_rgb2yuv_we_1P;

reg		r_yuv2rgb_de_1P;
reg		[Y_DEPTH-1:0]r_yuv2rgb_y_1P;
reg		[U_DEPTH-1:0]r_yuv2rgb_u_1P;
reg		[V_DEPTH-1:0]r_yuv2rgb_v_1P;
//reg		r_yuv2rgb_we_1P;

reg		r_rgb2yuv_de_2P;
reg		r_yuv2rgb_de_2P;

reg		r_rgb2yuv_de_3P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rgb2yuv_s00_3P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rgb2yuv_s10_3P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rgb2yuv_s20_3P;

reg		r_yuv2rgb_de_3P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_yuv2rgb_s00_3P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_yuv2rgb_s10_3P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_yuv2rgb_s20_3P;

reg		r_rgb2yuv_de_4P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rgb2yuv_y_4P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rgb2yuv_u_4P;
reg		[RGB2YUV_TWOCOMP_WIDTH-1:0]r_rgb2yuv_v_4P;

reg		r_yuv2rgb_de_4P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_yuv2rgb_r_4P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_yuv2rgb_g_4P;
reg		[YUV2RGB_TWOCOMP_WIDTH-1:0]r_yuv2rgb_b_4P;
reg		[1:0]r_yuv2rgb_r_2c_4P;
reg		[1:0]r_yuv2rgb_g_2c_4P;
reg		[1:0]r_yuv2rgb_b_2c_4P;

reg		r_rgb2yuv_de_5P;
reg		[Y_DEPTH-1:0]r_rgb2yuv_y_5P;
reg		[U_DEPTH-1:0]r_rgb2yuv_u_5P;
reg		[B_DEPTH-1:0]r_rgb2yuv_v_5P;

reg		r_yuv2rgb_de_5P;
reg		[R_DEPTH-1:0]r_yuv2rgb_r_5P;
reg		[G_DEPTH-1:0]r_yuv2rgb_g_5P;
reg		[B_DEPTH-1:0]r_yuv2rgb_b_5P;
/*
reg		r_yuv2rgb_de_6P;
reg		[R_DEPTH-1:0]r_yuv2rgb_r_6P;
reg		[G_DEPTH-1:0]r_yuv2rgb_g_6P;
reg		[B_DEPTH-1:0]r_yuv2rgb_b_6P;
reg		r_yuv2rgb_r_c_6P;
reg		r_yuv2rgb_g_c_6P;
reg		r_yuv2rgb_b_c_6P;

reg		r_yuv2rgb_de_7P;
reg		[R_DEPTH-1:0]r_yuv2rgb_r_7P;
reg		[G_DEPTH-1:0]r_yuv2rgb_g_7P;
reg		[B_DEPTH-1:0]r_yuv2rgb_b_7P;
*/
////////////////////////////////
//   0.299R + 0.587G + 0.114B
// - 0.147R - 0.289G + 0.436B
//   0.615R - 0.515G - 0.100B
//
// C = Y - 16  >> 2?
// D = Y - 128 >> 16?
// E = V - 128 >> 16?
//
// 298C 
//
//
// 2P    2P    3P    3P    4P
// a00 + a01 = s00 + a02 = b0
// a10 + a11 = s10 + a12 = b1
// a20 + a21 = s20 + a22 = b2
//
// c00 + c01 = t00 + c02 = d0
//       0               = overflow
//                       = underflow
// c10 + c11 = t10 + c12 = d1
//                       = overflow
//                       = underflow
// c20 + c22 = t20 + c21 = d2
//       0               = overflow
//                       = underflow
////////////////////////////////
wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a00_2P;
wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a01_2P;
wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a02_3P;

wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a10_2P;
wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a11_2P;
wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a12_3P;

wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a20_2P;
wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a21_2P;
wire	[RGB2YUV_TWOCOMP_WIDTH-1:0]w_rgb2yuv_a22_3P;

wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a00_2P;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a01_2P;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a02_3P;

wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a10_2P;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a11_2P;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a12_3P;

wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a20_2P;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a22_2P;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_yuv2rgb_a21_3P;

wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a00_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a01_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a02_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a10_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a11_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a12_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a20_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a21_dout1;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a22_dout1;

wire	w_rgb2yuv_de;
wire	w_yuv2rgb_de;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a02_dout2;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a12_dout2;
wire	[YUV2RGB_TWOCOMP_WIDTH-1:0]w_rom_a21_dout2;

wire	c_rgb2yuv_sel;
wire	c_yuv2rgb_sel;

assign	c_rgb2yuv_sel	= 1'b0;
assign	c_yuv2rgb_sel	= 1'b1;

assign	w_yuv2rgb_a01_2P	= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
assign	w_yuv2rgb_a22_2P	= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
//assign	w_yuv2rgb_a01_2P	= 6'd0;
//assign	w_yuv2rgb_a22_2P	= 6'd0;

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_rgb2yuv_de_1P		<= 1'b0;
		r_rgb2yuv_r_1P		<= {R_DEPTH{1'b0}};
		r_rgb2yuv_g_1P		<= {G_DEPTH{1'b0}};
		r_rgb2yuv_b_1P		<= {B_DEPTH{1'b0}};
//		r_rgb2yuv_we_1P		<= 1'b0;
		
		r_yuv2rgb_de_1P		<= 1'b0;
		r_yuv2rgb_y_1P		<= {Y_DEPTH{1'b0}};
		r_yuv2rgb_u_1P		<= {U_DEPTH{1'b0}};
		r_yuv2rgb_v_1P		<= {V_DEPTH{1'b0}};
//		r_yuv2rgb_we_1P		<= 1'b0;
		
		r_rgb2yuv_de_2P		<= 1'b0;
		r_yuv2rgb_de_2P		<= 1'b0;
		
		r_rgb2yuv_de_3P		<= 1'b0;
		r_rgb2yuv_s00_3P	<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		r_rgb2yuv_s10_3P	<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		r_rgb2yuv_s20_3P	<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		
		r_yuv2rgb_de_3P		<= 1'b0;
		r_yuv2rgb_s00_3P	<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_yuv2rgb_s10_3P	<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_yuv2rgb_s20_3P	<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		
		r_rgb2yuv_de_4P		<= 1'b0;
		r_rgb2yuv_y_4P		<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		r_rgb2yuv_u_4P		<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		r_rgb2yuv_v_4P		<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		
		r_yuv2rgb_de_4P		<= 1'b0;
		r_yuv2rgb_r_4P		<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_yuv2rgb_g_4P		<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_yuv2rgb_b_4P		<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_yuv2rgb_r_2c_4P	<= 2'b00;
		r_yuv2rgb_g_2c_4P	<= 2'b00;
		r_yuv2rgb_b_2c_4P	<= 2'b00;
		
		r_rgb2yuv_de_5P		<= 1'b0;
		r_rgb2yuv_y_5P		<= {Y_DEPTH{1'b0}};
		r_rgb2yuv_u_5P		<= {U_DEPTH{1'b0}};
		r_rgb2yuv_v_5P		<= {V_DEPTH{1'b0}};
		r_yuv2rgb_de_5P		<= 1'b0;
		r_yuv2rgb_r_5P		<= {R_DEPTH{1'b0}};
		r_yuv2rgb_g_5P		<= {G_DEPTH{1'b0}};
		r_yuv2rgb_b_5P		<= {B_DEPTH{1'b0}};
		/*
		r_yuv2rgb_de_6P		<= 1'b0;
		r_yuv2rgb_r_6P		<= {R_DEPTH{1'b0}};
		r_yuv2rgb_g_6P		<= {G_DEPTH{1'b0}};
		r_yuv2rgb_b_6P		<= {B_DEPTH{1'b0}};
		r_yuv2rgb_r_c_6P	<= 1'b0;
		r_yuv2rgb_g_c_6P	<= 1'b0;
		r_yuv2rgb_b_c_6P	<= 1'b0;
		
		r_yuv2rgb_de_7P		<= 1'b0;
		r_yuv2rgb_r_7P		<= {R_DEPTH{1'b0}};
		r_yuv2rgb_g_7P		<= {G_DEPTH{1'b0}};
		r_yuv2rgb_b_7P		<= {B_DEPTH{1'b0}};
		*/
	end
	else
	begin
		r_rgb2yuv_de_1P		<= w_rgb2yuv_de;
		r_yuv2rgb_de_1P		<= w_yuv2rgb_de;
		
		r_rgb2yuv_de_2P		<= r_rgb2yuv_de_1P;
		r_yuv2rgb_de_2P		<= r_yuv2rgb_de_1P;
		
		r_rgb2yuv_de_3P		<= r_rgb2yuv_de_2P;
		r_yuv2rgb_de_3P		<= r_yuv2rgb_de_2P;
		
		r_rgb2yuv_de_4P		<= r_rgb2yuv_de_3P;
		r_yuv2rgb_de_4P		<= r_yuv2rgb_de_3P;
		
		r_rgb2yuv_de_5P		<= r_rgb2yuv_de_4P;
		r_yuv2rgb_de_5P		<= r_yuv2rgb_de_4P;
		
//		r_yuv2rgb_de_6P		<= r_yuv2rgb_de_5P;
//		r_yuv2rgb_de_7P		<= r_yuv2rgb_de_6P;
		
/*		if (i_rgb2yuv_de)
		begin
			r_rgb2yuv_r_1P		<= {1'b0, i_rgb2yuv_r};
			r_rgb2yuv_g_1P		<= {1'b0, i_rgb2yuv_g};
			r_rgb2yuv_b_1P		<= {1'b0, i_rgb2yuv_b};
			r_rgb2yuv_we_1P		<= 1'b0;
		end
		else
		begin
			r_rgb2yuv_r_1P[R_DEPTH]	<= 1'b1;
			r_rgb2yuv_g_1P[G_DEPTH]	<= 1'b1;
			r_rgb2yuv_b_1P[B_DEPTH]	<= 1'b1;
			r_rgb2yuv_we_1P			<= 1'b1;
		end*/
		r_rgb2yuv_r_1P		<= i_rgb2yuv_r;
		r_rgb2yuv_g_1P		<= i_rgb2yuv_g;
		r_rgb2yuv_b_1P		<= i_rgb2yuv_b;
		
/*		if (i_yuv2rgb_de)
		begin
			r_yuv2rgb_y_1P		<= {1'b0, i_yuv2rgb_y};
			r_yuv2rgb_u_1P		<= {1'b0, i_yuv2rgb_u};
			r_yuv2rgb_v_1P		<= {1'b0, i_yuv2rgb_v};
			r_yuv2rgb_we_1P		<= 1'b0;
		end
		else
		begin
			r_yuv2rgb_y_1P[Y_DEPTH]	<= 1'b1;
			r_yuv2rgb_u_1P[U_DEPTH]	<= 1'b1;
			r_yuv2rgb_v_1P[V_DEPTH]	<= 1'b1;
			r_yuv2rgb_we_1P			<= 1'b1;
		end*/
		r_yuv2rgb_y_1P		<= i_yuv2rgb_y;
		r_yuv2rgb_u_1P		<= i_yuv2rgb_u;
		r_yuv2rgb_v_1P		<= i_yuv2rgb_v;
		
		r_rgb2yuv_s00_3P	<= w_rgb2yuv_a00_2P + w_rgb2yuv_a01_2P;
		r_rgb2yuv_s10_3P	<= w_rgb2yuv_a10_2P + w_rgb2yuv_a11_2P;
		r_rgb2yuv_s20_3P	<= w_rgb2yuv_a20_2P + w_rgb2yuv_a21_2P;
		
		r_yuv2rgb_s00_3P	<= w_yuv2rgb_a00_2P + w_yuv2rgb_a01_2P;
		r_yuv2rgb_s10_3P	<= w_yuv2rgb_a10_2P + w_yuv2rgb_a11_2P;
		r_yuv2rgb_s20_3P	<= w_yuv2rgb_a20_2P + w_yuv2rgb_a22_2P;
		
		r_rgb2yuv_y_4P		<= r_rgb2yuv_s00_3P + w_rgb2yuv_a02_3P + Y_OFFSET;
		r_rgb2yuv_u_4P		<= r_rgb2yuv_s10_3P + w_rgb2yuv_a12_3P + 8'd128;
		r_rgb2yuv_v_4P		<= r_rgb2yuv_s20_3P + w_rgb2yuv_a22_3P + 8'd128;
		
		r_yuv2rgb_r_4P		<= r_yuv2rgb_s00_3P + w_yuv2rgb_a02_3P;
		r_yuv2rgb_g_4P		<= r_yuv2rgb_s10_3P + w_yuv2rgb_a12_3P;
		r_yuv2rgb_b_4P		<= r_yuv2rgb_s20_3P + w_yuv2rgb_a21_3P;
		r_yuv2rgb_r_2c_4P	<= {r_yuv2rgb_s00_3P[YUV2RGB_TWOCOMP_WIDTH-1], w_yuv2rgb_a02_3P[YUV2RGB_TWOCOMP_WIDTH-1]};
		r_yuv2rgb_g_2c_4P	<= {r_yuv2rgb_s10_3P[YUV2RGB_TWOCOMP_WIDTH-1], w_yuv2rgb_a12_3P[YUV2RGB_TWOCOMP_WIDTH-1]};
		r_yuv2rgb_b_2c_4P	<= {r_yuv2rgb_s20_3P[YUV2RGB_TWOCOMP_WIDTH-1], w_yuv2rgb_a21_3P[YUV2RGB_TWOCOMP_WIDTH-1]};
		
//		r_rgb2yuv_y_5P	<= r_rgb2yuv_y_4P[Y_DEPTH-1:0]+8'd16;
		if (r_rgb2yuv_y_4P[RGB2YUV_TWOCOMP_WIDTH-1])
			r_rgb2yuv_y_5P	<= {Y_DEPTH{1'b1}};
		else
			r_rgb2yuv_y_5P	<= r_rgb2yuv_y_4P[Y_DEPTH-1:0]/*+Y_OFFSET*/;
		
		if (r_rgb2yuv_u_4P[RGB2YUV_TWOCOMP_WIDTH-1])
//			r_rgb2yuv_u_5P	<= {U_DEPTH{1'b0}};
			r_rgb2yuv_u_5P	<= {U_DEPTH{1'b1}};
		else
			r_rgb2yuv_u_5P	<= r_rgb2yuv_u_4P[U_DEPTH-1:0]/*+8'd128*/;
		
		if (r_rgb2yuv_v_4P[RGB2YUV_TWOCOMP_WIDTH-1])
//			r_rgb2yuv_v_5P	<= {V_DEPTH{1'b0}};
			r_rgb2yuv_v_5P	<= {V_DEPTH{1'b1}};
		else
			r_rgb2yuv_v_5P	<= r_rgb2yuv_v_4P[V_DEPTH-1:0]/*+8'd128*/;
		
		if (r_yuv2rgb_r_2c_4P[1] & r_yuv2rgb_r_2c_4P[0] & ~r_yuv2rgb_r_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_r_5P	<= {R_DEPTH{1'b0}};
		else if (~r_yuv2rgb_r_2c_4P[1] & ~r_yuv2rgb_r_2c_4P[0] & r_yuv2rgb_r_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_r_5P	<= {R_DEPTH{1'b1}};
		else if (r_yuv2rgb_r_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_r_5P	<= {R_DEPTH{1'b0}};
		else if (r_yuv2rgb_r_4P[YUV2RGB_TWOCOMP_WIDTH-2])
			r_yuv2rgb_r_5P	<= {R_DEPTH{1'b1}};
		else
			r_yuv2rgb_r_5P	<= r_yuv2rgb_r_4P[R_DEPTH-1:0];
		
		if (r_yuv2rgb_g_2c_4P[1] & r_yuv2rgb_g_2c_4P[0] & ~r_yuv2rgb_g_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_g_5P	<= {G_DEPTH{1'b0}};
		else  if (~r_yuv2rgb_g_2c_4P[1] & ~r_yuv2rgb_g_2c_4P[0] & r_yuv2rgb_g_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_g_5P	<= {G_DEPTH{1'b1}};
		else if (r_yuv2rgb_g_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_g_5P	<= {G_DEPTH{1'b0}};
		else if (r_yuv2rgb_g_4P[YUV2RGB_TWOCOMP_WIDTH-2])
			r_yuv2rgb_g_5P	<= {G_DEPTH{1'b1}};
		else
			r_yuv2rgb_g_5P	<= r_yuv2rgb_g_4P[G_DEPTH-1:0];
		
		if (r_yuv2rgb_b_2c_4P[1] & r_yuv2rgb_b_2c_4P[0] & ~r_yuv2rgb_b_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_b_5P	<= {B_DEPTH{1'b0}};
		else if (~r_yuv2rgb_b_2c_4P[1] & ~r_yuv2rgb_b_2c_4P[0] & r_yuv2rgb_b_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_b_5P	<= {B_DEPTH{1'b1}};
		else if (r_yuv2rgb_b_4P[YUV2RGB_TWOCOMP_WIDTH-1])
			r_yuv2rgb_b_5P	<= {B_DEPTH{1'b0}};
		else if (r_yuv2rgb_b_4P[YUV2RGB_TWOCOMP_WIDTH-2])
			r_yuv2rgb_b_5P	<= {B_DEPTH{1'b1}};
		else
			r_yuv2rgb_b_5P	<= r_yuv2rgb_b_4P[B_DEPTH-1:0];
		
/*		r_yuv2rgb_r_6P		<= r_yuv2rgb_r_5P+5'd2;
		r_yuv2rgb_r_c_6P	<= r_yuv2rgb_r_5P[R_DEPTH-1];
		r_yuv2rgb_g_6P		<= r_yuv2rgb_g_5P+5'd2;
		r_yuv2rgb_g_c_6P	<= r_yuv2rgb_g_5P[G_DEPTH-1];
		r_yuv2rgb_g_6P		<= r_yuv2rgb_g_5P;
		r_yuv2rgb_b_6P		<= r_yuv2rgb_b_5P+5'd2;
		r_yuv2rgb_b_c_6P	<= r_yuv2rgb_b_5P[B_DEPTH-1];
		
		if (~r_yuv2rgb_r_c_6P & r_yuv2rgb_r_6P[R_DEPTH-1])
			r_yuv2rgb_r_7P	<= {R_DEPTH{1'b1}};
		else
			r_yuv2rgb_r_7P	<= r_yuv2rgb_r_6P;
		
		if (~r_yuv2rgb_g_c_6P & r_yuv2rgb_g_6P[G_DEPTH-1])
			r_yuv2rgb_g_7P	<= {R_DEPTH{1'b1}};
		else
			r_yuv2rgb_g_7P	<= r_yuv2rgb_g_6P;
		
		if (~r_yuv2rgb_b_c_6P & r_yuv2rgb_b_6P[B_DEPTH-1])
			r_yuv2rgb_b_7P	<= {B_DEPTH{1'b1}};
		else
			r_yuv2rgb_b_7P	<= r_yuv2rgb_b_6P;*/
	end
end

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+R_DEPTH),
	.ADDR_WIDTH(1+R_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1(OUTPUT_REG),
	.OUTPUT_REG_2(OUTPUT_REG),
	.RAM_INIT_FILE(ROM_A00),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a00
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_r_1P[R_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_r_1P[R_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_r_1P[R_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a00_2P),
	.dout1	(w_rom_a00_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_y_1P[Y_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_y_1P[Y_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_y_1P[Y_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
	.dout2	(w_yuv2rgb_a00_2P)
);
assign	w_rgb2yuv_a00_2P	= w_rom_a00_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+G_DEPTH),
	.ADDR_WIDTH(1+G_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1(OUTPUT_REG),
	.OUTPUT_REG_2(OUTPUT_REG),
	.RAM_INIT_FILE(ROM_A01),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a01
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_g_1P[G_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_g_1P[G_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_g_1P[G_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a01_2P),
	.dout1	(w_rom_a01_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_u_1P[U_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_u_1P[U_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_u_1P[U_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout2	(w_yuv2rgb_a01_2P),
	.dout2	()
);
assign	w_rgb2yuv_a01_2P	= w_rom_a01_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+B_DEPTH),
	.ADDR_WIDTH(1+B_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1("TRUE"),
	.OUTPUT_REG_2("TRUE"),
	.RAM_INIT_FILE(ROM_A02),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a02
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_b_1P[B_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_b_1P[B_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_b_1P[B_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a02_3P),
	.dout1	(w_rom_a02_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_v_1P[V_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_v_1P[V_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_v_1P[V_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout2	(w_yuv2rgb_a02_3P)
	.dout2	(w_rom_a02_dout2)
);
generate
	if (OUTPUT_REG == "TRUE")
	begin
		assign	w_rgb2yuv_a02_3P	= r_rom_a02_dout1_P;
		assign	w_yuv2rgb_a02_3P	= r_rom_a02_dout2_P;
	end
	else
	begin
		assign	w_rgb2yuv_a02_3P	= w_rom_a02_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];
		assign	w_yuv2rgb_a02_3P	= w_rom_a02_dout2;
	end
endgenerate

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+R_DEPTH),
	.ADDR_WIDTH(1+R_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1(OUTPUT_REG),
	.OUTPUT_REG_2(OUTPUT_REG),
	.RAM_INIT_FILE(ROM_A10),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a10
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_r_1P[R_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_r_1P[R_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_r_1P[R_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a10_2P),
	.dout1	(w_rom_a10_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_y_1P[Y_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_y_1P[Y_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_y_1P[Y_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
	.dout2	(w_yuv2rgb_a10_2P)
);
assign	w_rgb2yuv_a10_2P	= w_rom_a10_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+G_DEPTH),
	.ADDR_WIDTH(1+G_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1(OUTPUT_REG),
	.OUTPUT_REG_2(OUTPUT_REG),
	.RAM_INIT_FILE(ROM_A11),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a11
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_g_1P[G_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_g_1P[G_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_g_1P[G_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a11_2P),
	.dout1	(w_rom_a11_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_u_1P[U_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_u_1P[U_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_u_1P[U_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
	.dout2	(w_yuv2rgb_a11_2P)
);
assign	w_rgb2yuv_a11_2P	= w_rom_a11_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+B_DEPTH),
	.ADDR_WIDTH(1+B_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1("TRUE"),
	.OUTPUT_REG_2("TRUE"),
	.RAM_INIT_FILE(ROM_A12),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a12
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_b_1P[B_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_b_1P[B_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_b_1P[B_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a12_3P),
	.dout1	(w_rom_a12_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_v_1P[B_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_v_1P[B_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_v_1P[B_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout2	(w_yuv2rgb_a12_3P)
	.dout2	(w_rom_a12_dout2)
);
generate
	if (OUTPUT_REG == "TRUE")
	begin
		assign	w_rgb2yuv_a12_3P	= r_rom_a12_dout1_P;
		assign	w_yuv2rgb_a12_3P	= r_rom_a12_dout2_P;
	end
	else
	begin
		assign	w_rgb2yuv_a12_3P	= w_rom_a12_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];
		assign	w_yuv2rgb_a12_3P	= w_rom_a12_dout2;
	end
endgenerate

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+R_DEPTH),
	.ADDR_WIDTH(1+R_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1(OUTPUT_REG),
	.OUTPUT_REG_2(OUTPUT_REG),
	.RAM_INIT_FILE(ROM_A20),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a20
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_r_1P[R_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_r_1P[R_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_r_1P[R_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a20_2P),
	.dout1	(w_rom_a20_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_y_1P[Y_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_y_1P[Y_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_y_1P[Y_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
	.dout2	(w_yuv2rgb_a20_2P)
);
assign	w_rgb2yuv_a20_2P	= w_rom_a20_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+G_DEPTH),
	.ADDR_WIDTH(1+G_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1(OUTPUT_REG),
	.OUTPUT_REG_2("TRUE"),
	.RAM_INIT_FILE(ROM_A21),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a21
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_g_1P[G_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_g_1P[G_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_g_1P[G_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a21_2P),
	.dout1	(w_rom_a21_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_u_1P[U_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_u_1P[U_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_u_1P[U_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout2	(w_yuv2rgb_a21_3P)
	.dout2	(w_rom_a21_dout2)
);
assign	w_rgb2yuv_a21_2P	= w_rom_a21_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];
generate
	if (OUTPUT_REG == "TRUE")
	begin
		assign	w_yuv2rgb_a21_3P	= r_rom_a21_dout2_P;
	end
	else
	begin
		assign	w_yuv2rgb_a21_3P	= w_rom_a21_dout2;
	end
endgenerate

true_dual_port_ram
#(
	.DATA_WIDTH(YUV2RGB_TWOCOMP_WIDTH),
//	.ADDR_WIDTH(1+1+YUV2RGB_TWOCOMP_WIDTH-1),
//	.ADDR_WIDTH(1+1+B_DEPTH),
	.ADDR_WIDTH(1+B_DEPTH),
	.WRITE_MODE_1("WRITE_FIRST"),
	.WRITE_MODE_2("WRITE_FIRST"),
	.OUTPUT_REG_1(OUTPUT_REG),
	.OUTPUT_REG_2("FALSE"),
	.RAM_INIT_FILE(ROM_A22),
	.RAM_INIT_RADIX("HEX")
)
inst_rom_a22
(
	.clka	(i_pclk),
//	.we1	(r_rgb2yuv_we_1P),
//	.addr1	({r_rgb2yuv_b_1P[B_DEPTH], c_rgb2yuv_sel, r_rgb2yuv_b_1P[B_DEPTH-1:0]}),
	.we1	(1'b0),
	.addr1	({c_rgb2yuv_sel, r_rgb2yuv_b_1P[B_DEPTH-1:0]}),
	.din1	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout1	(w_rgb2yuv_a22_3P),
	.dout1	(w_rom_a22_dout1),
	
	.clkb	(i_pclk),
//	.we2	(r_yuv2rgb_we_1P),
//	.addr2	({r_yuv2rgb_v_1P[V_DEPTH], c_yuv2rgb_sel, r_yuv2rgb_v_1P[V_DEPTH-1:0]}),
	.we2	(1'b0),
	.addr2	({c_yuv2rgb_sel, r_yuv2rgb_v_1P[V_DEPTH-1:0]}),
	.din2	({YUV2RGB_TWOCOMP_WIDTH{1'b0}}),
//	.dout2	(w_yuv2rgb_a22_2P),
	.dout2	()
);
generate
	if (OUTPUT_REG == "TRUE")
	begin
		assign	w_rgb2yuv_a22_3P	= r_rom_a22_dout1_P;
		
		assign	w_rgb2yuv_de		= r_rgb2yuv_de_P;
		assign	w_yuv2rgb_de		= r_yuv2rgb_de_P;
	end
	else
	begin
		assign	w_rgb2yuv_a22_3P	= w_rom_a22_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];
		
		assign	w_rgb2yuv_de		= i_rgb2yuv_de;
		assign	w_yuv2rgb_de		= i_yuv2rgb_de;
	end
endgenerate

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_rgb2yuv_de_P		<= 1'b0;
		r_yuv2rgb_de_P		<= 1'b0;
		r_rom_a02_dout1_P	<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		r_rom_a02_dout2_P	<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_rom_a12_dout1_P	<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
		r_rom_a12_dout2_P	<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_rom_a21_dout2_P	<= {YUV2RGB_TWOCOMP_WIDTH{1'b0}};
		r_rom_a22_dout1_P	<= {RGB2YUV_TWOCOMP_WIDTH{1'b0}};
	end
	else
	begin
		r_rgb2yuv_de_P		<= i_rgb2yuv_de;
		r_yuv2rgb_de_P		<= i_yuv2rgb_de;
		r_rom_a02_dout1_P	<= w_rom_a02_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];
		r_rom_a02_dout2_P	<= w_rom_a02_dout2;
		r_rom_a12_dout1_P	<= w_rom_a12_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];
		r_rom_a12_dout2_P	<= w_rom_a12_dout2;
		r_rom_a21_dout2_P	<= w_rom_a21_dout2;
		r_rom_a22_dout1_P	<= w_rom_a22_dout1[RGB2YUV_TWOCOMP_WIDTH-1:0];
	end
end

assign	o_rgb2yuv_de	= r_rgb2yuv_de_5P;
assign	o_rgb2yuv_y		= r_rgb2yuv_y_5P;
assign	o_rgb2yuv_u		= r_rgb2yuv_u_5P;
assign	o_rgb2yuv_v		= r_rgb2yuv_v_5P;
assign	o_yuv2rgb_de	= r_yuv2rgb_de_5P;
assign	o_yuv2rgb_r		= r_yuv2rgb_r_5P;
assign	o_yuv2rgb_g		= r_yuv2rgb_g_5P;
assign	o_yuv2rgb_b		= r_yuv2rgb_b_5P;

endmodule
