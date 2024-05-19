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


module altera_up_edge_detection_hysteresis (
	// Inputs
	clk,
	reset,

	data_in,
	data_en,

	// Bidirectionals

	// Outputs
	data_out
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter WIDTH	= 640; // Image width in pixels

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[ 7: 0]	data_in;
input						data_en;

// Bidirectionals

// Outputs
output		[ 7: 0]	data_out;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[ 8: 0]	shift_reg_out[ 1: 0];

wire						data_above_high_threshold;
wire			[ 8: 0]	data_to_shift_register_1;

wire						above_threshold;

wire						overflow;

// Internal Registers
reg			[ 8: 0]	data_line_2[ 1: 0];

reg			[ 2: 0]	thresholds[ 2: 0];

reg			[ 7: 0]	result;

// State Machine Registers

// Integers
integer					i;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset == 1'b1)
	begin
		data_line_2[0] <= 8'h00;
		data_line_2[1] <= 8'h00;

		for (i = 2; i >= 0; i = i-1)
			thresholds[i] <= 3'h0;
	end
	else if (data_en == 1'b1)
	begin
		// Increase edge visibility by 32 and saturate at 255 
		data_line_2[1] <= data_line_2[0] | {9{data_line_2[0][8]}};
		data_line_2[0] <= {1'b0, shift_reg_out[0][7:0]} + 32;

		thresholds[0] <= {thresholds[0][1:0], data_above_high_threshold};
		thresholds[1] <= {thresholds[1][1:0], shift_reg_out[0][8]};
		thresholds[2] <= {thresholds[2][1:0], shift_reg_out[1][8]};

		result <= (above_threshold) ? data_line_2[1][7:0] : 8'h00;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// External Assignments
assign data_out = result; 

// Internal Assignments
assign data_above_high_threshold = (data_in >= 8'h0A) ? 1'b1 : 1'b0;
assign data_to_shift_register_1  = {data_above_high_threshold,data_in};

assign above_threshold = 
		((|(thresholds[0])) | (|(thresholds[1])) | (|(thresholds[2])));

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_edge_detection_data_shift_register shift_register_1 (
	// Inputs
	.clock		(clk),
	.clken		(data_en),
	.shiftin		(data_to_shift_register_1),

	// Bidirectionals

	// Outputs
	.shiftout	(shift_reg_out[0]),
	.taps			()
);
defparam
	shift_register_1.DW		= 9,
	shift_register_1.SIZE	= WIDTH;

altera_up_edge_detection_data_shift_register shift_register_2 (
	// Inputs
	.clock		(clk),
	.clken		(data_en),
	.shiftin		(shift_reg_out[0]),

	// Bidirectionals

	// Outputs
	.shiftout	(shift_reg_out[1]),
	.taps			()
);
defparam
	shift_register_2.DW		= 9,
	shift_register_2.SIZE	= WIDTH;

endmodule

