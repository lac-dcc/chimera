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
 * This module reads and writes data to the IrDA connectpr on Altera's        *
 *  DE1 and DE2 Development and Education Boards.                             *
 *                                                                            *
 ******************************************************************************/

module altera_up_irda_counters (
	// Inputs
	clk,
	reset,
	
	reset_counters,

	// Bidirectionals

	// Outputs
	baud_clock_rising_edge,
	baud_clock_falling_edge,
	capture_in_bit,
	transmitting_bit,
	all_bits_transmitted
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter CW							= 9;		// BAUD COUNTER WIDTH
parameter BAUD_TICK_COUNT			= 433;
parameter BAUD_3_16_TICK_COUNT	= 81;
parameter CAPTURE_IN_TICK_COUNT	= 60;
parameter HALF_BAUD_TICK_COUNT	= 216;

parameter TDW							= 11;		// TOTAL DATA WIDTH

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input						reset_counters;

// Bidirectionals

// Outputs
output reg				baud_clock_rising_edge;
output reg				baud_clock_falling_edge;
output reg				capture_in_bit;
output reg				transmitting_bit;
output reg				all_bits_transmitted;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires

// Internal Registers
reg		[(CW-1):0]	baud_counter;
reg			[ 3: 0]	bit_counter;

// State Machine Registers
reg						ns_counter;
reg						s_counter;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/
/*
always @(posedge clk)
begin
	if (reset)
		s_counter <= STATE_0_IDLE;
	else
		s_counter <= ns_counter;
end

always @(*)
begin
	ns_counter = STATE_0_IDLE;
	// Defaults
	ns_counter = STATE_0_IDLE;

    case (s_counter)
	STATE_0_IDLE:
		begin
			if ((transfer_data) && (start_and_stop_en))
				ns_counter = STATE_1_RUNNING;
			else
				ns_counter = STATE_0_IDLE;
		end
	STATE_1_RUNNING:
		begin
			if (change_output_bit_en)
				ns_counter = STATE_0_IDLE;
			else
				ns_counter = STATE_1_RUNNING;
		end
	default:
		begin
			ns_counter = STATE_0_IDLE;
		end
	endcase
end
*/
/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		baud_counter <= {CW{1'b0}};
	else if (reset_counters)
		baud_counter <= {CW{1'b0}};
	else if (baud_counter == BAUD_TICK_COUNT)
		baud_counter <= {CW{1'b0}};
	else
		baud_counter <= baud_counter + 1;
end

always @(posedge clk)
begin
	if (reset)
		baud_clock_rising_edge <= 1'b0;
	else if (baud_counter == BAUD_TICK_COUNT)
		baud_clock_rising_edge <= 1'b1;
	else
		baud_clock_rising_edge <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		baud_clock_falling_edge <= 1'b0;
	else if (baud_counter == HALF_BAUD_TICK_COUNT)
		baud_clock_falling_edge <= 1'b1;
	else
		baud_clock_falling_edge <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		capture_in_bit <= 1'b0;
	else if (baud_counter == CAPTURE_IN_TICK_COUNT)
		capture_in_bit <= 1'b1;
	else
		capture_in_bit <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		transmitting_bit <= 1'b0;
	else if (reset_counters)
		transmitting_bit <= 1'b1;
	else if (bit_counter == TDW)
		transmitting_bit <= 1'b0;
	else if (baud_counter == BAUD_3_16_TICK_COUNT)
		transmitting_bit <= 1'b0;
	else if (baud_clock_rising_edge)
		transmitting_bit <= 1'b1;
end

always @(posedge clk)
begin
	if (reset)
		bit_counter <= 4'h0;
	else if (reset_counters)
		bit_counter <= 4'h0;
	else if (bit_counter == TDW)
		bit_counter <= 4'h0;
	else if (baud_counter == BAUD_TICK_COUNT)
		bit_counter <= bit_counter + 4'h1;
end

always @(posedge clk)
begin
	if (reset)
		all_bits_transmitted <= 1'b0;
	else if (bit_counter == TDW)
		all_bits_transmitted <= 1'b1;
	else
		all_bits_transmitted <= 1'b0;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

