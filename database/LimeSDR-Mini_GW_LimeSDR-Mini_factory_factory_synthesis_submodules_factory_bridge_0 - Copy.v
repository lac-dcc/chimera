// (C) 2001-2017 Intel Corporation. All rights reserved.
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
 * This module connects the an External Bus to Avalon Switch Fabric           *
 *  It acts as both a master for the avalon swtich fabric                     *
 *  and a slave to the master peripheral                                      *
 *                                                                            *
 ******************************************************************************/

module factory_bridge_0 (
	// Inputs
	clk,
	reset,

	// Inputs from Avalon Switch Fabric
	avalon_readdata,
	avalon_waitrequest,

	// Inputs from the master peripheral
	address,
	byte_enable,
	read,
	write,
	write_data,

	// Bidirectionals

	// Outputs
	// Output to Avalon Switch Fabric
	avalon_address,
	avalon_byteenable,
	avalon_read,
	avalon_write,
	avalon_writedata,

	// Outputs to master peripheral
	acknowledge,
	read_data
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter	AW	= 20;	// Address width
parameter	DW	= 31;	// Data width

parameter	BW	= 3;	// Byte enable width

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input						avalon_waitrequest;
input			[DW: 0]	avalon_readdata;

input			[AW: 0]	address;
input			[BW: 0]	byte_enable;
input						write;
input						read;
input			[DW: 0]	write_data;

// Bidirectionals

// Outputs
output		[AW: 0]	avalon_address;
output		[BW: 0]	avalon_byteenable;
output					avalon_read;
output					avalon_write;
output		[DW: 0]	avalon_writedata;

output					acknowledge;
output		[DW: 0]	read_data;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
assign read_data 				= avalon_readdata;
assign avalon_address 		= address;
assign avalon_byteenable	= byte_enable;
assign avalon_write 			= write;
assign avalon_read 			= read;
assign avalon_writedata 	= write_data;
assign acknowledge 			= ~avalon_waitrequest & (avalon_read | avalon_write);

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

endmodule

