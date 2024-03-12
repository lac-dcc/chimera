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


/******************************************************************************
 * License Agreement                                                          *
 *                                                                            *
 * Copyright (c) 1991-2014 Altera Corporation, San Jose, California, USA.     *
 * All rights reserved.                                                       *
 *                                                                            *
 * Any megafunction design, and related net list (encrypted or decrypted),    *
 *  support information, device programming or simulation file, and any other *
 *  associated documentation or information provided by Altera or a partner   *
 *  under Altera's Megafunction Partnership Program may be used only to       *
 *  program PLD devices (but not masked PLD devices) from Altera.  Any other  *
 *  use of such megafunction design, net list, support information, device    *
 *  programming or simulation file, or any other related documentation or     *
 *  information is prohibited for any other purpose, including, but not       *
 *  limited to modification, reverse engineering, de-compiling, or use with   *
 *  any other silicon devices, unless such use is explicitly licensed under   *
 *  a separate agreement with Altera or a megafunction partner.  Title to     *
 *  the intellectual property, including patents, copyrights, trademarks,     *
 *  trade secrets, or maskworks, embodied in any such megafunction design,    *
 *  net list, support information, device programming or simulation file, or  *
 *  any other related documentation or information provided by Altera or a    *
 *  megafunction partner, remains with Altera, the megafunction partner, or   *
 *  their respective licensors.  No other licenses, including any licenses    *
 *  needed under any third party's intellectual property, are provided herein.*
 *  Copying or modifying any file, or portion thereof, to which this notice   *
 *  is attached violates this copyright.                                      *
 *                                                                            *
 * THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    *
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *
 * FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  *
 * IN THIS FILE.                                                              *
 *                                                                            *
 * This agreement shall be governed in all respects by the laws of the State  *
 *  of California and by the laws of the United States of America.            *
 *                                                                            *
 ******************************************************************************/

/******************************************************************************
 *                                                                            *
 * This module is an adapter for the UP Video DMA Controller. It translates   *
 * the address of the front and back buffers by a fixed offset. This is       *
 * required when the addresses to memory differ for the DMA and the           *
 * processor, as in the case of the ARM processor.                            *
 *                                                                            *
 ******************************************************************************/

module altera_up_avalon_video_dma_ctrl_addr_trans (
	// Inputs
	clk,
	reset,

	slave_address,
	slave_byteenable,
	slave_read,
	slave_write,
	slave_writedata,

	master_readdata,
	master_waitrequest,

	// Bi-Directional

	// Outputs
	slave_readdata,
	slave_waitrequest,

	master_address,
	master_byteenable,
	master_read,
	master_write,
	master_writedata
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

// Parameters
parameter ADDRESS_TRANSLATION_MASK	= 32'hC0000000;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input					clk;
input					reset;

input			[ 1: 0]	slave_address;
input			[ 3: 0]	slave_byteenable;
input					slave_read;
input					slave_write;
input			[31: 0]	slave_writedata;

input			[31: 0]	master_readdata;
input					master_waitrequest;

// Bi-Directional

// Outputs
output			[31: 0]	slave_readdata;
output					slave_waitrequest;

output			[ 1: 0]	master_address;
output			[ 3: 0]	master_byteenable;
output					master_read;
output					master_write;
output			[31: 0]	master_writedata;

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

// Output Registers

// Internal Registers

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign slave_readdata		= (slave_address[1] == 1'b0) ? 
								master_readdata | ADDRESS_TRANSLATION_MASK :
								master_readdata;
assign slave_waitrequest	= master_waitrequest;

assign master_address		= slave_address;
assign master_byteenable	= slave_byteenable;
assign master_read			= slave_read;
assign master_write			= slave_write;
assign master_writedata		= (slave_address[1] == 1'b0) ?
								slave_writedata & ~ADDRESS_TRANSLATION_MASK :
								slave_writedata;


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

