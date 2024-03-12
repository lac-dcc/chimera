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
 *  bits to be used in the blending formula: Cn = (a < 0.5) ? Cb : Cf;        *
 *  Cn - new color                                                            *
 *  a  - alpha                                                                *
 *  Cb - background colour                                                    *
 *  Cf - foreground colour                                                    *
 *                                                                            *
 ******************************************************************************/

module altera_up_video_alpha_blender_simple (
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
assign new_red		= 
		(({10{foreground_data[39]}} & foreground_data[29:20]) |
		({10{~foreground_data[39]}} & background_data[29:20]));
assign new_green	= 
		(({10{foreground_data[39]}} & foreground_data[19:10]) |
		({10{~foreground_data[39]}} & background_data[19:10]));
assign new_blue		= 
		(({10{foreground_data[39]}} & foreground_data[ 9: 0]) |
		({10{~foreground_data[39]}} & background_data[ 9: 0]));

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

