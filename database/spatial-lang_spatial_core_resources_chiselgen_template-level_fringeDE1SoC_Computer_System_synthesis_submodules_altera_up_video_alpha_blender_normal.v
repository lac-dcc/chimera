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
 * This module combines two video streams by overlaying one onto the          *
 *  other using alpha blending.  The foreground image must include alpha      *
 *  bits to be used in the blending formula: Cn = (1 - a)Cb + (a)Cf           *
 *  Cn - new color                                                            *
 *  a  - alpha                                                                *
 *  Cb - background colour                                                    *
 *  Cf - foreground colour                                                    *
 *                                                                            *
 ******************************************************************************/

module altera_up_video_alpha_blender_normal (
	// Inputs
	background_data,
	foreground_data,

	// Bidirectionals

	// Outputs
	new_red,
	new_green,
	new_blue
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input			[29: 0]	background_data;
input			[39: 0]	foreground_data;

// Bidirectionals

// Outputs
output		[ 9: 0]	new_red;
output		[ 9: 0]	new_green;
output		[ 9: 0]	new_blue;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[ 9: 0] one_minus_a;

wire			[17: 0] r_x_alpha;
wire			[17: 0] g_x_alpha;
wire			[17: 0] b_x_alpha;
wire			[17: 0] r_x_one_minus_alpha;
wire			[17: 0] g_x_one_minus_alpha;
wire			[17: 0] b_x_one_minus_alpha;

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
assign new_red		= {1'b0, r_x_alpha[17:9]} + 
					  {1'b0, r_x_one_minus_alpha[17:9]};
assign new_green	= {1'b0, g_x_alpha[17:9]} + 
					  {1'b0, g_x_one_minus_alpha[17:9]};
assign new_blue	= {1'b0, b_x_alpha[17:9]} + 
					  {1'b0, b_x_one_minus_alpha[17:9]};

// Internal Assignments
assign one_minus_a	= 10'h3FF - foreground_data[39:30];

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

lpm_mult r_times_alpha (
	// Inputs
	.clock	(1'b0),
	.clken	(1'b1),
	.aclr		(1'b0),
	.sum		(1'b0),
	.dataa	(foreground_data[29:21]),
	.datab	(foreground_data[39:31]),

	// Outputs
	.result	(r_x_alpha)
);
defparam
	r_times_alpha.lpm_hint								= "MAXIMIZE_SPEED=5",
	r_times_alpha.lpm_representation					= "UNSIGNED",
	r_times_alpha.lpm_type								= "LPM_MULT",
	r_times_alpha.lpm_widtha							= 9,
	r_times_alpha.lpm_widthb							= 9,
	r_times_alpha.lpm_widthp							= 18;

lpm_mult g_times_alpha (
	// Inputs
	.clock	(1'b0),
	.clken	(1'b1),
	.aclr		(1'b0),
	.sum		(1'b0),
	.dataa	(foreground_data[19:11]),
	.datab	(foreground_data[39:31]),

	// Outputs
	.result	(g_x_alpha)
);
defparam
	g_times_alpha.lpm_hint								= "MAXIMIZE_SPEED=5",
	g_times_alpha.lpm_representation					= "UNSIGNED",
	g_times_alpha.lpm_type								= "LPM_MULT",
	g_times_alpha.lpm_widtha							= 9,
	g_times_alpha.lpm_widthb							= 9,
	g_times_alpha.lpm_widthp							= 18;

lpm_mult b_times_alpha (
	// Inputs
	.clock	(1'b0),
	.clken	(1'b1),
	.aclr		(1'b0),
	.sum		(1'b0),
	.dataa	(foreground_data[ 9: 1]),
	.datab	(foreground_data[39:31]),

	// Outputs
	.result	(b_x_alpha)
);
defparam
	b_times_alpha.lpm_hint								= "MAXIMIZE_SPEED=5",
	b_times_alpha.lpm_representation					= "UNSIGNED",
	b_times_alpha.lpm_type								= "LPM_MULT",
	b_times_alpha.lpm_widtha							= 9,
	b_times_alpha.lpm_widthb							= 9,
	b_times_alpha.lpm_widthp							= 18;

lpm_mult r_times_one_minus_alpha (
	// Inputs
	.clock	(1'b0),
	.clken	(1'b1),
	.aclr		(1'b0),
	.sum		(1'b0),
	.dataa	(background_data[29:21]),
	.datab	(one_minus_a[ 9: 1]),

	// Outputs
	.result	(r_x_one_minus_alpha)
);
defparam
	r_times_one_minus_alpha.lpm_hint					= "MAXIMIZE_SPEED=5",
	r_times_one_minus_alpha.lpm_representation	= "UNSIGNED",
	r_times_one_minus_alpha.lpm_type					= "LPM_MULT",
	r_times_one_minus_alpha.lpm_widtha				= 9,
	r_times_one_minus_alpha.lpm_widthb				= 9,
	r_times_one_minus_alpha.lpm_widthp				= 18;

lpm_mult g_times_one_minus_alpha (
	// Inputs
	.clock	(1'b0),
	.clken	(1'b1),
	.aclr		(1'b0),
	.sum		(1'b0),
	.dataa	(background_data[19:11]),
	.datab	(one_minus_a[ 9: 1]),

	// Outputs
	.result	(g_x_one_minus_alpha)
);
defparam
	g_times_one_minus_alpha.lpm_hint					= "MAXIMIZE_SPEED=5",
	g_times_one_minus_alpha.lpm_representation	= "UNSIGNED",
	g_times_one_minus_alpha.lpm_type					= "LPM_MULT",
	g_times_one_minus_alpha.lpm_widtha				= 9,
	g_times_one_minus_alpha.lpm_widthb				= 9,
	g_times_one_minus_alpha.lpm_widthp				= 18;

lpm_mult b_times_one_minus_alpha (
	// Inputs
	.clock	(1'b0),
	.clken	(1'b1),
	.aclr		(1'b0),
	.sum		(1'b0),
	.dataa	(background_data[ 9: 1]),
	.datab	(one_minus_a[ 9: 1]),

	// Outputs
	.result	(b_x_one_minus_alpha)
);
defparam
	b_times_one_minus_alpha.lpm_hint					= "MAXIMIZE_SPEED=5",
	b_times_one_minus_alpha.lpm_representation	= "UNSIGNED",
	b_times_one_minus_alpha.lpm_type					= "LPM_MULT",
	b_times_one_minus_alpha.lpm_widtha				= 9,
	b_times_one_minus_alpha.lpm_widthb				= 9,
	b_times_one_minus_alpha.lpm_widthp				= 18;

endmodule

