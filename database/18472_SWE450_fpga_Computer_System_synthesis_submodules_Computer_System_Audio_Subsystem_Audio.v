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
 * This module reads and writes data to the Audio chip on Altera's DE2        *
 *  Development and Education Board. The audio chip must be in master mode    *
 *  and the digital format must be left justified.                            *
 *                                                                            *
 ******************************************************************************/

module Computer_System_Audio_Subsystem_Audio (
	// Inputs
	clk,
	reset,
	
	address,
	chipselect,
	read,
	write,
	writedata,
	
	AUD_ADCDAT,

	// Bidirectionals
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,

	// Outputs
	irq,
	readdata,

	AUD_DACDAT
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[ 1: 0]	address;
input						chipselect;
input						read;
input						write;
input			[31: 0]	writedata;

input						AUD_ADCDAT;
input						AUD_ADCLRCK;
input						AUD_BCLK;
input						AUD_DACLRCK;

// Bidirectionals

// Outputs
output reg				irq;
output reg	[31: 0]	readdata;

output					AUD_DACDAT;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

localparam DW						= 31;
localparam BIT_COUNTER_INIT	= 5'd31;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						bclk_rising_edge;
wire						bclk_falling_edge;

wire						adc_lrclk_rising_edge;
wire						adc_lrclk_falling_edge;

wire			[DW: 0]	new_left_channel_audio;
wire			[DW: 0]	new_right_channel_audio;

wire			[ 7: 0]	left_channel_read_available;
wire			[ 7: 0]	right_channel_read_available;
wire						dac_lrclk_rising_edge;
wire						dac_lrclk_falling_edge;

wire			[ 7: 0]	left_channel_write_space;
wire			[ 7: 0]	right_channel_write_space;

// Internal Registers
reg						done_adc_channel_sync;
reg						read_interrupt_en;
reg						clear_read_fifos;
reg						read_interrupt;

reg						done_dac_channel_sync;
reg						write_interrupt_en;
reg						clear_write_fifos;
reg						write_interrupt;

// State Machine Registers


/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset == 1'b1)
		irq <= 1'b0;
	else
		irq <= 
			write_interrupt |
			read_interrupt;
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		readdata <= 32'h00000000;
	else if (chipselect == 1'b1)
	begin
		if (address == 2'h0)
			readdata <= 
				{22'h000000,
				 write_interrupt,
				 read_interrupt,
				 4'h0,
				 clear_write_fifos,
				 clear_read_fifos,
				 write_interrupt_en,
				 read_interrupt_en};
		else if (address == 2'h1)
		begin
			readdata[31:24] <= left_channel_write_space;
			readdata[23:16] <= right_channel_write_space;
			readdata[15: 8] <= left_channel_read_available;
			readdata[ 7: 0] <= right_channel_read_available;
		end
		else if (address == 2'h2)
			readdata <= 32'h00000000 | 
				new_left_channel_audio;
		else
			readdata <= 32'h00000000 | 
				new_right_channel_audio;
	end
end


always @(posedge clk)
begin
	if (reset == 1'b1)
		read_interrupt_en <= 1'b0;
	else if ((chipselect == 1'b1) && (write == 1'b1) && (address == 2'h0))
		read_interrupt_en <= writedata[0];
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		clear_read_fifos <= 1'b0;
	else if ((chipselect == 1'b1) && (write == 1'b1) && (address == 2'h0))
		clear_read_fifos <= writedata[2];
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		read_interrupt <= 1'b0;
	else if (read_interrupt_en == 1'b0)
		read_interrupt <= 1'b0;
	else
		read_interrupt <=
			(&(left_channel_read_available[6:5])  | left_channel_read_available[7]) | 
			(&(right_channel_read_available[6:5]) | right_channel_read_available[7]);
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		done_adc_channel_sync <= 1'b0;
	else if (adc_lrclk_rising_edge == 1'b1)
		done_adc_channel_sync <= 1'b1;
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		write_interrupt_en <= 1'b0;
	else if ((chipselect == 1'b1) && (write == 1'b1) && (address == 2'h0))
		write_interrupt_en <= writedata[1];
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		clear_write_fifos <= 1'b0;
	else if ((chipselect == 1'b1) && (write == 1'b1) && (address == 2'h0))
		clear_write_fifos <= writedata[3];
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		write_interrupt <= 1'b0;
	else if (write_interrupt_en == 1'b0)
		write_interrupt <= 1'b0;
	else
		write_interrupt <= 
			(&(left_channel_write_space[6:5])  | left_channel_write_space[7]) | 
			(&(right_channel_write_space[6:5]) | right_channel_write_space[7]);
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		done_dac_channel_sync <= 1'b0;
	else if (dac_lrclk_falling_edge == 1'b1)
		done_dac_channel_sync <= 1'b1;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_clock_edge Bit_Clock_Edges (
	// Inputs
	.clk				(clk),
	.reset			(reset),
	
	.test_clk		(AUD_BCLK),
	
	// Bidirectionals

	// Outputs
	.rising_edge	(bclk_rising_edge),
	.falling_edge	(bclk_falling_edge)
);

altera_up_clock_edge ADC_Left_Right_Clock_Edges (
	// Inputs
	.clk				(clk),
	.reset			(reset),
	
	.test_clk		(AUD_ADCLRCK),
	
	// Bidirectionals

	// Outputs
	.rising_edge	(adc_lrclk_rising_edge),
	.falling_edge	(adc_lrclk_falling_edge)
);

altera_up_clock_edge DAC_Left_Right_Clock_Edges (
	// Inputs
	.clk				(clk),
	.reset			(reset),
	
	.test_clk		(AUD_DACLRCK),
	
	// Bidirectionals

	// Outputs
	.rising_edge	(dac_lrclk_rising_edge),
	.falling_edge	(dac_lrclk_falling_edge)
);

altera_up_audio_in_deserializer Audio_In_Deserializer (
	// Inputs
	.clk									(clk),
	.reset								(reset | clear_read_fifos),
	
	.bit_clk_rising_edge				(bclk_rising_edge),
	.bit_clk_falling_edge			(bclk_falling_edge),
	.left_right_clk_rising_edge	(adc_lrclk_rising_edge),
	.left_right_clk_falling_edge	(adc_lrclk_falling_edge),

	.done_channel_sync				(done_adc_channel_sync),

	.serial_audio_in_data			(AUD_ADCDAT),

	.read_left_audio_data_en		((address == 2'h2) & chipselect & read),
	.read_right_audio_data_en		((address == 2'h3) & chipselect & read),

	// Bidirectionals

	// Outputs
	.left_audio_fifo_read_space	(left_channel_read_available),
	.right_audio_fifo_read_space	(right_channel_read_available),

	.left_channel_data				(new_left_channel_audio),
	.right_channel_data				(new_right_channel_audio)
);
defparam
	Audio_In_Deserializer.DW 					= DW,
	Audio_In_Deserializer.BIT_COUNTER_INIT = BIT_COUNTER_INIT;

altera_up_audio_out_serializer Audio_Out_Serializer (
	// Inputs
	.clk										(clk),
	.reset									(reset | clear_write_fifos),
	
	.bit_clk_rising_edge					(bclk_rising_edge),
	.bit_clk_falling_edge				(bclk_falling_edge),
	.left_right_clk_rising_edge		(done_dac_channel_sync & dac_lrclk_rising_edge),
	.left_right_clk_falling_edge		(done_dac_channel_sync & dac_lrclk_falling_edge),
	
	.left_channel_data					(writedata[DW:0]),
	.left_channel_data_en				((address == 2'h2) & chipselect & write),

	.right_channel_data					(writedata[DW:0]),
	.right_channel_data_en				((address == 2'h3) & chipselect & write),
	
	// Bidirectionals

	// Outputs
	.left_channel_fifo_write_space	(left_channel_write_space),
	.right_channel_fifo_write_space	(right_channel_write_space),

	.serial_audio_out_data				(AUD_DACDAT)
);
defparam
	Audio_Out_Serializer.DW = DW;

endmodule

