// This program was cloned from: https://github.com/stanford-ppl/spatial-lang
// License: MIT License

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
 * This module clips video streams on the DE boards. If the incoming image is *
 *   the wrong size, the circuit will discard or add pixels as necessary.     *
 *                                                                            *
 ******************************************************************************/

module altera_up_video_clipper_drop (
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

parameter DW							=  15; // Image's Data Width
parameter EW							=   0; // Image's Empty Width

parameter IMAGE_WIDTH				= 640; // Image in width in pixels
parameter IMAGE_HEIGHT				= 480; // Image in height in lines
parameter WW							=   9; // Image in width address width
parameter HW							=   8; // Image in height address width

parameter DROP_PIXELS_AT_START	=   0;
parameter DROP_PIXELS_AT_END		=   0;
parameter DROP_LINES_AT_START		=   0;
parameter DROP_LINES_AT_END		=   0;

parameter ADD_DATA					= 16'h0; // Data for added pixels

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[EW: 0]	stream_in_empty;
input						stream_in_valid;

input						stream_out_ready;

// Bidirectional

// Outputs
output					stream_in_ready;

output reg	[DW: 0]	stream_out_data;
output reg				stream_out_startofpacket;
output reg				stream_out_endofpacket;
output reg	[EW: 0]	stream_out_empty;
output reg				stream_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

localparam	STATE_0_WAIT_FOR_START		= 2'h0,
				STATE_1_RUN_CLIPPER			= 2'h1,
				STATE_2_ADD_MISSING_PART	= 2'h2;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						increment_counters;

wire						full_frame_endofpacket;
wire						new_startofpacket;
wire						new_endofpacket;
wire						pass_inner_frame;

// Internal Registers

// State Machine Registers
reg			[ 1: 0]	s_video_clipper_drop;
reg			[ 1: 0]	ns_video_clipper_drop;

// Integers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		s_video_clipper_drop <= STATE_0_WAIT_FOR_START;
	else
		s_video_clipper_drop <= ns_video_clipper_drop;
end

always @(*)
begin
   case (s_video_clipper_drop)
	STATE_0_WAIT_FOR_START:
		begin
			if (stream_in_startofpacket & stream_in_valid)
				ns_video_clipper_drop = STATE_1_RUN_CLIPPER;
			else
				ns_video_clipper_drop = STATE_0_WAIT_FOR_START;
		end
	STATE_1_RUN_CLIPPER:
		begin
			if (increment_counters & full_frame_endofpacket)
				ns_video_clipper_drop = STATE_0_WAIT_FOR_START;
			else if (increment_counters & stream_in_endofpacket)
				ns_video_clipper_drop = STATE_2_ADD_MISSING_PART;
			else
				ns_video_clipper_drop = STATE_1_RUN_CLIPPER;
		end
	STATE_2_ADD_MISSING_PART:
		begin
			if (increment_counters & full_frame_endofpacket)
				ns_video_clipper_drop = STATE_0_WAIT_FOR_START;
			else
				ns_video_clipper_drop = STATE_2_ADD_MISSING_PART;
		end
	default:
		begin
			ns_video_clipper_drop = STATE_0_WAIT_FOR_START;
		end
	endcase
end


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
	else if (stream_out_ready | ~stream_out_valid)
	begin
		if (s_video_clipper_drop == STATE_2_ADD_MISSING_PART)
			stream_out_data			<= ADD_DATA;
		else
			stream_out_data			<= stream_in_data;
		stream_out_startofpacket	<= new_startofpacket;
		stream_out_endofpacket		<= new_endofpacket;
		stream_out_empty				<= stream_in_empty;
		if (s_video_clipper_drop == STATE_1_RUN_CLIPPER)
			stream_out_valid			<= pass_inner_frame & stream_in_valid;
		else if (s_video_clipper_drop == STATE_2_ADD_MISSING_PART)
			stream_out_valid			<= pass_inner_frame;
		else
			stream_out_valid			<= 1'b0;
	end
end

// Internal Registers

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign stream_in_ready		= 
	(s_video_clipper_drop == STATE_0_WAIT_FOR_START) ? 
		~(stream_in_startofpacket & stream_in_valid) :
	(s_video_clipper_drop == STATE_1_RUN_CLIPPER) ?
		~pass_inner_frame | stream_out_ready | ~stream_out_valid :
		1'b0;

// Internal Assignments
assign increment_counters	= 
	(s_video_clipper_drop == STATE_1_RUN_CLIPPER) ?
		stream_in_valid & stream_in_ready :
	(s_video_clipper_drop == STATE_2_ADD_MISSING_PART) ?
		~pass_inner_frame | stream_out_ready | ~stream_out_valid :
		1'b0;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_video_clipper_counters Clipper_Drop_Counters (
	// Inputs
	.clk							(clk),
	.reset						(reset),

	.increment_counters		(increment_counters),

	// Bi-Directional

	// Outputs
	.start_of_outer_frame	(),
	.end_of_outer_frame		(full_frame_endofpacket),

	.start_of_inner_frame	(new_startofpacket),
	.end_of_inner_frame		(new_endofpacket),
	.inner_frame_valid		(pass_inner_frame)
);
defparam
	Clipper_Drop_Counters.IMAGE_WIDTH	= IMAGE_WIDTH,
	Clipper_Drop_Counters.IMAGE_HEIGHT	= IMAGE_HEIGHT,
	Clipper_Drop_Counters.WW				= WW,
	Clipper_Drop_Counters.HW				= HW,

	Clipper_Drop_Counters.LEFT_OFFSET	= DROP_PIXELS_AT_START,
	Clipper_Drop_Counters.RIGHT_OFFSET	= DROP_PIXELS_AT_END,
	Clipper_Drop_Counters.TOP_OFFSET		= DROP_LINES_AT_START,
	Clipper_Drop_Counters.BOTTOM_OFFSET	= DROP_LINES_AT_END;

endmodule

