// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`include "vesa_parameter.vh"

module v_filter
#(
	parameter	VESA_STD	= "VESA_1280X720_60FPS",
	parameter	R_DEPTH		= 8,
	parameter	G_DEPTH		= 8,
	parameter	B_DEPTH		= 8,
	parameter	Y_DEPTH		= 8,
	parameter	U_DEPTH		= 8,
	parameter	V_DEPTH		= 8,
	
	parameter	ROM_A00	= "../mif/rom_a00.mem",
	parameter	ROM_A01	= "../mif/rom_a01.mem",
	parameter	ROM_A02	= "../mif/rom_a02.mem",
	parameter	ROM_A10	= "../mif/rom_a10.mem",
	parameter	ROM_A11	= "../mif/rom_a11.mem",
	parameter	ROM_A12	= "../mif/rom_a12.mem",
	parameter	ROM_A20	= "../mif/rom_a20.mem",
	parameter	ROM_A21	= "../mif/rom_a21.mem",
	parameter	ROM_A22	= "../mif/rom_a22.mem"
)
(
	input	i_arstn,
	input	i_osc,
	input	i_sw_n,
	input	i_sysclk,
	input	i_pll_locked,
	output	o_pll_locked,
	
	input	i_ov5640_pclk,
//	output	o_ov5640_pwdn,
	input	i_ov5640_vsync,
	input	i_ov5640_href,
	input	i_ov5640_d0,
	input	i_ov5640_d1,
	input	i_ov5640_d2,
	input	i_ov5640_d3,
	input	i_ov5640_d4,
	input	i_ov5640_d5,
	input	i_ov5640_d6,
	input	i_ov5640_d7,
	
	input	i_ov5640_scl,
	output	o_ov5640_scl_oe,
	input	i_ov5640_sda,
	output	o_ov5640_sda_oe,
//	output	o_ov5640_xclk,
	
	output	o_vga_pclk,
	output	o_vga_vsync,
	output	o_vga_hsync,
	output	[5:0]o_vga_r,
	output	[5:0]o_vga_g,
	output	[5:0]o_vga_b	
);

wire	w_ov5640_scl_oe;
wire	w_ov5640_sda_oe;

localparam	HOR_SYNC_POLARITY	= `HOR_SYNC_POLARITY;
localparam	VER_SYNC_POLARITY	= `VER_SYNC_POLARITY;
wire	c_act_vs_por;
wire	c_ina_vs_por;
wire	c_act_hs_por;
wire	c_ina_hs_por;
wire	c_act_de_por;
wire	c_ina_de_por;

wire	w_srst_pclk_x2;
wire	w_srst_pclk_x1;
wire	w_srst_pclk_div2;

reg		r_ov5640_vsync_1P;
reg		r_ov5640_href_1P;
reg		[7:0]r_ov5640_d_1P;

reg		r_ov5640_vsync_2P;
reg		r_ov5640_href_2P;
reg		[7:0]r_ov5640_d_2P;

reg		r_posterize_de_9P;
reg		r_posterize_vsync_9P;
(* syn_preserve="TRUE" *)reg		r_posterize_hsync_9P;
reg		[Y_DEPTH-1:0]r_posterize_y_01_9P;
reg		[U_DEPTH-1:0]r_posterize_u_01_9P;
reg		[V_DEPTH-1:0]r_posterize_v_01_9P;

reg		r_sobel_de_9P;
reg		r_sobel_vsync_9P;
(* syn_preserve="TRUE" *)reg		r_sobel_hsync_9P;
reg		[Y_DEPTH-1:0]r_sobel_y_11_9P;
reg		[Y_DEPTH-1:0]r_sobel_y_00_9P;
reg		[Y_DEPTH-1:0]r_sobel_y_01_9P;

reg		r_vsync_19P;
reg		r_hsync_19P;
reg		r_de_19P;
reg		[Y_DEPTH-1:0]r_y_19P;
reg		[U_DEPTH-1:0]r_u_19P;
reg		[V_DEPTH-1:0]r_v_19P;

//assign  test_w_vsync_1P = w_vsync_1P;
assign  test_w_hsync_1P = w_hsync_1P;

wire	w_vsync_1P;
wire	w_hsync_1P;
wire	w_de_1P;
wire	[4:0]w_r_1P;
wire	[5:0]w_g_1P;
wire	[4:0]w_b_1P;

wire	w_de_6P;
wire	w_hsync_6P;
wire	w_vsync_6P;
wire	[Y_DEPTH-1:0]w_y_6P;
wire	[U_DEPTH-1:0]w_u_6P;
wire	[V_DEPTH-1:0]w_v_6P;

wire	w_de_8P;
wire	w_hsync_8P;
wire	w_vsync_8P;
wire	[Y_DEPTH-1:0]w_y_11_8P;
wire	[U_DEPTH-1:0]w_u_11_8P;
wire	[V_DEPTH-1:0]w_v_11_8P;
wire	[Y_DEPTH-1:0]w_y_00_8P;
wire	[U_DEPTH-1:0]w_u_00_8P;
wire	[V_DEPTH-1:0]w_v_00_8P;
wire	[Y_DEPTH-1:0]w_y_01_8P;
wire	[U_DEPTH-1:0]w_u_01_8P;
wire	[V_DEPTH-1:0]w_v_01_8P;
wire	[10:0]w_x_8P;

wire	w_posterize_de_11P;
wire	w_posterize_hsync_11P;
wire	w_posterize_vsync_11P;
wire	[Y_DEPTH-1:0]w_posterize_y_11P;
wire	[U_DEPTH-1:0]w_posterize_u_11P;
wire	[V_DEPTH-1:0]w_posterize_v_11P;

wire	w_posterize_de_18P;
wire	w_posterize_hsync_18P;
wire	w_posterize_vsync_18P;
wire	[Y_DEPTH-1:0]w_posterize_y_18P;
wire	[U_DEPTH-1:0]w_posterize_u_18P;
wire	[V_DEPTH-1:0]w_posterize_v_18P;

wire	w_sobel_x_en_18P;
wire	w_sobel_vsync_18P;
wire	w_sobel_hsync_18P;
wire	w_sobel_de_18P;
wire	[Y_DEPTH-1:0]w_sobel_y_18P;

wire	w_yuv2rgb_de_24P;
wire	w_yuv2rgb_hsync_24P;
wire	w_yuv2rgb_vsync_24P;
wire	[R_DEPTH-1:0]w_yuv2rgb_r_24P;
wire	[G_DEPTH-1:0]w_yuv2rgb_g_24P;
wire	[B_DEPTH-1:0]w_yuv2rgb_b_24P;

wire	w_vga_vsync;
wire	w_vga_hsync;
//wire	w_vga_de;
wire	[R_DEPTH-1:0]w_vga_r;
wire	[G_DEPTH-1:0]w_vga_g;
wire	[B_DEPTH-1:0]w_vga_b;

wire	w_led_vsync;
//wire	w_led_hsync,
wire	w_led_de;
wire	[R_DEPTH-1:0]w_led_r;
wire	[G_DEPTH-1:0]w_led_g;
wire	[B_DEPTH-1:0]w_led_b;

//assign	o_ov5640_pwdn	= 1'b0;

wire	w_posterize_x_done;
wire	w_vga_pclk;
wire	w_vga_pclk_div2;
wire	w_srstn;
wire	w_srst;
wire	w_confdone;

wire	w_posterize_en;
wire	[1:0]w_display_sel;

//assign	w_srst	= ~w_srstn;
reset
#(
	.IN_RST_ACTIVE("HIGH"),
	.OUT_RST_ACTIVE("HIGH"),
	.CYCLE(1)
)
inst_reset_pclk_x2
(
//	.i_arstn(i_arstn),
//	.i_srst	(w_srst),
	.i_arst	(w_srst),
	.i_clk	(i_ov5640_pclk),
	.o_srst	(w_srst_pclk_x2)
);

reset
#(
	.IN_RST_ACTIVE("HIGH"),
	.OUT_RST_ACTIVE("HIGH"),
	.CYCLE(1)
)
inst_reset_pclk_x1
(
//	.i_arstn(i_arstn),
//	.i_srst	(w_srst),
	.i_arst	(w_srst),
	.i_clk	(w_vga_pclk),
	.o_srst	(w_srst_pclk_x1)
);

reset
#(
	.IN_RST_ACTIVE("HIGH"),
	.OUT_RST_ACTIVE("HIGH"),
	.CYCLE(1)
)
inst_reset_pclk_div2
(
//	.i_arstn(i_arstn),
//	.i_srst	(w_srst),
	.i_arst	(w_srst),
	.i_clk	(w_vga_pclk_div2),
	.o_srst	(w_srst_pclk_div2)
);

ov5640_config
inst_ov5640_config
(
	.i_arst			(~i_pll_locked),
	.i_sysclk		(i_sysclk),
	.i_pll_locked	(i_pll_locked),
	.o_confdone		(w_confdone),
	
	.i_sda			(i_ov5640_sda),
	.o_sda_oe		(o_ov5640_sda_oe),
	.i_scl			(i_ov5640_scl),
	.o_scl_oe		(w_ov5640_scl_oe)
);
assign	o_ov5640_scl_oe		= w_ov5640_scl_oe;

assign	o_pll_locked	= w_srst_pclk_x1;

generate
	if (HOR_SYNC_POLARITY == "NEGATIVE")
	begin
		assign	c_act_hs_por	= 1'b0;
		assign	c_ina_hs_por	= 1'b1;
	end
	else
	begin
		assign	c_act_hs_por	= 1'b1;
		assign	c_ina_hs_por	= 1'b0;
	end
	
	if (VER_SYNC_POLARITY == "NEGATIVE")
	begin
		assign	c_act_vs_por	= 1'b0;
		assign	c_ina_vs_por	= 1'b1;
	end
	else
	begin
		assign	c_act_vs_por	= 1'b1;
		assign	c_ina_vs_por	= 1'b0;
	end
endgenerate

assign	c_act_de_por	= 1'b1;
assign	c_ina_de_por	= 1'b0;

always@(posedge w_srst_pclk_x2 or posedge i_ov5640_pclk)
begin
	if (w_srst_pclk_x2)
	begin
		r_ov5640_vsync_1P	<= 1'b0;
		r_ov5640_href_1P	<= 1'b0;
		r_ov5640_d_1P		<= {8{1'b0}};
		
		r_ov5640_vsync_2P	<= 1'b0;
		r_ov5640_href_2P	<= 1'b0;
		r_ov5640_d_2P		<= {8{1'b0}};
	end
	else
	begin
		r_ov5640_vsync_1P	<= i_ov5640_vsync;
		r_ov5640_href_1P	<= i_ov5640_href;
		r_ov5640_d_1P		<=	{i_ov5640_d7, i_ov5640_d6,
								i_ov5640_d5, i_ov5640_d4,
								i_ov5640_d3, i_ov5640_d2,
								i_ov5640_d1, i_ov5640_d0};
		
		r_ov5640_vsync_2P	<= r_ov5640_vsync_1P;
		r_ov5640_href_2P	<= r_ov5640_href_1P;
		r_ov5640_d_2P		<= r_ov5640_d_1P;
		
	end
end

ov5640_interface
#(
	.VESA_STD(VESA_STD),
	.RED_DEPTH(5),
	.GREEN_DEPTH(6),
	.BLUE_DEPTH(5)
)
inst_ov5640_interface
(
	.i_arst_pclk_x2		(w_srst_pclk_x2),
	.i_arst_pclk_x1		(w_srst_pclk_x1),
	.i_arst_pclk_div2	(w_srst_pclk_div2),
	.i_ov5640_pclk		(i_ov5640_pclk),
	.i_ov5640_vsync		(r_ov5640_vsync_2P),
	.i_ov5640_href		(r_ov5640_href_2P),
	.i_ov5640_d			(r_ov5640_d_2P),
	
	.o_pclk_x1			(w_vga_pclk),
	.o_pclk_div2		(w_vga_pclk_div2),
	.o_synced			(),
	.o_vs				(w_vsync_1P),
	.o_hs				(w_hsync_1P),
	.o_de				(w_de_1P),
	.o_r				(w_r_1P),
	.o_g				(w_g_1P),
	.o_b				(w_b_1P)
);

color_coding_converter
#(
	.R_DEPTH(R_DEPTH),
	.G_DEPTH(G_DEPTH),
	.B_DEPTH(B_DEPTH),
	.Y_DEPTH(Y_DEPTH),
	.U_DEPTH(U_DEPTH),
	.V_DEPTH(V_DEPTH),
	.RGB2YUV_TWOCOMP_WIDTH(9),
	.YUV2RGB_TWOCOMP_WIDTH(10),
	
	.ROM_A00(ROM_A00),
	.ROM_A01(ROM_A01),
	.ROM_A02(ROM_A02),
	.ROM_A10(ROM_A10),
	.ROM_A11(ROM_A11),
	.ROM_A12(ROM_A12),
	.ROM_A20(ROM_A20),
	.ROM_A21(ROM_A21),
	.ROM_A22(ROM_A22)
)
inst_color_coding_converter
(
	.i_arst(w_srst_pclk_x1),
	.i_pclk(w_vga_pclk),
	
	.i_rgb2yuv_de	(w_de_1P),
	.i_rgb2yuv_r	({w_r_1P, 3'b000}),
	.i_rgb2yuv_g	({w_g_1P, 2'b00}),
	.i_rgb2yuv_b	({w_b_1P, 3'b000}),
	.o_rgb2yuv_de	(w_de_6P),
	.o_rgb2yuv_y	(w_y_6P),
	.o_rgb2yuv_u	(w_u_6P),
	.o_rgb2yuv_v	(w_v_6P),
	
	.i_yuv2rgb_de	(r_de_19P),
	.i_yuv2rgb_y	(r_y_19P),
	.i_yuv2rgb_u	(r_u_19P),
	.i_yuv2rgb_v	(r_v_19P),
	.o_yuv2rgb_de	(w_yuv2rgb_de_24P),
	.o_yuv2rgb_r	(w_yuv2rgb_r_24P),
	.o_yuv2rgb_g	(w_yuv2rgb_g_24P),
	.o_yuv2rgb_b	(w_yuv2rgb_b_24P)
);

shift_reg
#(
	.D_WIDTH(2),
	.TAPE(5)
)
inst_shift_reg_00
(
	.i_arst(w_srst_pclk_x1),
	.i_clk(w_vga_pclk),
	
	.i_d({w_vsync_1P, w_hsync_1P}),
	.o_q({w_vsync_6P, w_hsync_6P})
);

line_buffer
#(
	.VESA_STD	(VESA_STD),
	.Y_DEPTH	(Y_DEPTH),
	.U_DEPTH	(U_DEPTH),
	.V_DEPTH	(V_DEPTH),
	
	.X_LSB_CNT_WIDTH(5),
	.X_MSB_CNT_WIDTH(6)
)
inst_line_buffer
(
	.i_arst(w_srst_pclk_x1),
	.i_pclk(w_vga_pclk),
	
	.i_vsync(w_vsync_6P),
	.i_hsync(w_hsync_6P),
	.i_de(w_de_6P),
	.i_y(w_y_6P),
	.i_u(w_u_6P),
	.i_v(w_v_6P),
	
	.o_vsync(w_vsync_8P),
	.o_hsync(w_hsync_8P),
	.o_de(w_de_8P),
	.o_y_11(w_y_11_8P),
	.o_u_11(w_u_11_8P),
	.o_v_11(w_v_11_8P),
	
	.o_y_00(w_y_00_8P),
	.o_u_00(w_u_00_8P),
	.o_v_00(w_v_00_8P),
	
	.o_y_01(w_y_01_8P),
	.o_u_01(w_u_01_8P),
	.o_v_01(w_v_01_8P),
	
	.o_x(w_x_8P)
);

always@(posedge w_srst_pclk_x1 or posedge w_vga_pclk)
begin
	if (w_srst_pclk_x1)
	begin
		r_posterize_de_9P		<= c_ina_de_por;
		r_posterize_vsync_9P	<= c_ina_vs_por;
		r_posterize_hsync_9P	<= c_ina_hs_por;
		r_posterize_y_01_9P		<= {Y_DEPTH{1'b0}};
		r_posterize_u_01_9P		<= {U_DEPTH{1'b0}};
		r_posterize_v_01_9P		<= {V_DEPTH{1'b0}};
		
		r_sobel_de_9P			<= c_ina_de_por;
		r_sobel_vsync_9P		<= c_ina_vs_por;
		r_sobel_hsync_9P		<= c_ina_hs_por;
		r_sobel_y_11_9P			<= {Y_DEPTH{1'b0}};
		r_sobel_y_00_9P			<= {Y_DEPTH{1'b0}};
		r_sobel_y_01_9P			<= {Y_DEPTH{1'b0}};
	end
	else
	begin
		r_posterize_de_9P		<= w_de_8P;
		r_posterize_vsync_9P	<= w_vsync_8P;
		r_posterize_hsync_9P	<= w_hsync_8P;
		r_posterize_y_01_9P		<= w_y_01_8P;
		r_posterize_u_01_9P		<= w_u_01_8P;
		r_posterize_v_01_9P		<= w_v_01_8P;
		
		r_sobel_de_9P			<= w_de_8P;
		r_sobel_vsync_9P		<= w_vsync_8P;
		r_sobel_hsync_9P		<= w_hsync_8P;
		r_sobel_y_11_9P			<= w_y_11_8P;
		r_sobel_y_00_9P			<= w_y_00_8P;
		r_sobel_y_01_9P			<= w_y_01_8P;
	end
end

posterize
#(
	.VESA_STD	(VESA_STD),
	.X_START	(0),
	.Y_START	(0),
	.X_END		(640),
	.Y_END		(720),
	.Y_DEPTH	(Y_DEPTH),
	.U_DEPTH	(U_DEPTH),
	.V_DEPTH	(V_DEPTH),
	.Y_TRIM_BIT	(5),
	.U_TRIM_BIT	(5),
	.V_TRIM_BIT	(5),
	
	.X_LSB_CNT_WIDTH(4),
	.X_MSB_CNT_WIDTH(6),
	.Y_LSB_CNT_WIDTH(4),
	.Y_MSB_CNT_WIDTH(6)
)
inst_posterize
(
	.i_arst			(w_srst_pclk_x1),
	.i_posterize_en	(w_posterize_en),
	.i_pclk			(w_vga_pclk),
	
	.i_vsync		(r_posterize_vsync_9P),
	.i_hsync		(r_posterize_hsync_9P),
	.i_de			(r_posterize_de_9P),
	.i_y			(r_posterize_y_01_9P),
	.i_u			(r_posterize_u_01_9P),
	.i_v			(r_posterize_v_01_9P),
	
	.o_vsync		(w_posterize_vsync_11P),
	.o_hsync		(w_posterize_hsync_11P),
	.o_de			(w_posterize_de_11P),
	.o_y			(w_posterize_y_11P),
	.o_u			(w_posterize_u_11P),
	.o_v			(w_posterize_v_11P),
	
	.o_x_done		(w_posterize_x_done)
);

shift_reg
#(
	.D_WIDTH(3+Y_DEPTH+U_DEPTH+V_DEPTH),
	.TAPE(7)
)
inst_shift_reg_01
(
	.i_arst(w_srst_pclk_x1),
	.i_clk(w_vga_pclk),
	
	.i_d({	w_posterize_de_11P, w_posterize_vsync_11P, w_posterize_hsync_11P,
			w_posterize_y_11P, w_posterize_u_11P, w_posterize_v_11P}),
	.o_q({	w_posterize_de_18P, w_posterize_vsync_18P, w_posterize_hsync_18P,
			w_posterize_y_18P, w_posterize_u_18P, w_posterize_v_18P})
);

sobel_filter
#(
	.VESA_STD	(VESA_STD),
	.X_START	(0),
	.Y_START	(0),
	.X_END		(640),
	.Y_END		(720),
	.Y_DEPTH	(Y_DEPTH),
	
	.X_LSB_CNT_WIDTH(4),
	.X_MSB_CNT_WIDTH(6),
	.Y_LSB_CNT_WIDTH(4),
	.Y_MSB_CNT_WIDTH(6)
)
inst_sobel_filter
(
	.i_arst		(w_srst_pclk_x1),
	.i_pclk		(w_vga_pclk),
	
	.i_vsync	(r_sobel_vsync_9P),
	.i_hsync	(r_sobel_hsync_9P),
	.i_de		(r_sobel_de_9P),
	.i_y_11_01	(r_sobel_y_11_9P),
	.i_y_00_01	(r_sobel_y_00_9P),
	.i_y_01_01	(r_sobel_y_01_9P),
	
	.o_x_en		(w_sobel_x_en_18P),
	.o_vsync	(w_sobel_vsync_18P),
	.o_hsync	(w_sobel_hsync_18P),
	.o_de		(w_sobel_de_18P),
	.o_y		(w_sobel_y_18P)
);

display_fsm
#(
	.TIMER_WIDTH(15)
)
inst_display_fsm
(
	.i_arst(w_srst_pclk_x1),
	.i_osc(i_osc),
	.i_pclk(w_vga_pclk),
	.i_sw_n(i_sw_n),
	.i_pll_locked(w_confdone),
	
	.o_srst(w_srst),
	.o_pll_locked(),
	.o_posterize_en(w_posterize_en),
	.o_display_sel(w_display_sel)
);

always@(posedge w_srst_pclk_x1 or posedge w_vga_pclk)
begin
	if (w_srst_pclk_x1)
	begin
		r_vsync_19P	<= c_ina_vs_por;
		r_hsync_19P	<= c_ina_hs_por;
		r_de_19P	<= c_ina_de_por;
		r_y_19P		<= {Y_DEPTH{1'b0}};
		r_u_19P		<= {U_DEPTH{1'b0}};
		r_v_19P		<= {V_DEPTH{1'b0}};
	end
	else
	begin
		if (w_display_sel[0])
		begin
			r_vsync_19P				<= w_sobel_vsync_18P;
			r_hsync_19P				<= w_sobel_hsync_18P;
			r_de_19P				<= w_sobel_de_18P;
			r_y_19P					<= w_sobel_y_18P;
			r_u_19P[U_DEPTH-1]		<= 1'b1;
			r_u_19P[U_DEPTH-2:0]	<= {U_DEPTH-1{1'b0}};
			r_v_19P[V_DEPTH-1]		<= 1'b1;
			r_v_19P[V_DEPTH-2:0]	<= {V_DEPTH-1{1'b0}};
		end
		else if (w_display_sel[1] & w_sobel_x_en_18P)
		begin
			r_vsync_19P				<= w_sobel_vsync_18P;
			r_hsync_19P				<= w_sobel_hsync_18P;
			r_de_19P				<= w_sobel_de_18P;
			r_y_19P					<= w_sobel_y_18P;
			r_u_19P[U_DEPTH-1]		<= 1'b1;
			r_u_19P[U_DEPTH-2:0]	<= {U_DEPTH-1{1'b0}};
			r_v_19P[V_DEPTH-1]		<= 1'b1;
			r_v_19P[V_DEPTH-2:0]	<= {V_DEPTH-1{1'b0}};
		end
		else
		begin
			r_vsync_19P				<= w_posterize_vsync_18P;
			r_hsync_19P				<= w_posterize_hsync_18P;
			r_de_19P				<= w_posterize_de_18P;
			r_y_19P					<= w_posterize_y_18P;
			r_u_19P					<= w_posterize_u_18P;
			r_v_19P					<= w_posterize_v_18P;
		end
	end
end

shift_reg
#(
	.D_WIDTH(2),
	.TAPE(5)
)
inst_shift_reg_02
(
	.i_arst(w_srst_pclk_x1),
	.i_clk(w_vga_pclk),
	
	.i_d({r_vsync_19P, r_hsync_19P}),
	.o_q({w_yuv2rgb_vsync_24P, w_yuv2rgb_hsync_24P})
);

shift_reg
#(
	.D_WIDTH(2+R_DEPTH+G_DEPTH+B_DEPTH),
	.TAPE(1)
)
inst_shift_reg_vga
(
	.i_arst(w_srst_pclk_x1),
	.i_clk(w_vga_pclk),
	.i_d({	w_yuv2rgb_vsync_24P, w_yuv2rgb_hsync_24P,
			w_yuv2rgb_r_24P, w_yuv2rgb_g_24P, w_yuv2rgb_b_24P}),
	.o_q({	w_vga_vsync, w_vga_hsync,
			w_vga_r, w_vga_g, w_vga_b})
);

shift_reg
#(
	.D_WIDTH(2+R_DEPTH+G_DEPTH+B_DEPTH),
	.TAPE(3)
)
inst_shift_reg_led
(
	.i_arst(w_srst_pclk_x1),
	.i_clk(w_vga_pclk),
	.i_d({	w_yuv2rgb_vsync_24P, w_yuv2rgb_de_24P,
			w_yuv2rgb_r_24P, w_yuv2rgb_g_24P, w_yuv2rgb_b_24P}),
	.o_q({	w_led_vsync, w_led_de,
			w_led_r, w_led_g, w_led_b})
);

assign	o_vga_vsync		= w_vga_vsync;
assign	o_vga_hsync		= w_vga_hsync;
assign	o_vga_r			= w_vga_r[7:2];
assign	o_vga_g			= w_vga_g[7:2];
assign	o_vga_b			= w_vga_b[7:2];

assign	o_vga_pclk		= w_vga_pclk;

endmodule
