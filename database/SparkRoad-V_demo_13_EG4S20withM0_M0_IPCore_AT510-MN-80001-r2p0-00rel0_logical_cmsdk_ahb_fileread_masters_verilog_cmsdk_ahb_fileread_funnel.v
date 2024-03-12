//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-07-30 18:07:21 +0100 (Mon, 30 Jul 2012) $
//
//      Revision            : $Revision: 216980 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Convert 64-bit bus from ahb_fileread_core to 32-bit
//-----------------------------------------------------------------------------
//  ----------------------------------------------------------------------------
//  Purpose             : A data bus multiplexor, used to connect a 32 bit slave
//                        to a 64 bit bus.
//                        Supports transfers up to 32 bit in size.
//  --========================================================================--

`timescale 1ns/1ps

module cmsdk_ahb_fileread_funnel (
 // Clock and Reset
 input  wire        HCLK,
 input  wire        HRESETn,
 // Interface to AHB
 input  wire        HADDR2S,
 input  wire [63:0] HWDATAS,
 input  wire        HREADYS,
 output wire [63:0] HRDATAS,
 // Interface to slave
 output reg  [31:0] HWDATAM,
 input  wire [31:0] HRDATAM);

// -----------------------------------------------------------------------------
// Signal Declarations
// -----------------------------------------------------------------------------

reg        haddr2s_reg;       // Delayed version of address bit2

// =============================================================================
// Beginning of main verilog code
// =============================================================================

//------------------------------------------------------------------------------
// Generate Delayed version of HADDR2S
//------------------------------------------------------------------------------
always@(posedge HCLK or negedge HRESETn)
  begin : p_haddr2s_reg
    if (HRESETn == 1'b0)
      haddr2s_reg <= 1'b0;
    else
      begin
        if (HREADYS == 1'b1)
        haddr2s_reg <= HADDR2S;
      end
  end // block: p_haddr2s_reg

// -----------------------------------------------------------------------------
// Write Data MUX
// -----------------------------------------------------------------------------
// Note: To support Big-Endian systems the polarity of the HWDATAM MUX should be
// reversed.

always@(haddr2s_reg or HWDATAS)
  begin : p_write_mux
    if (haddr2s_reg == 1'b0)
      HWDATAM = HWDATAS[31:0];
    else
      HWDATAM = HWDATAS[63:32];
  end // block: p_write_mux

// -----------------------------------------------------------------------------
// Read Data bus
// -----------------------------------------------------------------------------
  assign HRDATAS = {HRDATAM,HRDATAM};


endmodule
// --================================= End ===================================--
