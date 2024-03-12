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
// Purpose :
//           64-bit AHB ZBT SRAM controller
//           Also support 2nd 32-bit APB interface (low priority)
// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module ahb_zbtram_64
 #(
  parameter AW = 23 // 23 is 8MB
  )
  (
   // AHB interface

    // Inputs
    input  wire        HCLK,      // system bus clock (for both interface)
    input  wire        HRESETn,   // reset input (active low)

    input  wire        HSELSSRAM, // AHB peripheral select
    input  wire [31:0] HADDR,     // AHB address bus
    input  wire        HREADYIn,  // AHB ready input
    input  wire [1:0]  HTRANS,    // AHB transfer type
    input  wire [1:0]  HSIZE,     // AHB hsize
    input  wire        HWRITE,    // AHB hwrite
    input  wire [63:0] HWDATA,

    // Outputs
    output wire        HREADYOut, // AHB ready output to S->M mux
    output wire        HRESP,     // AHB response
    output wire [63:0] HRDATA,

   // APB interface (2nd master, lower priority)
    input  wire [31:0] PADDR,
    input  wire        PSEL,
    input  wire        PENABLE,
    input  wire        PWRITE,
    input  wire  [3:0] PSTRB,
    input  wire [31:0] PWDATA,

    output wire [31:0] PRDATA,
    output wire        PREADY,
    output wire        PSLVERR,


   // SRAM interface

    output wire [AW-4:0] SADDR,   // SSRAM Address
    output wire        SDATAEN,   // SSRAM tristate enable
    output wire  [7:0] SnWBYTE,   // SSRAM byte lane writes
    output wire        SnOE,      // SSRAM output enable
    output wire  [1:0] SnCE,      // SSRAM chip enable (active low)
    output wire        SADVnLD,   // SSRAM advance / load
    output wire        SnWR,      // SSRAM write
    output wire        SnCKE,     // SSRAM write Clock enable

    output wire [63:0] SWDATA,    // Write data
    input  wire [63:0] SRDATA,    // Read data
    output wire        rdmux_sel //  read data mux control for 32-bit AHB master
);


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
localparam RSP_OKAY   = 1'b0;
localparam RSP_ERROR  = 1'b1;

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

  wire          trans_valid_ahb;        // Module is selected with valid transfer
  wire          trans_valid_apb;        // Module is selected with valid transfer
  wire          trans_start_apb;
  wire          trans_valid_ahb_l;      // Module is selected with valid transfer (lower word)
  wire          trans_valid_ahb_u;      // Module is selected with valid transfer (upper word)

  wire          trans_valid_apb_l;      // Module is selected with valid transfer (lower word)
  wire          trans_valid_apb_u;      // Module is selected with valid transfer (upper word)

  reg           reg_addr2;       // Bit 2 of address


// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------

  // State machine vars
  reg           reg_wr_dataphase;
  wire          nxt_wr_dataphase;
  reg           reg_rd_dataphase;
  wire          nxt_rd_dataphase;
  wire    [1:0] nxt_dataphase; // bit 0 - lower word, bit 1 - higher word
  reg     [1:0] reg_dataphase;
  reg           reg_apb_hold;  // Stall APB transfer request
  reg           nxt_apb_hold;  // next cycle of reg_apb_hold
  reg           reg_apb_dphase; // data phase for mux
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
// TrnValid transfer detection
// The slave must only respond to a valid transfer, so this must be detected.
// Valid AHB transfers only take place when a non-sequential or sequential
// transfer is shown on HTRANS - an idle or busy transfer should be ignored.
// -----------------------------------------------------------------------------
  assign trans_valid_ahb   = HSELSSRAM & HREADYIn & HTRANS[1];
  assign trans_valid_ahb_l = trans_valid_ahb & ((~HADDR[2])|(HSIZE[1:0]==2'b11));
  assign trans_valid_ahb_u = trans_valid_ahb & (( HADDR[2])|(HSIZE[1:0]==2'b11));

  assign trans_start_apb   = PSEL & ~PENABLE;
  assign trans_valid_apb   = trans_start_apb|reg_apb_hold;
  assign trans_valid_apb_l = trans_valid_apb & (~PADDR[2]);
  assign trans_valid_apb_u = trans_valid_apb & ( PADDR[2]);

  // Detect stalling of APB
  always @(trans_start_apb or trans_valid_ahb or reg_apb_hold)
  begin
    if (trans_start_apb & trans_valid_ahb)
      nxt_apb_hold = 1'b1; // Both masters try to access ZBT SRAM
    else
      nxt_apb_hold = (trans_valid_ahb & reg_apb_hold);
  end

  // Hold APB request until AHB is idle
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_apb_hold <= 1'b0;
  else
    reg_apb_hold <= nxt_apb_hold;
  end

  // Write data phase
  // Note: APB don't have address phase & data phase, but we make
  //       use of the 2 cycle property to divide it into address
  //       and data phases.
  //       If APB is write but AHB is read, AHB has higher priority
  //       so it will be a read operation
  assign nxt_wr_dataphase = (trans_valid_ahb & HWRITE) |
   ((trans_valid_apb & ~trans_valid_ahb) & PWRITE);

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_wr_dataphase <= 1'b0;
  else
    reg_wr_dataphase <= nxt_wr_dataphase;
  end

  // Read data phase
  // Note: APB don't have address phase & data phase, but we make
  //       use of the 2 cycle property to divide it into address
  //       and data phases.
  //       If APB is read but AHB is write, AHB has higher priority
  //       so it will be a write operation
  assign nxt_rd_dataphase = (trans_valid_ahb & ~HWRITE) |
   ((trans_valid_apb & ~trans_valid_ahb) & (~PWRITE));

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_rd_dataphase <= 1'b0;
  else
    reg_rd_dataphase <= nxt_rd_dataphase;
  end

  // register address bit 2 for data mux ctrl
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      reg_addr2 <= 1'b0;
    else
      if (trans_valid_ahb)
        reg_addr2 <= HADDR[2];
      else if (trans_valid_apb)
        reg_addr2 <= PADDR[2];
    end

  assign rdmux_sel = reg_addr2;

  // Chip select for lower word
  assign   nxt_dataphase[1] =
    (trans_valid_ahb & (HADDR[2] | HSIZE[1:0] ==2'b11)) |
    (trans_valid_apb & (~trans_valid_ahb) | PADDR[2]);
  assign   nxt_dataphase[0] =
    (trans_valid_ahb & (~HADDR[2] | HSIZE[1:0] ==2'b11)) |
    (trans_valid_apb & (~trans_valid_ahb) | ~PADDR[2]);

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_dataphase <= 2'b00;
  else
    reg_dataphase <= nxt_dataphase;
  end

  // -----------------------------------------------------------------------------
  // ZBT SRAM output drivers
  // -----------------------------------------------------------------------------

  wire [7:0] bytestrobe_c1; // active low
  wire [7:0] bytestrobe_c2; // active low
  wire [7:0] bytestrobe_c3; // active low
  wire [7:0] bytestrobe_c4; // active low

  // AHB Byte strobe encoding
  assign bytestrobe_c1[0] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b000) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b00 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b0  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[1] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b001) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b00 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b0  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[2] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b010) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b01 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b0  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[3] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b011) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b01 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b0  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[4] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b100) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b10 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b1  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[5] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b101) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b10 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b1  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[6] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b110) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b11 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b1  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  assign bytestrobe_c1[7] = ((HSIZE[1:0] == 2'b00) && (HADDR[2:0] == 3'b111) ||
                             (HSIZE[1:0] == 2'b01) && (HADDR[2:1] == 2'b11 ) ||
                             (HSIZE[1:0] == 2'b10) && (HADDR[2  ] == 1'b1  ) ||
                             (HSIZE[1:0] == 2'b11)) ? 1'b0 : 1'b1;
  // Mask out byte strobe if it is not AHB write
  assign bytestrobe_c2 = (trans_valid_ahb & HWRITE) ? bytestrobe_c1 : 8'b11111111;
  // Byte strobe from APB interface
  assign bytestrobe_c3 = PADDR[2] ? {~PSTRB[3:0], 4'b1111} : {4'b1111, ~PSTRB[3:0]};
  // Select between byte strobe from APB or AHB
  assign bytestrobe_c4 = (trans_valid_apb & PWRITE) ? bytestrobe_c3 : bytestrobe_c2;

  // SRAM DATA tristate control passed to top top level (active low)
  assign SDATAEN      = ~reg_wr_dataphase;

  assign SADDR        = (trans_valid_apb) ? PADDR[AW-1:3] : HADDR[AW-1:3];

  assign SnWBYTE      = bytestrobe_c4;

  assign SnCE[0]      = ~(trans_valid_ahb_l | trans_valid_apb_l | reg_dataphase[0]);
  assign SnCE[1]      = ~(trans_valid_ahb_u | trans_valid_apb_u | reg_dataphase[1]);

  assign SnWR         = (trans_valid_ahb) ? ~HWRITE : ~(trans_valid_apb & PWRITE);

  assign SADVnLD      = 1'b0;

  assign SnCKE        = 1'b0;

  assign SnOE         = ~reg_rd_dataphase;

  assign SWDATA       = (reg_apb_dphase) ? {PWDATA,PWDATA} : HWDATA;


  // Hold APB request until AHB is idle
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_apb_dphase <= 1'b0;
  else
    reg_apb_dphase <= trans_valid_apb;
  end

// -----------------------------------------------------------------------------
// AHB output drivers
// -----------------------------------------------------------------------------
  assign HRESP        = RSP_OKAY;
  assign HREADYOut    = 1'b1;
  assign HRDATA       = SRDATA;

// -----------------------------------------------------------------------------
// APB output drivers
// -----------------------------------------------------------------------------
  assign PSLVERR  = 1'b0;
  assign PREADY   = ~reg_apb_hold;
  assign PRDATA   = (PADDR[2]) ? SRDATA[63:32] : SRDATA[31:0];

endmodule

// --================================== End ==================================--
