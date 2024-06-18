// This program was cloned from: https://github.com/stanford-ppl/spatial-lang
// License: MIT License

// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

/******************************************************************************
 *                                                                            *
 * This module drives the vga dac on Altera's DE2 Board.                      *
 *                                                                            *
 ******************************************************************************/

module altera_up_avalon_video_vga_timing (
	// inputs
	clk,
	reset,

	red_to_vga_display,
	green_to_vga_display,
	blue_to_vga_display,
	color_select,

	// bidirectional

	// outputs
	read_enable,

	end_of_active_frame,
	end_of_frame,

	// dac pins
	vga_blank,					//	VGA BLANK
	vga_c_sync,					//	VGA COMPOSITE SYNC
	vga_h_sync,					//	VGA H_SYNC
	vga_v_sync,					//	VGA V_SYNC
	vga_data_enable,			// VGA DEN
	vga_red,						//	VGA Red[9:0]
	vga_green,	 				//	VGA Green[9:0]
	vga_blue,	   			//	VGA Blue[9:0]
	vga_color_data	   		//	VGA Color[9:0] for TRDB_LCM
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter CW								= 9;

/* Number of pixels */
parameter H_ACTIVE 						= 640;
parameter H_FRONT_PORCH					=  16;
parameter H_SYNC							=  96;
parameter H_BACK_PORCH 					=  48;
parameter H_TOTAL 						= 800;

/* Number of lines */
parameter V_ACTIVE 						= 480;
parameter V_FRONT_PORCH					=  10;
parameter V_SYNC							=   2;
parameter V_BACK_PORCH 					=  33;
parameter V_TOTAL							= 525;

parameter PW								= 10;			// Number of bits for pixels
parameter PIXEL_COUNTER_INCREMENT	= 10'h001;

parameter LW								= 10;			// Number of bits for lines
parameter LINE_COUNTER_INCREMENT		= 10'h001;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[CW: 0]	red_to_vga_display;
input			[CW: 0]	green_to_vga_display;
input			[CW: 0]	blue_to_vga_display;
input			[ 3: 0]	color_select;

// Bidirectionals

// Outputs
output					read_enable;

output reg				end_of_active_frame;
output reg				end_of_frame;

// dac pins
output reg				vga_blank;			//	VGA BLANK
output reg				vga_c_sync;			//	VGA COMPOSITE SYNC
output reg				vga_h_sync;			//	VGA H_SYNC
output reg				vga_v_sync;			//	VGA V_SYNC
output reg				vga_data_enable;	// VGA DEN
output reg	[CW: 0]	vga_red;				//	VGA Red[9:0]
output reg	[CW: 0]	vga_green;			//	VGA Green[9:0]
output reg	[CW: 0]	vga_blue;  	 		//	VGA Blue[9:0]
output reg	[CW: 0]	vga_color_data;	//	VGA Color[9:0] for TRDB_LCM

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires

// Internal Registers
//reg					clk_en;
reg			[PW:1]	pixel_counter;
reg			[LW:1]	line_counter;

reg						early_hsync_pulse;
reg						early_vsync_pulse;
reg						hsync_pulse;
reg						vsync_pulse;
reg						csync_pulse;

reg						hblanking_pulse;
reg						vblanking_pulse;
reg						blanking_pulse;

// State Machine Registers


/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers
always @ (posedge clk)
begin
	if (reset)
	begin
		vga_c_sync			<= 1'b1;
		vga_blank			<= 1'b1;
		vga_h_sync			<= 1'b1;
		vga_v_sync			<= 1'b1;

		vga_red				<= {(CW + 1){1'b0}};
		vga_green			<= {(CW + 1){1'b0}};
		vga_blue				<= {(CW + 1){1'b0}};
		vga_color_data		<= {(CW + 1){1'b0}};
	end
	else
	begin
		vga_blank			<= ~blanking_pulse;
		vga_c_sync			<= ~csync_pulse;
		vga_h_sync			<= ~hsync_pulse;
		vga_v_sync			<= ~vsync_pulse;
//		vga_data_enable	<= hsync_pulse | vsync_pulse;
		vga_data_enable	<= ~blanking_pulse;

		if (blanking_pulse)
		begin
			vga_red			<= {(CW + 1){1'b0}};
			vga_green		<= {(CW + 1){1'b0}};
			vga_blue			<= {(CW + 1){1'b0}};
			vga_color_data	<= {(CW + 1){1'b0}};
		end
		else
		begin
			vga_red			<= red_to_vga_display;
			vga_green		<= green_to_vga_display;
			vga_blue			<= blue_to_vga_display;
			vga_color_data	<= ({(CW + 1){color_select[0]}} & red_to_vga_display) |
									({(CW + 1){color_select[1]}} & green_to_vga_display) |
									({(CW + 1){color_select[2]}} & blue_to_vga_display);
		end
	end
end

// Internal Registers
always @ (posedge clk)
begin
	if (reset)
	begin
		pixel_counter	<= H_TOTAL - 3; // {PW{1'b0}};
		line_counter	<= V_TOTAL - 1; // {LW{1'b0}};
	end
	else
	begin
		// last pixel in the line
		if (pixel_counter == (H_TOTAL - 1))
		begin
			pixel_counter <= {PW{1'b0}};
			
			// last pixel in last line of frame
			if (line_counter == (V_TOTAL - 1))
				line_counter <= {LW{1'b0}};
			// last pixel but not last line
			else
				line_counter <= line_counter + LINE_COUNTER_INCREMENT;
		end
		else 
			pixel_counter <= pixel_counter + PIXEL_COUNTER_INCREMENT;
	end
end

always @ (posedge clk) 
begin
	if (reset)
	begin
		end_of_active_frame <= 1'b0;
		end_of_frame		<= 1'b0;
	end
	else
	begin
		if ((line_counter == (V_ACTIVE - 1)) &&
			(pixel_counter == (H_ACTIVE - 2)))
			end_of_active_frame <= 1'b1;
		else
			end_of_active_frame <= 1'b0;

		if ((line_counter == (V_TOTAL - 1)) && 
			(pixel_counter == (H_TOTAL - 2)))
			end_of_frame <= 1'b1;
		else
			end_of_frame <= 1'b0;
	end
end

always @ (posedge clk) 
begin
	if (reset)
	begin
		early_hsync_pulse <= 1'b0;
		early_vsync_pulse <= 1'b0;
		
		hsync_pulse <= 1'b0;
		vsync_pulse <= 1'b0;
		
		csync_pulse	<= 1'b0;
	end
	else
	begin
		// start of horizontal sync
		if (pixel_counter == (H_ACTIVE + H_FRONT_PORCH - 2))
			early_hsync_pulse <= 1'b1;	
		// end of horizontal sync
		else if (pixel_counter == (H_TOTAL - H_BACK_PORCH - 2))
			early_hsync_pulse <= 1'b0;	
			
		// start of vertical sync
		if ((line_counter == (V_ACTIVE + V_FRONT_PORCH - 1)) && 
				(pixel_counter == (H_TOTAL - 2)))
			early_vsync_pulse <= 1'b1;
		// end of vertical sync
		else if ((line_counter == (V_TOTAL - V_BACK_PORCH - 1)) && 
				(pixel_counter == (H_TOTAL - 2)))
			early_vsync_pulse <= 1'b0;
			
		hsync_pulse <= early_hsync_pulse;
		vsync_pulse <= early_vsync_pulse;

		csync_pulse <= early_hsync_pulse ^ early_vsync_pulse;
	end
end

always @ (posedge clk) 
begin
	if (reset)
	begin
		hblanking_pulse	<= 1'b1;
		vblanking_pulse	<= 1'b1;
		
		blanking_pulse	<= 1'b1;
	end
	else
	begin
		if (pixel_counter == (H_ACTIVE - 2))
			hblanking_pulse	<= 1'b1;
		else if (pixel_counter == (H_TOTAL - 2))
			hblanking_pulse	<= 1'b0;
		
		if ((line_counter == (V_ACTIVE - 1)) &&
				(pixel_counter == (H_TOTAL - 2))) 
			vblanking_pulse	<= 1'b1;
		else if ((line_counter == (V_TOTAL - 1)) &&
				(pixel_counter == (H_TOTAL - 2))) 
			vblanking_pulse	<= 1'b0;
			
		blanking_pulse		<= hblanking_pulse | vblanking_pulse;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign read_enable = ~blanking_pulse;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

