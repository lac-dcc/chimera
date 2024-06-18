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
 * This module scales video streams on the DE boards.                         *
 *                                                                            *
 ******************************************************************************/

module Computer_System_VGA_Subsystem_Char_Buf_Subsystem_Char_Buf_Scaler (
	// Inputs
	clk,
	reset,

	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,

	stream_out_ready,
	
	// Bidirectional

	// Outputs
	stream_in_ready,


	stream_out_channel,
	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter CW					= 5; // Frame's Channel Width
parameter DW					= 7; // Frame's Data Width
parameter EW					= 0; // Frame's Empty Width

parameter WIW					= 6; // Incoming frame's width's address width
parameter HIW					= 5; // Incoming frame's height's address width
parameter WIDTH_IN			= 80;

parameter WIDTH_DROP_MASK	= 4'b0000;
parameter HEIGHT_DROP_MASK	= 4'b0000;

parameter MH_WW				= 6; // Multiply height's incoming width's address width
parameter MH_WIDTH_IN		= 80; // Multiply height's incoming width
parameter MH_CW				= 2; // Multiply height's counter width

parameter MW_CW				= 2; // Multiply width's counter width

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[EW: 0]	stream_in_empty;
input						stream_in_valid;

input						stream_out_ready;

// Bidirectional

// Outputs
output					stream_in_ready;

output		[CW: 0]	stream_out_channel;
output		[DW: 0]	stream_out_data;
output					stream_out_startofpacket;
output					stream_out_endofpacket;
output		[EW: 0]	stream_out_empty;
output					stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire			[CW: 0]	internal_channel;
wire			[DW: 0]	internal_data;
wire						internal_startofpacket;
wire						internal_endofpacket;
wire						internal_valid;

wire						internal_ready;

// Internal Registers

// State Machine Registers

// Integers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers

// Internal Registers

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign stream_out_empty		= 'h0;

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


altera_up_video_scaler_multiply_height Multiply_Height (
	// Inputs
	.clk								(clk),
	.reset							(reset),

	.stream_in_data				(stream_in_data),
	.stream_in_startofpacket	(stream_in_startofpacket),
	.stream_in_endofpacket		(stream_in_endofpacket),
	.stream_in_valid				(stream_in_valid),

	.stream_out_ready				(internal_ready),

	// Bi-Directional

	// Outputs
	.stream_in_ready				(stream_in_ready),

	.stream_out_channel			(internal_channel),
	.stream_out_data				(internal_data),
	.stream_out_startofpacket	(internal_startofpacket),
	.stream_out_endofpacket		(internal_endofpacket),
	.stream_out_valid				(internal_valid)
);
defparam
	Multiply_Height.DW		= DW,
	Multiply_Height.WW		= MH_WW,
	Multiply_Height.WIDTH	= MH_WIDTH_IN,

	Multiply_Height.MCW		= MH_CW;

altera_up_video_scaler_multiply_width Multiply_Width (
	// Inputs
	.clk								(clk),
	.reset							(reset),

	.stream_in_channel			(internal_channel),
	.stream_in_data				(internal_data),
	.stream_in_startofpacket	(internal_startofpacket),
	.stream_in_endofpacket		(internal_endofpacket),
	.stream_in_valid				(internal_valid),

	.stream_out_ready				(stream_out_ready),

	// Bi-Directional

	// Outputs
	.stream_in_ready				(internal_ready),

	.stream_out_channel			(stream_out_channel),
	.stream_out_data				(stream_out_data),
	.stream_out_startofpacket	(stream_out_startofpacket),
	.stream_out_endofpacket		(stream_out_endofpacket),
	.stream_out_valid				(stream_out_valid)
);
defparam
	Multiply_Width.CW		= CW,
	Multiply_Width.DW		= DW,
	Multiply_Width.MCW	= MW_CW;

endmodule

