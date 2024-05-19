// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`define VESA_1280X720_60FPS
`include "vesa_parameter.vh"

module sobel_filter
#(
	parameter	VESA_STD	= "VESA_180X720_60FPS",
	parameter	X_START		= 0,
	parameter	Y_START		= 0,
	parameter	X_END		= 640,
	parameter	Y_END		= 720,
	parameter	Y_DEPTH		= 8,
	
	parameter	X_LSB_CNT_WIDTH	= 4,
	parameter	X_MSB_CNT_WIDTH	= 6,
	parameter	Y_LSB_CNT_WIDTH	= 4,
	parameter	Y_MSB_CNT_WIDTH	= 6
)
(
	input	i_arst,
	input	i_pclk,
	
	input	i_vsync,
	input	i_hsync,
	input	i_de,
	input	[Y_DEPTH-1:0]i_y_11_01,
	input	[Y_DEPTH-1:0]i_y_00_01,
	input	[Y_DEPTH-1:0]i_y_01_01,
	
	output	o_x_en,
	output	o_vsync,
	output	o_hsync,
	output	o_de,
	output	[Y_DEPTH-1:0]o_y
);

localparam	HOR_SYNC_POLARITY	= `HOR_SYNC_POLARITY;
localparam	VER_SYNC_POLARITY	= `VER_SYNC_POLARITY;
wire	c_act_vs_por;
wire	c_ina_vs_por;
wire	c_act_hs_por;
wire	c_ina_hs_por;
wire	c_act_de_por;
wire	c_ina_de_por;

reg		r_vsync_1P;
reg		r_de_1P;

wire	w_x_en_1P;
wire	w_hsync_1P;

wire	w_x_en_9P;
wire	w_vsync_9P;
wire	w_hsync_9P;
wire	w_de_9P;
wire	[Y_DEPTH-1:0]w_y_9P;

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

sobel_feldman
//sobel_scharr
#(
	.Y_DEPTH(Y_DEPTH)
)
inst_sobel_pixel
(
	.i_arst			(i_arst),
	.i_pclk			(i_pclk),
	
	.i_pixel_11_01	(i_y_11_01),
	.i_pixel_00_01	(i_y_00_01),
	.i_pixel_01_01	(i_y_01_01),
	
	.o_pixel		(w_y_9P)
);

filter_size
#(
	.VESA_STD	(VESA_STD),
	.X_START	(0),
	.Y_START	(0),
	.X_END		(640),
	.Y_END		(720),
	
	.X_LSB_CNT_WIDTH(4),
	.X_MSB_CNT_WIDTH(6),
	.Y_LSB_CNT_WIDTH(4),
	.Y_MSB_CNT_WIDTH(6)
)
isnt_filter_size
(
	.i_arst		(i_arst),
	.i_pclk		(i_pclk),
	.i_hsync	(i_hsync),
	.o_hsync	(w_hsync_1P),
	.o_x_en		(w_x_en_1P)
);

shift_reg
#(
	.D_WIDTH(4),
	.TAPE(8)
)
inst_shift_reg
(
	.i_arst(i_arst),
	.i_clk(i_pclk),
	
	.i_d({w_x_en_1P, r_vsync_1P, w_hsync_1P, r_de_1P}),
	.o_q({w_x_en_9P, w_vsync_9P, w_hsync_9P, w_de_9P})
);

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_vsync_1P	<= c_ina_vs_por;
		r_de_1P		<= c_ina_de_por;
	end
	else
	begin
		r_vsync_1P	<= i_vsync;
		r_de_1P		<= i_de;
	end
end

assign	o_x_en	= w_x_en_9P;
assign	o_vsync	= w_vsync_9P;
assign	o_hsync	= w_hsync_9P;
assign	o_de	= w_de_9P;
assign	o_y		= w_y_9P;

endmodule
