// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2020 Efinix Inc. All rights reserved.
//
// Description:
// Example top file for OpalSoc_t8
//
// Language:  Verilog 2001
//
// ------------------------------------------------------------------------------
// REVISION:
//  $Snapshot: $
//  $Id:$
//
// History:
// 1.0 Initial Release. 
/////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//`define SOFT_TAP 

module top_opalSoc (

	//user custom ports
	//output    [1:0]     	apb3LED,
	//PLL
  	output	      		my_pll_rstn,
  	input				my_pll_locked,
	//SOC
  	input               	io_systemClk,
  	input               	io_asyncReset,
  	output              	system_uart_0_io_txd,
  	input               	system_uart_0_io_rxd,
  	output              	system_i2c_0_io_sda_writeEnable,
  	output              	system_i2c_0_io_sda_write,
  	input               	system_i2c_0_io_sda_read,
  	output              	system_i2c_0_io_scl_writeEnable,
  	output              	system_i2c_0_io_scl_write,
  	input               	system_i2c_0_io_scl_read,
  	input      [15:0]   	system_gpio_0_io_read,
  	output     [15:0]   	system_gpio_0_io_write,
  	output     [15:0]   	system_gpio_0_io_writeEnable,
  	output         		system_spi_0_io_sclk_write,
  	output             	system_spi_0_io_data_0_writeEnable,
  	input          		system_spi_0_io_data_0_read,
  	output         		system_spi_0_io_data_0_write,
  	output             	system_spi_0_io_data_1_writeEnable,
  	input          		system_spi_0_io_data_1_read,
  	output         		system_spi_0_io_data_1_write,
  	output         		system_spi_0_io_ss,
	
	output         		system_spi_1_io_sclk_write,
  	output             	system_spi_1_io_data_0_writeEnable,
  	input          		system_spi_1_io_data_0_read,
  	output         		system_spi_1_io_data_0_write,
  	output             	system_spi_1_io_data_1_writeEnable,
  	input          		system_spi_1_io_data_1_read,
  	output         		system_spi_1_io_data_1_write,
  	output         		system_spi_1_io_ss,
`ifndef SOFT_TAP
	input               	jtag_inst1_TCK,
  	input               	jtag_inst1_TDI,
  	output              	jtag_inst1_TDO,
  	input               	jtag_inst1_SEL,
  	input               	jtag_inst1_CAPTURE,
  	input               	jtag_inst1_SHIFT,
  	input               	jtag_inst1_UPDATE,
  	input               	jtag_inst1_RESET
`else
  	input               	io_jtag_tms,
  	input               	io_jtag_tdi,
  	output              	io_jtag_tdo,
  	input               	io_jtag_tck
`endif

);
/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
wire 		mcuReset;
wire		io_systemReset;
//APB Slave 0  
wire   [11:0]   io_apbSlave_0_PADDR;
wire          	io_apbSlave_0_PSEL;
wire            io_apbSlave_0_PENABLE;
wire            io_apbSlave_0_PREADY;
wire            io_apbSlave_0_PWRITE;
wire   [31:0]   io_apbSlave_0_PWDATA;
wire   [31:0]   io_apbSlave_0_PRDATA;
wire            io_apbSlave_0_PSLVERROR;
//User Interupt
wire    	apb3Interrupt;

/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
assign mcuReset 	= ~( io_asyncReset & my_pll_locked );
assign my_pll_rstn 	= 1'b1;
//I2C
assign system_i2c_0_io_sda_writeEnable = !system_i2c_0_io_sda_write;
assign system_i2c_0_io_scl_writeEnable = !system_i2c_0_io_scl_write;
//User Interrupt
assign userInterrupt 		       = apb3Interrupt;

/////////////////////////////////////////////////////////////////////////////
//Custom APB PLUGIN

apb3_slave #(
	// user parameter starts here
	//
	.ADDR_WIDTH	(12),
	.DATA_WIDTH	(32),
	.NUM_REG	(2)
) apb_slave_0 (
	// user logic starts here
	.apb3LED	(),
	.apb3Interrupt	(apb3Interrupt),
	.clk		(io_systemClk),
	.resetn		(~io_systemReset),
	.PADDR		(io_apbSlave_0_PADDR),
	.PSEL		(io_apbSlave_0_PSEL),
	.PENABLE	(io_apbSlave_0_PENABLE),
	.PREADY		(io_apbSlave_0_PREADY),
	.PWRITE		(io_apbSlave_0_PWRITE),
	.PWDATA		(io_apbSlave_0_PWDATA),
	.PRDATA		(io_apbSlave_0_PRDATA),
	.PSLVERROR 	(io_apbSlave_0_PSLVERROR)

);

`ifndef SOFT_TAP 

		OpalSoc_t8 OpalSoc_t8_inst
		(
		  .io_systemClk				(io_systemClk),
		  .io_asyncReset			(mcuReset),
		  .io_systemReset			(io_systemReset),
		  .system_uart_0_io_txd			(system_uart_0_io_txd),
		  .system_uart_0_io_rxd			(system_uart_0_io_rxd),
		  .system_i2c_0_io_sda_write		(system_i2c_0_io_sda_write),
		  .system_i2c_0_io_sda_read		(system_i2c_0_io_sda_read),
		  .system_i2c_0_io_scl_write		(system_i2c_0_io_scl_write),
		  .system_i2c_0_io_scl_read		(system_i2c_0_io_scl_read),
		  .system_gpio_0_io_read		(system_gpio_0_io_read[15:0]),
		  .system_gpio_0_io_write		(system_gpio_0_io_write[15:0]),
		  .system_gpio_0_io_writeEnable		(system_gpio_0_io_writeEnable[15:0]),
		  .io_apbSlave_0_PADDR			(io_apbSlave_0_PADDR),
		  .io_apbSlave_0_PSEL			(io_apbSlave_0_PSEL),
		  .io_apbSlave_0_PENABLE		(io_apbSlave_0_PENABLE),
		  .io_apbSlave_0_PREADY			(io_apbSlave_0_PREADY),
		  .io_apbSlave_0_PWRITE			(io_apbSlave_0_PWRITE),
		  .io_apbSlave_0_PWDATA			(io_apbSlave_0_PWDATA),
		  .io_apbSlave_0_PRDATA			(io_apbSlave_0_PRDATA),
		  .io_apbSlave_0_PSLVERROR		(io_apbSlave_0_PSLVERROR),
		  .userInterruptA			(userInterrupt),				
		  .system_spi_0_io_sclk_write		(system_spi_0_io_sclk_write),
		  .system_spi_0_io_data_0_writeEnable	(system_spi_0_io_data_0_writeEnable),
		  .system_spi_0_io_data_0_read		(system_spi_0_io_data_0_read),
		  .system_spi_0_io_data_0_write		(system_spi_0_io_data_0_write),
		  .system_spi_0_io_data_1_writeEnable	(system_spi_0_io_data_1_writeEnable),
		  .system_spi_0_io_data_1_read		(system_spi_0_io_data_1_read),
		  .system_spi_0_io_data_1_write		(system_spi_0_io_data_1_write),
		  .system_spi_0_io_data_2_writeEnable	(),
		  .system_spi_0_io_data_2_read		(),
		  .system_spi_0_io_data_2_write		(),
		  .system_spi_0_io_data_3_writeEnable	(),
		  .system_spi_0_io_data_3_read		(),
		  .system_spi_0_io_data_3_write		(),
		  .system_spi_0_io_ss			(system_spi_0_io_ss),
		  
		  .system_spi_1_io_sclk_write		(system_spi_1_io_sclk_write),
		  .system_spi_1_io_data_0_writeEnable	(system_spi_1_io_data_0_writeEnable),
		  .system_spi_1_io_data_0_read		(system_spi_1_io_data_0_read),
		  .system_spi_1_io_data_0_write		(system_spi_1_io_data_0_write),
		  .system_spi_1_io_data_1_writeEnable	(system_spi_1_io_data_1_writeEnable),
		  .system_spi_1_io_data_1_read		(system_spi_1_io_data_1_read),
		  .system_spi_1_io_data_1_write		(system_spi_1_io_data_1_write),
		  .system_spi_1_io_data_2_writeEnable	(),
		  .system_spi_1_io_data_2_read		(),
		  .system_spi_1_io_data_2_write		(),
		  .system_spi_1_io_data_3_writeEnable	(),
		  .system_spi_1_io_data_3_read		(),
		  .system_spi_1_io_data_3_write		(),
		  
		  .system_spi_1_io_ss			(system_spi_1_io_ss),
		  .jtagCtrl_tck				(jtag_inst1_TCK),
		  .jtagCtrl_tdi				(jtag_inst1_TDI),
		  .jtagCtrl_tdo				(jtag_inst1_TDO),
		  .jtagCtrl_enable			(jtag_inst1_SEL),
		  .jtagCtrl_capture			(jtag_inst1_CAPTURE),
		  .jtagCtrl_shift			(jtag_inst1_SHIFT),
		  .jtagCtrl_update			(jtag_inst1_UPDATE),
		  .jtagCtrl_reset			(jtag_inst1_RESET)
		
		);

`else
		OpalSoc_t8_softTap OpalSoc_t8_softTap_inst
		(
		  .io_systemClk				(io_systemClk),
		  .io_asyncReset			(mcuReset),
		  .io_systemReset			(io_systemReset),
		  .system_uart_0_io_txd			(system_uart_0_io_txd),
		  .system_uart_0_io_rxd			(system_uart_0_io_rxd),
		  .system_i2c_0_io_sda_write		(system_i2c_0_io_sda_write),
		  .system_i2c_0_io_sda_read		(system_i2c_0_io_sda_read),
		  .system_i2c_0_io_scl_write		(system_i2c_0_io_scl_write),
		  .system_i2c_0_io_scl_read		(system_i2c_0_io_scl_read),
		  .system_gpio_0_io_read		(system_gpio_0_io_read[7:0]),
		  .system_gpio_0_io_write		(system_gpio_0_io_write[7:0]),
		  .system_gpio_0_io_writeEnable		(system_gpio_0_io_writeEnable[7:0]),
		  .io_apbSlave_0_PADDR			(io_apbSlave_0_PADDR),
		  .io_apbSlave_0_PSEL			(io_apbSlave_0_PSEL),
		  .io_apbSlave_0_PENABLE		(io_apbSlave_0_PENABLE),
		  .io_apbSlave_0_PREADY			(io_apbSlave_0_PREADY),
		  .io_apbSlave_0_PWRITE			(io_apbSlave_0_PWRITE),
		  .io_apbSlave_0_PWDATA			(io_apbSlave_0_PWDATA),
		  .io_apbSlave_0_PRDATA			(io_apbSlave_0_PRDATA),
		  .io_apbSlave_0_PSLVERROR		(io_apbSlave_0_PSLVERROR),
		  .userInterruptA			(userInterrupt),				
		  .system_spi_0_io_sclk_write		(system_spi_0_io_sclk_write),
		  .system_spi_0_io_data_0_writeEnable	(system_spi_0_io_data_0_writeEnable),
		  .system_spi_0_io_data_0_read		(system_spi_0_io_data_0_read),
		  .system_spi_0_io_data_0_write		(system_spi_0_io_data_0_write),
		  .system_spi_0_io_data_1_writeEnable	(system_spi_0_io_data_1_writeEnable),
		  .system_spi_0_io_data_1_read		(system_spi_0_io_data_1_read),
		  .system_spi_0_io_data_1_write		(system_spi_0_io_data_1_write),
		  .system_spi_0_io_data_2_writeEnable	(),
		  .system_spi_0_io_data_2_read		(),
		  .system_spi_0_io_data_2_write		(),
		  .system_spi_0_io_data_3_writeEnable	(),
		  .system_spi_0_io_data_3_read		(),
		  .system_spi_0_io_data_3_write		(),
		  .system_spi_0_io_ss			(system_spi_0_io_ss),
  		  .io_jtag_tms				(io_jtag_tms),
  		  .io_jtag_tdi				(io_jtag_tdi),
  		  .io_jtag_tdo				(io_jtag_tdo),
  		  .io_jtag_tck				(io_jtag_tck)
		
		);
`endif

endmodule

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2020 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the 
// original license agreement is included in it's original 
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.  
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
//     APPLY TO LICENSEE.
//
/////////////////////////////////////////////////////////////////////////////
