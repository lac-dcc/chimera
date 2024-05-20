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
 * This module is a rom for auto initializing the on board periphal devices   *
 *  on the DE2i-150 board.                                                     *
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init_ob_de2i_150 (
	// Inputs
	rom_address,

	// Bidirectionals

	// Outputs
	rom_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter AUD_LINE_IN_LC	= 9'h01A;
parameter AUD_LINE_IN_RC	= 9'h01A;
parameter AUD_LINE_OUT_LC	= 9'h07B;
parameter AUD_LINE_OUT_RC	= 9'h07B;
parameter AUD_ADC_PATH		= 9'h0F8;
parameter AUD_DAC_PATH		= 9'h006;
parameter AUD_POWER			= 9'h000;
parameter AUD_DATA_FORMAT	= 9'h001;
parameter AUD_SAMPLE_CTRL	= 9'h002;
parameter AUD_SET_ACTIVE	= 9'h001;

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
wire			[26: 0]	audio_rom_data;
wire			[26: 0]	video_rom_data;

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
assign rom_data = audio_rom_data | video_rom_data;

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_av_config_auto_init_ob_audio Auto_Init_Audio_ROM (
	// Inputs
	.rom_address			(rom_address),

	// Bidirectionals

	// Outputs
	.rom_data				(audio_rom_data)
);
defparam
	Auto_Init_Audio_ROM.AUD_LINE_IN_LC	= AUD_LINE_IN_LC,
	Auto_Init_Audio_ROM.AUD_LINE_IN_RC	= AUD_LINE_IN_RC,
	Auto_Init_Audio_ROM.AUD_LINE_OUT_LC	= AUD_LINE_OUT_LC,
	Auto_Init_Audio_ROM.AUD_LINE_OUT_RC	= AUD_LINE_OUT_RC,
	Auto_Init_Audio_ROM.AUD_ADC_PATH		= AUD_ADC_PATH,
	Auto_Init_Audio_ROM.AUD_DAC_PATH		= AUD_DAC_PATH,
	Auto_Init_Audio_ROM.AUD_POWER			= AUD_POWER,
	Auto_Init_Audio_ROM.AUD_DATA_FORMAT	= AUD_DATA_FORMAT,
	Auto_Init_Audio_ROM.AUD_SAMPLE_CTRL	= AUD_SAMPLE_CTRL,
	Auto_Init_Audio_ROM.AUD_SET_ACTIVE	= AUD_SET_ACTIVE;

altera_up_av_config_auto_init_ob_adv7180 Auto_Init_Video_ROM (
	// Inputs
	.rom_address			(rom_address),

	// Bidirectionals

	// Outputs
	.rom_data				(video_rom_data)
);

endmodule

