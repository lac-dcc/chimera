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
 * This module adds the missing end of packet signal to the video stream.     *
 *                                                                            *
 ******************************************************************************/
//`define USE_CLIPPER_DROP

module altera_up_video_decoder_add_endofpacket (
	// Inputs
	clk,
	reset,

	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_valid,

	stream_out_ready,
	
	// Bidirectional

	// Outputs
	stream_in_ready,

	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW	=  15; // Frame's data width

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input						stream_in_valid;

input						stream_out_ready;

// Bi-Directional

// Outputs
output					stream_in_ready;

output reg	[DW: 0]	stream_out_data;
output reg				stream_out_startofpacket;
output reg				stream_out_endofpacket;
output reg				stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						internal_ready;

// Internal Registers
reg			[DW: 0]	internal_data;
reg						internal_startofpacket;
reg						internal_endofpacket;
reg						internal_valid;

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
		stream_out_valid				<= 1'b0;
	end
	else if (stream_in_ready & stream_in_valid)
	begin
		stream_out_data				<= internal_data;
		stream_out_startofpacket	<= internal_startofpacket;
		stream_out_endofpacket		<= internal_endofpacket | stream_in_startofpacket;
		stream_out_valid				<= internal_valid;
	end
	else if (stream_out_ready)
		stream_out_valid				<= 1'b0;
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		internal_data					<=  'h0;
		internal_startofpacket		<= 1'b0;
		internal_endofpacket			<= 1'b0;
		internal_valid					<= 1'b0;
	end
	else if (stream_in_ready & stream_in_valid)
	begin
		internal_data					<= stream_in_data;
		internal_startofpacket		<= stream_in_startofpacket;
		internal_endofpacket			<= stream_in_endofpacket;
		internal_valid					<= stream_in_valid;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
// Output Assignments
assign stream_in_ready = stream_out_ready | ~stream_out_valid;

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

