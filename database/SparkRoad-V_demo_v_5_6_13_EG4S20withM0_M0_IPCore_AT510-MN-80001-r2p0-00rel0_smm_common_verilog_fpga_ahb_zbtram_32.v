//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB ZBT SRAM controller
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module ahb_zbtram_32 (
  // Inputs
  HCLK, HRESETn, HSELSSRAM, HREADYIn, HTRANS, HPROT, HSIZE, HWRITE, HADDR,

  // Outputs
  HREADYOut, HRESP, SADDR, SDATAEN, SnWBYTE, SnOE, SnCE, SADVnLD, SnWR, SnCKE
);

parameter AW = 22; // 22 is 4MB

// Inputs
input         HCLK;      // system bus clock
input         HRESETn;   // reset input (active low)
input         HSELSSRAM; // AHB peripheral select
input         HREADYIn;  // AHB ready input
input   [1:0] HTRANS;    // AHB transfer type
input   [3:0] HPROT;     // AHB hprot
input   [1:0] HSIZE;     // AHB hsize
input         HWRITE;    // AHB hwrite
input  [31:0] HADDR;     // AHB address bus

// Outputs
output        HREADYOut; // AHB ready output to S->M mux
output        HRESP;     // AHB response

output [AW-3:0] SADDR;     // SSRAM Address
output        SDATAEN;   // SSRAM tristate enable
output  [3:0] SnWBYTE;   // SSRAM byte lane writes
output        SnOE;      // SSRAM output enable
output        SnCE;      // SSRAM chip enable
output        SADVnLD;   // SSRAM advance / load
output        SnWR;      // SSRAM write
output        SnCKE;     // SSRAM write Clock enable

// Outputs
wire          HREADYOut; // AHB ready output to S->M mux
wire          HRESP;     // AHB response

wire   [AW-3:0] SADDR;     // SSRAM Address
wire          SDATAEN;   // SSRAM tristate enable
wire    [3:0] SnWBYTE;   // SSRAM byte lane writes
wire          SnOE;      // SSRAM output enable
wire          SnCE;      // SSRAM chip enable
wire          SADVnLD;   // SSRAM advance / load
wire          SnWR;      // SSRAM write
wire          SnCKE;     // SSRAM write Clock enable

// -----------------------------------------------------------------------------
//
//                                  AHBZBTRAM
//                                  =========
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
// AHB ZBT SRAM controller
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Constant declarations
// -----------------------------------------------------------------------------

// HRESP transfer response signal encoding
parameter RSP_OKAY   = 1'b0;
parameter RSP_ERROR  = 1'b1;

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

  wire          trans_valid;        // Module is selected with valid transfer
  wire   [3:0]  bytestrobe_c1;
  wire   [3:0]  bytestrobe_c2;

// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------

  reg           reg_wr_dataphase;
  reg           reg_rd_dataphase;
// -----------------------------------------------------------------------------
// Function declarations
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// trans_valid transfer detection
// The slave must only respond to a valid transfer, so this must be detected.
// Valid AHB transfers only take place when a non-sequential or sequential
// transfer is shown on HTRANS - an idle or busy transfer should be ignored.
// -----------------------------------------------------------------------------
  assign trans_valid  = HSELSSRAM & HREADYIn & HTRANS[1];

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_wr_dataphase <= 1'b0;
  else if (HREADYIn)
    reg_wr_dataphase <= trans_valid & HWRITE;
  end

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_rd_dataphase <= 1'b0;
  else if (HREADYIn)
    reg_rd_dataphase <= trans_valid & ~HWRITE;
  end

// -----------------------------------------------------------------------------
// ZBT SRAM output drivers
// -----------------------------------------------------------------------------

  // Byte strobes are active low
  assign bytestrobe_c1[0] = ((HADDR[1:0] == 2'b00) && (HSIZE[1:0] == 2'b00) ||
                             (HADDR[1]   == 1'b0 ) && (HSIZE[1:0] == 2'b01) ||
                             (HSIZE[1:0] == 2'b10)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[1] = ((HADDR[1:0] == 2'b01) && (HSIZE[1:0] == 2'b00) ||
                             (HADDR[1]   == 1'b0 ) && (HSIZE[1:0] == 2'b01) ||
                             (HSIZE[1:0] == 2'b10)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[2] = ((HADDR[1:0] == 2'b10) && (HSIZE[1:0] == 2'b00) ||
                             (HADDR[1]   == 1'b1 ) && (HSIZE[1:0] == 2'b01) ||
                             (HSIZE[1:0] == 2'b10)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[3] = ((HADDR[1:0] == 2'b11) && (HSIZE[1:0] == 2'b00) ||
                             (HADDR[1]   == 1'b1 ) && (HSIZE[1:0] == 2'b01) ||
                             (HSIZE[1:0] == 2'b10)) ? 1'b0 : 1'b1;

  assign bytestrobe_c2 = (trans_valid & HWRITE) ? bytestrobe_c1 : 4'b1111;


  // SRAM DATA tristate control passed to top top level (active low)
  assign SDATAEN      = ~reg_wr_dataphase;

  assign SADDR        = HADDR[AW-1:2];

  assign SnWBYTE      = bytestrobe_c2;


  assign SnCE         = ~(trans_valid | reg_rd_dataphase | reg_wr_dataphase);

  assign SnWR         = ~(trans_valid & HWRITE);

  assign SADVnLD      = 1'b0;

  assign SnCKE        = 1'b0;

  assign SnOE         = ~reg_rd_dataphase;

// -----------------------------------------------------------------------------
// AHB output drivers
// -----------------------------------------------------------------------------
  assign HRESP        = RSP_OKAY;
  assign HREADYOut    = 1'b1;

endmodule

// --================================== End ==================================--
