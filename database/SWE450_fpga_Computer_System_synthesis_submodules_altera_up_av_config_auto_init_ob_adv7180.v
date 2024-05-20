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
 * This module is a rom for auto initializing the on board ADV7180 video chip.*
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init_ob_adv7180 (
	// Inputs
	rom_address,

	// Bidirectionals

	// Outputs
	rom_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter INPUT_CTRL					= 16'h0000;
parameter VIDEO_SELECTION			= 16'h01C8;
parameter OUTPUT_CTRL				= 16'h030C;
parameter EXT_OUTPUT_CTRL			= 16'h0445;
parameter AUTODETECT					= 16'h077F;
parameter BRIGHTNESS					= 16'h0A00;
parameter HUE							= 16'h0B00;
parameter DEFAULT_VALUE_Y			= 16'h0C36;
parameter DEFAULT_VALUE_C			= 16'h0D7C;
parameter POWER_MGMT					= 16'h0F00;
parameter ANALOG_CLAMP_CTRL		= 16'h1412;
parameter DIGITAL_CLAMP_CTRL		= 16'h1500;
parameter SHAPING_FILTER_CTRL_1	= 16'h1701;
parameter SHAPING_FILTER_CTRL_2	= 16'h1893;
parameter COMB_FILTER_CTRL_2		= 16'h19F1;
parameter PIXEL_DELAY_CTRL			= 16'h2758;
parameter MISC_GAIN_CTRL			= 16'h2BE1;
parameter AGC_MODE_CTRL				= 16'h2CAE;
parameter CHROMA_GAIN_CTRL_1		= 16'h2DF4;
parameter CHROMA_GAIN_CTRL_2		= 16'h2E00;
parameter LUMA_GAIN_CTRL_1			= 16'h2FF0;
parameter LUMA_GAIN_CTRL_2			= 16'h3000;
parameter VSYNC_FIELD_CTRL_1		= 16'h3112;
parameter VSYNC_FIELD_CTRL_2		= 16'h3241;
parameter VSYNC_FIELD_CTRL_3		= 16'h3384;
parameter HSYNC_FIELD_CTRL_1		= 16'h3400;
parameter HSYNC_FIELD_CTRL_2		= 16'h3502;
parameter HSYNC_FIELD_CTRL_3		= 16'h3600;
parameter POLARITY					= 16'h3701;
parameter NTSC_COMB_CTRL			= 16'h3880;
parameter PAL_COMB_CTRL				= 16'h39C0;
parameter ADC_CTRL					= 16'h3A10;
parameter MANUAL_WINDOW_CTRL		= 16'h3DB2;
parameter RESAMPLE_CONTROL			= 16'h4101;
parameter CRC							= 16'hB21C;
parameter ADC_SWITCH_1				= 16'hC300;
parameter ADC_SWITCH_2				= 16'hC400;
parameter LETTERBOX_CTRL_1			= 16'hDCAC;
parameter LETTERBOX_CTRL_2			= 16'hDD4C;
parameter NTSC_V_BIT_BEGIN			= 16'hE525;
parameter NTSC_V_BIT_END			= 16'hE604;
parameter NTSC_F_BIT_TOGGLE		= 16'hE763;
parameter PAL_V_BIT_BEGIN			= 16'hE865;
parameter PAL_V_BIT_END				= 16'hE914;
parameter PAL_F_BIT_TOGGLE			= 16'hEA63;
parameter VBLANK_CTRL_1				= 16'hEB55;
parameter VBLANK_CTRL_2				= 16'hEC55;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input			[ 5: 0]	rom_address;

// Bidirectionals

// Outputs
output		[26: 0]	rom_data;

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
assign rom_data = {data[23:16], 1'b0, 
						data[15: 8], 1'b0, 
						data[ 7: 0], 1'b0};

// Internal Assignments
always @(*)
begin
	case (rom_address)
	//	Video Config Data
	10		:	data	<=	{8'h40, INPUT_CTRL};
	11		:	data	<=	{8'h40, VIDEO_SELECTION};
	12		:	data	<=	{8'h40, OUTPUT_CTRL};
	13		:	data	<=	{8'h40, EXT_OUTPUT_CTRL};
	14		:	data	<=	{8'h40, AUTODETECT};
	15		:	data	<=	{8'h40, BRIGHTNESS};
	16		:	data	<=	{8'h40, HUE};
	17		:	data	<=	{8'h40, DEFAULT_VALUE_Y};
	18		:	data	<=	{8'h40, DEFAULT_VALUE_C};
	19		:	data	<=	{8'h40, POWER_MGMT};
	20		:	data	<=	{8'h40, ANALOG_CLAMP_CTRL};
	21		:	data	<=	{8'h40, DIGITAL_CLAMP_CTRL};
	22		:	data	<=	{8'h40, SHAPING_FILTER_CTRL_1};
	23		:	data	<=	{8'h40, SHAPING_FILTER_CTRL_2};
	24		:	data	<=	{8'h40, COMB_FILTER_CTRL_2};
	25		:	data	<=	{8'h40, PIXEL_DELAY_CTRL};
	26		:	data	<=	{8'h40, MISC_GAIN_CTRL};
	27		:	data	<=	{8'h40, AGC_MODE_CTRL};
	28		:	data	<=	{8'h40, CHROMA_GAIN_CTRL_1};
	29		:	data	<=	{8'h40, CHROMA_GAIN_CTRL_2};
	30		:	data	<=	{8'h40, LUMA_GAIN_CTRL_1};
	31		:	data	<=	{8'h40, LUMA_GAIN_CTRL_2};
	32		:	data	<=	{8'h40, VSYNC_FIELD_CTRL_1};
	33		:	data	<=	{8'h40, VSYNC_FIELD_CTRL_2};
	34		:	data	<=	{8'h40, VSYNC_FIELD_CTRL_3};
	35		:	data	<=	{8'h40, HSYNC_FIELD_CTRL_1};
	36		:	data	<=	{8'h40, HSYNC_FIELD_CTRL_2};
	37		:	data	<=	{8'h40, HSYNC_FIELD_CTRL_3};
	38		:	data	<=	{8'h40, POLARITY};
	39		:	data	<=	{8'h40, NTSC_COMB_CTRL};
	40		:	data	<=	{8'h40, PAL_COMB_CTRL};
	41		:	data	<=	{8'h40, ADC_CTRL};
	42		:	data	<=	{8'h40, MANUAL_WINDOW_CTRL};
	43		:	data	<=	{8'h40, RESAMPLE_CONTROL};
	44		:	data	<=	{8'h40, CRC};
	45		:	data	<=	{8'h40, ADC_SWITCH_1};
	46		:	data	<=	{8'h40, ADC_SWITCH_2};
	47		:	data	<=	{8'h40, LETTERBOX_CTRL_1};
	48		:	data	<=	{8'h40, LETTERBOX_CTRL_2};
	49		:	data	<=	{8'h40, NTSC_V_BIT_BEGIN};
	50		:	data	<=	{8'h40, NTSC_V_BIT_END};
	51		:	data	<=	{8'h40, NTSC_F_BIT_TOGGLE};
	52		:	data	<=	{8'h40, PAL_V_BIT_BEGIN};
	53		:	data	<=	{8'h40, PAL_V_BIT_END};
	54		:	data	<=	{8'h40, PAL_F_BIT_TOGGLE};
	55		:	data	<=	{8'h40, VBLANK_CTRL_1};
	56		:	data	<=	{8'h40, VBLANK_CTRL_2};
	default	:	data	<=	{8'h00, 16'h0000};
	endcase
end

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

