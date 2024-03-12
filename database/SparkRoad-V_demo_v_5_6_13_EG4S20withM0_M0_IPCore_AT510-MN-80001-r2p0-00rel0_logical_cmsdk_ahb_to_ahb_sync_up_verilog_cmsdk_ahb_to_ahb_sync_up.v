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
//      Checked In          : $Date: 2013-04-10 15:07:36 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243494 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB to AHB sync up bridge
//            The support for write buffer and burst are configurable
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Functional Overview
//-----------------------------------------------------------------------------
//
//           +----+     +------------+
//  AHB1 +---+-WB-+-----+S  Bridge  M+--+ AHB2
//           +----+     +------------+
//   HCLKS         HCLKS                  HCLKM
//
// The Synchronous Step-Up (1:N) Bridge is used to connect AHB buses where the
// target bus (AHB2) is running at a clock frequency which is a multiple of that
// of the originating bus (AHB1). The clock of AHB1 is driven by HCLKS (S for
// slave side) and the clock of AHB2 is HCLKM (M for Master side). The clock
// ratio HCLKS:HCLKM is of the form 1:N where N is an integer.
//
// The bridge is driven by one clock, HCLK, at the higher
// frequency HCLKM. Co-incident rising edges on the two clocks are indicated
// with the HCLKEN input as shown below for a ratio of 1:3.
//          _   _   _   _   _   _   _   _   _   _   _   _   _   _   _
// HCLKM  _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_
//          _____       _____       _____       _____       _____
// HCLKS  _|     |_____|     |_____|     |_____|     |_____|     |_____
//        ___         ___         ___         ___         ___         _
// HCLKEN    |_______|   |_______|   |_______|   |_______|   |_______|
//
//------------------------------------------------------------------------------

module cmsdk_ahb_to_ahb_sync_up #(
// --------------------------------------------------------------------------------
// Parameters
// --------------------------------------------------------------------------------

 parameter       AW    = 32,  //Define the address width of AHB bridge
 parameter       DW    = 32,  //Define the data width of AHB bridge
 parameter       MW    = 1,   //Define the width of HMASTER signal
 parameter       BURST = 0,   //Define whether support burst transfer:
                // 0: not support, burst transfers are converted to single transfers
                // 1: supported
 parameter       WB    = 0)   //Define whether support write buffer
                // 0: not support, up stream AHB need to wait for all transfer completions
                // 1: supported, up stream AHB do not have to wait for completion of single
                //    bufferable writes
 (
// --------------------------------------------------------------------------------
// IO declaration
// --------------------------------------------------------------------------------



  input  wire          HCLK,       // Clock
  input  wire          HRESETn,    // Reset
  input  wire          HCLKEN,     // Clock enable signal - divide control for slow AHB

  // AHB bridge slave side signals: connect to master
  input  wire          HSELS,
  input  wire [AW-1:0] HADDRS,
  input  wire    [1:0] HTRANSS,
  input  wire    [2:0] HSIZES,
  input  wire          HWRITES,
  input  wire          HREADYS,
  input  wire    [3:0] HPROTS,
  input  wire [MW-1:0] HMASTERS,
  input  wire          HMASTLOCKS,
  input  wire [DW-1:0] HWDATAS,
  input  wire    [2:0] HBURSTS,

  output wire          HREADYOUTS,
  output wire          HRESPS,
  output wire [DW-1:0] HRDATAS,

  output wire          BWERR,     // Bufferable write error signal, valid for one slow HCLK cycle

  // AHB bridge master side signals: connect to slave
  output wire [AW-1:0] HADDRM,
  output wire   [1:0]  HTRANSM,
  output wire   [2:0]  HSIZEM,
  output wire          HWRITEM,
  output wire   [3:0]  HPROTM,
  output wire [MW-1:0] HMASTERM,
  output wire          HMASTLOCKM,
  output wire [DW-1:0] HWDATAM,
  output wire   [2:0]  HBURSTM,

  input  wire          HREADYM,
  input  wire          HRESPM,
  input  wire [DW-1:0] HRDATAM);

 // --------------------------------------------------------------------------------
 // Internal wires declarations
 // --------------------------------------------------------------------------------

  wire          BUFFERABLE; // Indicate transfer is bufferable.
                            // This can be abstracted from HPROT[2], or
                            // alternatively this can be decode from memory address


  wire          hsels_i;
  wire [AW-1:0] haddrs_i;
  wire    [1:0] htranss_i;
  wire    [2:0] hsizes_i;
  wire          hwrites_i;
  wire          hreadys_i;
  wire    [3:0] hprots_i;
  wire [MW-1:0] hmasters_i;
  wire          hmastlocks_i;
  wire [DW-1:0] hwdatas_i;
  wire    [2:0] hbursts_i;
  wire          hreadyouts_i;
  wire          hresps_i;
  wire [DW-1:0] hrdatas_i;



 // --------------------------------------------------------------------------------
 // write buffer module
 // --------------------------------------------------------------------------------

 assign BUFFERABLE = HPROTS[2];  // Write Buffer is used when HPROTS[2] is 1

 generate
   if (WB ==1 ) begin: gen_wb_support //support write buffer
     cmsdk_ahb_to_ahb_sync_wb #(
      .AW (AW),
      .DW (DW),
      .MW (MW)
      )
     u_ahb_to_ahb_sync_up_wb (
         .HCLK            (HCLK),
         .HRESETn         (HRESETn),
         .HCLKEN          (HCLKEN),

         .BUFFERABLE      (BUFFERABLE),

         //AHB slave interface
         .HSELS           (HSELS),
         .HADDRS          (HADDRS),
         .HTRANSS         (HTRANSS),
         .HSIZES          (HSIZES),
         .HWRITES         (HWRITES),
         .HREADYS         (HREADYS),
         .HPROTS          (HPROTS),
         .HMASTERS        (HMASTERS),
         .HMASTLOCKS      (HMASTLOCKS),
         .HWDATAS         (HWDATAS),
         .HBURSTS         (HBURSTS),

         .HREADYOUTS      (HREADYOUTS),
         .HRESPS          (HRESPS),
         .HRDATAS         (HRDATAS),
         .BWERR           (BWERR),  //Bufferable write error signal, valid for one slow HCLK cycle

         //AHB master interface
         .HSELM           (hsels_i),
         .HADDRM          (haddrs_i),
         .HTRANSM         (htranss_i),
         .HSIZEM          (hsizes_i),
         .HWRITEM         (hwrites_i),
         .HREADYM         (hreadys_i),
         .HPROTM          (hprots_i),
         .HMASTERM        (hmasters_i),
         .HMASTLOCKM      (hmastlocks_i),
         .HWDATAM         (hwdatas_i),
         .HBURSTM         (hbursts_i),

         .HREADYOUTM      (hreadyouts_i),
         .HRESPM          (hresps_i),
         .HRDATAM         (hrdatas_i)
      );


   end
   else begin: gen_no_wb_support   //write buffer is not included
     // AHB slave interface signals connected directly to bridge core

     assign      hsels_i     = HSELS;
     assign      haddrs_i    = HADDRS;
     assign      htranss_i   = HTRANSS;
     assign      hsizes_i    = HSIZES;
     assign      hwrites_i   = HWRITES;
     assign      hreadys_i   = HREADYS;
     assign      hprots_i    = HPROTS;
     assign      hmasters_i  = HMASTERS;
     assign      hmastlocks_i= HMASTLOCKS;
     assign      hwdatas_i   = HWDATAS;
     assign      hbursts_i   = HBURSTS;
     assign      HREADYOUTS  = hreadyouts_i;
     assign      HRESPS      = hresps_i;
     assign      HRDATAS     = hrdatas_i;

     assign      BWERR       = 1'b0;
   end
 endgenerate



 // --------------------------------------------------------------------------------
 // Sync down bridge core module
 // --------------------------------------------------------------------------------
 cmsdk_ahb_to_ahb_sync_up_core
 #(
  .AW(AW),
  .DW(DW),
  .MW(MW),
  .BURST(BURST)
 )
 u_ahb_to_ahb_sync_up_core(
         .HCLK            (HCLK),
         .HCLKEN          (HCLKEN),
         .HRESETn         (HRESETn),
         //bridge slave interface (slow AHB)
         .HSELS           (hsels_i),
         .HADDRS          (haddrs_i),
         .HTRANSS         (htranss_i),
         .HSIZES          (hsizes_i),
         .HWRITES         (hwrites_i),
         .HREADYS         (hreadys_i),
         .HPROTS          (hprots_i),
         .HMASTERS        (hmasters_i),
         .HMASTLOCKS      (hmastlocks_i),
         .HWDATAS         (hwdatas_i),
         .HBURSTS         (hbursts_i),

         .HREADYOUTS      (hreadyouts_i),
         .HRESPS          (hresps_i),
         .HRDATAS         (hrdatas_i),

         // bridge master interface (fast AHB)
         .HADDRM          (HADDRM),
         .HTRANSM         (HTRANSM),
         .HSIZEM          (HSIZEM),
         .HWRITEM         (HWRITEM),
         .HPROTM          (HPROTM),
         .HMASTLOCKM      (HMASTLOCKM),
         .HWDATAM         (HWDATAM),
         .HMASTERM        (HMASTERM),
         .HBURSTM         (HBURSTM),

         .HREADYM         (HREADYM),
         .HRESPM          (HRESPM),
         .HRDATAM         (HRDATAM)
       );


endmodule  // End of module


