


/***************************************************************************


	Video Core - THis does the decoding of the Vs and HS signals and the coding
	for the interlacing.
	
	This keeps the core at a 640x480 interlaced image.


*****************************************************************************/
module Analogue_video_encoder(
	input						clk_74a,
	input 					bridge_wr,
	input						bridge_rd,
	input [31:0] 			bridge_addr,
	input [31:0] 			bridge_wr_data,
	output reg [31:0]		vga_bridge_rd_data,
	
	input 					video_rgb_clock,
	input 					hs,
	input 					vs,
	input 					hblank_i,
	input 					vblank_i,
	input [7:0]				r, 
	input [7:0]				g, 
	input [7:0]				b,	
	input 					field1,
	input						lace, 
	input [1:0]				res,
	input 					ce_pix,
	input 					clk7_en,
	input 					clk7n_en,

	
	input 	 				LED,
	input 					light_enable,
	input 					ide_c_led, 
	input 					ide_f_led,
	
	output reg [23:0] 	video_rgb_reg,
	output reg 				video_hs_i_reg,
	output reg 				video_vs_i_reg,
	output reg 				video_de_reg,
	output reg				video_skip
);

reg [23:0] rgb_reg;
reg clk7_en_reg;
reg clk7n_en_reg;

always @(posedge video_rgb_clock) begin
	if (ce_pix)rgb_reg <= {r, g, b};
	clk7_en_reg		<= clk7_en;
	clk7n_en_reg 	<= clk7n_en;
end

reg hs_reg, vs_reg, hblank_i_reg;
reg hs_delay0, hs_delay1, hs_delay2, hs_delay3;
reg 				video_de_reg_i;

// lets get some video offsets working

reg [7:0] x_offset = 0;
reg [7:0] y_offset = 0;
wire [7:0] x_offset_s;
wire [7:0] y_offset_s;
reg [31:0] vga_bridge_rd_data_reg;

always @(posedge clk_74a) begin
	if (bridge_wr && bridge_addr[31:8] == 24'hA00000) begin
		case (bridge_addr[7:0])
			8'h00 : begin
				x_offset <= bridge_wr_data;
			end
			8'h04 : begin
				y_offset <= bridge_wr_data;
			end
		endcase
	end
end

always @(posedge clk_74a) begin
	if (bridge_rd) begin
		case (bridge_addr[7:0])
			8'h00 : begin
				vga_bridge_rd_data_reg <= x_offset;
			end
			8'h04 : begin
				vga_bridge_rd_data_reg <= y_offset;
			end
		endcase
	end
	vga_bridge_rd_data <= vga_bridge_rd_data_reg;
end

synch_3 #(.WIDTH(8)) x_offset_sync(x_offset, x_offset_s, video_rgb_clock);
synch_3 #(.WIDTH(8)) y_offset_sync(y_offset, y_offset_s, video_rgb_clock);

reg [11:0] x_offset_vga; // these are the counters for the offset when the DE or each HS wit DE happens
reg [11:0] y_offset_vga;
reg [2:0] res_reg;

reg [11:0] x_counter_vga;
reg [11:0] y_counter_vga;

reg [11:0] x_green_start_vga;
reg [11:0] x_green_end_vga;

reg [11:0] x_red_start_vga;
reg [11:0] x_red_end_vga;

reg 		 lace_reg;
reg 		 field1_reg;
//assign video_skip = |{clk7n_en, clk7_en} && video_de_reg;

always @(posedge video_rgb_clock) begin
	video_rgb_reg 	<= 'b0;
	video_de_reg 	<= 'b0;
	video_vs_i_reg <= 'b0;
//	video_skip		<= 'b0;
	hs_delay0 		<= 'b0;
	hblank_i_reg <= hblank_i;
	hs_delay1 <= hs_delay0;
	hs_delay2 <= hs_delay1;
	hs_delay3 <= hs_delay2;
	video_hs_i_reg <= hs_delay3;
	video_de_reg_i <= video_de_reg;
	if (video_de_reg) x_counter_vga <= x_counter_vga + 1;
	if (video_de_reg && ~video_de_reg_i) y_counter_vga <= y_counter_vga + 1;
	
	hs_reg <= hs;
	
	if (~hs && hs_reg)  begin
		hs_delay0 	<= 'b1;
		x_counter_vga <= 0;
		field1_reg <= field1;
		x_offset_vga <= x_offset_s;
		if (y_offset_vga != 0) y_offset_vga <= y_offset_vga - 1;
	end
	
	vs_reg <= vs;
	
	if (~vs && vs_reg) begin
		res_reg <= {lace, res[1:0]};
		lace_reg <= lace;
		y_offset_vga <= y_offset_s;
		y_counter_vga <= 0;
		video_vs_i_reg 	<= 'b1;
		
		video_rgb_reg 	<= {21'd0, 1'b0, field1_reg && lace_reg, lace_reg, ~field1_reg && lace_reg}; // This is the interlace part for the core.
	end
	
	
	
	else if (~hblank_i && ~vblank_i) begin
		if (video_de_reg) video_skip <= ~video_skip;
		if ((y_counter_vga <= 15 && y_counter_vga >= 5) && (x_counter_vga <= 30 && x_counter_vga >= 10) && LED && ~light_enable) 
			video_rgb_reg 	<= {8'h0, 8'hF0, 8'h0};
		else if ((y_counter_vga <= 15 && y_counter_vga >= 5) && (x_counter_vga <= 60 && x_counter_vga >= 40) && |{ide_c_led, ide_f_led} && ~light_enable) 
			video_rgb_reg 	<= {8'hF0, 8'h0, 8'h0};
		else begin
			video_rgb_reg 	<= rgb_reg;
		end
		
		if (y_offset_vga == 0 && x_offset_vga == 0 ) video_de_reg 	<= 'b1;
		if (x_offset_vga != 0) x_offset_vga <= x_offset_vga - 1;
	end
	
	else if (hblank_i && ~hblank_i_reg) begin
		video_skip <= 0;
		case (res_reg)
			3'd7		: video_rgb_reg 	<= {10'd0, 3'h7, 13'd0};
			3'd6		: video_rgb_reg 	<= {10'd0, 3'h6, 13'd0};
			3'd5		: video_rgb_reg 	<= {10'd0, 3'h5, 13'd0};
			3'd4		: video_rgb_reg 	<= {10'd0, 3'h4, 13'd0};
			3'd3		: video_rgb_reg 	<= {10'd0, 3'h3, 13'd0};
			3'd2		: video_rgb_reg 	<= {10'd0, 3'h2, 13'd0};
			3'd1		: video_rgb_reg 	<= {10'd0, 3'h1, 13'd0};
			default : video_rgb_reg 	<= 24'h0;
		endcase
	end
	
end
endmodule