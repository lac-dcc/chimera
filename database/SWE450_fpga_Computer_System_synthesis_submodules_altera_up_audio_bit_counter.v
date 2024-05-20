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
 *   This module counts which bits for serial audio transfers. The module     *
 * assume that the data format is I2S, as it is described in the audio        *
 * chip's datasheet.                                                          *
 *                                                                            *
 ******************************************************************************/

module altera_up_audio_bit_counter (
	// Inputs
	clk,
	reset,
	
	bit_clk_rising_edge,
	bit_clk_falling_edge,
	left_right_clk_rising_edge,
	left_right_clk_falling_edge,
	
	// Bidirectionals

	// Outputs
	counting
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter BIT_COUNTER_INIT	= 5'h0F;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;
	
input						bit_clk_rising_edge;
input						bit_clk_falling_edge;
input						left_right_clk_rising_edge;
input						left_right_clk_falling_edge;

// Bidirectionals

// Outputs
output reg				counting;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						reset_bit_counter;

// Internal Registers
reg			[ 4: 0]	bit_counter;

// State Machine Registers


/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset == 1'b1)
		bit_counter <= 5'h00;
	else if (reset_bit_counter == 1'b1)
		bit_counter <= BIT_COUNTER_INIT;
	else if ((bit_clk_falling_edge == 1'b1) && (bit_counter != 5'h00))
		bit_counter <= bit_counter - 5'h01;
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		counting <= 1'b0;
	else if (reset_bit_counter == 1'b1)
		counting <= 1'b1;
	else if ((bit_clk_falling_edge == 1'b1) && (bit_counter == 5'h00))
		counting <= 1'b0;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign reset_bit_counter = left_right_clk_rising_edge | 
							left_right_clk_falling_edge;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

endmodule

