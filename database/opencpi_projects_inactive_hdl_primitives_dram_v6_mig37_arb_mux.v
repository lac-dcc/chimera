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
//  /   /         Filename              : arb_mux.v
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


`timescale 1 ns / 1 ps

module arb_mux #
  (
   parameter TCQ = 100,
   parameter ADDR_CMD_MODE            = "UNBUF",
   parameter BANK_VECT_INDX           = 11,
   parameter BANK_WIDTH               = 3,
   parameter BURST_MODE               = "8",
   parameter CS_WIDTH                 = 4,
   parameter DATA_BUF_ADDR_VECT_INDX  = 31,
   parameter DATA_BUF_ADDR_WIDTH      = 8,
   parameter DRAM_TYPE                = "DDR3",
   parameter EARLY_WR_DATA_ADDR       = "OFF",
   parameter ECC                      = "OFF",
   parameter nBANK_MACHS              = 4,
   parameter nCK_PER_CLK              = 2,       // # DRAM CKs per fabric CLKs
   parameter nCS_PER_RANK             = 1,
   parameter nCNFG2WR                 = 2,
   parameter nSLOTS                   = 2,
   parameter RANK_VECT_INDX           = 15,
   parameter RANK_WIDTH               = 2,
   parameter ROW_VECT_INDX            = 63,
   parameter ROW_WIDTH                = 16,
   parameter RTT_NOM                  = "40",
   parameter RTT_WR                   = "120",
   parameter SLOT_0_CONFIG            = 8'b0000_0101,
   parameter SLOT_1_CONFIG            = 8'b0000_1010
  )
  (/*AUTOARG*/
  // Outputs
  sent_row, sent_col, sending_row, io_config_valid_r, io_config,
  dfi_we_n1, dfi_we_n0, dfi_ras_n1, dfi_ras_n0, dfi_odt_wr1,
  dfi_odt_wr0, dfi_odt_nom1, dfi_odt_nom0, dfi_cs_n1, dfi_cs_n0,
  dfi_cas_n1, dfi_cas_n0, dfi_bank1, dfi_bank0, dfi_address1,
  dfi_address0, col_wr_data_buf_addr, col_size, col_row, col_rmw,
  col_ra, col_periodic_rd, col_data_buf_addr, col_ba, col_a,
  sending_col, io_config_strobe, insert_maint_r1,
  // Inputs
  slot_1_present, slot_0_present, rts_row, rts_col, rtc, row_cmd_wr,
  row_addr, req_wr_r, req_size_r, req_row_r, req_ras, req_rank_r,
  req_periodic_rd_r, req_data_buf_addr_r, req_cas, req_bank_r,
  rd_wr_r, maint_zq_r, maint_rank_r, insert_maint_r,
  force_io_config_rd_r, col_rdy_wr, col_addr, clk, rst
  );

  /*AUTOINPUT*/
  // Beginning of automatic inputs (from unused autoinst inputs)
  input [ROW_VECT_INDX:0] col_addr;             // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] col_rdy_wr;           // To arb_row_col0 of arb_row_col.v
  input                 force_io_config_rd_r;   // To arb_row_col0 of arb_row_col.v
  input                 insert_maint_r;         // To arb_row_col0 of arb_row_col.v
  input [RANK_WIDTH-1:0] maint_rank_r;          // To arb_select0 of arb_select.v
  input                 maint_zq_r;             // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] rd_wr_r;              // To arb_select0 of arb_select.v
  input [BANK_VECT_INDX:0] req_bank_r;          // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] req_cas;              // To arb_select0 of arb_select.v
  input [DATA_BUF_ADDR_VECT_INDX:0] req_data_buf_addr_r;// To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] req_periodic_rd_r;    // To arb_select0 of arb_select.v
  input [RANK_VECT_INDX:0] req_rank_r;          // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] req_ras;              // To arb_select0 of arb_select.v
  input [ROW_VECT_INDX:0] req_row_r;            // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] req_size_r;           // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] req_wr_r;             // To arb_select0 of arb_select.v
  input [ROW_VECT_INDX:0] row_addr;             // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] row_cmd_wr;           // To arb_select0 of arb_select.v
  input [nBANK_MACHS-1:0] rtc;                  // To arb_row_col0 of arb_row_col.v
  input [nBANK_MACHS-1:0] rts_col;              // To arb_row_col0 of arb_row_col.v
  input [nBANK_MACHS-1:0] rts_row;              // To arb_row_col0 of arb_row_col.v
  input [7:0]           slot_0_present;         // To arb_select0 of arb_select.v
  input [7:0]           slot_1_present;         // To arb_select0 of arb_select.v
  // End of automatics

  /*AUTOOUTPUT*/
  // Beginning of automatic outputs (from unused autoinst outputs)
  output [ROW_WIDTH-1:0] col_a;                 // From arb_select0 of arb_select.v
  output [BANK_WIDTH-1:0] col_ba;               // From arb_select0 of arb_select.v
  output [DATA_BUF_ADDR_WIDTH-1:0] col_data_buf_addr;// From arb_select0 of arb_select.v
  output                col_periodic_rd;        // From arb_select0 of arb_select.v
  output [RANK_WIDTH-1:0] col_ra;               // From arb_select0 of arb_select.v
  output                col_rmw;                // From arb_select0 of arb_select.v
  output [ROW_WIDTH-1:0] col_row;               // From arb_select0 of arb_select.v
  output                col_size;               // From arb_select0 of arb_select.v
  output [DATA_BUF_ADDR_WIDTH-1:0] col_wr_data_buf_addr;// From arb_select0 of arb_select.v
  output [ROW_WIDTH-1:0] dfi_address0;          // From arb_select0 of arb_select.v
  output [ROW_WIDTH-1:0] dfi_address1;          // From arb_select0 of arb_select.v
  output [BANK_WIDTH-1:0] dfi_bank0;            // From arb_select0 of arb_select.v
  output [BANK_WIDTH-1:0] dfi_bank1;            // From arb_select0 of arb_select.v
  output                dfi_cas_n0;             // From arb_select0 of arb_select.v
  output                dfi_cas_n1;             // From arb_select0 of arb_select.v
  output [(CS_WIDTH*nCS_PER_RANK)-1:0] dfi_cs_n0;// From arb_select0 of arb_select.v
  output [(CS_WIDTH*nCS_PER_RANK)-1:0] dfi_cs_n1;// From arb_select0 of arb_select.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_nom0;// From arb_select0 of arb_select.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_nom1;// From arb_select0 of arb_select.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_wr0;// From arb_select0 of arb_select.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_wr1;// From arb_select0 of arb_select.v
  output                dfi_ras_n0;             // From arb_select0 of arb_select.v
  output                dfi_ras_n1;             // From arb_select0 of arb_select.v
  output                dfi_we_n0;              // From arb_select0 of arb_select.v
  output                dfi_we_n1;              // From arb_select0 of arb_select.v
  output [RANK_WIDTH:0] io_config;              // From arb_select0 of arb_select.v
  output                io_config_valid_r;      // From arb_row_col0 of arb_row_col.v
  output [nBANK_MACHS-1:0] sending_row;         // From arb_row_col0 of arb_row_col.v
  output                sent_col;               // From arb_row_col0 of arb_row_col.v
  output                sent_row;               // From arb_row_col0 of arb_row_col.v
  // End of automatics

  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire                  cs_en0;                 // From arb_row_col0 of arb_row_col.v
  wire                  cs_en1;                 // From arb_row_col0 of arb_row_col.v
  wire                  force_io_config_rd_r1;  // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_col_r;           // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_col_wr;          // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_config_r;        // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_row_r;           // From arb_row_col0 of arb_row_col.v
  wire                  send_cmd0_col;          // From arb_row_col0 of arb_row_col.v
  wire                  send_cmd1_row;          // From arb_row_col0 of arb_row_col.v
  // End of automatics

  input clk;
  input rst;

  output [nBANK_MACHS-1:0] sending_col;
  output io_config_strobe;
  output insert_maint_r1;

  arb_row_col #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .ADDR_CMD_MODE                     (ADDR_CMD_MODE),
     .EARLY_WR_DATA_ADDR                (EARLY_WR_DATA_ADDR),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nCNFG2WR                          (nCNFG2WR))
    arb_row_col0
      (/*AUTOINST*/
       // Outputs
       .grant_row_r                     (grant_row_r[nBANK_MACHS-1:0]),
       .sent_row                        (sent_row),
       .sending_row                     (sending_row[nBANK_MACHS-1:0]),
       .grant_config_r                  (grant_config_r[nBANK_MACHS-1:0]),
       .io_config_strobe                (io_config_strobe),
       .force_io_config_rd_r1           (force_io_config_rd_r1),
       .io_config_valid_r               (io_config_valid_r),
       .grant_col_r                     (grant_col_r[nBANK_MACHS-1:0]),
       .sending_col                     (sending_col[nBANK_MACHS-1:0]),
       .sent_col                        (sent_col),
       .grant_col_wr                    (grant_col_wr[nBANK_MACHS-1:0]),
       .send_cmd0_col                   (send_cmd0_col),
       .send_cmd1_row                   (send_cmd1_row),
       .cs_en0                          (cs_en0),
       .cs_en1                          (cs_en1),
       .insert_maint_r1                 (insert_maint_r1),
       // Inputs
       .clk                             (clk),
       .rst                             (rst),
       .rts_row                         (rts_row[nBANK_MACHS-1:0]),
       .insert_maint_r                  (insert_maint_r),
       .rts_col                         (rts_col[nBANK_MACHS-1:0]),
       .rtc                             (rtc[nBANK_MACHS-1:0]),
       .force_io_config_rd_r            (force_io_config_rd_r),
       .col_rdy_wr                      (col_rdy_wr[nBANK_MACHS-1:0]));

  arb_select #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .ADDR_CMD_MODE                     (ADDR_CMD_MODE),
     .BANK_VECT_INDX                    (BANK_VECT_INDX),
     .BANK_WIDTH                        (BANK_WIDTH),
     .BURST_MODE                        (BURST_MODE),
     .CS_WIDTH                          (CS_WIDTH),
     .DATA_BUF_ADDR_VECT_INDX           (DATA_BUF_ADDR_VECT_INDX),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .DRAM_TYPE                         (DRAM_TYPE),
     .EARLY_WR_DATA_ADDR                (EARLY_WR_DATA_ADDR),
     .ECC                               (ECC),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nCS_PER_RANK                      (nCS_PER_RANK),
     .nSLOTS                            (nSLOTS),
     .RANK_VECT_INDX                    (RANK_VECT_INDX),
     .RANK_WIDTH                        (RANK_WIDTH),
     .ROW_VECT_INDX                     (ROW_VECT_INDX),
     .ROW_WIDTH                         (ROW_WIDTH),
     .RTT_NOM                           (RTT_NOM),
     .RTT_WR                            (RTT_WR),
     .SLOT_0_CONFIG                     (SLOT_0_CONFIG),
     .SLOT_1_CONFIG                     (SLOT_1_CONFIG))
    arb_select0
      (/*AUTOINST*/
       // Outputs
       .col_periodic_rd                 (col_periodic_rd),
       .col_ra                          (col_ra[RANK_WIDTH-1:0]),
       .col_ba                          (col_ba[BANK_WIDTH-1:0]),
       .col_a                           (col_a[ROW_WIDTH-1:0]),
       .col_rmw                         (col_rmw),
       .col_size                        (col_size),
       .col_row                         (col_row[ROW_WIDTH-1:0]),
       .col_data_buf_addr               (col_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .col_wr_data_buf_addr            (col_wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .dfi_bank0                       (dfi_bank0[BANK_WIDTH-1:0]),
       .dfi_address0                    (dfi_address0[ROW_WIDTH-1:0]),
       .dfi_ras_n0                      (dfi_ras_n0),
       .dfi_cas_n0                      (dfi_cas_n0),
       .dfi_we_n0                       (dfi_we_n0),
       .dfi_bank1                       (dfi_bank1[BANK_WIDTH-1:0]),
       .dfi_address1                    (dfi_address1[ROW_WIDTH-1:0]),
       .dfi_ras_n1                      (dfi_ras_n1),
       .dfi_cas_n1                      (dfi_cas_n1),
       .dfi_we_n1                       (dfi_we_n1),
       .dfi_cs_n0                       (dfi_cs_n0[(CS_WIDTH*nCS_PER_RANK)-1:0]),
       .dfi_cs_n1                       (dfi_cs_n1[(CS_WIDTH*nCS_PER_RANK)-1:0]),
       .io_config                       (io_config[RANK_WIDTH:0]),
       .dfi_odt_nom0                    (dfi_odt_nom0[(nSLOTS*nCS_PER_RANK)-1:0]),
       .dfi_odt_wr0                     (dfi_odt_wr0[(nSLOTS*nCS_PER_RANK)-1:0]),
       .dfi_odt_nom1                    (dfi_odt_nom1[(nSLOTS*nCS_PER_RANK)-1:0]),
       .dfi_odt_wr1                     (dfi_odt_wr1[(nSLOTS*nCS_PER_RANK)-1:0]),
       // Inputs
       .clk                             (clk),
       .rst                             (rst),
       .req_rank_r                      (req_rank_r[RANK_VECT_INDX:0]),
       .req_bank_r                      (req_bank_r[BANK_VECT_INDX:0]),
       .req_ras                         (req_ras[nBANK_MACHS-1:0]),
       .req_cas                         (req_cas[nBANK_MACHS-1:0]),
       .req_wr_r                        (req_wr_r[nBANK_MACHS-1:0]),
       .grant_row_r                     (grant_row_r[nBANK_MACHS-1:0]),
       .row_addr                        (row_addr[ROW_VECT_INDX:0]),
       .row_cmd_wr                      (row_cmd_wr[nBANK_MACHS-1:0]),
       .insert_maint_r1                 (insert_maint_r1),
       .maint_zq_r                      (maint_zq_r),
       .maint_rank_r                    (maint_rank_r[RANK_WIDTH-1:0]),
       .req_periodic_rd_r               (req_periodic_rd_r[nBANK_MACHS-1:0]),
       .req_size_r                      (req_size_r[nBANK_MACHS-1:0]),
       .rd_wr_r                         (rd_wr_r[nBANK_MACHS-1:0]),
       .req_row_r                       (req_row_r[ROW_VECT_INDX:0]),
       .col_addr                        (col_addr[ROW_VECT_INDX:0]),
       .req_data_buf_addr_r             (req_data_buf_addr_r[DATA_BUF_ADDR_VECT_INDX:0]),
       .grant_col_r                     (grant_col_r[nBANK_MACHS-1:0]),
       .grant_col_wr                    (grant_col_wr[nBANK_MACHS-1:0]),
       .send_cmd0_col                   (send_cmd0_col),
       .send_cmd1_row                   (send_cmd1_row),
       .cs_en0                          (cs_en0),
       .cs_en1                          (cs_en1),
       .force_io_config_rd_r1           (force_io_config_rd_r1),
       .grant_config_r                  (grant_config_r[nBANK_MACHS-1:0]),
       .io_config_strobe                (io_config_strobe),
       .slot_0_present                  (slot_0_present[7:0]),
       .slot_1_present                  (slot_1_present[7:0]));

endmodule

