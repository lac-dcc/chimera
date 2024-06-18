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
 * This module converts incoming ascii characters into their pixel            *
 *   representation, which is  suitable for output on a display, such as a    *
 *   VGA-compatible monitor or LCD.                                           *
 *                                                                            *
 ******************************************************************************/

module Computer_System_VGA_Subsystem_Char_Buf_Subsystem_ASCII_to_Image (
	// Global Signals
	clk,
	reset,

	// ASCII Character Stream (input stream)
	ascii_in_channel,
	ascii_in_data,
	ascii_in_startofpacket,
	ascii_in_endofpacket,
	ascii_in_valid,
	ascii_in_ready,

	// Image Stream (output stream)
	image_out_ready,
	image_out_data,
	image_out_startofpacket,
	image_out_endofpacket,
	image_out_valid
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter IDW		= 7;
parameter ODW		= 0;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Global Signals
input						clk;
input						reset;

// ASCII Character Stream (avalon stream - sink)
input			[ 5: 0]	ascii_in_channel;
input			[IDW:0]	ascii_in_data;
input						ascii_in_startofpacket;
input						ascii_in_endofpacket;
input						ascii_in_valid;
output					ascii_in_ready;

// Image Stream (avalon stream - source)
input						image_out_ready;
output reg	[ODW:0]	image_out_data;
output reg				image_out_startofpacket;
output reg				image_out_endofpacket;
output reg				image_out_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						rom_data;

// Internal Registers
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
		image_out_data				<=  'h0;
		image_out_startofpacket	<= 1'b0;
		image_out_endofpacket	<= 1'b0;
		image_out_valid			<= 1'b0;
	end
	else if (image_out_ready | ~image_out_valid)
	begin
		image_out_data				<= rom_data;
		image_out_startofpacket	<= internal_startofpacket;
		image_out_endofpacket	<= internal_endofpacket;
		image_out_valid			<= internal_valid;
	end
end


// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		internal_startofpacket	<= 1'b0;
		internal_endofpacket		<= 1'b0;
		internal_valid				<= 1'b0;
	end
	else if (ascii_in_ready)
	begin
		internal_startofpacket	<= ascii_in_startofpacket;
		internal_endofpacket		<= ascii_in_endofpacket;
		internal_valid				<= ascii_in_valid;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign ascii_in_ready = ~ascii_in_valid | image_out_ready | ~image_out_valid;

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_video_ascii_rom_128 ASCII_Character_Rom (
	// Global Signals
	.clk					(clk),
	.clk_en				(ascii_in_ready),

	// Inputs
	.character			(ascii_in_data[ 6: 0]),
	.x_coordinate		(ascii_in_channel[ 2: 0]),
	.y_coordinate		(ascii_in_channel[ 5: 3]),
	
	// Outputs
	.character_data	(rom_data)
);
	

endmodule

