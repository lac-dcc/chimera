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
 * This module converts resamples the chroma components of a video in         *
 *  stream, whos colour space is YCrCb.                                       *
 *                                                                            *
 ******************************************************************************/

module Computer_System_Video_In_Subsystem_Video_In_Chroma_Resampler (
	// Inputs
	clk,
	reset,

	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,

	stream_out_ready,
	
	// Bidirectional

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

parameter IDW = 15; // Incoming frame's data width
parameter ODW = 23; // Outcoming frame's data width

parameter IEW = 0; // Incoming frame's empty width
parameter OEW = 1; // Outcoming frame's empty width

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[IDW:0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[IEW:0]	stream_in_empty;
input						stream_in_valid;

input						stream_out_ready;

// Bidirectional

// Outputs
output					stream_in_ready;

output reg	[ODW:0]	stream_out_data;
output reg				stream_out_startofpacket;
output reg				stream_out_endofpacket;
output reg	[OEW:0]	stream_out_empty;
output reg				stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						transfer_data;

wire			[ODW:0]	converted_data;

wire						converted_startofpacket;
wire						converted_endofpacket;
wire			[OEW:0]	converted_empty;
wire						converted_valid;

// Internal Registers
reg			[IDW:0]	data;
reg						startofpacket;
reg						endofpacket;
reg			[IEW:0]	empty;
reg						valid;

reg			[ 7: 0]	saved_CrCb;
reg						cur_is_Cr_or_Cb;

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
	else if (transfer_data)
	begin
		stream_out_data				<= converted_data;
		stream_out_startofpacket	<= converted_startofpacket;
		stream_out_endofpacket		<= converted_endofpacket;
		stream_out_empty				<= converted_empty;
		stream_out_valid				<= converted_valid;
	end
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		data								<=  'h0;
		startofpacket					<= 1'b0;
		endofpacket						<= 1'b0;
		empty								<=  'h0;
		valid								<= 1'b0;
	end
	else if (stream_in_ready)
	begin
		data								<= stream_in_data;
		startofpacket					<= stream_in_startofpacket;
		endofpacket						<= stream_in_endofpacket;
		empty								<= stream_in_empty;
		valid								<= stream_in_valid;
	end
	else if (transfer_data)
	begin
		data								<=  'h0;
		startofpacket					<= 1'b0;
		endofpacket						<= 1'b0;
		empty								<=  'h0;
		valid								<= 1'b0;
	end
end

always @(posedge clk)
begin
	if (reset)
		saved_CrCb						<= 8'h00;
	else if (stream_in_ready & stream_in_startofpacket)
		saved_CrCb						<= 8'h00;
	else if (transfer_data & valid)
		saved_CrCb						<= data[15: 8];
end

always @(posedge clk)
begin
	if (reset)
		cur_is_Cr_or_Cb				<= 1'b0;
	else if (stream_in_ready & stream_in_startofpacket)
		cur_is_Cr_or_Cb				<= 1'b0;
	else if (stream_in_ready)
		cur_is_Cr_or_Cb				<= cur_is_Cr_or_Cb ^ 1'b1;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign stream_in_ready 			= stream_in_valid & (~valid | transfer_data);

// Internal Assignments
assign transfer_data				= 
		~stream_out_valid | (stream_out_ready & stream_out_valid);

assign converted_data[23:16]	= (cur_is_Cr_or_Cb) ? data[15: 8] : saved_CrCb;
assign converted_data[15: 8]	= (cur_is_Cr_or_Cb) ? saved_CrCb : data[15: 8];
assign converted_data[ 7: 0]	= data[ 7: 0];
assign converted_startofpacket	= startofpacket;
assign converted_endofpacket	= endofpacket;
assign converted_empty			= empty;
assign converted_valid			= valid;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

