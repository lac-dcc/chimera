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
 * This module splits video in streams for the DE-series boards.              *
 *                                                                            *
 ******************************************************************************/

module Computer_System_Video_In_Subsystem_Edge_Detection_Subsystem_Video_Stream_Splitter (
	// Inputs
	clk,
	reset,

	sync_ready,

	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,

	stream_out_ready_0,

	stream_out_ready_1,

	stream_select,
	
	// Bidirectional

	// Outputs
	sync_data,
	sync_valid,

	stream_in_ready,

	stream_out_data_0,
	stream_out_startofpacket_0,
	stream_out_endofpacket_0,
	stream_out_empty_0,
	stream_out_valid_0,
	
	stream_out_data_1,
	stream_out_startofpacket_1,
	stream_out_endofpacket_1,
	stream_out_empty_1,
	stream_out_valid_1
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW = 23; // Frame's data width
parameter EW = 1; // Frame's empty width

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input						sync_ready;

input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[EW: 0]	stream_in_empty;
input						stream_in_valid;

input						stream_out_ready_0;

input						stream_out_ready_1;

input						stream_select;

// Bidirectional

// Outputs
output reg				sync_data;
output reg				sync_valid;

output					stream_in_ready;

output reg	[DW: 0]	stream_out_data_0;
output reg				stream_out_startofpacket_0;
output reg				stream_out_endofpacket_0;
output reg	[EW: 0]	stream_out_empty_0;
output reg				stream_out_valid_0;

output reg	[DW: 0]	stream_out_data_1;
output reg				stream_out_startofpacket_1;
output reg				stream_out_endofpacket_1;
output reg	[EW: 0]	stream_out_empty_1;
output reg				stream_out_valid_1;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						enable_setting_stream_select;

// Internal Registers
reg						between_frames;
reg						stream_select_reg;

// State Machine Registers

// Integers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers
always @(posedge clk)
begin
	if (reset)
	begin
		sync_data	<= 1'b0;
		sync_valid	<= 1'b0;
	end
	else if (enable_setting_stream_select)
	begin
		sync_data	<= stream_select;
		sync_valid	<= 1'b1;
	end
	else if (sync_ready)
		sync_valid	<= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
	begin
		stream_out_data_0				<=  'h0;
		stream_out_startofpacket_0	<= 1'b0;
		stream_out_endofpacket_0	<= 1'b0;
		stream_out_empty_0			<=  'h0;
		stream_out_valid_0			<= 1'b0;
	end
	else if (stream_in_ready & ~stream_select_reg)
	begin
		stream_out_data_0				<= stream_in_data;
		stream_out_startofpacket_0	<= stream_in_startofpacket;
		stream_out_endofpacket_0	<= stream_in_endofpacket;
		stream_out_empty_0			<= stream_in_empty;
		stream_out_valid_0			<= stream_in_valid;
	end
	else if (stream_out_ready_0)
		stream_out_valid_0			<= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
	begin
		stream_out_data_1				<=  'h0;
		stream_out_startofpacket_1	<= 1'b0;
		stream_out_endofpacket_1	<= 1'b0;
		stream_out_empty_1			<=  'h0;
		stream_out_valid_1			<= 1'b0;
	end
	else if (stream_in_ready & stream_select_reg)
	begin
		stream_out_data_1				<= stream_in_data;
		stream_out_startofpacket_1	<= stream_in_startofpacket;
		stream_out_endofpacket_1	<= stream_in_endofpacket;
		stream_out_empty_1			<= stream_in_empty;
		stream_out_valid_1			<= stream_in_valid;
	end
	else if (stream_out_ready_1)
		stream_out_valid_1			<= 1'b0;
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
		between_frames <= 1'b1;
	else if (stream_in_ready & stream_in_endofpacket)
		between_frames <= 1'b1;
	else if (stream_in_ready & stream_in_startofpacket)
		between_frames <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		stream_select_reg <= 1'b0;
	else if (enable_setting_stream_select)
		stream_select_reg <= stream_select;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign stream_in_ready = (stream_select_reg) ? 
			stream_in_valid & (~stream_out_valid_1 | stream_out_ready_1) :
			stream_in_valid & (~stream_out_valid_0 | stream_out_ready_0);

// Internal Assignments
assign enable_setting_stream_select = 
		  (stream_in_ready & stream_in_endofpacket) |
		(~(stream_in_ready & stream_in_startofpacket) & between_frames);

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

