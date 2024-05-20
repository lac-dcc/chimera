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

module altera_up_edge_detection_nonmaximum_suppression (
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

input			[ 9: 0]	data_in;
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
wire			[ 9: 0]	shift_reg_out[ 1: 0];

// Internal Registers
reg			[ 9: 0]	original_line_1[ 2: 0];
reg			[ 9: 0]	original_line_2[ 2: 0];
reg			[ 9: 0]	original_line_3[ 2: 0];

reg			[ 7: 0]	suppress_level_1[ 4: 0];
reg			[ 8: 0]	suppress_level_2[ 2: 0];
reg			[ 7: 0]	suppress_level_3;
reg			[ 1: 0]	average_flags;

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
		for (i = 2; i >= 0; i = i-1)
		begin
			original_line_1[i] 	<= 10'h000;
			original_line_2[i] 	<= 10'h000;
			original_line_3[i] 	<= 10'h000;
		end

		for (i = 4; i >= 0; i = i-1)
		begin
			suppress_level_1[i] 	<= 8'h00;
		end
		suppress_level_2[0] 		<= 9'h000;
		suppress_level_2[1] 		<= 9'h000;
		suppress_level_2[2] 		<= 9'h000;
		suppress_level_3   	 	<= 8'h00;

		average_flags				<= 2'h0;
	end
	else if (data_en == 1'b1)
	begin	
		for (i = 2; i > 0; i = i-1)
		begin
			original_line_1[i] 	<= original_line_1[i-1];
			original_line_2[i] 	<= original_line_2[i-1];
			original_line_3[i] 	<= original_line_3[i-1];
		end
		original_line_1[0] 		<= data_in;
		original_line_2[0] 		<= shift_reg_out[0];
		original_line_3[0] 		<= shift_reg_out[1];

		suppress_level_1[0] 		<= original_line_2[1][ 7: 0];
		case (original_line_2[1][9:8])
			2'b00 :
			begin
				suppress_level_1[1] <= original_line_1[0][ 7: 0];
				suppress_level_1[2] <= original_line_2[0][ 7: 0];
				suppress_level_1[3] <= original_line_2[2][ 7: 0];
				suppress_level_1[4] <= original_line_3[2][ 7: 0];
			end
			2'b01 :
			begin
				suppress_level_1[1] <= original_line_1[0][ 7: 0];
				suppress_level_1[2] <= original_line_1[1][ 7: 0];
				suppress_level_1[3] <= original_line_3[1][ 7: 0];
				suppress_level_1[4] <= original_line_3[2][ 7: 0];
			end
			2'b10 :
			begin
				suppress_level_1[1] <= original_line_1[1][ 7: 0];
				suppress_level_1[2] <= original_line_1[2][ 7: 0];
				suppress_level_1[3] <= original_line_3[0][ 7: 0];
				suppress_level_1[4] <= original_line_3[1][ 7: 0];
			end
			2'b11 :
			begin
				suppress_level_1[1] <= original_line_1[2][ 7: 0];
				suppress_level_1[2] <= original_line_2[2][ 7: 0];
				suppress_level_1[3] <= original_line_2[0][ 7: 0];
				suppress_level_1[4] <= original_line_3[0][ 7: 0];
			end
		endcase

		// Calculate Averages
		suppress_level_2[0] <= {1'b0,suppress_level_1[0]};
		suppress_level_2[1] <= {1'b0,suppress_level_1[1]} + {1'h0,suppress_level_1[2]};
		suppress_level_2[2] <= {1'b0,suppress_level_1[3]} + {1'h0,suppress_level_1[3]};

		// Calculate if pixel is nonmaximum
		suppress_level_3 <= suppress_level_2[0][ 7: 0];
		average_flags[0] <= (suppress_level_2[0][ 7: 0] >= suppress_level_2[1][ 8: 1]) ? 1'b1 : 1'b0;
		average_flags[1] <= (suppress_level_2[0][ 7: 0] >= suppress_level_2[2][ 8: 1]) ? 1'b1 : 1'b0;
	
		result <= (average_flags == 2'b11) ? suppress_level_3 : 8'h00;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign data_out = result; 

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
	shift_register_1.DW		= 10,
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
	shift_register_2.DW		= 10,
	shift_register_2.SIZE	= WIDTH;

endmodule

