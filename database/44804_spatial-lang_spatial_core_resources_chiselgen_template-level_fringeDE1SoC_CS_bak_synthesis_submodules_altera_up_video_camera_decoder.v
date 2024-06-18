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
 * This module decodes video streams from the Terasic CCD cameras.            *
 *                                                                            *
 ******************************************************************************/

module altera_up_video_camera_decoder (
	// Inputs
	clk,
	reset,

	PIXEL_DATA,
	LINE_VALID,
	FRAME_VALID,

	ready,

	// Bidirectional

	// Outputs
	data,
	startofpacket,
	endofpacket,
	valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW = 9;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[DW: 0]	PIXEL_DATA;
input						LINE_VALID;
input						FRAME_VALID;

input						ready;

// Bidirectional

// Outputs
output reg	[DW: 0]	data;
output reg				startofpacket;
output reg			 	endofpacket;
output reg			 	valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire				read_temps;

// Internal Registers
reg			[DW: 0]	io_pixel_data;
reg						io_line_valid;
reg						io_frame_valid;

reg						frame_sync;

reg			[DW: 0]	temp_data;
reg						temp_start;
reg						temp_end;
reg						temp_valid;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
// Input Registers
always @ (posedge clk)
begin
	io_pixel_data		<= PIXEL_DATA;
	io_line_valid		<= LINE_VALID;
	io_frame_valid		<= FRAME_VALID;
end

// Output Registers
always @ (posedge clk)
begin
	if (reset)
	begin
		data				<= 'h0;
		startofpacket	<= 1'b0;
		endofpacket		<= 1'b0;
		valid				<= 1'b0;
	end
	else if (read_temps)
	begin
		data				<= temp_data;
		startofpacket	<= temp_start;
		endofpacket		<= temp_end;
		valid				<= temp_valid;
	end
	else if (ready)
		valid				<= 1'b0;
end

// Internal Registers
always @ (posedge clk)
begin
	if (reset)
		frame_sync 		<= 1'b0;
	else if (~io_frame_valid)
		frame_sync 		<= 1'b1;
	else if (io_line_valid & io_frame_valid)
		frame_sync 		<= 1'b0;
end

always @ (posedge clk)
begin
	if (reset)
	begin
		temp_data 		<= 'h0;
		temp_start		<= 1'b0;
		temp_end			<= 1'b0;
		temp_valid		<= 1'b0;
	end
	else if (read_temps)
	begin
		temp_data 		<= io_pixel_data;
		temp_start		<= frame_sync;
		temp_end			<= ~io_frame_valid;
		temp_valid		<= io_line_valid & io_frame_valid;
	end
	else if (~io_frame_valid)
	begin
		temp_end			<= ~io_frame_valid;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
// Output Assignments

// Internal Assignments
assign read_temps = (ready | ~valid) & 
	((io_line_valid & io_frame_valid) | 
	 ((temp_start | temp_end) & temp_valid));


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

