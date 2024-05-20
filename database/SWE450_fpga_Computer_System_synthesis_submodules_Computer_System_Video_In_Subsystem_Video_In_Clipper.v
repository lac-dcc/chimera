// This program was cloned from: https://github.com/briancook247/SWE450
// License: MIT License

// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
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
 * This module clips video streams on the DE boards.                          *
 *                                                                            *
 ******************************************************************************/
//`define USE_CLIPPER_DROP

module Computer_System_Video_In_Subsystem_Video_In_Clipper (
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


	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW							= 15; // Frame's data width
parameter EW							= 0; // Frame's empty width

parameter WIDTH_IN					= 720; // Incoming frame's width in pixels
parameter HEIGHT_IN					= 244; // Incoming frame's height in lines
parameter WW_IN						= 9; // Incoming frame's width's address width
parameter HW_IN						= 7; // Incoming frame's height's address width

parameter DROP_PIXELS_AT_START	= 40;
parameter DROP_PIXELS_AT_END		= 40;
parameter DROP_LINES_AT_START		= 2;
parameter DROP_LINES_AT_END		= 2;

parameter WIDTH_OUT					= 640; // Final frame's width in pixels
parameter HEIGHT_OUT					= 240; // Final frame's height in lines
parameter WW_OUT						= 9; // Final frame's width's address width
parameter HW_OUT						= 7; // Final frame's height's address width

parameter ADD_PIXELS_AT_START		= 0;
parameter ADD_PIXELS_AT_END		= 0;
parameter ADD_LINES_AT_START		= 0;
parameter ADD_LINES_AT_END			= 0;

parameter ADD_DATA					= 16'd0; // Data value for added pixels

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
wire			[DW: 0]	internal_data;
wire						internal_startofpacket;
wire						internal_endofpacket;
wire			[EW: 0]	internal_empty;
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

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_video_clipper_drop Clipper_Drop (
	// Inputs
	.clk								(clk),
	.reset							(reset),

	.stream_in_data				(stream_in_data),
	.stream_in_startofpacket	(stream_in_startofpacket),
	.stream_in_endofpacket		(stream_in_endofpacket),
	.stream_in_empty				(stream_in_empty),
	.stream_in_valid				(stream_in_valid),

	.stream_out_ready				(internal_ready),
	
	// Bidirectional

	// Outputs
	.stream_in_ready				(stream_in_ready),


	.stream_out_data				(internal_data),
	.stream_out_startofpacket	(internal_startofpacket),
	.stream_out_endofpacket		(internal_endofpacket),
	.stream_out_empty				(internal_empty),
	.stream_out_valid				(internal_valid)
);
defparam
	Clipper_Drop.DW							= DW,
	Clipper_Drop.EW							= EW,

	Clipper_Drop.IMAGE_WIDTH				= WIDTH_IN,
	Clipper_Drop.IMAGE_HEIGHT				= HEIGHT_IN,
	Clipper_Drop.WW							= WW_IN,
	Clipper_Drop.HW							= HW_IN,

	Clipper_Drop.DROP_PIXELS_AT_START	= DROP_PIXELS_AT_START,
	Clipper_Drop.DROP_PIXELS_AT_END		= DROP_PIXELS_AT_END,
	Clipper_Drop.DROP_LINES_AT_START		= DROP_LINES_AT_START,
	Clipper_Drop.DROP_LINES_AT_END 		= DROP_LINES_AT_END,

	Clipper_Drop.ADD_DATA					= ADD_DATA;

altera_up_video_clipper_add Clipper_Add (
	// Inputs
	.clk								(clk),
	.reset							(reset),

	.stream_in_data				(internal_data),
	.stream_in_startofpacket	(internal_startofpacket),
	.stream_in_endofpacket		(internal_endofpacket),
	.stream_in_empty				(internal_empty),
	.stream_in_valid				(internal_valid),

	.stream_out_ready				(stream_out_ready),

	// Bidirectional

	// Outputs
	.stream_in_ready				(internal_ready),

	.stream_out_data				(stream_out_data),
	.stream_out_startofpacket	(stream_out_startofpacket),
	.stream_out_endofpacket		(stream_out_endofpacket),
	.stream_out_empty				(stream_out_empty),
	.stream_out_valid				(stream_out_valid)
);
defparam
	Clipper_Add.DW							= DW,
	Clipper_Add.EW							= EW,

	Clipper_Add.IMAGE_WIDTH				= WIDTH_OUT,
	Clipper_Add.IMAGE_HEIGHT			= HEIGHT_OUT,
	Clipper_Add.WW							= WW_OUT,
	Clipper_Add.HW							= HW_OUT,

	Clipper_Add.ADD_PIXELS_AT_START	= ADD_PIXELS_AT_START,
	Clipper_Add.ADD_PIXELS_AT_END		= ADD_PIXELS_AT_END,
	Clipper_Add.ADD_LINES_AT_START	= ADD_LINES_AT_START,
	Clipper_Add.ADD_LINES_AT_END 		= ADD_LINES_AT_END,

	Clipper_Add.ADD_DATA					= ADD_DATA;

endmodule

