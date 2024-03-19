//---------------------------------------------------------------------------   
// File:        ddr2_usr_top.v
// Author:      Zhangxi Tan
// Description: Modified from ddr2_usr_top.v
//------------------------------------------------------------------------------

//*****************************************************************************
// DISCLAIMER OF LIABILITY
// 
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you a 
// license to use this text/file solely for design, simulation, 
// implementation and creation of design files limited 
// to Xilinx devices or technologies. Use with non-Xilinx 
// devices or technologies is expressly prohibited and 
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information 
// "as-is" solely for use in developing programs and 
// solutions for Xilinx devices, with no obligation on the 
// part of Xilinx to provide support. By providing this design, 
// code, or information as one possible implementation of 
// this feature, application or standard, Xilinx is making no 
// representation that this implementation is free from any 
// claims of infringement. You are responsible for 
// obtaining any rights you may require for your implementation. 
// Xilinx expressly disclaims any warranty whatsoever with 
// respect to the adequacy of the implementation, including 
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied 
// warranties of merchantability or fitness for a particular 
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications is
// expressly prohibited.
//
// Any modifications that are made to the Source Code are 
// done at the users sole risk and will be unsupported.
//
// Copyright (c) 2006-2007 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part 
// of this text at all times. 
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 2.3
//  \   \         Application: MIG
//  /   /         Filename: ddr2_usr_top.v
// /___/   /\     Date Last Modified: $Date: 2008/05/08 15:20:47 $
// \   \  /  \    Date Created: Mon Aug 28 2006
//  \___\/\___\
//
//Device: Virtex-5
//Design Name: DDR2
//Purpose:
//   This module interfaces with the user. The user should provide the data
//   and  various commands.
//Reference:
//Revision History:
//*****************************************************************************

`timescale 1ns/1ps

module ddr2_usr_top #
  (
   // Following parameters are for 72-bit RDIMM design (for ML561 Reference 
   // board design). Actual values may be different. Actual parameters values 
   // are passed from design top module ddr2_sdram module. Please refer to
   // the ddr2_sdram module for actual values.
   parameter BANK_WIDTH     = 2,
   parameter CS_BITS        = 0,
   parameter COL_WIDTH      = 10,
   parameter DQ_WIDTH       = 72,
   parameter DQ_PER_DQS     = 8,
   parameter APPDATA_WIDTH  = 144,
   parameter ECC_ENABLE     = 0,
   parameter DQS_WIDTH      = 9,
   parameter ROW_WIDTH      = 14
   )
  (
   input                                     clk0,
   input                                     clk90,
   input                                     rst0,
   //added by xtan
   input				     af_clk,			//address fifo clk
   input				     rb_clk,			//read buffer clk
   input				     wb_clk,			//write buffer clk
   input         rb_re,    //read buffer enable
   output				    rb_full,		//read buffer is full
   //end of add
   input [DQ_WIDTH-1:0]                      rd_data_in_rise,
   input [DQ_WIDTH-1:0]                      rd_data_in_fall,
   input [DQS_WIDTH-1:0]                     phy_calib_rden,
   input [DQS_WIDTH-1:0]                     phy_calib_rden_sel,
   output                                    rd_data_valid,

   output [APPDATA_WIDTH-1:0]                rd_data_fifo_out,
   input [2:0]                               app_af_cmd,
   input [30:0]                              app_af_addr,
   input                                     app_af_wren,
   input                                     ctrl_af_rden,
   output [2:0]                              af_cmd,
   output [30:0]                             af_addr,
   output                                    af_empty,
   output                                    app_af_afull,
   output [1:0]                              rd_ecc_error,
   input                                     app_wdf_wren,
   input [APPDATA_WIDTH-1:0]                 app_wdf_data,
   input [(APPDATA_WIDTH/8)-1:0]             app_wdf_mask_data,
   input                                     wdf_rden,
   output                                    app_wdf_afull,
   output [(2*DQ_WIDTH)-1:0]                 wdf_data,
   output [((2*DQ_WIDTH)/8)-1:0]             wdf_mask_data
   );

  wire [(APPDATA_WIDTH/2)-1:0] i_rd_data_fifo_out_fall;
  wire [(APPDATA_WIDTH/2)-1:0] i_rd_data_fifo_out_rise;

  //***************************************************************************

  assign rd_data_fifo_out = {i_rd_data_fifo_out_fall,
                             i_rd_data_fifo_out_rise};

  // read data de-skew and ECC calculation
  ddr2_usr_rd #
    (
     .DQ_PER_DQS    (DQ_PER_DQS),
     .ECC_ENABLE    (ECC_ENABLE),
     .APPDATA_WIDTH (APPDATA_WIDTH),
     .DQS_WIDTH     (DQS_WIDTH)
     )
     u_usr_rd
      (
       .clk0             (clk0),
       .rst0             (rst0),
       .rb_clk           (rb_clk),
       .rb_full          (rb_full),
       .rb_re            (rb_re),
       .rd_data_in_rise  (rd_data_in_rise),
       .rd_data_in_fall  (rd_data_in_fall),
       .rd_ecc_error     (rd_ecc_error),
       .ctrl_rden        (phy_calib_rden),
       .ctrl_rden_sel    (phy_calib_rden_sel),
       .rd_data_valid    (rd_data_valid),
       .rd_data_out_rise (i_rd_data_fifo_out_rise),
       .rd_data_out_fall (i_rd_data_fifo_out_fall)
       );

  // Command/Addres FIFO
  ddr2_usr_addr_fifo #
    (
     .BANK_WIDTH (BANK_WIDTH),
     .COL_WIDTH  (COL_WIDTH),
     .CS_BITS    (CS_BITS),
     .ROW_WIDTH  (ROW_WIDTH)
     )
     u_usr_addr_fifo
      (
       .clk0         (clk0),
       .af_clk       (af_clk),
       .rst0         (rst0),
       .app_af_cmd   (app_af_cmd),
       .app_af_addr  (app_af_addr),
       .app_af_wren  (app_af_wren),
       .ctrl_af_rden (ctrl_af_rden),
       .af_cmd       (af_cmd),
       .af_addr      (af_addr),
       .af_empty     (af_empty),
       .app_af_afull (app_af_afull)
       );

  ddr2_usr_wr #
    (
     .BANK_WIDTH    (BANK_WIDTH),
     .COL_WIDTH     (COL_WIDTH),
     .CS_BITS       (CS_BITS),
     .DQ_WIDTH      (DQ_WIDTH),
     .APPDATA_WIDTH (APPDATA_WIDTH),
     .ECC_ENABLE    (ECC_ENABLE),
     .ROW_WIDTH     (ROW_WIDTH)
     )
    u_usr_wr
      (
       .clk0              (clk0),
       .wb_clk            (wb_clk),
       .clk90             (clk90),
       .rst0              (rst0),
       .app_wdf_wren      (app_wdf_wren),
       .app_wdf_data      (app_wdf_data),
       .app_wdf_mask_data (app_wdf_mask_data),
       .wdf_rden          (wdf_rden),
       .app_wdf_afull     (app_wdf_afull),
       .wdf_data          (wdf_data),
       .wdf_mask_data     (wdf_mask_data)
       );

endmodule
