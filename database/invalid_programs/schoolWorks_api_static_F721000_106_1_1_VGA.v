`default_nettype none			//disable implicit definitions by Verilog

module VGA(				//top module and signals wired to FPGA pins
	CLK50MHz,
	vga_r,
	vga_g,
	vga_b,
	vga_hs,
	vga_vs,
);

input			CLK50MHz;	// Oscillator input 100Mhz
output  [2:0]   	vga_r;		// VGA Red 3 bit
output  [2:0]   	vga_g;		// VGA Green 3 bit
output  [2:0]   	vga_b;		// VGA Blue 3 bit
output          	vga_hs;		// H-sync pulse 
output          	vga_vs;		// V-sync pulse


parameter h_pulse   = 96;	//H-SYNC pulse width 96 * 40 ns (25 Mhz) = 3.84 uS
parameter h_bp      = 48;	//H-BP back porch pulse width
parameter h_pixels  = 640;	//H-PIX Number of pixels horisontally
parameter h_fp      = 16;	//H-FP front porch pulse width
parameter h_pol     = 1'b0;	//H-SYNC polarity
parameter h_frame   = 800;	//800 = 96 (H-SYNC) + 48 (H-BP) + 640 (H-PIX) + 16 (H-FP)
parameter v_pulse   = 2;	//V-SYNC pulse width
parameter v_bp      = 33;	//V-BP back porch pulse width
parameter v_pixels  = 480;	//V-PIX Number of pixels vertically
parameter v_fp      = 10;	//V-FP front porch pulse width
parameter v_pol     = 1'b1;	//V-SYNC polarity
parameter v_frame   = 525;	// 525 = 2 (V-SYNC) + 33 (V-BP) + 480 (V-PIX) + 10 (V-FP)


reg	[1:0]		clk_div;	// 2 bit counter
wire			vga_clk;	

assign 	vga_clk 	= clk_div[0];		// 25Mhz clock = 100Mhz divided by 2-bit counter

always @ (posedge CLK50MHz) begin		// 2-bt counter ++ on each positive edge of 100Mhz clock
	clk_div <= clk_div + 2'b1;
end

reg     [2:0]   	vga_r_r;	//VGA color registers R,G,B x 3 bit
reg     [2:0]   	vga_g_r;
reg     [2:0]   	vga_b_r;
reg             	vga_hs_r;	//H-SYNC register
reg             	vga_vs_r;	//V-SYNC register

assign 	vga_r 		= vga_r_r;		//assign the output signals for VGA to the VGA registers
assign 	vga_g 		= vga_g_r;
assign 	vga_b 		= vga_b_r;
assign 	vga_hs 		= vga_hs_r;
assign 	vga_vs 		= vga_vs_r;

reg     [7:0]		timer_t = 8'b0;	// 8 bit timer with 0 initialization
reg             	reset = 1;	
reg     [9:0]   	c_row;		//complete frame register row
reg     [9:0]   	c_col;		//complete frame register colum
reg     [9:0]   	c_hor;		//visible frame register horisontally
reg     [9:0]   	c_ver;		//visible  frame register vertically

reg			disp_en;	//display enable flag

//VGA sync 
always @ (posedge vga_clk) begin

	if(timer_t > 250) begin					// generate 10 uS RESET signal 
		reset <= 0;
	end
	else begin
		reset <= 1;					//while in reset display is disabled, suare is set to initial position
		timer_t <= timer_t + 1;
		disp_en <= 0;			
	end
	
	if(reset == 1) begin					//while RESET is high init counters
		c_hor <= 0;
		c_ver <= 0;
		vga_hs_r <= 1;
		vga_vs_r <= 0;
		c_row <= 0;
		c_col <= 0;
	end
	else begin						// update current beam position
		if(c_hor < h_frame - 1) begin
			c_hor <= c_hor + 1;
		end
		else begin
			c_hor <= 0;
			if(c_ver < v_frame - 1) begin
				c_ver <= c_ver + 1;
			end
			else begin
				c_ver <= 0;
			end
		end
	end
	if(c_hor < h_pixels + h_fp + 1 || c_hor > h_pixels + h_fp + h_pulse) begin	// H-SYNC generator
		vga_hs_r <= ~h_pol;
	end
	else begin
		vga_hs_r <= h_pol;
	end
	if(c_ver < v_pixels + v_fp || c_ver > v_pixels + v_fp + v_pulse) begin		//V-SYNC generator
		vga_vs_r <= ~v_pol;
	end
	else begin
		vga_vs_r <= v_pol;
	end
	if(c_hor < h_pixels) begin		//c_col and c_row counters are updated only in the visible time-frame
		c_col <= c_hor;
	end
	if(c_ver < v_pixels) begin
		c_row <= c_ver;
	end
	if(c_hor < h_pixels && c_ver < v_pixels) begin		//VGA color signals are enabled only in the visible time frame
		disp_en <= 1;
	end
	else begin
		disp_en <= 0;
	end
end


//generate blue square
always @ (posedge vga_clk) begin	
	if(disp_en == 1 && reset == 0) begin
		if(c_col > 200 && c_col < 250) begin
			if(c_row > 200 && c_row < 250)begin
				vga_r_r <= 0;
				vga_g_r <= 0;
				vga_b_r <= 7;
			end
		end
		else begin			//everything else is black
			vga_r_r <= 0;
			vga_g_r <= 0;
			vga_b_r <= 0;
		end
	end
	else begin			//when display is not enabled everything is black
		vga_r_r <= 0;
		vga_g_r <= 0;
		vga_b_r <= 0;
	end
end
endmodule

