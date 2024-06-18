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
 * This module is a rom for auto initializing the TRDB LCM lcd screen.        *
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init_lcm (
	// Inputs
	rom_address,

	// Bidirectionals

	// Outputs
	rom_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter LCM_INPUT_FORMAT_UB					= 8'h00;
parameter LCM_INPUT_FORMAT_LB					= 8'h01;
parameter LCM_POWER								= 8'h3F;
parameter LCM_DIRECTION_AND_PHASE			= 8'h17;
parameter LCM_HORIZONTAL_START_POSITION	= 8'h18;
parameter LCM_VERTICAL_START_POSITION		= 8'h08;
parameter LCM_ENB_NEGATIVE_POSITION			= 8'h00;
parameter LCM_GAIN_OF_CONTRAST				= 8'h20;
parameter LCM_R_GAIN_OF_SUB_CONTRAST		= 8'h20;
parameter LCM_B_GAIN_OF_SUB_CONTRAST		= 8'h20;
parameter LCM_OFFSET_OF_BRIGHTNESS			= 8'h10;
parameter LCM_VCOM_HIGH_LEVEL					= 8'h3F;
parameter LCM_VCOM_LOW_LEVEL					= 8'h3F;
parameter LCM_PCD_HIGH_LEVEL					= 8'h2F;
parameter LCM_PCD_LOW_LEVEL					= 8'h2F;
parameter LCM_GAMMA_CORRECTION_0				= 8'h98;
parameter LCM_GAMMA_CORRECTION_1				= 8'h9A;
parameter LCM_GAMMA_CORRECTION_2				= 8'hA9;
parameter LCM_GAMMA_CORRECTION_3				= 8'h99;
parameter LCM_GAMMA_CORRECTION_4				= 8'h08;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input			[ 4: 0]	rom_address;

// Bidirectionals

// Outputs
output		[15: 0]	rom_data;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

// States

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
reg			[13: 0]	data;

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
	0		:	data	<=	{6'h02, LCM_INPUT_FORMAT_UB};
	1		:	data	<=	{6'h03, LCM_INPUT_FORMAT_LB};
	2		:	data	<=	{6'h04, LCM_POWER};
	3		:	data	<=	{6'h05, LCM_DIRECTION_AND_PHASE};
	4		:	data	<=	{6'h06, LCM_HORIZONTAL_START_POSITION};
	5		:	data	<=	{6'h07, LCM_VERTICAL_START_POSITION};
	6		:	data	<=	{6'h08, LCM_ENB_NEGATIVE_POSITION};
	7		:	data	<=	{6'h09, LCM_GAIN_OF_CONTRAST};
	8		:	data	<=	{6'h0A, LCM_R_GAIN_OF_SUB_CONTRAST};
	9		:	data	<=	{6'h0B, LCM_B_GAIN_OF_SUB_CONTRAST};
	10		:	data	<=	{6'h0C, LCM_OFFSET_OF_BRIGHTNESS};
	11		:	data	<=	{6'h10, LCM_VCOM_HIGH_LEVEL};
	12		:	data	<=	{6'h11, LCM_VCOM_LOW_LEVEL};
	13		:	data	<=	{6'h12, LCM_PCD_HIGH_LEVEL};
	14		:	data	<=	{6'h13, LCM_PCD_LOW_LEVEL};
	15		:	data	<=	{6'h14, LCM_GAMMA_CORRECTION_0};
	16		:	data	<=	{6'h15, LCM_GAMMA_CORRECTION_1};
	17		:	data	<=	{6'h16, LCM_GAMMA_CORRECTION_2};
	18		:	data	<=	{6'h17, LCM_GAMMA_CORRECTION_3};
	19		:	data	<=	{6'h18, LCM_GAMMA_CORRECTION_4};
	default	:	data	<=	14'h0000;
	endcase
end

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

