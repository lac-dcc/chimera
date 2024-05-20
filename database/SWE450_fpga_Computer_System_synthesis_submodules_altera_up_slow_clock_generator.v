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
 * This module can create clock signals that have a frequency lower           *
 *  than those a PLL can generate.                                            *
 *                                                                            *
 * Revision: 1.2                                                              *
 *                                                                            *
 * Used in IP Cores:                                                          *
 *   Altera UP Avalon Audio and Video Config                                  *
 *                                                                            *
 ******************************************************************************/

module altera_up_slow_clock_generator (
	// Inputs
	clk,
	reset,
	
	enable_clk,

	// Bidirectionals

	// Outputs
	new_clk,

	rising_edge,
	falling_edge,

	middle_of_high_level,
	middle_of_low_level
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter CB				= 10;			//COUNTER BITS

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input						enable_clk;
	
// Bidirectionals

// Outputs
output reg				new_clk;

output reg				rising_edge;
output reg				falling_edge;

output reg				middle_of_high_level;
output reg				middle_of_low_level;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires

// Internal Registers
reg			[CB:1]	clk_counter;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		clk_counter	<= 'h0;
	else if (enable_clk)
		clk_counter	<= clk_counter + 1;
end

always @(posedge clk)
begin
	if (reset)
		new_clk	<= 1'b0;
	else
		new_clk	<= clk_counter[CB];
end

always @(posedge clk)
begin
	if (reset)
		rising_edge	<= 1'b0;
	else
		rising_edge	<= (clk_counter[CB] ^ new_clk) & ~new_clk;
end

always @(posedge clk)
begin
	if (reset)
		falling_edge <= 1'b0;
	else
		falling_edge <= (clk_counter[CB] ^ new_clk) & new_clk;
end

always @(posedge clk)
begin
	if (reset)
		middle_of_high_level <= 1'b0;
	else
		middle_of_high_level <= 
			clk_counter[CB] & 
			~clk_counter[(CB - 1)] &
			(&(clk_counter[(CB - 2):1]));
end

always @(posedge clk)
begin
	if (reset)
		middle_of_low_level <= 1'b0;
	else
		middle_of_low_level <= 
			~clk_counter[CB] & 
			~clk_counter[(CB - 1)] &
			(&(clk_counter[(CB - 2):1]));
end



/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

endmodule

