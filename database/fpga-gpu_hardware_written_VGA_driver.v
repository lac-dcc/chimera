module VGA_driver(
	//sys_clk
	input clk,
	input rst,
	input [31:0]fbAddr,
	output startNew,

	output [31:0]master_address, 
	output master_read, 
	input [31:0]master_read_data, 
	input master_wait_request,
	input master_read_data_valid,
	
	//vga_clk
	input VGA_CLK,
	input vga_rst,
	output VGA_SYNC_N,
	output VGA_BLANK_N,
	output [7:0]VGA_R,
	output [7:0]VGA_G,
	output [7:0]VGA_B,
	output VGA_HS,
	output VGA_VS
);

	parameter C_VERT_NUM_PIXELS  = 16'd480;
	parameter C_VERT_SYNC_START  = 16'd490;
	parameter C_VERT_SYNC_END    = 16'd492; 
	parameter C_VERT_TOTAL_COUNT = 16'd525;

	parameter C_HORZ_NUM_PIXELS  = 16'd640;
	parameter C_HORZ_SYNC_START  = 16'd656;
	parameter C_HORZ_SYNC_END    = 16'd752;
	parameter C_HORZ_TOTAL_COUNT = 16'd800;	

	//watch the polarity of the sync signals - it fucking CHANGES with the resolution you are running at!
	assign VGA_HS = !((xCounter >= C_HORZ_SYNC_START) && (xCounter < C_HORZ_SYNC_END));
	assign VGA_VS = !((yCounter >= C_VERT_SYNC_START) && (yCounter < C_VERT_SYNC_END));
	assign VGA_BLANK_N = ((xCounter < C_HORZ_NUM_PIXELS) && (yCounter < C_VERT_NUM_PIXELS));
	assign VGA_SYNC_N = 1'b1;
	
	assign VGA_R = {pixel[14:10], pixel[14:12]};
	assign VGA_G = {pixel[9:5], pixel[9:7]};
	assign VGA_B = {pixel[4:0], pixel[4:2]};
	
	//fifo to get vertical sync signal
	wire dout, rdempty, wrfull, display_done, display_start;
	//assign display_done = xCounter_clear && (yCounter == (C_VERT_NUM_PIXELS-1));
	assign display_start = xCounter_clear && (yCounter == (C_VERT_TOTAL_COUNT-2));
	
	//two signals sent per frame:
	//a '0' indicates when the monitor has finished rendering the current frame
	//a '1' indicates when to start loading the next frame from memory
	//software should use the time between these signals to swap the buffers 
	vga_signals F0(display_start, clk, 1'b1, VGA_CLK, /*display_done |*/ display_start, dout, rdempty, wrfull);
	
	//wire frame_finished = !rdempty & !dout;
	assign startNew = !rdempty & dout;
		
	reg [15:0] xCounter, yCounter;
	wire xCounter_clear, yCounter_clear;

	//scan horizontal lines
	always @(posedge VGA_CLK or posedge vga_rst) begin
		if (vga_rst) begin
			xCounter <= 16'd0;
		end
		else if (xCounter_clear) begin
			xCounter <= 16'd0;				
		end else begin
			xCounter <= xCounter + 1'b1;
		end
	end
	assign xCounter_clear = (xCounter == (C_HORZ_TOTAL_COUNT-1));

	//scan vertical lines
	always @(posedge VGA_CLK or posedge vga_rst)
	begin
		if (vga_rst) begin
			yCounter <= 16'd0;
		end
		else if (xCounter_clear && yCounter_clear) begin
			yCounter <= 16'd0;
		end
		else if (xCounter_clear) begin		//Increment when x counter resets
			yCounter <= yCounter + 1'b1;
		end
	end
	assign yCounter_clear = (yCounter == (C_VERT_TOTAL_COUNT-1)); 
	
	//assert read_pixel if we need a pixel on the next clock cycle
	wire this_line = (xCounter < (C_HORZ_NUM_PIXELS-1)) && (yCounter < C_VERT_NUM_PIXELS);
	wire next_line = (yCounter < (C_VERT_NUM_PIXELS-1)) || yCounter_clear;
	wire read_pixel = (this_line || (next_line && xCounter_clear));
	
	wire [15:0]pixel;
	//load values from memory
	vga_dram_master DM0(
		//interface to GPU control
		clk, rst, startNew, fbAddr, 
		
		//avalon master interface
		master_address, master_read, master_read_data, master_wait_request, master_read_data_valid, 
		
		//VGA module interface
		VGA_CLK, vga_rst, read_pixel, pixel
	);
	
endmodule

