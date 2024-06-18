// This program was cloned from: https://github.com/TripleJ160/FPGA-Audio-Recorder
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:30:18 02/24/2015 
// Design Name: 
// Module Name:    ram_interface_wrapper 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ram_interface_wrapper#
(
	parameter DATA_BYTE_WIDTH = 2 //2 bit width
)
(
	address, data_in, write_enable, read_request, read_ack, data_out, reset, clk, hw_ram_rasn, hw_ram_casn,
	hw_ram_wen, hw_ram_ba, hw_ram_udqs_p, hw_ram_udqs_n, hw_ram_ldqs_p, hw_ram_ldqs_n, hw_ram_udm, hw_ram_ldm, hw_ram_ck, hw_ram_ckn, hw_ram_cke, hw_ram_odt,
	hw_ram_ad, hw_ram_dq, hw_rzq_pin, hw_zio_pin, clkout, sys_clk, rdy, rd_data_pres,
	max_ram_address, STATLED3, STATLED4
);

	output wire STATLED3, STATLED4;
	
	localparam DATA_BIT_WIDTH = 8*DATA_BYTE_WIDTH;
	 
	input [25:0] address; 								// inputs
																// address, data_in, write_enable, read_request, read_ack,reset, clk, sys_clk
	 output wire [25:0] max_ram_address;
	input [DATA_BIT_WIDTH-1:0] data_in;
	input write_enable;
	
	output rdy, rd_data_pres;
	 
	input read_request;
	input read_ack;
	output [DATA_BIT_WIDTH-1:0] data_out;
	 
	input reset, clk, sys_clk; 
	output clkout;
	
	output hw_ram_rasn;
	output hw_ram_casn;
	output hw_ram_wen;
	output [2:0] hw_ram_ba;
	
//	inout hw_ram_udqs_p;
//	inout hw_ram_udqs_n;
//	inout hw_ram_ldqs_p;
//	inout hw_ram_ldqs_n;
	output hw_ram_udqs_p;
	output hw_ram_udqs_n;
	output hw_ram_ldqs_p;
	output hw_ram_ldqs_n;
	
	
	output hw_ram_udm;
	output hw_ram_ldm;
	output hw_ram_ck;
	output hw_ram_ckn;
	output hw_ram_cke;
	output hw_ram_odt;
	output [12:0] hw_ram_ad;
	inout [15:0] hw_ram_dq;
	
	inout	hw_rzq_pin;
	inout hw_zio_pin;
	
	wire [31:0] wr_data_in;
	wire [31:0] ram_rd_bus;
	wire [3:0] write_mask;
	wire [25:0] ram_cmd_byte_addr;
	wire [6:0] c3_p0_wr_count, c3_p0_rd_count;
	
	//always @(posedge sys_clk)begin
		//if (write_enable && address == 1)
			//ledRAM = 1'b1;
	//end
	
	generate
		if( DATA_BYTE_WIDTH == 1 ) begin
			assign wr_data_in = {data_in,data_in,data_in,data_in};
			// 11;01;10;00
			assign write_mask = (address[0])?((address[1])?4'b1110:4'b1011):((address[1])?4'b1101:4'b0111);
			assign data_out = (address[0])?((address[1])?ram_rd_bus[7:0]:ram_rd_bus[23:16]):((address[1])?ram_rd_bus[15:8]:ram_rd_bus[31:24]);
			assign max_ram_address = 26'h1FFFFFF;
			assign ram_cmd_byte_addr = {address[25:2],2'b00};
		end else if( DATA_BYTE_WIDTH == 2 ) begin
			assign wr_data_in = {data_in,data_in};
			assign write_mask = (address[0])?4'b1100:4'b0011;
			assign data_out = (address[0])?ram_rd_bus[15:0]:ram_rd_bus[31:16];
			assign max_ram_address = 26'h0FFFFFF;
			assign ram_cmd_byte_addr = {address[24:1],2'b00};
		end else if ( DATA_BYTE_WIDTH == 4 ) begin
			assign wr_data_in = data_in;
			assign write_mask = 4'b0000;
			assign data_out = ram_rd_bus;
			assign max_ram_address = 26'h07FFFFF;
			assign ram_cmd_byte_addr = {address[23:0],2'b00};
		end
	endgenerate
	
	

ram_interface # (
    .C3_P0_MASK_SIZE(4),
    .C3_P0_DATA_PORT_SIZE(32),
    .C3_P1_MASK_SIZE(4),
    .C3_P1_DATA_PORT_SIZE(32),
    .DEBUG_EN(0),
    .C3_MEMCLK_PERIOD(3333),
    .C3_CALIB_SOFT_IP("TRUE"),
    .C3_SIMULATION("FALSE"),
    .C3_RST_ACT_LOW(0),
    .C3_INPUT_CLK_TYPE("SINGLE_ENDED"),
    .C3_MEM_ADDR_ORDER("ROW_BANK_COLUMN"),
    .C3_NUM_DQ_PINS(16),
    .C3_MEM_ADDR_WIDTH(13),
    .C3_MEM_BANKADDR_WIDTH(3)
)
u_memory_interface (

	// External Pins
	.mcb3_dram_ras_n(hw_ram_rasn),
	.mcb3_dram_cas_n(hw_ram_casn),
	.mcb3_dram_we_n(hw_ram_wen),
	.mcb3_dram_ba(hw_ram_ba),		// 2:0
	.mcb3_dram_udqs(hw_ram_udqs_p),
	.mcb3_dram_udqs_n(hw_ram_udqs_n),
	.mcb3_dram_dqs(hw_ram_ldqs_p),
	.mcb3_dram_dqs_n(hw_ram_ldqs_n),
	.mcb3_dram_udm(hw_ram_udm),
	.mcb3_dram_dm(hw_ram_ldm),
	.mcb3_dram_ck(hw_ram_ck),
	.mcb3_dram_ck_n(hw_ram_ckn),
	.mcb3_dram_cke(hw_ram_cke),
	.mcb3_dram_odt(hw_ram_odt),
	.mcb3_dram_a(hw_ram_ad),		// 15:0
	.mcb3_dram_dq(hw_ram_dq),		// 12:0
	
	.mcb3_rzq(hw_rzq_pin),
	.mcb3_zio(hw_zio_pin),
	

	
	
	// Outputs for use everywhere else
	.c3_clk0		        (clkout),
	.c3_rst0		        (),
	
	// System Inputs
   .c3_sys_clk           (clk),
   .c3_sys_rst_i           (reset),                        

 
  	.c3_calib_done          (c3_calib_done),	// 1=ready to go!
	
	
	// Command Datapath
	//
	// commands:
	// * 0x0: write
	// * 0x1: read
	// * 01x: ... with precharge
	// * 1xx: refresh (won't use)
	
   .c3_p0_cmd_clk                          (sys_clk),
   .c3_p0_cmd_en                           (read_request | write_enable),
   .c3_p0_cmd_instr                        ({2'b00,read_request}),	// Instruction 2:0
   .c3_p0_cmd_bl                           (6'b00_0000),		// Burst Length ( ...times port width ) 5:0
   .c3_p0_cmd_byte_addr                    ({4'h0,ram_cmd_byte_addr}), // Start address - for 32 bit, lower 2 are 0; 29:0
   .c3_p0_cmd_empty                        (c3_p0_cmd_empty), // status output
   .c3_p0_cmd_full                         (c3_p0_cmd_full), // status output

	
	// Write Datapath
   .c3_p0_wr_clk                           (sys_clk),
   .c3_p0_wr_en                            (write_enable),
   .c3_p0_wr_mask                          (write_mask),	// mask 31:0
   .c3_p0_wr_data                          (wr_data_in),	// data 31:0
   .c3_p0_wr_full                          (c3_p0_wr_full), // status output
   .c3_p0_wr_empty                         (c3_p0_wr_empty), // status output
   .c3_p0_wr_count                         (c3_p0_wr_count), // status output - num of words in fifo 6:0
   .c3_p0_wr_underrun                      (c3_p0_wr_underrun), // status output
   .c3_p0_wr_error                         (c3_p0_wr_error), // status output
	
	// Read Datapath
   .c3_p0_rd_clk                           (sys_clk),
   .c3_p0_rd_en                            (read_ack),
   .c3_p0_rd_data                          (ram_rd_bus),	// data 31:0
   .c3_p0_rd_full                          (c3_p0_rd_full),	// status output
   .c3_p0_rd_empty                         (c3_p0_rd_empty), //
   .c3_p0_rd_count                         (c3_p0_rd_count),
   .c3_p0_rd_overflow                      (c3_p0_rd_overflow),
   .c3_p0_rd_error                         (c3_p0_rd_error)
);

assign rd_data_pres = (c3_p0_rd_count > 7'h00);
assign rdy = c3_calib_done;
assign STATLED4 = c3_p0_rd_empty;
assign STATLED3 = c3_p0_wr_empty;

endmodule
