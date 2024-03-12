// ----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//        (C) COPYRIGHT 2004-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      RCS Information:
//
//      RCS Filename       : $RCSfile$
//      Revision           : $Revision: 368444 $
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
// ----------------------------------------------------------------------------
//  Purpose : AHB BlockRam/OnChip
// ----------------------------------------------------------------------------

module ahb_blockram_32
  (/*AUTOARG*/
   //Inputs
   HCLK, HRESETn, HSELBRAM, HREADY, HTRANS, HSIZE, HWRITE, HADDR, HWDATA,
   //Outputs
   HREADYOUT, HRESP, HRDATA
   );

// --------------------------------------------------------------------------
// Parameter Declarations
// --------------------------------------------------------------------------
  parameter ADDRESSWIDTH = 12;

// -----------------------------------------------------------------------------
// Constant Declarations
// -----------------------------------------------------------------------------
  parameter AW  = (ADDRESSWIDTH-1);
  parameter AWT = ((1<<(AW-1))-1);
  // HTRANS transfer type signal encoding
  parameter TRN_IDLE   = 2'b00;
  parameter TRN_BUSY   = 2'b01;
  parameter TRN_NONSEQ = 2'b10;
  parameter TRN_SEQ    = 2'b11;
  // HRESP transfer response signal encoding
  parameter RSP_OKAY   = 1'b0;
  parameter RSP_ERROR  = 1'b1;
  parameter RSP_RETRY  = 1'b0;
  parameter RSP_SPLIT  = 1'b1;

// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  input         HCLK;      // system bus clock
  input         HRESETn;   // system bus reset
  input         HSELBRAM;  // AHB peripheral select
  input         HREADY;  // AHB ready input
  input   [1:0] HTRANS;    // AHB transfer type
  input   [1:0] HSIZE;     // AHB hsize
  input         HWRITE;    // AHB hwrite
  input  [AW:0] HADDR;     // AHB address bus
  input  [31:0] HWDATA;    // AHB write data bus
  output        HREADYOUT; // AHB ready output to S->M mux
  output        HRESP;     // AHB response
  output [31:0] HRDATA;    // AHB read data bus

// --------------------------------------------------------------------------
// Signal Declarations
// --------------------------------------------------------------------------
  // I/O pins
  wire          HCLK;      // system bus clock
  wire          HRESETn;   // system bus reset
  wire          HSELBRAM;  // AHB peripheral select
  wire          HREADY;  // AHB ready input
  wire    [1:0] HTRANS;    // AHB transfer type
  wire    [1:0] HSIZE;     // AHB hsize
  wire          HWRITE;    // AHB hwrite
  wire   [AW:0] HADDR;     // AHB address bus
  wire   [31:0] HWDATA;    // AHB write data bus
  wire          HREADYOUT; // AHB ready output to S->M mux
  wire          HRESP;     // AHB response
  wire   [31:0] HRDATA;    // AHB read data bus

  // Memory Array
  reg     [7:0] BRAM0 [0:AWT];
  reg     [7:0] BRAM1 [0:AWT];
  reg     [7:0] BRAM2 [0:AWT];
  reg     [7:0] BRAM3 [0:AWT];

  // Internal signals
  reg  [AW-2:0] reg_haddr;  // Registered address
  wire          trn_valid;  // Transfer valid
  wire    [3:0] nxt_wr_en;  // Next write enable
  reg     [3:0] reg_wr_en;  // Registered write enable
  wire          wr_en_actv; // Active Write enable

  // -----------------------------------------------------------------------------
  // Main body of code
  // -----------------------------------------------------------------------------

  assign trn_valid = HSELBRAM & HREADY & HTRANS[1];

  // -----------------------------------------------------------------------------
  // RAM Write Interface
  // -----------------------------------------------------------------------------
  assign wr_en_actv   = (trn_valid & HWRITE) | (|reg_wr_en);
  assign nxt_wr_en[0] = (((HADDR[1:0]==2'b00) && (HSIZE[1:0]==2'b00)) ||
                         ((HADDR[1]==1'b0)    && (HSIZE[1:0]==2'b01)) ||
                         ((HSIZE[1:0]==2'b10)))? trn_valid & HWRITE : 1'b0;

  assign nxt_wr_en[1] = (((HADDR[1:0]==2'b01) && (HSIZE[1:0]==2'b00)) ||
                         ((HADDR[1]==1'b0)    && (HSIZE[1:0]==2'b01)) ||
                         ((HSIZE[1:0]==2'b10)))? trn_valid & HWRITE : 1'b0;

  assign nxt_wr_en[2] = (((HADDR[1:0]==2'b10) && (HSIZE[1:0]==2'b00)) ||
                         ((HADDR[1]==1'b1)    && (HSIZE[1:0]==2'b01)) ||
                         ((HSIZE[1:0]==2'b10)))? trn_valid & HWRITE : 1'b0;

  assign nxt_wr_en[3] = (((HADDR[1:0]==2'b11) && (HSIZE[1:0]==2'b00)) ||
                         ((HADDR[1]==1'b1)    && (HSIZE[1:0]==2'b01)) ||
                        ((HSIZE[1:0]==2'b10))) ? trn_valid & HWRITE : 1'b0;

  always @ (negedge HRESETn or posedge HCLK)
    if (~HRESETn)
      reg_wr_en <= 4'b0000;
    else if (wr_en_actv)
      reg_wr_en <= nxt_wr_en;

  // Infer Block RAM - syntax is very specific.
  always @ (posedge HCLK)
    begin
      if (reg_wr_en[0])
        BRAM0[reg_haddr] <= HWDATA[7:0];
      if (reg_wr_en[1])
        BRAM1[reg_haddr] <= HWDATA[15:8];
      if (reg_wr_en[2])
        BRAM2[reg_haddr] <= HWDATA[23:16];
      if (reg_wr_en[3])
        BRAM3[reg_haddr] <= HWDATA[31:24];
      // do not use enable on read interface.
      reg_haddr <= HADDR[AW:2];
    end

  // -----------------------------------------------------------------------------
  // AHB Outputs
  // -----------------------------------------------------------------------------
  assign HRESP     = RSP_OKAY;
  assign HREADYOUT = 1'b1;
  assign HRDATA    = {BRAM3[reg_haddr],BRAM2[reg_haddr],
                      BRAM1[reg_haddr],BRAM0[reg_haddr]};

  // -----------------------------------------------------------------------------
  // Initial image
  // -----------------------------------------------------------------------------


`ifdef ARM_ASSERT_ON
  // Simulation
  integer i;

  initial begin
    for (i = 0; i <= AWT; i=i+1)
      begin
        BRAM0[i] = 8'h00;
        BRAM1[i] = 8'h00;
        BRAM2[i] = 8'h00;
        BRAM3[i] = 8'h00;
      end

    $readmemh("itcm3", BRAM3);
    $readmemh("itcm2", BRAM2);
    $readmemh("itcm1", BRAM1);
    $readmemh("itcm0", BRAM0);

  end
`else
  // Synthesis
  initial begin
    $readmemh("itcm3", BRAM3);
    $readmemh("itcm2", BRAM2);
    $readmemh("itcm1", BRAM1);
    $readmemh("itcm0", BRAM0);
    end

`endif // ARM_ASSERT_ON

endmodule
