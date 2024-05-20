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
 * This module reads data to the IrDA UART Port.                              *
 *                                                                            *
 ******************************************************************************/

module altera_up_irda_in_deserializer (
	// Inputs
	clk,
	reset,
	
	serial_data_in,

	receive_data_en,

	// Bidirectionals

	// Outputs
	fifo_read_available,

	received_data_valid,
	received_data
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
parameter DW							= 9;		// DATA WIDTH

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input						serial_data_in;

input						receive_data_en;

// Bidirectionals

// Outputs
output reg	[ 7: 0]	fifo_read_available;

output					received_data_valid;
output		[DW: 0]	received_data;


/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						shift_data_reg_en;
wire						all_bits_received;

wire						fifo_is_empty;
wire						fifo_is_full;
wire			[ 6: 0]	fifo_used;

// Internal Registers
reg						receiving_data;

reg		[(TDW-1):0]	data_in_shift_reg;

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
		fifo_read_available <= 8'h00;
	else
		fifo_read_available <= {fifo_is_full, fifo_used};
end

always @(posedge clk)
begin
	if (reset)
		receiving_data <= 1'b0;
	else if (all_bits_received)
		receiving_data <= 1'b0;
	else if (serial_data_in == 1'b0)
		receiving_data <= 1'b1;
end

always @(posedge clk)
begin
	if (reset)
		data_in_shift_reg	<= {TDW{1'b0}};
	else if (shift_data_reg_en)
		data_in_shift_reg	<= 
			{serial_data_in, data_in_shift_reg[(TDW - 1):1]};
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output assignments
assign received_data_valid = ~fifo_is_empty;

// Input assignments


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_irda_counters IrDA_In_Counters (
	// Inputs
	.clk								(clk),
	.reset							(reset),
	
	.reset_counters				(~receiving_data),

	// Bidirectionals

	// Outputs
	.baud_clock_rising_edge		(),
	.baud_clock_falling_edge	(),
	.capture_in_bit				(shift_data_reg_en),
	.transmitting_bit				(),
	.all_bits_transmitted		(all_bits_received)
);
defparam 
	IrDA_In_Counters.CW							= CW,
	IrDA_In_Counters.BAUD_TICK_COUNT			= BAUD_TICK_COUNT,
	IrDA_In_Counters.BAUD_3_16_TICK_COUNT	= BAUD_3_16_TICK_COUNT,
	IrDA_In_Counters.CAPTURE_IN_TICK_COUNT	= CAPTURE_IN_TICK_COUNT,
	IrDA_In_Counters.HALF_BAUD_TICK_COUNT	= HALF_BAUD_TICK_COUNT,
	IrDA_In_Counters.TDW							= TDW;

altera_up_sync_fifo IrDA_In_FIFO (
	// Inputs
	.clk								(clk),
	.reset							(reset),

	.write_en						(all_bits_received & ~fifo_is_full),
	.write_data						(data_in_shift_reg[(DW + 1):1]),

	.read_en							(receive_data_en & ~fifo_is_empty),
	
	// Bidirectionals

	// Outputs
	.fifo_is_empty					(fifo_is_empty),
	.fifo_is_full					(fifo_is_full),
	.words_used						(fifo_used),

	.read_data						(received_data)
);
defparam 
	IrDA_In_FIFO.DW								= DW,
	IrDA_In_FIFO.DATA_DEPTH						= 128,
	IrDA_In_FIFO.AW								= 6;

endmodule

