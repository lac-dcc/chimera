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

module altera_up_video_dma_control_slave (
	// Inputs
	clk,
	reset,

	address,
	byteenable,
	read,
	write,
	writedata,

	swap_addresses_enable,

	// Bi-Directional

	// Outputs
	readdata,

	current_start_address,
	dma_enabled
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

// Parameters
parameter DEFAULT_BUFFER_ADDRESS		= 32'h00000000;
parameter DEFAULT_BACK_BUF_ADDRESS	= 32'h00000000;

parameter WIDTH							= 640; // Frame's width in pixels
parameter HEIGHT							= 480; // Frame's height in lines

parameter ADDRESSING_BITS				= 16'h0809;
parameter COLOR_BITS						= 4'h7; // Bits per color plane minus 1 
parameter COLOR_PLANES					= 2'h2; // Color planes per pixel minus 1
parameter ADDRESSING_MODE				= 1'b1; // 0: X-Y or 1: Consecutive

parameter DEFAULT_DMA_ENABLED			= 1'b1; // 0: OFF or 1: ON

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[ 1: 0]	address;
input			[ 3: 0]	byteenable;
input						read;
input						write;
input			[31: 0]	writedata;

input						swap_addresses_enable;

// Bi-Directional

// Outputs
output reg	[31: 0]	readdata;

output		[31: 0]	current_start_address;
output reg				dma_enabled;


/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires

// Internal Registers
reg			[31: 0]	buffer_start_address;
reg			[31: 0]	back_buf_start_address;

reg						buffer_swap;

// State Machine Registers

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
		readdata <= 32'h00000000;
   
	else if (read & (address == 2'h0))
		readdata <= buffer_start_address;
   
	else if (read & (address == 2'h1))
		readdata <= back_buf_start_address;
   
	else if (read & (address == 2'h2))
	begin
		readdata[31:16] <= HEIGHT;
		readdata[15: 0] <= WIDTH;
	end
   
	else if (read)
	begin
		readdata[31:16] <= ADDRESSING_BITS;
		readdata[15:12] <= 4'h0;
		readdata[11: 8] <= COLOR_BITS;
		readdata[ 7: 6] <= COLOR_PLANES;
		readdata[ 5: 3] <= 3'h0;
		readdata[    2] <= dma_enabled;
		readdata[    1] <= ADDRESSING_MODE;
		readdata[    0] <= buffer_swap;
	end
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		buffer_start_address	<= DEFAULT_BUFFER_ADDRESS;
		back_buf_start_address	<= DEFAULT_BACK_BUF_ADDRESS;
	end
	else if (write & (address == 2'h1))
	begin
		if (byteenable[0])
			back_buf_start_address[ 7: 0] <= writedata[ 7: 0];
		if (byteenable[1])
			back_buf_start_address[15: 8] <= writedata[15: 8];
		if (byteenable[2])
			back_buf_start_address[23:16] <= writedata[23:16];
		if (byteenable[3])
			back_buf_start_address[31:24] <= writedata[31:24];
	end
	else if (buffer_swap & swap_addresses_enable)
	begin
		buffer_start_address <= back_buf_start_address;
		back_buf_start_address <= buffer_start_address;
	end
end

always @(posedge clk)
begin
	if (reset)
		buffer_swap <= 1'b0;
	else if (write & (address == 2'h0))
		buffer_swap <= 1'b1;
	else if (swap_addresses_enable)
		buffer_swap <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		dma_enabled <= DEFAULT_DMA_ENABLED;
	else if (write & (address == 2'h3) & byteenable[0])
		dma_enabled <= writedata[2];
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign current_start_address	= buffer_start_address;

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

