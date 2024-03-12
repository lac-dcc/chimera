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
 * This module contains a character map for 128 different ASCII characters.   *
 *                                                                            *
 ******************************************************************************/

module altera_up_video_ascii_rom_128 (
	// Inputs
	clk,
	clk_en,

	character,
	x_coordinate,
	y_coordinate,
	
	// Bidirectionals

	// Outputs
	character_data
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						clk_en;

input			[ 6: 0]	character;
input			[ 2: 0]	x_coordinate;
input			[ 2: 0]	y_coordinate;

// Bidirectionals

// Outputs
output reg				character_data;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[12: 0]	character_address;

// Internal Registers
reg						rom [8191:0];

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

initial
begin
	$readmemb("altera_up_video_ascii_rom_128.txt", rom);
end
always @ (posedge clk)
begin
	if (clk_en)
		character_data <= rom[character_address];
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign character_address = {character, y_coordinate, x_coordinate};

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

