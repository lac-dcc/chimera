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
 * This module replicates pixels in video data to enlarge the image.          *
 *                                                                            *
 ******************************************************************************/

module altera_up_video_scaler_multiply_width (
	// Inputs
	clk,
	reset,

	stream_in_channel,
	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_valid,

	stream_out_ready,

	// Bi-Directional

	// Outputs
	stream_in_ready,

	stream_out_channel,
	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_valid
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter CW	=  15; // Image's Channel Width
parameter DW	=  15; // Image's data width

parameter MCW	=   0; // Multiply width's counter width

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[CW: 0]	stream_in_channel;
input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input						stream_in_valid;

input						stream_out_ready;

// Bi-Directional

// Outputs
output					stream_in_ready;

output reg	[CW: 0]	stream_out_channel;
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

// Internal Registers
reg			[CW: 0]	channel;
reg			[DW: 0]	data;
reg						startofpacket;
reg						endofpacket;
reg						valid;

reg			[MCW:0]	enlarge_width_counter;

// State Machine Registers

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
		stream_out_channel				<=  'h0;
		stream_out_data					<=  'h0;
		stream_out_startofpacket		<= 1'b0;
		stream_out_endofpacket			<= 1'b0;
		stream_out_valid					<= 1'b0;
	end
	else if (stream_out_ready | ~stream_out_valid)
	begin
		stream_out_channel				<= {channel, enlarge_width_counter};
		stream_out_data					<= data;

		if (|(enlarge_width_counter))
			stream_out_startofpacket	<= 1'b0;
		else
			stream_out_startofpacket	<= startofpacket;

		if (&(enlarge_width_counter))
			stream_out_endofpacket		<= endofpacket;
		else
			stream_out_endofpacket		<= 1'b0;

		stream_out_valid					<= valid;
	end
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		channel								<=  'h0;
		data									<=  'h0;
		startofpacket						<= 1'b0;
		endofpacket							<= 1'b0;
		valid									<= 1'b0;
	end
	else if (stream_in_ready)
	begin
		channel								<= stream_in_channel;
		data									<= stream_in_data;
		startofpacket						<= stream_in_startofpacket;
		endofpacket							<= stream_in_endofpacket;
		valid									<= stream_in_valid;
	end
end

always @(posedge clk)
begin
	if (reset)
		enlarge_width_counter <= 'h0;
	else if ((stream_out_ready | ~stream_out_valid) & valid)
		enlarge_width_counter <= enlarge_width_counter + 1;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output assignments
assign stream_in_ready	= (~valid) | 
	((&(enlarge_width_counter)) & (stream_out_ready | ~stream_out_valid));

// Internal assignments
		
/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

