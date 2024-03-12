//*****************************************************************************
// (c) Copyright 2008-2009 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor                : Xilinx
// \   \   \/     Version               : 3.4
//  \   \         Application           : MIG
//  /   /         Filename              : ecc_merge_enc.v
// /___/   /\     Date Last Modified    : $date$
// \   \  /  \    Date Created          : Tue Jun 30 2009
//  \___\/\___\
//
//Device            : Virtex-6
//Design Name       : DDR3 SDRAM
//Purpose           :
//Reference         :
//Revision History  :
//*****************************************************************************

`timescale 1ps/1ps

module ecc_merge_enc
  #(
    parameter TCQ = 100,
    parameter PAYLOAD_WIDTH         = 64,
    parameter CODE_WIDTH            = 72,
    parameter DATA_BUF_ADDR_WIDTH   = 4,
    parameter DATA_BUF_OFFSET_WIDTH = 1,
    parameter DATA_WIDTH            = 64,
    parameter DQ_WIDTH              = 72,
    parameter ECC_WIDTH             = 8
   )
   (
    /*AUTOARG*/
  // Outputs
  dfi_wrdata, dfi_wrdata_mask,
  // Inputs
  clk, rst, wr_data, wr_data_mask, rd_merge_data, h_rows, raw_not_ecc
  );

  input clk;
  input rst;

  input [4*PAYLOAD_WIDTH-1:0] wr_data;
  input [4*DATA_WIDTH/8-1:0] wr_data_mask;
  input [4*DATA_WIDTH-1:0] rd_merge_data;
  
  reg [4*PAYLOAD_WIDTH-1:0] wr_data_r;
  reg [4*DATA_WIDTH/8-1:0] wr_data_mask_r;
  reg [4*DATA_WIDTH-1:0] rd_merge_data_r;

  always @(posedge clk) wr_data_r <= #TCQ wr_data;
  always @(posedge clk) wr_data_mask_r <= #TCQ wr_data_mask;
  always @(posedge clk) rd_merge_data_r <= #TCQ rd_merge_data;
  
  // Merge new data with memory read data.
  wire [4*PAYLOAD_WIDTH-1:0] merged_data;
  genvar h;
  genvar i;
  generate
    for (h=0; h<4; h=h+1) begin : merge_data_outer
      for (i=0; i<DATA_WIDTH/8; i=i+1) begin : merge_data_inner
        assign merged_data[h*PAYLOAD_WIDTH+i*8+:8] =  
                wr_data_mask_r[h*DATA_WIDTH/8+i]
                  ? rd_merge_data_r[h*DATA_WIDTH+i*8+:8]               
                  : wr_data_r[h*PAYLOAD_WIDTH+i*8+:8];
      end
      if (PAYLOAD_WIDTH > DATA_WIDTH)
        assign merged_data[(h+1)*PAYLOAD_WIDTH-1-:PAYLOAD_WIDTH-DATA_WIDTH]=
                      wr_data_r[(h+1)*PAYLOAD_WIDTH-1-:PAYLOAD_WIDTH-DATA_WIDTH];
                                                                   
    end
  endgenerate

  // Generate ECC and overlay onto dfi_wrdata.
  input [CODE_WIDTH*ECC_WIDTH-1:0] h_rows;
  input [3:0] raw_not_ecc;
  reg [3:0] raw_not_ecc_r;
  always @(posedge clk) raw_not_ecc_r <= #TCQ raw_not_ecc;
  output reg [4*DQ_WIDTH-1:0] dfi_wrdata;
  genvar j;
  integer k;
  generate
    for (j=0; j<4; j=j+1) begin : ecc_word
      always @(/*AS*/h_rows or merged_data or raw_not_ecc_r) begin
        dfi_wrdata[j*DQ_WIDTH+:DQ_WIDTH] =
          {{DQ_WIDTH-PAYLOAD_WIDTH{1'b0}},
           merged_data[j*PAYLOAD_WIDTH+:PAYLOAD_WIDTH]};
        for (k=0; k<ECC_WIDTH; k=k+1)
          if (~raw_not_ecc_r[j])
            dfi_wrdata[j*DQ_WIDTH+CODE_WIDTH-k-1] =
              ^(merged_data[j*PAYLOAD_WIDTH+:DATA_WIDTH] & 
                h_rows[k*CODE_WIDTH+:DATA_WIDTH]);
      end
    end
  endgenerate

  // Set all DRAM masks to zero.
  output wire[4*DQ_WIDTH/8-1:0] dfi_wrdata_mask;
  assign dfi_wrdata_mask = {4*DQ_WIDTH/8{1'b0}};

endmodule

