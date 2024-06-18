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
 * This module sends and receives data to/from the DE2's audio and TV         *
 *  peripherals' control registers.                                           *
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_serial_bus_controller (
	// Inputs
	clk,
	reset,

	start_transfer,

	data_in,
	transfer_mask,

	restart_counter,
	restart_data_in,
	restart_transfer_mask,

	// Bidirectionals
	serial_data,

	// Outputs
	serial_clk,
	serial_en,

	data_out,
	transfer_complete
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter DW	= 26;	// Datawidth
parameter CW	= 4;	// Counter's datawidth

parameter SCCW	= 11;	// Slow clock's counter's datawidth

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input						clk;
input						reset;

input						start_transfer;

input			[DW: 0]	data_in;
input			[DW: 0]	transfer_mask;

input			[CW: 0]	restart_counter;
input			[DW: 0]	restart_data_in;
input			[DW: 0]	restart_transfer_mask;

// Bidirectionals
inout						serial_data;			//	I2C Data

// Outputs
output					serial_clk;				//	I2C Clock
output reg				serial_en;

output		[DW: 0]	data_out;
output reg				transfer_complete;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

// States for finite state machines
localparam	STATE_0_IDLE			= 3'h0,
				STATE_1_INITIALIZE	= 3'h1,
				STATE_2_RESTART_BIT	= 3'h2,
				STATE_3_START_BIT		= 3'h3,
				STATE_4_TRANSFER		= 3'h4,
				STATE_5_STOP_BIT		= 3'h5;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						slow_clk;

wire						toggle_data_in;
wire						toggle_data_out;

// Internal Registers
reg			[CW: 0]	counter;

reg			[DW: 0]	shiftreg_data;
reg			[DW: 0]	shiftreg_mask;

reg						new_data;

// State Machine Registers
reg			[ 2: 0]	ns_serial_protocol;
reg			[ 2: 0]	s_serial_protocol;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		s_serial_protocol <= STATE_0_IDLE;
	else
		s_serial_protocol <= ns_serial_protocol;
end

always @(*)
begin
	// Defaults
	ns_serial_protocol = STATE_0_IDLE;

   case (s_serial_protocol)
	STATE_0_IDLE:
		begin
			if (start_transfer & ~transfer_complete & toggle_data_in)
				ns_serial_protocol = STATE_1_INITIALIZE;
			else
				ns_serial_protocol = STATE_0_IDLE;
		end
	STATE_1_INITIALIZE:
		begin
			ns_serial_protocol = STATE_3_START_BIT;
		end
	STATE_2_RESTART_BIT:
		begin
			if (toggle_data_in)
				ns_serial_protocol = STATE_3_START_BIT;
			else
				ns_serial_protocol = STATE_2_RESTART_BIT;
		end
	STATE_3_START_BIT:
		begin
			if (toggle_data_out)
				ns_serial_protocol = STATE_4_TRANSFER;
			else
				ns_serial_protocol = STATE_3_START_BIT;
		end
	STATE_4_TRANSFER:
		begin
			if (toggle_data_out & (counter == DW))
				ns_serial_protocol = STATE_5_STOP_BIT;
			else if (toggle_data_out & shiftreg_mask[DW] & shiftreg_data[DW])
				ns_serial_protocol = STATE_2_RESTART_BIT;
			else
				ns_serial_protocol = STATE_4_TRANSFER;
		end
	STATE_5_STOP_BIT:
		begin
			if (toggle_data_in)
				ns_serial_protocol = STATE_0_IDLE;
			else
				ns_serial_protocol = STATE_5_STOP_BIT;
		end
	default:
		begin
			ns_serial_protocol = STATE_0_IDLE;
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
		serial_en			<= 1'b1;
	else if (toggle_data_out & (s_serial_protocol == STATE_3_START_BIT))
		serial_en			<= 1'b0;
	else if (s_serial_protocol == STATE_5_STOP_BIT)
		serial_en			<= 1'b1;
end

always @(posedge clk)
begin
	if (reset)
		transfer_complete	<= 1'b0;
	else if (s_serial_protocol == STATE_5_STOP_BIT)
		transfer_complete	<= 1'b1;
	else if (~start_transfer)
		transfer_complete	<= 1'b0;
end

// Input Registers
always @(posedge clk)
begin
	if (reset)
	begin
		counter				<= 'h0;
		shiftreg_data		<= 'h0;
		shiftreg_mask		<= 'h0;
	end

	else if (s_serial_protocol == STATE_1_INITIALIZE)
	begin
		counter				<= 'h0;
		shiftreg_data		<= data_in;
		shiftreg_mask		<= transfer_mask;
	end

	else if (toggle_data_in & (s_serial_protocol == STATE_2_RESTART_BIT))
	begin
		counter				<= restart_counter;
		shiftreg_data		<= restart_data_in;
		shiftreg_mask		<= restart_transfer_mask;
	end

	else if (toggle_data_out & (s_serial_protocol == STATE_4_TRANSFER))
	begin
		counter				<= counter + 'h1;
		shiftreg_data		<= {shiftreg_data[(DW - 1):0], new_data};
		shiftreg_mask		<= {shiftreg_mask[(DW - 1):0], 1'b0};
	end
end

always @(posedge clk)
begin
	if (reset)
		new_data				<= 1'b0;
	else if (toggle_data_in & (s_serial_protocol == STATE_4_TRANSFER))
		new_data				<= serial_data;
end


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign serial_clk		= (s_serial_protocol == STATE_0_IDLE) ? 1'b1 : slow_clk;
assign serial_data	= (s_serial_protocol == STATE_0_IDLE) ? 1'b1 :
								(s_serial_protocol == STATE_2_RESTART_BIT) ? 1'b1 :
								(s_serial_protocol == STATE_4_TRANSFER) ? 
								((shiftreg_mask[DW]) ? 1'bz : 
									shiftreg_data[DW]) : 
								1'b0;

assign data_out		= shiftreg_data;

// Input Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_slow_clock_generator Serial_Config_Clock_Generator (
	// Inputs
	.clk							(clk),
	.reset						(reset),

	.enable_clk					(1'b1),
	
	// Bidirectionals

	// Outputs
	.new_clk						(slow_clk),

	.rising_edge				(),
	.falling_edge				(),

	.middle_of_high_level	(toggle_data_in),
	.middle_of_low_level		(toggle_data_out)
);
defparam
	Serial_Config_Clock_Generator.CB				= SCCW;


endmodule

