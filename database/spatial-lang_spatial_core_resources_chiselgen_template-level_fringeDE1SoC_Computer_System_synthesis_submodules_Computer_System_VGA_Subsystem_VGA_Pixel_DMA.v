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
 * This module constantly performs a DMA transfer from a memory device        *
 *  containing pixel data to the VGA Controller IP Core.                      *
 *                                                                            *
 ******************************************************************************/

module Computer_System_VGA_Subsystem_VGA_Pixel_DMA (
	// Inputs
	clk,
	reset,

	slave_address,
	slave_byteenable,
	slave_read,
	slave_write,
	slave_writedata,

	master_readdata,
	master_readdatavalid,
	master_waitrequest,

	stream_ready,

	// Bi-Directional

	// Outputs
	slave_readdata,

	master_address,
	master_arbiterlock,
	master_read,

	stream_data,
	stream_startofpacket,
	stream_endofpacket,
	stream_empty,
	stream_valid
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

// Parameters
parameter DEFAULT_BUFFER_ADDRESS		= 32'd134217728;
parameter DEFAULT_BACK_BUF_ADDRESS	= 32'd134217728;

parameter WW						= 8;  // Image width's address width
parameter HW						= 7;  // Image height's address width

parameter MW						= 15; // Avalon master's data width
parameter DW						= 15; // Image pixel width
parameter EW						= 0;  // Streaming empty signel width

parameter PIXELS					= 320; // Image width - number of pixels
parameter LINES 					= 240; // Image height - number of lines

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[ 1: 0]	slave_address;
input			[ 3: 0]	slave_byteenable;
input						slave_read;
input						slave_write;
input			[31: 0]	slave_writedata;

input			[MW: 0]	master_readdata;
input						master_readdatavalid;
input						master_waitrequest;

input						stream_ready;

// Bi-Directional

// Outputs
output reg	[31: 0]	slave_readdata;

output		[31: 0]	master_address;
output					master_arbiterlock;
output					master_read;

output		[DW: 0]	stream_data;
output					stream_startofpacket;
output					stream_endofpacket;
output		[EW: 0]	stream_empty;
output					stream_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/
// states
localparam	STATE_0_IDLE							= 2'h0,
				STATE_1_WAIT_FOR_LAST_PIXEL		= 2'h1,
				STATE_2_READ_BUFFER					= 2'h2,
				STATE_3_MAX_PENDING_READS_STALL	= 2'h3;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
//wire		[ 9: 0]	red;
//wire		[ 9: 0]	green;
//wire		[ 9: 0]	blue;

// Data fifo signals
wire		[(DW+2):0]	fifo_data_in;
wire						fifo_read;
wire						fifo_write;

wire		[(DW+2):0]	fifo_data_out;
wire						fifo_empty;
wire						fifo_full;
wire						fifo_almost_empty;
wire						fifo_almost_full;

// Internal Registers
reg			[31: 0]	buffer_start_address;
reg			[31: 0]	back_buf_start_address;

reg						buffer_swap;

reg			[ 3: 0]	pending_reads;
reg						reading_first_pixel_in_image;

reg			[WW: 0]	pixel_address;
reg			[HW: 0]	line_address;

// State Machine Registers
reg			[ 1: 0]	s_pixel_buffer;
reg			[ 1: 0]	ns_pixel_buffer;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		s_pixel_buffer <= STATE_0_IDLE;
	else
		s_pixel_buffer <= ns_pixel_buffer;
end

always @(*)
begin
   case (s_pixel_buffer)
	STATE_0_IDLE:
		begin
			if (fifo_almost_empty)
				ns_pixel_buffer = STATE_2_READ_BUFFER;
			else
				ns_pixel_buffer = STATE_0_IDLE;
		end
	STATE_1_WAIT_FOR_LAST_PIXEL:
		begin
			if (pending_reads == 4'h0) 
				ns_pixel_buffer = STATE_0_IDLE;
			else
				ns_pixel_buffer = STATE_1_WAIT_FOR_LAST_PIXEL;
		end
	STATE_2_READ_BUFFER:
		begin
			if (~master_waitrequest)
			begin
				if ((pixel_address == (PIXELS - 1)) & 
					(line_address == (LINES - 1)))
					ns_pixel_buffer = STATE_1_WAIT_FOR_LAST_PIXEL;
				else if (fifo_almost_full) 
					ns_pixel_buffer = STATE_0_IDLE;
				else if (pending_reads >= 4'hC) 
					ns_pixel_buffer = STATE_3_MAX_PENDING_READS_STALL;
				else
					ns_pixel_buffer = STATE_2_READ_BUFFER;
			end
			else
				ns_pixel_buffer = STATE_2_READ_BUFFER;
		end
	STATE_3_MAX_PENDING_READS_STALL:
		begin
			if (pending_reads <= 4'h7) 
				ns_pixel_buffer = STATE_2_READ_BUFFER;
			else
				ns_pixel_buffer = STATE_3_MAX_PENDING_READS_STALL;
		end
	default:
		begin
			ns_pixel_buffer = STATE_0_IDLE;
		end
	endcase
end

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers
always @(posedge clk)
begin
	if (reset)
		slave_readdata <= 32'h00000000;
   
	else if (slave_read & (slave_address == 2'h0))
		slave_readdata <= buffer_start_address;
   
	else if (slave_read & (slave_address == 2'h1))
		slave_readdata <= back_buf_start_address;
   
	else if (slave_read & (slave_address == 2'h2))
	begin
		slave_readdata[31:16] <= LINES;
		slave_readdata[15: 0] <= PIXELS;
	end
   
	else if (slave_read)
	begin
		slave_readdata[31:24] <= HW + 8'h01;
		slave_readdata[23:16] <= WW + 8'h01;
		slave_readdata[15: 8] <= 8'h00;
		slave_readdata[ 7: 4] <= 4'h2;
		slave_readdata[ 3: 2] <= 2'h0;
		slave_readdata[    1] <= 1'b0;
		slave_readdata[    0] <= buffer_swap;
	end
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		buffer_start_address <= DEFAULT_BUFFER_ADDRESS;
		back_buf_start_address <= DEFAULT_BACK_BUF_ADDRESS;
	end
	else if (slave_write & (slave_address == 2'h1))
	begin
		if (slave_byteenable[0])
			back_buf_start_address[ 7: 0] <= slave_writedata[ 7: 0];
		if (slave_byteenable[1])
			back_buf_start_address[15: 8] <= slave_writedata[15: 8];
		if (slave_byteenable[2])
			back_buf_start_address[23:16] <= slave_writedata[23:16];
		if (slave_byteenable[3])
			back_buf_start_address[31:24] <= slave_writedata[31:24];
	end
	else if (buffer_swap & master_read & ~master_waitrequest &
			((pixel_address == (PIXELS - 1)) & 
			(line_address == (LINES - 1))))
	begin
		buffer_start_address <= back_buf_start_address;
		back_buf_start_address <= buffer_start_address;
	end
end

always @(posedge clk)
begin
	if (reset)
		buffer_swap <= 1'b0;
	else if (slave_write & (slave_address == 2'h0))
		buffer_swap <= 1'b1;
	else if ((pixel_address == 0) & (line_address == 0))
		buffer_swap <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		pending_reads <= 4'h0;
	else if (master_read & ~master_waitrequest)
	begin
		if (~master_readdatavalid)
			pending_reads <= pending_reads + 1'h1;
	end
	else if (master_readdatavalid & (pending_reads != 4'h0))
		pending_reads <= pending_reads - 1'h1;
end

always @(posedge clk)
begin
	if (reset)
		reading_first_pixel_in_image <= 1'b0;
	else if ((s_pixel_buffer == STATE_0_IDLE) &
			((pixel_address == 0) & (line_address == 0)))
		reading_first_pixel_in_image <= 1'b1;
	else if (master_readdatavalid)
		reading_first_pixel_in_image <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		pixel_address <= 'h0;
	else if (master_read & ~master_waitrequest)
	begin
		if (pixel_address == (PIXELS - 1))
			pixel_address <= 'h0;
		else
			pixel_address <= pixel_address + 1;
	end
end

always @(posedge clk)
begin
	if (reset)
		line_address <= 'h0;
	else if ((master_read & ~master_waitrequest) && 
			(pixel_address == (PIXELS - 1)))
	begin
		if (line_address == (LINES - 1))
			line_address <= 'h0;
		else
			line_address <= line_address + 1;
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign master_address		= buffer_start_address + 
								{line_address, pixel_address, 1'b0};
assign master_arbiterlock	= !((s_pixel_buffer == STATE_2_READ_BUFFER) |
		(s_pixel_buffer == STATE_3_MAX_PENDING_READS_STALL));
assign master_read			= (s_pixel_buffer == STATE_2_READ_BUFFER);

assign stream_data			= fifo_data_out[DW:0];
assign stream_startofpacket	= fifo_data_out[DW+1];
assign stream_endofpacket	= fifo_data_out[DW+2];
assign stream_empty			= 'h0;
assign stream_valid			= ~fifo_empty;

// Internal Assignments
assign fifo_data_in[DW:0]	= master_readdata[DW:0];
assign fifo_data_in[DW+1]	= reading_first_pixel_in_image;
assign fifo_data_in[DW+2]	= (s_pixel_buffer == STATE_1_WAIT_FOR_LAST_PIXEL) & 
										(pending_reads == 4'h1);
assign fifo_write				= master_readdatavalid & ~fifo_full;

assign fifo_read				= stream_ready & stream_valid;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

scfifo Image_Buffer (
	// Inputs
	.clock			(clk),
	.sclr				(reset),
   
	.data				(fifo_data_in),
	.wrreq			(fifo_write),

	.rdreq			(fifo_read),

	// Outputs
	.q					(fifo_data_out),

	.empty			(fifo_empty),
	.full				(fifo_full),
	   
	.almost_empty	(fifo_almost_empty),
	.almost_full	(fifo_almost_full)
	// synopsys translate_off
	,
	
	.aclr				(),
	.usedw			()
	// synopsys translate_on
);
defparam
	Image_Buffer.add_ram_output_register	= "OFF",
	Image_Buffer.almost_empty_value			= 32,
	Image_Buffer.almost_full_value			= 96,
	Image_Buffer.intended_device_family		= "Cyclone II",
	Image_Buffer.lpm_numwords					= 128,
	Image_Buffer.lpm_showahead					= "ON",
	Image_Buffer.lpm_type						= "scfifo",
	Image_Buffer.lpm_width						= DW + 3,
	Image_Buffer.lpm_widthu						= 7,
	Image_Buffer.overflow_checking			= "OFF",
	Image_Buffer.underflow_checking			= "OFF",
	Image_Buffer.use_eab							= "ON";

endmodule

