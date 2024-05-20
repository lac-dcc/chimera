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
 * This module is a rom for auto initializing the TRDB D5M digital camera.    *
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init_d5m (
	// Inputs
	rom_address,

	exposure,

	// Bidirectionals

	// Outputs
	rom_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter D5M_COLUMN_SIZE	= 16'd2591;
parameter D5M_ROW_SIZE		= 16'd1943;
parameter D5M_COLUMN_BIN	= 16'h0000;
parameter D5M_ROW_BIN		= 16'h0000;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input			[ 4: 0]	rom_address;

input			[15: 0]	exposure;

// Bidirectionals

// Outputs
output		[35: 0]	rom_data;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

// States

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
reg			[31: 0]	data;

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
assign rom_data = {data[31:24], 1'b0, 
						data[23:16], 1'b0, 
						data[15: 8], 1'b0, 
						data[ 7: 0], 1'b0};

// Internal Assignments
always @(*)
begin
	case (rom_address)
	0		:	data	<= {8'hBA, 8'h00, 16'h0000};
	1		:	data	<= {8'hBA, 8'h20, 16'hc000}; // Mirror Row and Columns
	2		:	data	<= {8'hBA, 8'h09, exposure}; // Exposure
	3		:	data	<= {8'hBA, 8'h05, 16'h0000}; // H_Blanking
	4		:	data	<= {8'hBA, 8'h06, 16'h0019}; // V_Blanking	
	5		:	data	<= {8'hBA, 8'h0A, 16'h8000}; // change latch
	6		:	data	<= {8'hBA, 8'h2B, 16'h000b}; // Green 1 Gain
	7		:	data	<= {8'hBA, 8'h2C, 16'h000f}; // Blue Gain
	8		:	data	<= {8'hBA, 8'h2D, 16'h000f}; // Red Gain
	9		:	data	<= {8'hBA, 8'h2E, 16'h000b}; // Green 2 Gain
	10		:	data	<= {8'hBA, 8'h10, 16'h0051}; // set up PLL power on
	11		:	data	<= {8'hBA, 8'h11, 16'h1807}; // PLL_m_Factor<<8+PLL_n_Divider
	12		:	data	<= {8'hBA, 8'h12, 16'h0002}; // PLL_p1_Divider
	13		:	data	<= {8'hBA, 8'h10, 16'h0053}; // set USE PLL	 
	14		:	data	<= {8'hBA, 8'h98, 16'h0000}; // disble calibration 	
`ifdef ENABLE_TEST_PATTERN
	15		:	data	<= {8'hBA, 8'hA0, 16'h0001}; // Test pattern control 	
	16		:	data	<= {8'hBA, 8'hA1, 16'h0123}; // Test green pattern value
	17		:	data	<= {8'hBA, 8'hA2, 16'h0456}; // Test red pattern value
`else
	15		:	data	<= {8'hBA, 8'hA0, 16'h0000}; // Test pattern control 
	16		:	data	<= {8'hBA, 8'hA1, 16'h0000}; // Test green pattern value
	17		:	data	<= {8'hBA, 8'hA2, 16'h0FFF}; // Test red pattern value
`endif
	18		:	data	<= {8'hBA, 8'h01, 16'h0036}; // set start row	
	19		:	data	<= {8'hBA, 8'h02, 16'h0010}; // set start column 	
	20		:	data	<= {8'hBA, 8'h03, D5M_ROW_SIZE}; // set row size	
	21		:	data	<= {8'hBA, 8'h04, D5M_COLUMN_SIZE}; // set column size
	22		:	data	<= {8'hBA, 8'h22, D5M_ROW_BIN}; // set row mode in bin mode
	23		:	data	<= {8'hBA, 8'h23, D5M_COLUMN_BIN}; // set column mode in bin mode
	24		:	data	<= {8'hBA, 8'h49, 16'h01A8}; // row black target		
	default	:	data	<= {8'h00, 8'h00, 16'h0000};
	endcase
end

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

