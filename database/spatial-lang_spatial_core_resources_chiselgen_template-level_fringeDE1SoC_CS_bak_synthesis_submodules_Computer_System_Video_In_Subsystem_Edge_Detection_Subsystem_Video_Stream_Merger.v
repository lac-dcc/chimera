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
 * This module joins video in streams for the DE-series boards.               *
 *                                                                            *
 ******************************************************************************/

module Computer_System_Video_In_Subsystem_Edge_Detection_Subsystem_Video_Stream_Merger (
	// Inputs
	clk,
	reset,

	sync_data,
	sync_valid,

	stream_in_data_0,
	stream_in_startofpacket_0,
	stream_in_endofpacket_0,
	stream_in_empty_0,
	stream_in_valid_0,

	stream_in_data_1,
	stream_in_startofpacket_1,
	stream_in_endofpacket_1,
	stream_in_empty_1,
	stream_in_valid_1,

	stream_out_ready,

	// Bidirectional

	// Outputs
	sync_ready,

	stream_in_ready_0,

	stream_in_ready_1,

	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
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

input						sync_data;
input						sync_valid;

input			[DW: 0]	stream_in_data_0;
input						stream_in_startofpacket_0;
input						stream_in_endofpacket_0;
input			[EW: 0]	stream_in_empty_0;
input						stream_in_valid_0;

input			[DW: 0]	stream_in_data_1;
input						stream_in_startofpacket_1;
input						stream_in_endofpacket_1;
input			[EW: 0]	stream_in_empty_1;
input						stream_in_valid_1;

input						stream_out_ready;

// Bidirectional

// Outputs
output					sync_ready;

output					stream_in_ready_0;

output					stream_in_ready_1;

output reg	[DW: 0]	stream_out_data;
output reg				stream_out_startofpacket;
output reg				stream_out_endofpacket;
output reg	[EW: 0]	stream_out_empty;
output reg				stream_out_valid;

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
		stream_out_data				<=  'h0;
		stream_out_startofpacket	<= 1'b0;
		stream_out_endofpacket		<= 1'b0;
		stream_out_empty				<=  'h0;
		stream_out_valid				<= 1'b0;
	end
	else if (stream_in_ready_0)
	begin
		stream_out_data				<= stream_in_data_0;
		stream_out_startofpacket	<= stream_in_startofpacket_0;
		stream_out_endofpacket		<= stream_in_endofpacket_0;
		stream_out_empty				<= stream_in_empty_0;
		stream_out_valid				<= stream_in_valid_0;
	end
	else if (stream_in_ready_1)
	begin
		stream_out_data				<= stream_in_data_1;
		stream_out_startofpacket	<= stream_in_startofpacket_1;
		stream_out_endofpacket		<= stream_in_endofpacket_1;
		stream_out_empty				<= stream_in_empty_1;
		stream_out_valid				<= stream_in_valid_1;
	end
	else if (stream_out_ready)
		stream_out_valid				<= 1'b0;
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
		between_frames <= 1'b1;
	else if (stream_in_ready_0 & stream_in_endofpacket_0)
		between_frames <= 1'b1;
	else if (stream_in_ready_1 & stream_in_endofpacket_1)
		between_frames <= 1'b1;
	else if (stream_in_ready_0 & stream_in_startofpacket_0)
		between_frames <= 1'b0;
	else if (stream_in_ready_1 & stream_in_startofpacket_1)
		between_frames <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		stream_select_reg <= 1'b0;
	else if (enable_setting_stream_select & sync_valid)
		stream_select_reg <= sync_data;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign sync_ready				= enable_setting_stream_select;

assign stream_in_ready_0	= (stream_select_reg) ? 
		1'b0 : stream_in_valid_0 & (~stream_out_valid | stream_out_ready);

assign stream_in_ready_1	= (stream_select_reg) ? 
		stream_in_valid_1 & (~stream_out_valid | stream_out_ready) : 1'b0;

// Internal Assignments
assign enable_setting_stream_select = 
		  (stream_in_ready_0 & stream_in_endofpacket_0) |
		  (stream_in_ready_1 & stream_in_endofpacket_1) |
		(~(stream_in_ready_0 & stream_in_startofpacket_0) & between_frames) |
		(~(stream_in_ready_1 & stream_in_startofpacket_1) & between_frames);

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

