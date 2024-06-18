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
 * This module is a FIFO with same clock for both reads and writes.           *
 *                                                                            *
 ******************************************************************************/

module altera_up_sync_fifo (
	// Inputs
	clk,
	reset,

	write_en,
	write_data,

	read_en,
	
	// Bidirectionals

	// Outputs
	fifo_is_empty,
	fifo_is_full,
	words_used,

	read_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter	DW				= 31;
parameter	DATA_DEPTH	= 128;
parameter	AW				= 6;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input						write_en;
input			[DW: 0]	write_data;

input						read_en;

// Bidirectionals

// Outputs
output					fifo_is_empty;
output					fifo_is_full;
output		[AW: 0]	words_used;

output		[DW: 0]	read_data;

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


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


scfifo	Sync_FIFO (
	// Inputs
	.clock			(clk),
	.sclr				(reset),

	.data				(write_data),
	.wrreq			(write_en),

	.rdreq			(read_en),

	// Bidirectionals

	// Outputs
	.empty			(fifo_is_empty),
	.full				(fifo_is_full),
	.usedw			(words_used),
	
	.q					(read_data)

	// Unused
	// synopsys translate_off
	,
	.aclr				(),
	.almost_empty	(),
	.almost_full	()
	// synopsys translate_on
);
defparam
	Sync_FIFO.add_ram_output_register	= "OFF",
	Sync_FIFO.intended_device_family		= "Cyclone II",
	Sync_FIFO.lpm_numwords					= DATA_DEPTH,
	Sync_FIFO.lpm_showahead					= "ON",
	Sync_FIFO.lpm_type						= "scfifo",
	Sync_FIFO.lpm_width						= DW + 1,
	Sync_FIFO.lpm_widthu						= AW + 1,
	Sync_FIFO.overflow_checking			= "OFF",
	Sync_FIFO.underflow_checking			= "OFF",
	Sync_FIFO.use_eab							= "ON";

endmodule

