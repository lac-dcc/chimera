// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`define VESA_1280X720_60FPS
`include "vesa_parameter.vh"

module filter_size
#(
	parameter	VESA_STD	= "VESA_STD",
	parameter	X_START		= 0,
	parameter	Y_START		= 0,
	parameter	X_END		= 640,
	parameter	Y_END		= 720,
	
	parameter	X_LSB_CNT_WIDTH	= 4,
	parameter	X_MSB_CNT_WIDTH	= 6,
	parameter	Y_LSB_CNT_WIDTH	= 4,
	parameter	Y_MSB_CNT_WIDTH	= 6
)
(
	input	i_arst,
	input	i_pclk,
	
	input	i_hsync,
	
	output	o_hsync,
	output	o_x_en
);

localparam	HOR_SYNC_POLARITY	= `HOR_SYNC_POLARITY;
localparam	VER_SYNC_POLARITY	= `VER_SYNC_POLARITY;
wire	c_act_vs_por;
wire	c_ina_vs_por;
wire	c_act_hs_por;
wire	c_ina_hs_por;

reg		r_hsync_1P;
reg		[X_LSB_CNT_WIDTH-1:0]r_x_lsb_cnt_1P;
reg		[X_MSB_CNT_WIDTH-1:0]r_x_msb_cnt_1P;
reg		r_x_en_1P;
reg		r_x_done_1P;
reg		r_hsync_posedge_1P;

//reg		r_hsync_2P;
reg		r_x_en_2P;
reg		r_hsync_posedge_2P;

//reg		r_hsync_3P;
reg		r_x_en_3P;
reg		r_hsync_posedge_3P;

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

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_hsync_1P			<= c_ina_hs_por;
		r_x_lsb_cnt_1P		<= {X_LSB_CNT_WIDTH{1'b0}};
		r_x_msb_cnt_1P		<= {X_MSB_CNT_WIDTH{1'b0}};
		r_x_en_1P			<= 1'b0;
		r_x_done_1P			<= 1'b0;
		r_hsync_posedge_1P	<= 1'b0;
		
//		r_hsync_2P			<= 1'b0;
		r_x_en_2P			<= 1'b0;
		r_hsync_posedge_2P	<= 1'b0;
		
//		r_hsync_3P			<= 1'b0;
		r_x_en_3P			<= 1'b0;
		r_hsync_posedge_3P	<= 1'b0;
	end
	else
	begin
		r_hsync_1P			<= i_hsync;
		r_hsync_posedge_1P	<= i_hsync & ~r_hsync_1P;
		
//		r_hsync_2P			<= r_hsync_1P;
		r_x_en_2P			<= r_x_en_1P;
		r_hsync_posedge_2P	<= r_hsync_posedge_1P;
		
//		r_hsync_3P			<= r_hsync_2P;
		r_x_en_3P			<= r_x_en_2P;
		r_hsync_posedge_3P	<= r_hsync_posedge_2P;
		
		r_x_lsb_cnt_1P	<= r_x_lsb_cnt_1P+1'b1;
		if (r_x_lsb_cnt_1P == {X_LSB_CNT_WIDTH{1'b1}})
			r_x_msb_cnt_1P	<= r_x_msb_cnt_1P+1'b1;
		
		if (r_x_en_1P)
		begin
			if (r_x_msb_cnt_1P[5] & r_x_msb_cnt_1P[3])	// 640
			begin
				r_x_en_1P	<= 1'b0;
				r_x_done_1P	<= 1'b1;
			end
		end
		else if (r_x_msb_cnt_1P[5:4] == 2'b01 && r_x_lsb_cnt_1P[1:0] == 3'b11)	// 259
		begin
			r_x_lsb_cnt_1P		<= {X_LSB_CNT_WIDTH{1'b0}};
//			r_x_msb_cnt_1P		<= {X_MSB_CNT_WIDTH{1'b0}};
//			r_x_en_1P			<= 1'b1;
			r_x_en_1P			<= ~r_x_done_1P;
		end
		
		if (i_hsync & ~r_hsync_1P)
		begin
			r_x_lsb_cnt_1P	<= {X_LSB_CNT_WIDTH{1'b0}};
//			r_x_msb_cnt_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
//			r_x_en_1P		<= 1'b0;
//			r_x_done_1P		<= 1'b0;
		end
		
//		if (r_hsync_2P & ~r_hsync_3P)
		if (r_hsync_posedge_2P)
		begin
//			r_x_msb_cnt_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
			r_x_msb_cnt_1P[X_MSB_CNT_WIDTH/2-1:0]	<= {X_MSB_CNT_WIDTH/2{1'b0}};
			r_x_en_1P		<= 1'b0;
			r_x_done_1P		<= 1'b0;
		end
		else if (r_hsync_posedge_3P)
		begin
			r_x_msb_cnt_1P[X_MSB_CNT_WIDTH-1:X_MSB_CNT_WIDTH/2]	<= {X_MSB_CNT_WIDTH/2{1'b0}};
		end
		else if (r_x_en_2P & ~r_x_en_3P)
		begin
			r_x_msb_cnt_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
//			r_x_en_1P		<= 1'b0;
//			r_x_done_1P		<= 1'b0;
		end
	end
end

assign	o_hsync	= r_hsync_1P;
assign	o_x_en	= r_x_en_1P;

endmodule
