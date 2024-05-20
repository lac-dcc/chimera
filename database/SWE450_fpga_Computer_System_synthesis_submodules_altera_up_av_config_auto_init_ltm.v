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
 * This module is a rom for auto initializing the TRDB LTM lcd screen.        *
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init_ltm (
	// Inputs
	rom_address,

	// Bidirectionals

	// Outputs
	rom_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input			[ 4: 0]	rom_address;

// Bidirectionals

// Outputs
output		[23: 0]	rom_data;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

// States

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
reg			[23: 0]	data;

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers

// Internal Registers

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign rom_data = {data[13: 8], 2'h0, 
						data[ 7: 0]};

// Internal Assignments
always @(*)
begin
	case (rom_address)
	0		:	data	<=	{6'h02, 8'h07};
	1		:	data	<=	{6'h03, 8'hDF};
	2		:	data	<=	{6'h04, 8'h17};
	3		:	data	<=	{6'h11, 8'h00};
	4		:	data	<=	{6'h12, 8'h5B};
	5		:	data	<=	{6'h13, 8'hFF};
	6		:	data	<=	{6'h14, 8'h00};
	7		:	data	<=	{6'h15, 8'h20};
	8		:	data	<=	{6'h16, 8'h40};
	9		:	data	<=	{6'h17, 8'h80};
	10		:	data	<=	{6'h18, 8'h00};
	11		:	data	<=	{6'h19, 8'h80};
	12		:	data	<=	{6'h1A, 8'h00};
	13		:	data	<=	{6'h1B, 8'h00};
	14		:	data	<=	{6'h1C, 8'h80};
	15		:	data	<=	{6'h1D, 8'hC0};
	16		:	data	<=	{6'h1E, 8'hE0};
	17		:	data	<=	{6'h1F, 8'hFF};
	18		:	data	<=	{6'h20, 8'hD2};
	19		:	data	<=	{6'h21, 8'hD2};
	default	:	data	<=	14'h0000;
	endcase
end

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

