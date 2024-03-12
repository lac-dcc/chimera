//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2012-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-08-02 16:26:56 +0100 (Thu, 02 Aug 2012) $
//
//      Revision            : $Revision: 217500 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//
// Simple AHB to IOP Bridge (for use with the IOP GPIO to make an AHB GPIO).
//
//-----------------------------------------------------------------------------

module cmsdk_ahb_to_iop
// ----------------------------------------------------------------------------
// Port Definitions
// ----------------------------------------------------------------------------
  (// AHB Inputs
   input  wire                 HCLK,      // system bus clock
   input  wire                 HRESETn,   // system bus reset
   input  wire                 HSEL,      // AHB peripheral select
   input  wire                 HREADY,    // AHB ready input
   input  wire  [1:0]          HTRANS,    // AHB transfer type
   input  wire  [2:0]          HSIZE,     // AHB hsize
   input  wire                 HWRITE,    // AHB hwrite
   input  wire [11:0]          HADDR,     // AHB address bus
   input  wire [31:0]          HWDATA,    // AHB write data bus

   // IOP Inputs
   input wire [31:0]           IORDATA,    // I/0 read data bus

   // AHB Outputs
   output wire                 HREADYOUT, // AHB ready output to S->M mux
   output wire                 HRESP,     // AHB response
   output wire [31:0]          HRDATA,

   // IOP Outputs
   output reg                  IOSEL,      // Decode for peripheral
   output reg  [11:0]          IOADDR,     // I/O transfer address
   output reg                  IOWRITE,    // I/O transfer direction
   output reg  [1:0]           IOSIZE,     // I/O transfer size
   output reg                  IOTRANS,    // I/O transaction
   output wire [31:0]          IOWDATA);   // I/O write data bus

  // ----------------------------------------------------------
  // Read/write control logic
  // ----------------------------------------------------------

  // registered HSEL, update only if selected to reduce toggling
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      IOSEL <= 1'b0;
    else
      IOSEL <= HSEL & HREADY;
  end

  // registered address, update only if selected to reduce toggling
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      IOADDR <= {12{1'b0}};
    else
      IOADDR <= HADDR[11:0];
  end

  // Data phase write control
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      IOWRITE <= 1'b0;
    else
      IOWRITE <= HWRITE;
  end

  // registered hsize, update only if selected to reduce toggling
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      IOSIZE <= {2{1'b0}};
    else
      IOSIZE <= HSIZE[1:0];
  end

  // registered HTRANS, update only if selected to reduce toggling
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      IOTRANS <= 1'b0;
    else
      IOTRANS <= HTRANS[1];
  end

  assign IOWDATA   = HWDATA;
  assign HRDATA    = IORDATA;
  assign HREADYOUT = 1'b1;
  assign HRESP     = 1'b0;

endmodule
