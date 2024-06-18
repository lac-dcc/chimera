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
 * This module connects the PS2 core to Avalon.                               *
 *                                                                            *
 ******************************************************************************/

/*
 *
 * Data Register Bits
 * Read Available 31-16, Read Valid 15, Incoming Data or Outgoing Command 7-0
 *
 * Control Register Bits
 * CE 10, RI 8, RE 0
 *
 **/

module Computer_System_PS2_Port (
	// Inputs
	clk,
	reset,

	address,
	chipselect,
	byteenable,
	read,
	write,
	writedata,
	
	// Bidirectionals
	PS2_CLK,					// PS2 Clock
 	PS2_DAT,					// PS2 Data

	// Outputs
	irq,
	readdata,
	waitrequest
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

input						address;
input						chipselect;
input			[ 3: 0]	byteenable;
input						read;
input						write;
input			[31: 0]	writedata;

// Bidirectionals
inout						PS2_CLK;
inout					 	PS2_DAT;

// Outputs
output					irq;
output reg	[31: 0]	readdata;
output					waitrequest;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

// Command path parameters
localparam	CLOCK_CYCLES_FOR_101US	= 10100;
localparam	DATA_WIDTH_FOR_101US		= 14;
localparam	CLOCK_CYCLES_FOR_15MS	= 1500000;
localparam	DATA_WIDTH_FOR_15MS		= 21;
localparam	CLOCK_CYCLES_FOR_2MS		= 200000;
localparam	DATA_WIDTH_FOR_2MS		= 18;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire			[ 7: 0]	data_from_the_PS2_port;
wire						data_from_the_PS2_port_en;

wire						get_data_from_PS2_port;
wire						send_command_to_PS2_port;
wire						clear_command_error;
wire						set_interrupt_enable;

wire						command_was_sent;
wire						error_sending_command;

wire						data_fifo_is_empty;
wire						data_fifo_is_full;

wire			[ 7: 0]	data_in_fifo;
wire						data_valid;
wire			[ 8: 0]	data_available;

// Internal Registers
reg			[31: 0]	control_register;

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
		readdata <= 32'h00000000;
	else if (chipselect == 1'b1)
	begin
		if (address == 1'b0)
			readdata <= {7'h00,data_available,data_valid,7'h00,data_in_fifo};
		else
			readdata <= control_register;
	end
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		control_register <= 32'h00000000;
	else
	begin
		if (error_sending_command == 1'b1)
			control_register[10] <= 1'b1;
		else if (clear_command_error == 1'b1)
			control_register[10] <= 1'b0;
		
		control_register[8] <= ~data_fifo_is_empty & control_register[0];

		if ((chipselect == 1'b1) && (set_interrupt_enable == 1'b1))
			control_register[0]  <= writedata[0];
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign irq				= control_register[8];
assign waitrequest	= send_command_to_PS2_port & 
						~(command_was_sent | error_sending_command);

assign get_data_from_PS2_port  = chipselect & byteenable[0] & ~address & read;
assign send_command_to_PS2_port= chipselect & byteenable[0] & ~address & write;
assign clear_command_error     = chipselect & byteenable[1] & address & write;
assign set_interrupt_enable    = chipselect & byteenable[0] & address & write;

assign data_available[8]	= data_fifo_is_full;
assign data_valid				= ~data_fifo_is_empty;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_ps2 PS2_Serial_Port (
	// Inputs
	.clk										(clk),
	.reset									(reset),

	.the_command							(writedata[7:0]),
	.send_command							(send_command_to_PS2_port),

	// Bidirectionals
	.PS2_CLK									(PS2_CLK),
 	.PS2_DAT									(PS2_DAT),

	// Outputs
	.command_was_sent						(command_was_sent),
	.error_communication_timed_out	(error_sending_command),

	.received_data							(data_from_the_PS2_port),
	.received_data_en						(data_from_the_PS2_port_en)
);
defparam
	PS2_Serial_Port.CLOCK_CYCLES_FOR_101US	= CLOCK_CYCLES_FOR_101US,
	PS2_Serial_Port.DATA_WIDTH_FOR_101US	= DATA_WIDTH_FOR_101US,
	PS2_Serial_Port.CLOCK_CYCLES_FOR_15MS	= CLOCK_CYCLES_FOR_15MS,
	PS2_Serial_Port.DATA_WIDTH_FOR_15MS		= DATA_WIDTH_FOR_15MS,
	PS2_Serial_Port.CLOCK_CYCLES_FOR_2MS	= CLOCK_CYCLES_FOR_2MS,
	PS2_Serial_Port.DATA_WIDTH_FOR_2MS		= DATA_WIDTH_FOR_2MS;

scfifo	Incoming_Data_FIFO (
	// Inputs
	.clock			(clk),
	.sclr				(reset),

	.rdreq			(get_data_from_PS2_port & ~data_fifo_is_empty),
	.wrreq			(data_from_the_PS2_port_en & ~data_fifo_is_full),
	.data				(data_from_the_PS2_port),

	// Bidirectionals

	// Outputs
	.q					(data_in_fifo),

	.usedw			(data_available[7:0]),
	.empty			(data_fifo_is_empty),
	.full				(data_fifo_is_full)

	// synopsys translate_off
	,
	.almost_empty	(),
	.almost_full	(),
	.aclr				()
	// synopsys translate_on
);
defparam
	Incoming_Data_FIFO.add_ram_output_register	= "ON",
	Incoming_Data_FIFO.intended_device_family		= "Cyclone II",
	Incoming_Data_FIFO.lpm_numwords					= 256,
	Incoming_Data_FIFO.lpm_showahead					= "ON",
	Incoming_Data_FIFO.lpm_type						= "scfifo",
	Incoming_Data_FIFO.lpm_width						= 8,
	Incoming_Data_FIFO.lpm_widthu						= 8,
	Incoming_Data_FIFO.overflow_checking			= "OFF",
	Incoming_Data_FIFO.underflow_checking			= "OFF",
	Incoming_Data_FIFO.use_eab							= "ON";

endmodule

