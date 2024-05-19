// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`define VESA_1280X720_60FPS
`include "vesa_parameter.vh"

module posterize
#(
	parameter	VESA_STD	= "VESA_1280X720_60FPS",
	parameter	X_START		= 0,
	parameter	Y_START		= 0,
	parameter	X_END		= 640,
	parameter	Y_END		= 720,
	parameter	Y_DEPTH		= 8,
	parameter	U_DEPTH		= 8,
	parameter	V_DEPTH		= 8,
	parameter	Y_TRIM_BIT	= 5,
	parameter	U_TRIM_BIT	= 5,
	parameter	V_TRIM_BIT	= 5,
	
	parameter	X_LSB_CNT_WIDTH	= 4,
	parameter	X_MSB_CNT_WIDTH	= 6,
	parameter	Y_LSB_CNT_WIDTH	= 4,
	parameter	Y_MSB_CNT_WIDTH = 6
)
(
	input	i_arst,
	input	i_pclk,
	input	i_posterize_en,
	
	input	i_vsync,
	input	i_hsync,
	input	i_de,
	input	[Y_DEPTH-1:0]i_y,
	input	[U_DEPTH-1:0]i_u,
	input	[V_DEPTH-1:0]i_v,
	
	output	o_vsync,
	output	o_hsync,
	output	o_de,
	output	[Y_DEPTH-1:0]o_y,
	output	[U_DEPTH-1:0]o_u,
	output	[V_DEPTH-1:0]o_v,
	
	output	o_x_done
);

//localparam	X_MSB_END	= X_END/(2**X_LSB_CNT_WIDTH)-1;
localparam	X_MSB_END	= X_END/(2**X_LSB_CNT_WIDTH);
//wire	[X_MSB_CNT_WIDTH-1:0]w_X_MSB_END;
//wire	[X_LSB_CNT_WIDTH-1:0]w_X_LSB_END;

localparam	HOR_SYNC_POLARITY	= `HOR_SYNC_POLARITY;
localparam	VER_SYNC_POLARITY	= `VER_SYNC_POLARITY;
wire	c_act_vs_por;
wire	c_ina_vs_por;
wire	c_act_hs_por;
wire	c_ina_hs_por;
wire	c_act_de_por;
wire	c_ina_de_por;

reg		[X_LSB_CNT_WIDTH-1:0]r_x_lsb_cnt_1P;
reg		[X_MSB_CNT_WIDTH-1:0]r_x_msb_cnt_1P;
//reg		r_x_done_1P;
//reg		r_x_msb_cnt_inc_1P;

reg		r_posterize_en_1P;

reg		r_vsync_1P;
reg		r_hsync_1P;
reg		r_de_1P;
reg		[Y_DEPTH-1:0]r_y_1P;
reg		[U_DEPTH-1:0]r_u_1P;
reg		[V_DEPTH-1:0]r_v_1P;

reg		r_vsync_2P;
reg		r_hsync_2P;
reg		r_de_2P;
reg		[Y_DEPTH-1:0]r_y_2P;
reg		[U_DEPTH-1:0]r_u_2P;
reg		[V_DEPTH-1:0]r_v_2P;
reg		r_x_done_y_2P;
reg		r_x_done_u_2P;
reg		r_x_done_v_2P;

//assign	w_X_MSB_END	= r_x_msb_cnt_1P-X_MSB_END;
//assign	w_X_LSB_END	= r_x_lsb_cnt_1P-{X_LSB_CNT_WIDTH{1'b1}};

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

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_x_lsb_cnt_1P	<= {X_LSB_CNT_WIDTH{1'b0}};
		r_x_msb_cnt_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
//		r_x_done_1P		<= 1'b0;
//		r_x_msb_cnt_inc_1P	<= 1'b0;
		
		r_posterize_en_1P	<= 1'b0;
		
		r_vsync_1P		<= c_ina_vs_por;
		r_hsync_1P		<= c_ina_hs_por;
		r_de_1P			<= c_ina_de_por;
		r_y_1P			<= {Y_DEPTH{1'b0}};
		r_u_1P			<= {U_DEPTH{1'b0}};
		r_v_1P			<= {V_DEPTH{1'b0}};
		
		r_vsync_2P		<= c_ina_vs_por;
		r_hsync_2P		<= c_ina_hs_por;
		r_de_2P			<= c_ina_de_por;
		r_y_2P			<= {Y_DEPTH{1'b0}};
		r_u_2P			<= {U_DEPTH{1'b0}};
		r_v_2P			<= {V_DEPTH{1'b0}};
		r_x_done_y_2P	<= 1'b0;
		r_x_done_u_2P	<= 1'b0;
		r_x_done_v_2P	<= 1'b0;
	end
	else
	begin
//		r_x_msb_cnt_inc_1P	<= 1'b0;
		
		r_posterize_en_1P	<= i_posterize_en;
		
		if (i_hsync == c_act_hs_por)
			r_x_lsb_cnt_1P	<= {X_LSB_CNT_WIDTH{1'b0}};
		else if (i_de)
			r_x_lsb_cnt_1P	<= r_x_lsb_cnt_1P+1'b1;
		
/*		if (r_x_msb_cnt_inc_1P)
		begin
			r_x_msb_cnt_1P	<= r_x_msb_cnt_1P+1'b1;
			if (r_x_msb_cnt_1P == X_MSB_END)
			begin
//				r_x_done_1P		<= 1'b1;
				r_x_done_y_2P	<= 1'b1;
				r_x_done_u_2P	<= 1'b1;
				r_x_done_v_2P	<= 1'b1;
			end
		end*/
		
		if (i_hsync == c_act_hs_por)
		begin
			r_x_msb_cnt_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
//			r_x_done_1P		<= 1'b0;
		end
//		else if (w_X_LSB_END == {X_LSB_CNT_WIDTH{1'b0}})
		else if (r_x_lsb_cnt_1P == {X_LSB_CNT_WIDTH{1'b1}})
		begin
//			r_x_msb_cnt_inc_1P	<= 1'b1;
			r_x_msb_cnt_1P	<= r_x_msb_cnt_1P+1'b1;
//			if (w_X_MSB_END == {X_MSB_CNT_WIDTH{1'b0}})
//			if (r_x_msb_cnt_1P == X_MSB_END)
//				r_x_done_1P		<= 1'b1;
		end
		
		if (r_hsync_1P == c_act_hs_por)
		begin
//			r_x_done_y_2P	<= 1'b0;
//			r_x_done_u_2P	<= 1'b0;
//			r_x_done_v_2P	<= 1'b0;
			
			r_x_done_y_2P	<= r_posterize_en_1P;
			r_x_done_u_2P	<= r_posterize_en_1P;
			r_x_done_v_2P	<= r_posterize_en_1P;
		end
		else if (r_x_msb_cnt_1P == X_MSB_END)
		begin
			r_x_done_y_2P	<= 1'b1;
			r_x_done_u_2P	<= 1'b1;
			r_x_done_v_2P	<= 1'b1;

//			r_x_done_y_2P	<= r_posterize_en_1P;
//			r_x_done_u_2P	<= r_posterize_en_1P;
//			r_x_done_v_2P	<= r_posterize_en_1P;
		end
		
		r_vsync_1P	<= i_vsync;
		r_hsync_1P	<= i_hsync;
		r_de_1P		<= i_de;
//		r_y_1P[Y_DEPTH-1:Y_TRIM_BIT]	<= i_y[Y_DEPTH-1:Y_TRIM_BIT];
//		r_u_1P[U_DEPTH-1:U_TRIM_BIT]	<= i_u[U_DEPTH-1:U_TRIM_BIT];
//		r_v_1P[V_DEPTH-1:V_TRIM_BIT]	<= i_v[V_DEPTH-1:V_TRIM_BIT];
		r_y_1P		<= i_y;
		r_u_1P		<= i_u;
		r_v_1P		<= i_v;
		
/*		if (~r_x_done_1P)
		begin
			r_y_1P[Y_TRIM_BIT-1:0]	<= {Y_TRIM_BIT{1'b0}};
			r_u_1P[U_TRIM_BIT-1:0]	<= {U_TRIM_BIT{1'b0}};
			r_v_1P[V_TRIM_BIT-1:0]	<= {V_TRIM_BIT{1'b0}};
		end
		else
		begin
			r_y_1P[Y_TRIM_BIT-1:0]	<= i_y[Y_TRIM_BIT-1:0];
			r_u_1P[U_TRIM_BIT-1:0]	<= i_u[U_TRIM_BIT-1:0];
			r_v_1P[V_TRIM_BIT-1:0]	<= i_v[V_TRIM_BIT-1:0];
		end*/
		
		r_vsync_2P		<= r_vsync_1P;
		r_hsync_2P		<= r_hsync_1P;
		r_de_2P			<= r_de_1P;
		r_y_2P[Y_DEPTH-1:Y_TRIM_BIT]	<= r_y_1P[Y_DEPTH-1:Y_TRIM_BIT];
		r_u_2P[U_DEPTH-1:U_TRIM_BIT]	<= r_u_1P[U_DEPTH-1:U_TRIM_BIT];
		r_v_2P[V_DEPTH-1:V_TRIM_BIT]	<= r_v_1P[V_DEPTH-1:V_TRIM_BIT];
		
//		r_x_done_y_2P	<= r_x_done_1P;
//		r_x_done_u_2P	<= r_x_done_1P;
//		r_x_done_v_2P	<= r_x_done_1P;
		
		if (~r_x_done_y_2P)
			r_y_2P[Y_TRIM_BIT-1:0]	<= {Y_TRIM_BIT{1'b0}};
		else
			r_y_2P[Y_TRIM_BIT-1:0]	<= r_y_1P[Y_TRIM_BIT-1:0];
		
		if (~r_x_done_u_2P)
			r_u_2P[U_TRIM_BIT-1:0]	<= {U_TRIM_BIT{1'b0}};
		else
			r_u_2P[U_TRIM_BIT-1:0]	<= r_u_1P[U_TRIM_BIT-1:0];
		
		if (~r_x_done_v_2P)
			r_v_2P[V_TRIM_BIT-1:0]	<= {V_TRIM_BIT{1'b0}};
		else
			r_v_2P[V_TRIM_BIT-1:0]	<= r_v_1P[V_TRIM_BIT-1:0];
	end
end

//assign	o_vsync		= r_vsync_1P;
//assign	o_hsync		= r_hsync_1P;
//assign	o_de		= r_de_1P;
//assign	o_y			= r_y_1P;
//assign	o_u			= r_u_1P;
//assign	o_v			= r_v_1P;
assign	o_vsync		= r_vsync_2P;
assign	o_hsync		= r_hsync_2P;
assign	o_de		= r_de_2P;
assign	o_y			= r_y_2P;
assign	o_u			= r_u_2P;
assign	o_v			= r_v_2P;

//assign	o_x_done	= r_x_done_1P;
assign	o_x_done	= r_x_done_y_2P;

endmodule
