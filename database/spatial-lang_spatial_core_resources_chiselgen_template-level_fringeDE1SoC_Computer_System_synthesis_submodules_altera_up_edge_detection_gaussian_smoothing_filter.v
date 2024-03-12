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


module altera_up_edge_detection_gaussian_smoothing_filter (
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
output		[ 8: 0]	data_out;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[ 7: 0]	shift_reg_out[ 3: 0];

// Internal Registers
reg			[ 7: 0]	original_line_1[ 4: 0];
reg			[ 7: 0]	original_line_2[ 4: 0];
reg			[ 7: 0]	original_line_3[ 4: 0];
reg			[ 7: 0]	original_line_4[ 4: 0];
reg			[ 7: 0]	original_line_5[ 4: 0];

reg			[15: 0]	sum_level_1[12: 0];
reg			[15: 0]	sum_level_2[ 6: 0];
reg			[15: 0]	sum_level_3[ 4: 0];
reg			[15: 0]	sum_level_4[ 2: 0];
reg			[15: 0]	sum_level_5[ 1: 0];
reg			[15: 0]	sum_level_6;
reg			[ 8: 0]	sum_level_7;

// State Machine Registers

// Integers
integer				i;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Gaussian Smoothing Filter
// 
//          [ 2  4  5  4  2 ]
//          [ 4  9 12  9  4 ]
// 1 / 115  [ 5 12 15 12  5 ]
//          [ 4  9 12  9  4 ]
//          [ 2  4  5  4  2 ]
//


always @(posedge clk)
begin
	if (reset == 1'b1)
	begin
		for (i = 4; i >= 0; i = i-1)
		begin
			original_line_1[i] <= 8'h00;
			original_line_2[i] <= 8'h00;
			original_line_3[i] <= 8'h00;
			original_line_4[i] <= 8'h00;
			original_line_5[i] <= 8'h00;
		end

		for (i = 12; i >= 0; i = i-1)
		begin
			sum_level_1[i] <= 16'h0000;
		end

		for (i = 6; i >= 0; i = i-1)
		begin
			sum_level_2[i] <= 16'h0000;
		end

		for (i = 4; i >= 0; i = i-1)
		begin
			sum_level_3[i] <= 16'h0000;
		end

		sum_level_4[0] <= 16'h0000;
		sum_level_4[1] <= 16'h0000;
		sum_level_4[2] <= 16'h0000;
	
		sum_level_5[0] <= 16'h0000;
		sum_level_5[1] <= 16'h0000;

		sum_level_6    <= 16'h0000;
		sum_level_7    <= 9'h000;
	end
	else if (data_en == 1'b1)
	begin	
		for (i = 4; i > 0; i = i-1)
		begin
			original_line_1[i] <= original_line_1[i-1];
			original_line_2[i] <= original_line_2[i-1];
			original_line_3[i] <= original_line_3[i-1];
			original_line_4[i] <= original_line_4[i-1];
			original_line_5[i] <= original_line_5[i-1];
		end
		original_line_1[0] <= data_in;
		original_line_2[0] <= shift_reg_out[0];
		original_line_3[0] <= shift_reg_out[1];
		original_line_4[0] <= shift_reg_out[2];
		original_line_5[0] <= shift_reg_out[3];

		// Add numbers that are multiplied by 2 and multiply by 2
		sum_level_1[ 0] <= {7'h00,original_line_1[0], 1'b0} + {7'h00,original_line_1[4], 1'b0};
		sum_level_1[ 1] <= {7'h00,original_line_5[0], 1'b0} + {7'h00,original_line_5[4], 1'b0};
		// Add numbers that are multiplied by 4 and multiply by 4
		sum_level_1[ 2] <= {6'h00,original_line_1[1], 2'h0} + {6'h00,original_line_1[3], 2'h0};
		sum_level_1[ 3] <= {6'h00,original_line_2[0], 2'h0} + {6'h00,original_line_2[4], 2'h0};
		sum_level_1[ 4] <= {6'h00,original_line_4[0], 2'h0} + {6'h00,original_line_4[4], 2'h0};
		sum_level_1[ 5] <= {6'h00,original_line_5[1], 2'h0} + {6'h00,original_line_5[3], 2'h0};
		// Add numbers that are multiplied by 5
		sum_level_1[ 6] <= {8'h00,original_line_1[2]} + {8'h00,original_line_5[2]};
		sum_level_1[ 7] <= {8'h00,original_line_3[0]} + {8'h00,original_line_3[4]};
		// Add numbers that are multiplied by 9
		sum_level_1[ 8] <= {8'h00,original_line_2[1]} + {8'h00,original_line_2[3]};
		sum_level_1[ 9] <= {8'h00,original_line_4[1]} + {8'h00,original_line_4[3]};
		// Add numbers that are multiplied by 12
		sum_level_1[10] <= {8'h00,original_line_2[2]} + {8'h00,original_line_4[2]};
		sum_level_1[11] <= {8'h00,original_line_3[1]} + {8'h00,original_line_3[3]};
		// Add numbers that are multiplied by 15
		sum_level_1[12] <= {4'h0,original_line_3[2], 4'h0} - original_line_3[2];
					
		// Add numbers that are multiplied by 2
		sum_level_2[ 0] <= sum_level_1[ 0] + sum_level_1[ 1];
		// Add numbers that are multiplied by 4
		sum_level_2[ 1] <= sum_level_1[ 2] + sum_level_1[ 3];
		sum_level_2[ 2] <= sum_level_1[ 4] + sum_level_1[ 5];
		// Add numbers that are multiplied by 5
		sum_level_2[ 3] <= sum_level_1[ 6] + sum_level_1[ 7];
		// Add numbers that are multiplied by 9
		sum_level_2[ 4] <= sum_level_1[ 8] + sum_level_1[ 9];
		// Add numbers that are multiplied by 12
		sum_level_2[ 5] <= sum_level_1[10] + sum_level_1[11];
		// Multiplied by 15
		sum_level_2[ 6] <= sum_level_1[12];

		// Add 2s and 15s
		sum_level_3[ 0] <= sum_level_2[ 0] + sum_level_2[ 6];
		// Add numbers that are multiplied by 4
		sum_level_3[ 1] <= sum_level_2[ 1] + sum_level_2[ 2];
		// Multiplied by 5
		sum_level_3[ 2] <= {sum_level_2[ 3], 2'h0} + sum_level_2[ 3];
		// Multiplied by 9
		sum_level_3[ 3] <= {sum_level_2[ 4], 3'h0} + sum_level_2[ 4];
		// Multiplied by 12
		sum_level_3[ 4] <= {sum_level_2[ 5], 3'h0} + {sum_level_2[ 5], 2'h0};

		// Add
		sum_level_4[ 0] <= sum_level_3[ 0] + sum_level_3[ 1];
		sum_level_4[ 1] <= sum_level_3[ 2] + sum_level_3[ 3];
		sum_level_4[ 2] <= sum_level_3[ 4];

		sum_level_5[ 0] <= sum_level_4[ 0] + sum_level_4[ 1];
		sum_level_5[ 1] <= sum_level_4[ 2];

		sum_level_6     <= sum_level_5[ 0] + sum_level_5[ 1];

		// Divide by 128, which is close enough to 115
		sum_level_7     <= sum_level_6[15:7];
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign data_out = sum_level_7; 

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_edge_detection_data_shift_register shift_register_1 (
	// Inputs
	.clock		(clk),
	.clken		(data_en),
	.shiftin		(data_in),

	// Bidirectionals

	// Outputs
	.shiftout	(shift_reg_out[0]),
	.taps			()
);
defparam
	shift_register_1.DW		= 8,
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
	shift_register_2.DW		= 8,
	shift_register_2.SIZE	= WIDTH;

altera_up_edge_detection_data_shift_register shift_register_3 (
	// Inputs
	.clock		(clk),
	.clken		(data_en),
	.shiftin		(shift_reg_out[1]),

	// Bidirectionals

	// Outputs
	.shiftout	(shift_reg_out[2]),
	.taps			()
);
defparam
	shift_register_3.DW		= 8,
	shift_register_3.SIZE	= WIDTH;

altera_up_edge_detection_data_shift_register shift_register_4 (
	// Inputs
	.clock		(clk),
	.clken		(data_en),
	.shiftin		(shift_reg_out[2]),

	// Bidirectionals

	// Outputs
	.shiftout	(shift_reg_out[3]),
	.taps			()
);
defparam
	shift_register_4.DW		= 8,
	shift_register_4.SIZE	= WIDTH;

endmodule

