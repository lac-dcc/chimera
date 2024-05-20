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
 * This module sends and receives data from the audio's and TV in's           *
 *  control registers for the chips on Altera's DE2 board. Plus, it can       *
 *  send and receive data from the TRDB_DC2 and TRDB_LCM add-on modules.      *
 *                                                                            *
 ******************************************************************************/

`define USE_OB_MODE
//`define USE_OB_AUTO_INIT
//`define USE_OB_DE2_35_AUTO_INIT
//`define USE_AUTO_INIT

module Computer_System_AV_Config (
	// Inputs
	clk,
	reset,

	address,
	byteenable,
	read,
	write,
	writedata,
	
	
	// Bidirectionals
	I2C_SDAT,

	// Outputs
	readdata,
	waitrequest,
	irq,

	I2C_SCEN,
	I2C_SCLK
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
input			[ 3: 0]	byteenable;
input						read;
input						write;
input			[31: 0]	writedata;


// Bidirectionals
inout						I2C_SDAT;

// Outputs
output reg	[31: 0]	readdata;
output					waitrequest;
output					irq;

output					I2C_SCEN;
output					I2C_SCLK;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

localparam DW					= 26;	// Serial protocol's datawidth

localparam CFG_TYPE			= 8'h03;

localparam READ_MASK			= {8'h00, 1'b1, 8'hFF, 1'b0, 8'h00, 1'b1};
localparam WRITE_MASK		= {8'h00, 1'b1, 8'h00, 1'b1, 8'h00, 1'b1};

localparam RESTART_COUNTER	= 'h9;

// Auto init parameters
localparam AIRS				= 57;	// Auto Init ROM's size
localparam AIAW				= 5;	// Auto Init ROM's address width 

localparam AUD_LINE_IN_LC	= 9'h01A;
localparam AUD_LINE_IN_RC	= 9'h01A;
localparam AUD_LINE_OUT_LC	= 9'h07B;
localparam AUD_LINE_OUT_RC	= 9'h07B;
localparam AUD_ADC_PATH		= 9'd157;
localparam AUD_DAC_PATH		= 9'h006;
localparam AUD_POWER			= 9'h000;
localparam AUD_DATA_FORMAT	= 9'd77;
localparam AUD_SAMPLE_CTRL	= 9'd12;
localparam AUD_SET_ACTIVE	= 9'h001;

// Serial Bus Controller parameters
//parameter SBDW				= 26;	// Serial bus's datawidth
localparam SBCW				= 4;	// Serial bus counter's width
localparam SCCW				= 11;	// Slow clock's counter's width

// States for finite state machine
localparam	STATE_0_IDLE				= 3'h0,
				STATE_1_PRE_WRITE			= 3'h1,
				STATE_2_WRITE_TRANSFER	= 3'h2,
				STATE_3_POST_WRITE		= 3'h3,
				STATE_4_PRE_READ			= 3'h4,
				STATE_5_READ_TRANSFER	= 3'h5,
				STATE_6_POST_READ			= 3'h6;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire						internal_reset;

//  Auto init signals
wire			[AIAW:0]	rom_address;
wire			[DW: 0]	rom_data;
wire						ack;

wire			[DW: 0]	auto_init_data;
wire						auto_init_transfer_en;
wire						auto_init_complete;
wire						auto_init_error;

//  Serial controller signals
wire			[DW: 0]	transfer_mask;
wire			[DW: 0]	data_to_controller;
wire			[DW: 0]	data_to_controller_on_restart;
wire			[DW: 0]	data_from_controller;

wire						start_transfer;

wire						transfer_complete;

// Internal Registers
reg			[31: 0]	control_reg;
reg			[31: 0]	address_reg;
reg			[31: 0]	data_reg;

reg						start_external_transfer;
reg						external_read_transfer;
reg			[ 7: 0]	address_for_transfer;
reg			[ 1: 0]	device_for_transfer;

// State Machine Registers
reg			[ 2: 0]	ns_serial_transfer;
reg			[ 2: 0]	s_serial_transfer;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/

always @(posedge clk)
begin
	if (internal_reset)
		s_serial_transfer <= STATE_0_IDLE;
	else
		s_serial_transfer <= ns_serial_transfer;
end

always @(*)
begin
	// Defaults
	ns_serial_transfer = STATE_0_IDLE;

   case (s_serial_transfer)
	STATE_0_IDLE:
		begin
			if (transfer_complete | ~auto_init_complete)
				ns_serial_transfer = STATE_0_IDLE;
			else if (write & (address == 2'h3))
				ns_serial_transfer = STATE_1_PRE_WRITE;
			else if (read & (address == 2'h3))
			begin
				if (control_reg[17:16] == 2'h0)
					ns_serial_transfer = STATE_6_POST_READ;
				else
					ns_serial_transfer = STATE_4_PRE_READ;
			end
			else
				ns_serial_transfer = STATE_0_IDLE;
		end
	STATE_1_PRE_WRITE:
		begin
			ns_serial_transfer = STATE_2_WRITE_TRANSFER;
		end
	STATE_2_WRITE_TRANSFER:
		begin
			if (transfer_complete)
				ns_serial_transfer = STATE_3_POST_WRITE;
			else
				ns_serial_transfer = STATE_2_WRITE_TRANSFER;
		end
	STATE_3_POST_WRITE:
		begin
			ns_serial_transfer = STATE_0_IDLE;
		end
	STATE_4_PRE_READ:
		begin
			ns_serial_transfer = STATE_5_READ_TRANSFER;
		end
	STATE_5_READ_TRANSFER:
		begin
			if (transfer_complete)
				ns_serial_transfer = STATE_6_POST_READ;
			else
				ns_serial_transfer = STATE_5_READ_TRANSFER;
		end
	STATE_6_POST_READ:
		begin
			ns_serial_transfer = STATE_0_IDLE;
		end
	default:
		begin
			ns_serial_transfer = STATE_0_IDLE;
		end
	endcase
end

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output regsiters
always @(posedge clk)
begin
	if (internal_reset)
		readdata		<= 32'h00000000;
	else if (read)
	begin
		if (address == 2'h0)
			readdata	<= control_reg;
		else if (address == 2'h1)
		begin
			readdata	<= {8'h00, CFG_TYPE, 7'h00,
							auto_init_complete & ~auto_init_error, 6'h00,
							~start_external_transfer & auto_init_complete, 
							ack};
		end
		else if (address == 2'h2)
			readdata	<= address_reg;
		else if (control_reg[17:16] == 2'h0)
			readdata	<= {23'h000000, 
							data_from_controller[10], 
							data_from_controller[ 8: 1]};
		else
			readdata	<= {24'h000000, data_from_controller[ 8: 1]};
	end
end

// Internal regsiters
always @(posedge clk)
begin
	if (internal_reset)
	begin
		control_reg					<= 32'h00000000;
		address_reg					<= 32'h00000000;
		data_reg						<= 32'h00000000;
	end
	
	else if (write & ~waitrequest)
	begin
		// Write to control register
		if ((address == 2'h0) & byteenable[0])
			control_reg[ 2: 1]	<= writedata[ 2: 1];
		if ((address == 2'h0) & byteenable[2])
			control_reg[17:16]	<= writedata[17:16];

		// Write to address register
		if ((address == 2'h2) & byteenable[0])
			address_reg[ 7: 0]	<= writedata[ 7: 0];

		// Write to data register
		if ((address == 2'h3) & byteenable[0])
			data_reg[ 7: 0]		<= writedata[ 7: 0];
		if ((address == 2'h3) & byteenable[1])
			data_reg[15: 8]		<= writedata[15: 8];
		if ((address == 2'h3) & byteenable[2])
			data_reg[23:16]		<= writedata[23:16];
		if ((address == 2'h3) & byteenable[3])
			data_reg[31:24]		<= writedata[31:24];
	end
end

always @(posedge clk)
begin
	if (internal_reset)
	begin
		start_external_transfer <= 1'b0;
		external_read_transfer	<= 1'b0;
		address_for_transfer		<= 8'h00;
		device_for_transfer		<= 2'h0;
	end
	else if (transfer_complete)
	begin
		start_external_transfer <= 1'b0;
		external_read_transfer	<= 1'b0;
		address_for_transfer		<= 8'h00;
	end
	else if (s_serial_transfer == STATE_1_PRE_WRITE)
	begin
		start_external_transfer <= 1'b1;
		external_read_transfer	<= 1'b0;
		address_for_transfer		<= address_reg[7:0];
		device_for_transfer		<= control_reg[17:16];
	end
	else if (s_serial_transfer == STATE_4_PRE_READ)
	begin
		start_external_transfer <= 1'b1;
		external_read_transfer	<= 1'b1;
		address_for_transfer		<= address_reg[7:0];
		device_for_transfer		<= control_reg[17:16];
	end
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign waitrequest	=
	((address == 2'h3) & write & (s_serial_transfer != STATE_1_PRE_WRITE)) |
	((address == 2'h3) & read  & (s_serial_transfer != STATE_6_POST_READ));
assign irq				= control_reg[1] & ~start_external_transfer & auto_init_complete;

// Internal Assignments
assign internal_reset = reset | 
		((address == 2'h0) & write & byteenable[0] & writedata[0]);


//  Signals to the serial controller
assign transfer_mask = WRITE_MASK;

assign data_to_controller = 
		(~auto_init_complete) ?
			auto_init_data :
			(device_for_transfer == 2'h0) ?
				{8'h34, 1'b0, 
				 address_for_transfer[6:0], data_reg[8], 1'b0, 
				 data_reg[7:0], 1'b0} :
				(device_for_transfer == 2'h1) ?
					{8'h40, 1'b0, 
					 address_for_transfer[7:0], external_read_transfer, 
					 data_reg[7:0], 1'b0} :
					{8'h42, 1'b0, 
					 address_for_transfer[7:0], external_read_transfer, 
					 data_reg[7:0], 1'b0};

assign data_to_controller_on_restart = 
			(device_for_transfer == 2'h1) ?
				{8'h41, 1'b0, 8'h00, 1'b0, 8'h00, ack} :
				{8'h43, 1'b0, 8'h00, 1'b0, 8'h00, ack};
//				{8'h43, 1'b0, {2{8'h00, 1'b0}}};
			

assign start_transfer = (auto_init_complete) ? 
							start_external_transfer : 
							auto_init_transfer_en;

//  Signals from the serial controller
assign ack =	data_from_controller[18] | 
					data_from_controller[ 9] |
					data_from_controller[ 0];

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_av_config_auto_init AV_Config_Auto_Init (
	// Inputs
	.clk						(clk),
	.reset					(internal_reset),

	.clear_error			(1'b0),

	.ack						(ack),
	.transfer_complete	(transfer_complete),

	.rom_data				(rom_data),

	// Bidirectionals

	// Outputs
	.data_out				(auto_init_data),
	.transfer_data			(auto_init_transfer_en),

	.rom_address			(rom_address),
	
	.auto_init_complete	(auto_init_complete),
	.auto_init_error		(auto_init_error)
);
defparam	
	AV_Config_Auto_Init.ROM_SIZE	= AIRS,
	AV_Config_Auto_Init.AW			= AIAW,
	AV_Config_Auto_Init.DW			= DW;

altera_up_av_config_auto_init_ob_de10_standard Auto_Init_OB_Devices_ROM (
	// Inputs
	.rom_address			(rom_address),


	// Bidirectionals

	// Outputs
	.rom_data				(rom_data)
);
defparam
	Auto_Init_OB_Devices_ROM.AUD_LINE_IN_LC		= AUD_LINE_IN_LC,
	Auto_Init_OB_Devices_ROM.AUD_LINE_IN_RC		= AUD_LINE_IN_RC,
	Auto_Init_OB_Devices_ROM.AUD_LINE_OUT_LC		= AUD_LINE_OUT_LC,
	Auto_Init_OB_Devices_ROM.AUD_LINE_OUT_RC		= AUD_LINE_OUT_RC,
	Auto_Init_OB_Devices_ROM.AUD_ADC_PATH			= AUD_ADC_PATH,
	Auto_Init_OB_Devices_ROM.AUD_DAC_PATH			= AUD_DAC_PATH,
	Auto_Init_OB_Devices_ROM.AUD_POWER				= AUD_POWER,
	Auto_Init_OB_Devices_ROM.AUD_DATA_FORMAT		= AUD_DATA_FORMAT,
	Auto_Init_OB_Devices_ROM.AUD_SAMPLE_CTRL		= AUD_SAMPLE_CTRL,
	Auto_Init_OB_Devices_ROM.AUD_SET_ACTIVE		= AUD_SET_ACTIVE;


altera_up_av_config_serial_bus_controller Serial_Bus_Controller (
	// Inputs
	.clk							(clk),
	.reset						(internal_reset),

	.start_transfer			(start_transfer),

	.data_in						(data_to_controller),
	.transfer_mask				(transfer_mask),

	.restart_counter			(RESTART_COUNTER),
	.restart_data_in			(data_to_controller_on_restart),
	.restart_transfer_mask	(READ_MASK),

	// Bidirectionals
	.serial_data				(I2C_SDAT),

	// Outputs
	.serial_clk					(I2C_SCLK),
	.serial_en					(I2C_SCEN),

	.data_out					(data_from_controller),
	.transfer_complete		(transfer_complete)
);
defparam
	Serial_Bus_Controller.DW	= DW,
	Serial_Bus_Controller.CW	= SBCW,
	Serial_Bus_Controller.SCCW	= SCCW;

endmodule

