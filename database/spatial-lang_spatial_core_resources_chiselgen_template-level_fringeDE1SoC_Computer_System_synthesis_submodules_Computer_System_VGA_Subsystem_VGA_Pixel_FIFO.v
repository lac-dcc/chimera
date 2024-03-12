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
 * This module is a buffer that can be used the transfer streaming data from  *
 *  one clock domain to another.                                              *
 *                                                                            *
 ******************************************************************************/

module Computer_System_VGA_Subsystem_VGA_Pixel_FIFO (
	// Inputs
	clk_stream_in,
	reset_stream_in,
	clk_stream_out,
	reset_stream_out,

	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,

	stream_out_ready,

	// Bi-Directional

	// Outputs
	stream_in_ready,

	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW	= 15; // Frame's data width
parameter EW	= 0; // Frame's empty width

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk_stream_in;
input						reset_stream_in;
input						clk_stream_out;
input						reset_stream_out;

input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[EW: 0]	stream_in_empty;
input						stream_in_valid;

input						stream_out_ready;

// Bi-Directional

// Outputs
output					stream_in_ready;

output		[DW: 0]	stream_out_data;
output					stream_out_startofpacket;
output					stream_out_endofpacket;
output		[EW: 0]	stream_out_empty;
output					stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[ 6: 0]	fifo_wr_used;
wire						fifo_empty;

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

// Output assignments
assign stream_in_ready	= ~(&(fifo_wr_used[6:4]));

assign stream_out_empty	= 'h0;
assign stream_out_valid	= ~fifo_empty;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

dcfifo	Data_FIFO (
	// Inputs
	.wrclk	(clk_stream_in),
	.wrreq	(stream_in_ready & stream_in_valid),
	.data		({stream_in_data, stream_in_endofpacket, stream_in_startofpacket}),

	.rdclk	(clk_stream_out),
	.rdreq	(stream_out_ready & ~fifo_empty),

	// Outputs
	.wrusedw	(fifo_wr_used),
		
	.rdempty	(fifo_empty),
	.q			({stream_out_data, stream_out_endofpacket, stream_out_startofpacket})
	// synopsys translate_off
	,
		
	.aclr		(),
	.wrfull	(),
	.wrempty	(),
	.rdfull	(),
	.rdusedw	()
	// synopsys translate_on
);
defparam
	Data_FIFO.intended_device_family	= "Cyclone II",
	Data_FIFO.lpm_hint					= "MAXIMIZE_SPEED=7",
	Data_FIFO.lpm_numwords				= 128,
	Data_FIFO.lpm_showahead				= "ON",
	Data_FIFO.lpm_type					= "dcfifo",
	Data_FIFO.lpm_width					= DW + 3,
	Data_FIFO.lpm_widthu					= 7,
	Data_FIFO.overflow_checking		= "OFF",
	Data_FIFO.rdsync_delaypipe			= 5,
	Data_FIFO.underflow_checking		= "OFF",
	Data_FIFO.use_eab						= "ON",
	Data_FIFO.wrsync_delaypipe			= 5;

endmodule

