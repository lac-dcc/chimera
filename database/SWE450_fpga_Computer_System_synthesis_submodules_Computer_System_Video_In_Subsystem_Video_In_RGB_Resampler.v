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
 * This module converts video streams between RGB color formats.              *
 *                                                                            *
 ******************************************************************************/

module Computer_System_Video_In_Subsystem_Video_In_RGB_Resampler (
	// Globals
	clk,
	reset,

	// Avalon Streaming Sink
	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,
	stream_in_ready,

	// Avalon Memory-Mapped Slave
	//slave_address,
	//slave_byteenable,
	slave_read,
	//slave_write,
	//slave_writedata,
	slave_readdata,

	// Avalon Streaming Source
	stream_out_ready,
	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter IDW			= 23;
parameter ODW			= 15;

parameter IEW			= 1;
parameter OEW			= 0;

parameter ALPHA			= 10'h3FF;

parameter STATUS_IN		= 16'h0017;
parameter STATUS_OUT	= 16'h0014;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Globals
input				clk;
input				reset;

// Avalon Streaming Sink
input		[IDW:0]	stream_in_data;
input				stream_in_startofpacket;
input				stream_in_endofpacket;
input		[IEW:0]	stream_in_empty;
input				stream_in_valid;
output				stream_in_ready;

// Avalon Memory-Mapped Slave
//input		[ 1: 0]	slave_address;
//input		[ 3: 0]	slave_byteenable;
input				slave_read;
//input				slave_write;
//input		[31: 0]	slave_writedata;
output reg	[31: 0]	slave_readdata;

// Avalon Streaming Source
input				stream_out_ready;
output reg	[ODW:0]	stream_out_data;
output reg			stream_out_startofpacket;
output reg			stream_out_endofpacket;
output reg	[OEW:0]	stream_out_empty;
output reg			stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire		[ 9: 0]	r;
wire		[ 9: 0]	g;
wire		[ 9: 0]	b;
wire		[ 9: 0]	a;


wire		[ODW:0]	converted_data;

// Internal Registers

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
		slave_readdata	<= 'h0;
	end
	else if (slave_read)
	begin
		slave_readdata[15: 0] <= STATUS_IN;
		slave_readdata[31:16] <= STATUS_OUT;
	end
end

always @(posedge clk)
begin
	if (reset)
	begin
		stream_out_data				<=  'b0;
		stream_out_startofpacket	<= 1'b0;
		stream_out_endofpacket		<= 1'b0;
		stream_out_empty			<=  'b0;
		stream_out_valid			<= 1'b0;
	end
	else if (stream_out_ready | ~stream_out_valid)
	begin
		stream_out_data				<= converted_data;
		stream_out_startofpacket	<= stream_in_startofpacket;
		stream_out_endofpacket		<= stream_in_endofpacket;
		stream_out_empty			<= stream_in_empty;
		stream_out_valid			<= stream_in_valid;
	end
end

// Internal Registers

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign stream_in_ready = stream_out_ready | ~stream_out_valid;

// Internal Assignments
assign r = {stream_in_data[23:16], stream_in_data[23:22]};
assign g = {stream_in_data[15: 8], stream_in_data[15:14]};
assign b = {stream_in_data[ 7: 0], stream_in_data[ 7: 6]};

assign a = ALPHA;

assign converted_data[15:11] = r[ 9: 5];
assign converted_data[10: 5] = g[ 9: 4];
assign converted_data[ 4: 0] = b[ 9: 5];

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

