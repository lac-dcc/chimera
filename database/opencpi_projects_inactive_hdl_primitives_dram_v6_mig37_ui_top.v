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
// \   \   \/     Version               : 3.7
//  \   \         Application           : MIG
//  /   /         Filename              : ui_top.v
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

// Top level of simple user interface.


`timescale 1 ps / 1 ps

module ui_top #
  (
   parameter TCQ = 100,
   parameter APP_DATA_WIDTH  = 256,
   parameter APP_MASK_WIDTH  = 32,
   parameter BANK_WIDTH      = 3,
   parameter COL_WIDTH       = 12,
   parameter CWL             = 5,
   parameter ECC             = "OFF",
   parameter ECC_TEST        = "OFF",
   parameter ORDERING        = "NORM",
   parameter RANKS           = 4,
   parameter RANK_WIDTH      = 2,
   parameter ROW_WIDTH       = 16,
   parameter MEM_ADDR_ORDER  = "BANK_ROW_COLUMN"
  )
  (/*AUTOARG*/
  // Outputs
  wr_data_mask, wr_data, use_addr, size, row, raw_not_ecc, rank,
  hi_priority, data_buf_addr, col, cmd, bank, app_wdf_rdy, app_rdy,
  app_rd_data_valid, app_rd_data_end, app_rd_data,
  app_ecc_multiple_err, correct_en,
  // Inputs
  wr_data_offset, wr_data_en, wr_data_addr, rst, rd_data_offset,
  rd_data_end, rd_data_en, rd_data_addr, rd_data, ecc_multiple, clk,
  app_wdf_wren, app_wdf_mask, app_wdf_end, app_wdf_data, app_sz,
  app_raw_not_ecc, app_hi_pri, app_en, app_cmd, app_addr, accept_ns,
  accept, app_correct_en
  );

  input accept;
  localparam ADDR_WIDTH = RANK_WIDTH + BANK_WIDTH + ROW_WIDTH + COL_WIDTH;

  input app_correct_en;
  output wire correct_en;
  assign correct_en = app_correct_en;

  /*AUTOINPUT*/
  // Beginning of automatic inputs (from unused autoinst inputs)
  input                 accept_ns;              // To ui_cmd0 of ui_cmd.v
  input [ADDR_WIDTH-1:0] app_addr;              // To ui_cmd0 of ui_cmd.v
  input [2:0]           app_cmd;                // To ui_cmd0 of ui_cmd.v
  input                 app_en;                 // To ui_cmd0 of ui_cmd.v
  input                 app_hi_pri;             // To ui_cmd0 of ui_cmd.v
  input [3:0]           app_raw_not_ecc;        // To ui_wr_data0 of ui_wr_data.v
  input                 app_sz;                 // To ui_cmd0 of ui_cmd.v
  input [APP_DATA_WIDTH-1:0] app_wdf_data;      // To ui_wr_data0 of ui_wr_data.v
  input                 app_wdf_end;            // To ui_wr_data0 of ui_wr_data.v
  input [APP_MASK_WIDTH-1:0] app_wdf_mask;      // To ui_wr_data0 of ui_wr_data.v
  input                 app_wdf_wren;           // To ui_wr_data0 of ui_wr_data.v
  input                 clk;                    // To ui_cmd0 of ui_cmd.v, ...
  input [3:0]           ecc_multiple;           // To ui_rd_data0 of ui_rd_data.v
  input [APP_DATA_WIDTH-1:0] rd_data;           // To ui_rd_data0 of ui_rd_data.v
  input [3:0]           rd_data_addr;           // To ui_rd_data0 of ui_rd_data.v
  input                 rd_data_en;             // To ui_rd_data0 of ui_rd_data.v
  input                 rd_data_end;            // To ui_rd_data0 of ui_rd_data.v
  input                 rd_data_offset;         // To ui_rd_data0 of ui_rd_data.v
  input                 rst;                    // To ui_cmd0 of ui_cmd.v, ...
  input [3:0]           wr_data_addr;           // To ui_wr_data0 of ui_wr_data.v
  input                 wr_data_en;             // To ui_wr_data0 of ui_wr_data.v
  input                 wr_data_offset;         // To ui_wr_data0 of ui_wr_data.v
  // End of automatics

  /*AUTOOUTPUT*/
  // Beginning of automatic outputs (from unused autoinst outputs)
  output [3:0]          app_ecc_multiple_err;   // From ui_rd_data0 of ui_rd_data.v
  output [APP_DATA_WIDTH-1:0] app_rd_data;      // From ui_rd_data0 of ui_rd_data.v
  output                app_rd_data_end;        // From ui_rd_data0 of ui_rd_data.v
  output                app_rd_data_valid;      // From ui_rd_data0 of ui_rd_data.v
  output                app_rdy;                // From ui_cmd0 of ui_cmd.v
  output                app_wdf_rdy;            // From ui_wr_data0 of ui_wr_data.v
  output [BANK_WIDTH-1:0] bank;                 // From ui_cmd0 of ui_cmd.v
  output [2:0]          cmd;                    // From ui_cmd0 of ui_cmd.v
  output [COL_WIDTH-1:0] col;                   // From ui_cmd0 of ui_cmd.v
  output [3:0]          data_buf_addr;          // From ui_cmd0 of ui_cmd.v
  output                hi_priority;            // From ui_cmd0 of ui_cmd.v
  output [RANK_WIDTH-1:0] rank;                 // From ui_cmd0 of ui_cmd.v
  output [3:0]          raw_not_ecc;            // From ui_wr_data0 of ui_wr_data.v
  output [ROW_WIDTH-1:0] row;                   // From ui_cmd0 of ui_cmd.v
  output                size;                   // From ui_cmd0 of ui_cmd.v
  output                use_addr;               // From ui_cmd0 of ui_cmd.v
  output [APP_DATA_WIDTH-1:0] wr_data;          // From ui_wr_data0 of ui_wr_data.v
  output [APP_MASK_WIDTH-1:0] wr_data_mask;     // From ui_wr_data0 of ui_wr_data.v
  // End of automatics

  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [3:0]            ram_init_addr;          // From ui_rd_data0 of ui_rd_data.v
  wire                  ram_init_done_r;        // From ui_rd_data0 of ui_rd_data.v
  wire                  rd_accepted;            // From ui_cmd0 of ui_cmd.v
  wire                  rd_buf_full;            // From ui_rd_data0 of ui_rd_data.v
  wire [3:0]            rd_data_buf_addr_r;     // From ui_rd_data0 of ui_rd_data.v
  wire                  wr_accepted;            // From ui_cmd0 of ui_cmd.v
  wire [3:0]            wr_data_buf_addr;       // From ui_wr_data0 of ui_wr_data.v
  wire                  wr_req_16;              // From ui_wr_data0 of ui_wr_data.v
  wire [ADDR_WIDTH-1 : 0] app_addr_temp;

  // End of automatics
  reg [9:0]  rst_reg;
  reg  rst_final;//synthesis attribute max_fanout of rst_final is 10

  always @(posedge clk) begin
  	rst_reg <= {rst_reg[8:0],rst};
  end

  always @(posedge clk) begin
  	rst_final <= rst_reg[9];
  end

  generate
    if ( RANKS > 1 ) 
       assign app_addr_temp = app_addr;
    else
       assign app_addr_temp = {1'b0,app_addr[ADDR_WIDTH-2 : 0]};
  endgenerate


  ui_cmd #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .ADDR_WIDTH                        (ADDR_WIDTH),
     .BANK_WIDTH                        (BANK_WIDTH),
     .COL_WIDTH                         (COL_WIDTH),
     .RANK_WIDTH                        (RANK_WIDTH),
     .ROW_WIDTH                         (ROW_WIDTH),
     .RANKS                             (RANKS),
     .MEM_ADDR_ORDER                    (MEM_ADDR_ORDER))
    ui_cmd0
      (/*AUTOINST*/
       // Outputs
       .app_rdy                         (app_rdy),
       .use_addr                        (use_addr),
       .rank                            (rank[RANK_WIDTH-1:0]),
       .bank                            (bank[BANK_WIDTH-1:0]),
       .row                             (row[ROW_WIDTH-1:0]),
       .col                             (col[COL_WIDTH-1:0]),
       .size                            (size),
       .cmd                             (cmd[2:0]),
       .hi_priority                     (hi_priority),
       .rd_accepted                     (rd_accepted),
       .wr_accepted                     (wr_accepted),
       .data_buf_addr                   (data_buf_addr[3:0]),
       // Inputs
       .rst                             (rst_final),
       .clk                             (clk),
       .accept_ns                       (accept_ns),
       .rd_buf_full                     (rd_buf_full),
       .wr_req_16                       (wr_req_16),
       .app_addr                        (app_addr_temp[ADDR_WIDTH-1:0]),
       .app_cmd                         (app_cmd[2:0]),
       .app_sz                          (app_sz),
       .app_hi_pri                      (app_hi_pri),
       .app_en                          (app_en),
       .wr_data_buf_addr                (wr_data_buf_addr[3:0]),
       .rd_data_buf_addr_r              (rd_data_buf_addr_r[3:0]));

  ui_wr_data #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .APP_DATA_WIDTH                    (APP_DATA_WIDTH),
     .APP_MASK_WIDTH                    (APP_MASK_WIDTH),
     .ECC                               (ECC),
     .ECC_TEST                          (ECC_TEST),
     .CWL                               (CWL))
    ui_wr_data0
      (/*AUTOINST*/
       // Outputs
       .app_wdf_rdy                     (app_wdf_rdy),
       .wr_req_16                       (wr_req_16),
       .wr_data_buf_addr                (wr_data_buf_addr[3:0]),
       .wr_data                         (wr_data[APP_DATA_WIDTH-1:0]),
       .wr_data_mask                    (wr_data_mask[APP_MASK_WIDTH-1:0]),
       .raw_not_ecc                     (raw_not_ecc[3:0]),
       // Inputs
       .rst                             (rst_final),
       .clk                             (clk),
       .app_wdf_data                    (app_wdf_data[APP_DATA_WIDTH-1:0]),
       .app_wdf_mask                    (app_wdf_mask[APP_MASK_WIDTH-1:0]),
       .app_raw_not_ecc                 (app_raw_not_ecc[3:0]),
       .app_wdf_wren                    (app_wdf_wren),
       .app_wdf_end                     (app_wdf_end),
       .wr_data_offset                  (wr_data_offset),
       .wr_data_addr                    (wr_data_addr[3:0]),
       .wr_data_en                      (wr_data_en),
       .wr_accepted                     (wr_accepted),
       .ram_init_done_r                 (ram_init_done_r),
       .ram_init_addr                   (ram_init_addr[3:0]));

  ui_rd_data #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .APP_DATA_WIDTH                    (APP_DATA_WIDTH),
     .ECC                               (ECC),
     .ORDERING                          (ORDERING))
    ui_rd_data0
      (/*AUTOINST*/
       // Outputs
       .ram_init_done_r                 (ram_init_done_r),
       .ram_init_addr                   (ram_init_addr[3:0]),
       .app_rd_data_valid               (app_rd_data_valid),
       .app_rd_data_end                 (app_rd_data_end),
       .app_rd_data                     (app_rd_data[APP_DATA_WIDTH-1:0]),
       .app_ecc_multiple_err            (app_ecc_multiple_err[3:0]),
       .rd_buf_full                     (rd_buf_full),
       .rd_data_buf_addr_r              (rd_data_buf_addr_r[3:0]),
       // Inputs
       .rst                             (rst_final),
       .clk                             (clk),
       .rd_data_en                      (rd_data_en),
       .rd_data_addr                    (rd_data_addr[3:0]),
       .rd_data_offset                  (rd_data_offset),
       .rd_data_end                     (rd_data_end),
       .rd_data                         (rd_data[APP_DATA_WIDTH-1:0]),
       .ecc_multiple                    (ecc_multiple[3:0]),
       .rd_accepted                     (rd_accepted));


endmodule // ui_top

// Local Variables:
// verilog-library-directories:("." "../mc")
// End:
