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
 * This module store and retrieves video frames to and from memory.           *
 *                                                                            *
 ******************************************************************************/

`undef USE_TO_MEMORY
`define USE_32BIT_MASTER

module Computer_System_Video_In_Subsystem_Video_In_DMA (
	// Inputs
	clk,
	reset,

	stream_data,
	stream_startofpacket,
	stream_endofpacket,
	stream_empty,
	stream_valid,

	master_waitrequest,
	
	slave_address,
	slave_byteenable,
	slave_read,
	slave_write,
	slave_writedata,

	// Bidirectional

	// Outputs
	stream_ready,

	master_address,
	master_write,
	master_writedata,

	slave_readdata
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW								= 15; // Frame's datawidth
parameter EW								= 0; // Frame's empty width
parameter WIDTH							= 320; // Frame's width in pixels
parameter HEIGHT							= 240; // Frame's height in lines

parameter AW								= 16; // Frame's address width
parameter WW								= 8; // Frame width's address width
parameter HW								= 7; // Frame height's address width

parameter MDW								= 15; // Avalon master's datawidth

parameter DEFAULT_BUFFER_ADDRESS		= 32'd134217728;
parameter DEFAULT_BACK_BUF_ADDRESS	= 32'd134217728;

parameter ADDRESSING_BITS				= 16'd2057;
parameter COLOR_BITS						= 4'd15;
parameter COLOR_PLANES					= 2'd0;

parameter DEFAULT_DMA_ENABLED			= 1'b0; // 0: OFF or 1: ON

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input			[DW: 0]	stream_data;
input						stream_startofpacket;
input						stream_endofpacket;
input			[EW: 0]	stream_empty;
input						stream_valid;

input						master_waitrequest;
	
input			[ 1: 0]	slave_address;
input			[ 3: 0]	slave_byteenable;
input						slave_read;
input						slave_write;
input			[31: 0]	slave_writedata;

// Bidirectional

// Outputs
output					stream_ready;

output		[31: 0]	master_address;
output					master_write;
output		[MDW:0]	master_writedata;

output		[31: 0]	slave_readdata;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						inc_address;
wire						reset_address;

wire			[31: 0]	buffer_start_address;
wire						dma_enabled;

// Internal Registers
reg			[WW: 0]	w_address;		// Frame's width address
reg			[HW: 0]	h_address;		// Frame's height address

// State Machine Registers

// Integers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers

// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		w_address 	<= 'h0;
		h_address 	<= 'h0;
	end
	else if (reset_address)
	begin
		w_address 	<= 'h0;
		h_address 	<= 'h0;
	end
	else if (inc_address)
	begin
		if (w_address == (WIDTH - 1))
		begin
			w_address 	<= 'h0;
			h_address	<= h_address + 1;
		end
		else
			w_address 	<= w_address + 1;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign master_address		= buffer_start_address +
								{h_address, w_address, 1'b0};

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_video_dma_control_slave DMA_Control_Slave (
	// Inputs
	.clk									(clk),
	.reset								(reset),

	.address								(slave_address),
	.byteenable							(slave_byteenable),
	.read									(slave_read),
	.write								(slave_write),
	.writedata							(slave_writedata),

	.swap_addresses_enable			(reset_address),

	// Bi-Directional

	// Outputs
	.readdata							(slave_readdata),

	.current_start_address			(buffer_start_address),
	.dma_enabled						(dma_enabled)
);
defparam
	DMA_Control_Slave.DEFAULT_BUFFER_ADDRESS		= DEFAULT_BUFFER_ADDRESS,
	DMA_Control_Slave.DEFAULT_BACK_BUF_ADDRESS	= DEFAULT_BACK_BUF_ADDRESS,

	DMA_Control_Slave.WIDTH								= WIDTH,
	DMA_Control_Slave.HEIGHT							= HEIGHT,

	DMA_Control_Slave.ADDRESSING_BITS				= ADDRESSING_BITS,
	DMA_Control_Slave.COLOR_BITS						= COLOR_BITS,
	DMA_Control_Slave.COLOR_PLANES					= COLOR_PLANES,
	DMA_Control_Slave.ADDRESSING_MODE				= 1'b0,

	DMA_Control_Slave.DEFAULT_DMA_ENABLED			= DEFAULT_DMA_ENABLED;

altera_up_video_dma_to_memory From_Stream_to_Memory (
	// Inputs
	.clk									(clk),
	.reset								(reset | ~dma_enabled),

	.stream_data						(stream_data),
	.stream_startofpacket			(stream_startofpacket),
	.stream_endofpacket				(stream_endofpacket),
	.stream_empty						(stream_empty),
	.stream_valid						(stream_valid),

	.master_waitrequest				(master_waitrequest),
	
	// Bidirectional

	// Outputs
	.stream_ready						(stream_ready),

	.master_write						(master_write),
	.master_writedata					(master_writedata),

	.inc_address						(inc_address),
	.reset_address						(reset_address)
);
defparam
	From_Stream_to_Memory.DW	= DW,
	From_Stream_to_Memory.EW	= EW,
	From_Stream_to_Memory.MDW	= MDW;

endmodule

