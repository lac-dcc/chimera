`define VESA_1280X720_60FPS
`include "vesa_parameter.vh"

module ov5640_interface
#(
	parameter	VESA_STD	= "VESA_1280X720_60FPS",
	parameter	RED_DEPTH	= 5,
	parameter	GREEN_DEPTH	= 6,
	parameter	BLUE_DEPTH	= 5
)
(
	input	i_arst_pclk_x2,
	input	i_arst_pclk_x1,
	input	i_arst_pclk_div2,
	input	i_ov5640_pclk,
	input	i_ov5640_vsync,
	input	i_ov5640_href,
	input	[7:0]i_ov5640_d,
	
	output	o_pclk_x1,
	output	o_pclk_div2,
	output	o_synced,
	output	o_vs,
	output	o_hs,
	output	o_de,
	output	[RED_DEPTH-1:0]o_r,
	output	[GREEN_DEPTH-1:0]o_g,
	output	[BLUE_DEPTH-1:0]o_b
);

reg		r_pclk_x1_1P	= 1'b0;
reg		r_pclk_div2_1P	= 1'b0;
//reg		r_pclk_x1_1P	= 1'b1;
//reg		r_pclk_div2_1P	= 1'b1;
reg		r_vs_sel_2P;
reg		r_de_sel_2P;
reg		r_vs_sel_3P		= 1'b0;
reg		r_vs_sel_4P		= 1'b0;
reg		r_vs_sel_5P		= 1'b0;

reg		[1:0]r_ov5640_vsync_pclk_x1_1P;
reg		[1:0]r_ov5640_vs_pclk_x1_1P;
reg		[1:0]r_ov5640_href_pclk_x1_1P;
reg		[1:0]r_ov5640_de_pclk_x1_1P;
reg		[15:0]r_ov5640_d_pclk_x1_1P;

reg		[1:0]r_ov5640_vsync_pclk_x1_2P;
reg		[1:0]r_ov5640_vs_pclk_x1_2P;
reg		[1:0]r_ov5640_href_pclk_x1_2P;
reg		[1:0]r_ov5640_de_pclk_x1_2P;
reg		[15:0]r_ov5640_d_pclk_x1_2P;

reg		r_ov5640_vsync_pclk_x1_FP;
reg		r_ov5640_href_pclk_x1_FP;
reg		[7:0]r_ov5640_d_pclk_x1_FP;

reg		[1:0]r_ov5640_vsync_pclk_x1_3P;
reg		[1:0]r_ov5640_href_pclk_x1_3P;
reg		[15:0]r_ov5640_d_pclk_x1_3P;

reg		r_vs_pclk_x1_4P;
reg		r_de_pclk_x1_4P;
reg		[RED_DEPTH-1:0]r_r_pclk_x1_4P;
reg		[GREEN_DEPTH-1:0]r_g_pclk_x1_4P;
reg		[BLUE_DEPTH-1:0]r_b_pclk_x1_4P;

reg		r_neven_odd_pclk_x1_5P;
reg		r_vs_pclk_x1_5P;
reg		r_de_pclk_x1_5P;
reg		[RED_DEPTH-1:0]r_r_pclk_x1_5P;
reg		[GREEN_DEPTH-1:0]r_g_pclk_x1_5P;
reg		[BLUE_DEPTH-1:0]r_b_pclk_x1_5P;

reg		r_neven_odd_pclk_x1_6P;
reg		r_vs_pclk_x1_6P;
reg		[2*RED_DEPTH-1:0]r_r_pclk_x1_6P;
reg		[2*GREEN_DEPTH-1:0]r_g_pclk_x1_6P;
reg		[2*BLUE_DEPTH-1:0]r_b_pclk_x1_6P;

reg		r_vs_pclk_div2_7P;
reg		r_de_pclk_div2_7P;
reg		[2*RED_DEPTH-1:0]r_r_pclk_div2_7P;
reg		[2*GREEN_DEPTH-1:0]r_g_pclk_div2_7P;
reg		[2*BLUE_DEPTH-1:0]r_b_pclk_div2_7P;

reg		r_vs_pclk_div2_8P;
reg		r_de_pclk_div2_8P;
reg		[2*RED_DEPTH-1:0]r_r_pclk_div2_8P;
reg		[2*GREEN_DEPTH-1:0]r_g_pclk_div2_8P;
reg		[2*BLUE_DEPTH-1:0]r_b_pclk_div2_8P;

reg		r_vs_pclk_div2_9P;
reg		r_hs_pclk_div2_9P;
reg		r_de_pclk_div2_9P;
reg		[2*RED_DEPTH-1:0]r_r_pclk_div2_9P;
reg		[2*GREEN_DEPTH-1:0]r_g_pclk_div2_9P;
reg		[2*BLUE_DEPTH-1:0]r_b_pclk_div2_9P;
reg		[9:0]r_x_9P;
reg		[9:0]r_y_9P;
reg		r_synced_pclk_div2_9P;
reg		r_de_next_pclk_div2_9P;

reg		r_vs_pclk_x1_10P;
reg		r_hs_pclk_x1_10P;
reg		r_de_pclk_x1_10P;
reg		[2*RED_DEPTH-1:0]r_r_pclk_x1_10P;
reg		[2*GREEN_DEPTH-1:0]r_g_pclk_x1_10P;
reg		[2*BLUE_DEPTH-1:0]r_b_pclk_x1_10P;

reg		r_vs_pclk_x1_11P;
reg		r_hs_pclk_x1_11P;
reg		r_de_pclk_x1_11P;
reg		[2*RED_DEPTH-1:0]r_r_pclk_x1_11P;
reg		[2*GREEN_DEPTH-1:0]r_g_pclk_x1_11P;
reg		[2*BLUE_DEPTH-1:0]r_b_pclk_x1_11P;

reg		r_neven_odd_pclk_x1_12P;
reg		r_de_pclk_x1_12P;
reg		[RED_DEPTH-1:0]r_r_pclk_x1_12P;
reg		[GREEN_DEPTH-1:0]r_g_pclk_x1_12P;
reg		[BLUE_DEPTH-1:0]r_b_pclk_x1_12P;

wire	[1:0]w_ov5640_vsync_pclk_x1;
wire	[1:0]w_ov5640_href_pclk_x1;
wire	[15:0]w_ov5640_d_pclk_x1;

wire	w_de;
wire	[RED_DEPTH-1:0]w_r;
wire	[GREEN_DEPTH-1:0]w_g;
wire	[BLUE_DEPTH-1:0]w_b;

wire	c_act_vs_por;
wire	c_ina_vs_por;
wire	c_act_hs_por;
wire	c_ina_hs_por;
wire	c_act_de_por;
wire	c_ina_de_por;
wire	w_pclk_x1;
wire	w_pclk_div2;
wire	[11:0]c_cmp_hor_sync_time;
wire	[11:0]c_cmp_hor_total_time;

assign	w_pclk_x1				= r_pclk_x1_1P;
assign	w_pclk_div2				= r_pclk_div2_1P;
assign	c_cmp_hor_sync_time		= `HOR_SYNC_TIME-1'b1;
assign	c_cmp_hor_total_time	= `HOR_TOTAL_TIME-1'b1;

generate
	localparam	HOR_SYNC_POLARITY	= `HOR_SYNC_POLARITY;
	localparam	VER_SYNC_POLARITY	= `VER_SYNC_POLARITY;
	
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

sync_ddio_group_in
#(
	.DW(10),
	.SYNC("RISING")
)
inst_sync_ddio_group_in
(
	.arst_c_x1(i_arst_pclk_x1),
	.arst_c_x2(i_arst_pclk_x2),
	.c_x1(w_pclk_x1),
	.c_x2(i_ov5640_pclk),
	.d({i_ov5640_vsync,
		i_ov5640_href,
		i_ov5640_d}),
	.q0({	w_ov5640_vsync_pclk_x1[0],
			w_ov5640_href_pclk_x1[0],
			w_ov5640_d_pclk_x1[15:8]
		}),
	.q1({	w_ov5640_vsync_pclk_x1[1],
			w_ov5640_href_pclk_x1[1],
			w_ov5640_d_pclk_x1[7:0]
		})
);

always@(posedge i_ov5640_pclk)
begin
	r_vs_sel_3P	<= r_vs_sel_2P;
	r_vs_sel_4P	<= r_vs_sel_3P;
	r_vs_sel_5P	<= r_vs_sel_4P;
	
	if (r_vs_sel_4P && ~r_vs_sel_5P)
		r_pclk_x1_1P	<= r_pclk_x1_1P;
	else
		r_pclk_x1_1P	<= ~r_pclk_x1_1P;
end

always@(posedge w_pclk_x1)
begin
	r_pclk_div2_1P	<= ~r_pclk_div2_1P;
end

always@(posedge i_arst_pclk_x1 or posedge w_pclk_x1)
begin
	if (i_arst_pclk_x1)
	begin
		r_vs_sel_2P		<= 1'b0;
		r_de_sel_2P		<= 1'b0;
		
		r_ov5640_vsync_pclk_x1_1P	<= {2{1'b0}};
		r_ov5640_vs_pclk_x1_1P		<= {2{1'b0}};
		r_ov5640_href_pclk_x1_1P	<= {2{1'b0}};
		r_ov5640_de_pclk_x1_1P		<= {2{1'b0}};
		r_ov5640_d_pclk_x1_1P		<= {16{1'b0}};
		
		r_ov5640_vsync_pclk_x1_2P	<= {2{1'b0}};
		r_ov5640_vs_pclk_x1_2P		<= {2{1'b0}};
		r_ov5640_href_pclk_x1_2P	<= {2{1'b0}};
		r_ov5640_de_pclk_x1_2P		<= {2{1'b0}};
		r_ov5640_d_pclk_x1_2P		<= {16{1'b0}};
		
		r_ov5640_vsync_pclk_x1_FP	<= {1{1'b0}};
		r_ov5640_href_pclk_x1_FP	<= {1{1'b0}};
		r_ov5640_d_pclk_x1_FP		<= {8{1'b0}};
		
		r_ov5640_vsync_pclk_x1_3P	<= {2{1'b0}};
		r_ov5640_href_pclk_x1_3P	<= {2{1'b0}};
		r_ov5640_d_pclk_x1_3P		<= {16{1'b0}};
		
		r_vs_pclk_x1_4P			<= c_ina_vs_por;
		r_de_pclk_x1_4P			<= 1'b0;
		r_r_pclk_x1_4P			<= {RED_DEPTH{1'b0}};
		r_g_pclk_x1_4P			<= {GREEN_DEPTH{1'b0}};
		r_b_pclk_x1_4P			<= {BLUE_DEPTH{1'b0}};
		
		r_neven_odd_pclk_x1_5P	<= 1'b0;
		r_vs_pclk_x1_5P			<= c_ina_vs_por;
		r_de_pclk_x1_5P			<= 1'b0;
		r_r_pclk_x1_5P			<= {RED_DEPTH{1'b0}};
		r_g_pclk_x1_5P			<= {GREEN_DEPTH{1'b0}};
		r_b_pclk_x1_5P			<= {BLUE_DEPTH{1'b0}};
		
		r_neven_odd_pclk_x1_6P	<= 1'b0;
		r_vs_pclk_x1_6P			<= c_ina_vs_por;
		r_r_pclk_x1_6P			<= {RED_DEPTH{1'b0}};
		r_g_pclk_x1_6P			<= {GREEN_DEPTH{1'b0}};
		r_b_pclk_x1_6P			<= {BLUE_DEPTH{1'b0}};
	end
	else
	begin
		r_ov5640_vsync_pclk_x1_1P	<= w_ov5640_vsync_pclk_x1;
		r_ov5640_vs_pclk_x1_1P		<= w_ov5640_vsync_pclk_x1;
		r_ov5640_href_pclk_x1_1P	<= w_ov5640_href_pclk_x1;
		r_ov5640_de_pclk_x1_1P		<= w_ov5640_href_pclk_x1;
		r_ov5640_d_pclk_x1_1P		<= w_ov5640_d_pclk_x1;
		
		r_ov5640_vsync_pclk_x1_2P	<= r_ov5640_vsync_pclk_x1_1P;
		r_ov5640_vs_pclk_x1_2P		<= r_ov5640_vsync_pclk_x1_1P;
		r_ov5640_href_pclk_x1_2P	<= r_ov5640_href_pclk_x1_1P;
		r_ov5640_de_pclk_x1_2P		<= r_ov5640_href_pclk_x1_1P;
		r_ov5640_d_pclk_x1_2P		<= r_ov5640_d_pclk_x1_1P;
		if (r_ov5640_vs_pclk_x1_1P == 2'b10)
			r_vs_sel_2P		<= 1'b1;
		else if (r_ov5640_vs_pclk_x1_1P == 2'b11 && r_ov5640_vs_pclk_x1_2P == 2'b00)
			r_vs_sel_2P		<= 1'b0;
		
		if (r_ov5640_de_pclk_x1_1P == 2'b10)
			r_de_sel_2P		<= 1'b1;
		else if (r_ov5640_de_pclk_x1_1P == 2'b11 && r_ov5640_de_pclk_x1_2P == 2'b00)
			r_de_sel_2P		<= 1'b0;
		
		r_ov5640_vsync_pclk_x1_FP	<= r_ov5640_vsync_pclk_x1_2P[1];
		r_ov5640_href_pclk_x1_FP	<= r_ov5640_href_pclk_x1_2P[1];
		r_ov5640_d_pclk_x1_FP		<= r_ov5640_d_pclk_x1_2P[15:8];
		
		if (r_vs_sel_2P)
			r_ov5640_vsync_pclk_x1_3P	<= {r_ov5640_vsync_pclk_x1_2P[0], r_ov5640_vsync_pclk_x1_FP};
		else
			r_ov5640_vsync_pclk_x1_3P	<= r_ov5640_vsync_pclk_x1_2P;
		
		if (r_de_sel_2P)
		begin
			r_ov5640_href_pclk_x1_3P	<= {r_ov5640_href_pclk_x1_2P[0], r_ov5640_href_pclk_x1_FP};
			r_ov5640_d_pclk_x1_3P		<= {r_ov5640_d_pclk_x1_2P[7:0], r_ov5640_d_pclk_x1_FP};
		end
		else
		begin
			r_ov5640_href_pclk_x1_3P	<= r_ov5640_href_pclk_x1_2P;
			r_ov5640_d_pclk_x1_3P		<= r_ov5640_d_pclk_x1_2P;
		end
		
		r_vs_pclk_x1_4P	<= 1'b0;
		if (r_ov5640_vsync_pclk_x1_3P[0])
			r_vs_pclk_x1_4P	<= 1'b1;
		
		r_de_pclk_x1_4P	<= 1'b0;
		if (r_ov5640_href_pclk_x1_3P[0])
			r_de_pclk_x1_4P	<= 1'b1;
		
		r_r_pclk_x1_4P	<= {RED_DEPTH{1'b0}};
		r_g_pclk_x1_4P	<= {GREEN_DEPTH{1'b0}};
		r_b_pclk_x1_4P	<= {BLUE_DEPTH{1'b0}};
		// Color Bar
		if (r_ov5640_href_pclk_x1_3P[1])
			r_b_pclk_x1_4P	<= r_ov5640_d_pclk_x1_3P[15:16-BLUE_DEPTH];
//			r_b_pclk_x1_4P	<= {BLUE_DEPTH{1'b0}};
		if (r_ov5640_href_pclk_x1_3P[0])
			r_g_pclk_x1_4P	<= r_ov5640_d_pclk_x1_3P[16-BLUE_DEPTH-1:16-BLUE_DEPTH-GREEN_DEPTH];
//			r_g_pclk_x1_4P	<= {GREEN_DEPTH{1'b0}};
		if (r_ov5640_href_pclk_x1_3P[1])
			r_r_pclk_x1_4P	<= r_ov5640_d_pclk_x1_3P[RED_DEPTH-1:0];
//			r_r_pclk_x1_4P	<= {RED_DEPTH{1'b1}};
		
		if (~r_de_pclk_x1_4P && r_de_pclk_x1_5P)
			r_neven_odd_pclk_x1_5P	<= 1'b0;
		else if (r_de_pclk_x1_4P)
			r_neven_odd_pclk_x1_5P	<= ~r_neven_odd_pclk_x1_5P;
		r_vs_pclk_x1_5P	<= r_vs_pclk_x1_4P;
		r_de_pclk_x1_5P	<= r_de_pclk_x1_4P;
		r_r_pclk_x1_5P	<= r_r_pclk_x1_4P;
		r_g_pclk_x1_5P	<= r_g_pclk_x1_4P;
		r_b_pclk_x1_5P	<= r_b_pclk_x1_4P;
		
		r_neven_odd_pclk_x1_6P	<= r_neven_odd_pclk_x1_5P;
		r_vs_pclk_x1_6P			<= r_vs_pclk_x1_5P;
		if (r_de_pclk_x1_5P)
		begin
			if (r_neven_odd_pclk_x1_5P && ~r_neven_odd_pclk_x1_6P)
			begin
				r_r_pclk_x1_6P	<= {r_r_pclk_x1_4P, r_r_pclk_x1_5P};
				r_g_pclk_x1_6P	<= {r_g_pclk_x1_4P, r_g_pclk_x1_5P};
				r_b_pclk_x1_6P	<= {r_b_pclk_x1_4P, r_b_pclk_x1_5P};
			end
		end
		else
		begin
			r_r_pclk_x1_6P	<= {RED_DEPTH*2{1'b0}};
			r_g_pclk_x1_6P	<= {GREEN_DEPTH*2{1'b0}};
			r_b_pclk_x1_6P	<= {BLUE_DEPTH*2{1'b0}};
		end
	end
end

always@(posedge i_arst_pclk_div2 or posedge w_pclk_div2)
begin
	if (i_arst_pclk_div2)
	begin
		r_vs_pclk_div2_7P		<= c_ina_vs_por;
		r_r_pclk_div2_7P		<= {2*RED_DEPTH{1'b0}};
		r_g_pclk_div2_7P		<= {2*GREEN_DEPTH{1'b0}};
		r_b_pclk_div2_7P		<= {2*BLUE_DEPTH{1'b0}};
		
		r_vs_pclk_div2_8P		<= c_ina_vs_por;
		r_r_pclk_div2_8P		<= {2*RED_DEPTH{1'b0}};
		r_g_pclk_div2_8P		<= {2*GREEN_DEPTH{1'b0}};
		r_b_pclk_div2_8P		<= {2*BLUE_DEPTH{1'b0}};
		
		r_vs_pclk_div2_9P		<= c_ina_vs_por;
		r_hs_pclk_div2_9P		<= c_ina_hs_por;
		r_de_pclk_div2_9P		<= c_ina_de_por;
		r_r_pclk_div2_9P		<= {2*RED_DEPTH{1'b0}};
		r_g_pclk_div2_9P		<= {2*GREEN_DEPTH{1'b0}};
		r_b_pclk_div2_9P		<= {2*BLUE_DEPTH{1'b0}};
		r_x_9P					<= {10{1'b0}};
		r_y_9P					<= {10{1'b0}};
		r_synced_pclk_div2_9P	<= 1'b0;
		r_de_next_pclk_div2_9P	<= c_ina_de_por;
	end
	else
	begin
		r_vs_pclk_div2_7P		<= r_vs_pclk_x1_6P;
		r_r_pclk_div2_7P		<= r_r_pclk_x1_6P;
		r_g_pclk_div2_7P		<= r_g_pclk_x1_6P;
		r_b_pclk_div2_7P		<= r_b_pclk_x1_6P;
		
		r_vs_pclk_div2_8P		<= r_vs_pclk_div2_7P;
		r_r_pclk_div2_8P		<= r_r_pclk_div2_7P;
		r_g_pclk_div2_8P		<= r_g_pclk_div2_7P;
		r_b_pclk_div2_8P		<= r_b_pclk_div2_7P;
		
		r_r_pclk_div2_9P		<= r_r_pclk_div2_8P;
		r_g_pclk_div2_9P		<= r_g_pclk_div2_8P;
		r_b_pclk_div2_9P		<= r_b_pclk_div2_8P;
		
		r_x_9P	<= r_x_9P+1'b1;
		if (r_x_9P-10'd19==10'h000)
			r_hs_pclk_div2_9P		<= c_ina_hs_por;
		else if (r_x_9P-10'd22==10'h000)
			r_de_pclk_div2_9P		<= r_de_next_pclk_div2_9P;
		else if (r_x_9P-10'd661==10'h000)
			r_de_pclk_div2_9P		<= c_ina_de_por;
		else if (r_x_9P-10'd824==10'h000)
		begin
			r_hs_pclk_div2_9P	<= c_act_hs_por;
			r_x_9P				<= {10{1'b0}};
			r_y_9P				<= r_y_9P+1'b1;
			if (r_y_9P-10'd4 == 10'h000)
				r_vs_pclk_div2_9P	<= c_ina_vs_por;
			else if (r_y_9P-10'd24 == 10'h000)
				r_de_next_pclk_div2_9P	<= c_act_de_por;
			else if (r_y_9P-10'd744 == 10'h000)
				r_de_next_pclk_div2_9P	<= c_ina_de_por;
			else if (r_y_9P-10'd749 == 10'h000)
			begin
				r_vs_pclk_div2_9P	<= c_act_vs_por;
				r_y_9P				<= {10{1'b0}};
			end
		end
		
		if (~r_synced_pclk_div2_9P)
		begin
			if (r_vs_pclk_div2_8P)
			begin
				r_hs_pclk_div2_9P	<= c_act_hs_por;
				r_x_9P	<= r_x_9P+1'b1;
				if (r_x_9P-10'd19==10'h000)
				begin
					r_hs_pclk_div2_9P		<= c_ina_hs_por;
					r_synced_pclk_div2_9P	<= 1'b1;
				end
			end
			else
			begin
				r_hs_pclk_div2_9P	<= c_ina_hs_por;
				r_x_9P	<= {10{1'b0}};
			end
		end
	end
end

//always@(posedge i_arst or posedge w_pclk_x1)
always@(posedge i_arst_pclk_x1 or posedge w_pclk_x1)
begin
//	if (i_arst)
	if (i_arst_pclk_x1)
	begin
		r_vs_pclk_x1_10P	<= c_ina_vs_por;
		r_hs_pclk_x1_10P	<= c_ina_hs_por;
		r_de_pclk_x1_10P	<= c_ina_de_por;
		r_r_pclk_x1_10P		<= {2*RED_DEPTH{1'b0}};
		r_g_pclk_x1_10P		<= {2*GREEN_DEPTH{1'b0}};
		r_b_pclk_x1_10P		<= {2*BLUE_DEPTH{1'b0}};
		
		r_vs_pclk_x1_11P	<= c_ina_vs_por;
		r_hs_pclk_x1_11P	<= c_ina_hs_por;
		r_de_pclk_x1_11P	<= c_ina_de_por;
		r_r_pclk_x1_11P		<= {2*RED_DEPTH{1'b0}};
		r_g_pclk_x1_11P		<= {2*GREEN_DEPTH{1'b0}};
		r_b_pclk_x1_11P		<= {2*BLUE_DEPTH{1'b0}};
		
		r_neven_odd_pclk_x1_12P	<= 1'b0;
		r_de_pclk_x1_12P		<= c_ina_de_por;
		r_r_pclk_x1_12P			<= {RED_DEPTH{1'b0}};
		r_g_pclk_x1_12P			<= {GREEN_DEPTH{1'b0}};
		r_b_pclk_x1_12P			<= {BLUE_DEPTH{1'b0}};
	end
	else
	begin
		r_vs_pclk_x1_10P	<= r_vs_pclk_div2_9P;
		r_hs_pclk_x1_10P	<= r_hs_pclk_div2_9P;
		r_de_pclk_x1_10P	<= r_de_pclk_div2_9P;
		r_r_pclk_x1_10P		<= r_r_pclk_div2_9P;
		r_g_pclk_x1_10P		<= r_g_pclk_div2_9P;
		r_b_pclk_x1_10P		<= r_b_pclk_div2_9P;
		
		r_vs_pclk_x1_11P	<= r_vs_pclk_x1_10P;
		r_hs_pclk_x1_11P	<= r_hs_pclk_x1_10P;
		r_de_pclk_x1_11P	<= r_de_pclk_x1_10P;
		r_r_pclk_x1_11P		<= r_r_pclk_x1_10P;
		r_g_pclk_x1_11P		<= r_g_pclk_x1_10P;
		r_b_pclk_x1_11P		<= r_b_pclk_x1_10P;
		
		if (r_de_pclk_x1_11P)
			r_neven_odd_pclk_x1_12P	<= ~r_neven_odd_pclk_x1_12P;
		r_de_pclk_x1_12P	<= r_de_pclk_x1_11P;
		if (r_neven_odd_pclk_x1_12P)
		begin
			r_r_pclk_x1_12P		<= r_r_pclk_x1_11P[RED_DEPTH*2-1:RED_DEPTH];
			r_g_pclk_x1_12P		<= r_g_pclk_x1_11P[GREEN_DEPTH*2-1:GREEN_DEPTH];
			r_b_pclk_x1_12P		<= r_b_pclk_x1_11P[BLUE_DEPTH*2-1:BLUE_DEPTH];
		end
		else
		begin
			r_r_pclk_x1_12P		<= r_r_pclk_x1_11P[RED_DEPTH-1:0];
			r_g_pclk_x1_12P		<= r_g_pclk_x1_11P[GREEN_DEPTH-1:0];
			r_b_pclk_x1_12P		<= r_b_pclk_x1_11P[BLUE_DEPTH-1:0];
		end
	end
end

ram_shift_reg
#(
	.DATA_WIDTH(1+RED_DEPTH+GREEN_DEPTH+BLUE_DEPTH),
	.LATENCY(214),
	.NUM_GROUP(1)
)
inst_ram_shift_reg
(
	.arst(i_arst_pclk_x1),
	.clk(w_pclk_x1),
	.sr_in({r_de_pclk_x1_12P, r_b_pclk_x1_12P,
			r_g_pclk_x1_12P, r_r_pclk_x1_12P}),
	.sr_out({w_de, w_b, w_g, w_r}),
	.tg_out()
);

assign	o_pclk_x1	= w_pclk_x1;
assign	o_pclk_div2	= w_pclk_div2;
assign	o_synced	= r_synced_pclk_div2_9P;
assign	o_vs		= r_vs_pclk_x1_11P;
assign	o_hs		= r_hs_pclk_x1_11P;
assign	o_de		= w_de;
assign	o_r			= w_r;
assign	o_g			= w_g;
assign	o_b			= w_b;

endmodule
