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

module altera_up_video_dma_to_memory (
	// Inputs
	clk,
	reset,

	stream_data,
	stream_startofpacket,
	stream_endofpacket,
	stream_empty,
	stream_valid,

	master_waitrequest,
	
	// Bidirectional

	// Outputs
	stream_ready,

	master_write,
	master_writedata,

	inc_address,
	reset_address
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW	=  15; // Frame's datawidth
parameter EW	=   0; // Frame's empty width

parameter MDW	=  15; // Avalon master's datawidth

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[DW: 0]	stream_data;
input						stream_startofpacket;
input						stream_endofpacket;
input			[EW: 0]	stream_empty;
input						stream_valid;

input						master_waitrequest;
	
// Bidirectional

// Outputs
output					stream_ready;

output					master_write;
output		[MDW:0]	master_writedata;

output					inc_address;
output					reset_address;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires

// Internal Registers
reg			[DW: 0]	temp_data;
reg						temp_valid;

// State Machine Registers

// Integers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers

// Internal Registers
always @(posedge clk)
begin
	if (reset & ~master_waitrequest)
	begin
		temp_data	<=  'h0;
		temp_valid	<= 1'b0;
	end
	else if (stream_ready)
	begin
		temp_data	<= stream_data;
		temp_valid	<= stream_valid;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
// Output Assignments
assign stream_ready		= ~reset & (~temp_valid | ~master_waitrequest);

assign master_write		= temp_valid;
assign master_writedata	= temp_data;

assign inc_address		= stream_ready & stream_valid;
assign reset_address		= inc_address & stream_startofpacket;

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

