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
 * This module combines two video streams by overlaying one onto the          *
 *  other using alpha blending.  The foreground image must include alpha      *
 *  bits to be used in the blending formula: Cn = (1 - a)Cb + (a)Cf           *
 *  Cn - new color                                                            *
 *  a  - alpha                                                                *
 *  Cb - background colour                                                    *
 *  Cf - foreground colour                                                    *
 *                                                                            *
 ******************************************************************************/

module Computer_System_VGA_Subsystem_VGA_Alpha_Blender (
	// Inputs
	clk,
	reset,

	background_data,
	background_startofpacket,
	background_endofpacket,
	background_empty,
	background_valid,
	
	foreground_data,
	foreground_startofpacket,
	foreground_endofpacket,
	foreground_empty,
	foreground_valid,

	output_ready,

	// Bidirectionals

	// Outputs
	background_ready,

	foreground_ready,
	
	output_data,
	output_startofpacket,
	output_endofpacket,
	output_empty,
	output_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[29: 0]	background_data;
input						background_startofpacket;
input						background_endofpacket;
input			[ 1: 0]	background_empty;
input						background_valid;

input			[39: 0]	foreground_data;
input						foreground_startofpacket;
input						foreground_endofpacket;
input			[ 1: 0]	foreground_empty;
input						foreground_valid;

input						output_ready;

// Bidirectionals

// Outputs
output					background_ready;

output					foreground_ready;

output		[29: 0]	output_data;
output					output_startofpacket;
output					output_endofpacket;
output		[ 1: 0]	output_empty;
output					output_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[ 9: 0]	new_red;
wire			[ 9: 0]	new_green;
wire			[ 9: 0]	new_blue;

wire						sync_foreground;
wire						sync_background;

wire						valid;

// Internal Registers

// State Machine Registers

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
assign background_ready = (output_ready & output_valid) | sync_background;
assign foreground_ready = (output_ready & output_valid) | sync_foreground;

assign output_data				= {new_red, new_green, new_blue};
assign output_startofpacket 	= foreground_startofpacket;
assign output_endofpacket		= foreground_endofpacket;
assign output_empty				= 2'h0;
assign output_valid				= valid;

// Internal Assignments
assign sync_foreground = (foreground_valid & background_valid &
			((background_startofpacket & ~foreground_startofpacket) |
			(background_endofpacket & ~foreground_endofpacket)));
assign sync_background = (foreground_valid & background_valid &
			((foreground_startofpacket & ~background_startofpacket) |
			(foreground_endofpacket & ~background_endofpacket)));

assign valid =	foreground_valid & background_valid & 
				~sync_foreground & ~sync_background;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_video_alpha_blender_simple alpha_blender (
	// Inputs
	.background_data	(background_data),
	.foreground_data	(foreground_data),

	// Bidirectionals

	// Outputs
	.new_red				(new_red),
	.new_green			(new_green),
	.new_blue			(new_blue)
);


endmodule

