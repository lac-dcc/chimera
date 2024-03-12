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
// Abstract : AHB upsizer:
//            Interface 32 bits AHB-lite master to 64 bits AHB-lite slave
//-----------------------------------------------------------------------------
module cmsdk_ahb_upsizer64 (
  input  wire        HCLK,       // Clock
  input  wire        HRESETn,    // Reset

  // AHB connection to master
  input  wire        HSELS,
  input  wire [31:0] HADDRS,
  input  wire  [1:0] HTRANSS,
  input  wire  [2:0] HSIZES,
  input  wire        HWRITES,
  input  wire        HREADYS,
  input  wire  [3:0] HPROTS,
  input  wire  [2:0] HBURSTS,
  input  wire        HMASTLOCKS,
  input  wire [31:0] HWDATAS,

  output wire        HREADYOUTS,
  output wire        HRESPS,
  output wire [31:0] HRDATAS,

  // AHB output master port : 64 bit data bus interface
  output wire        HSELM,
  output wire [31:0] HADDRM,
  output wire  [1:0] HTRANSM,
  output wire  [2:0] HSIZEM,
  output wire        HWRITEM,
  output wire        HREADYM,
  output wire  [3:0] HPROTM,
  output wire  [2:0] HBURSTM,
  output wire        HMASTLOCKM,
  output wire [63:0] HWDATAM,

  input  wire        HREADYOUTM,
  input  wire        HRESPM,
  input  wire [63:0] HRDATAM);

  // ----------------------------------------
  // Internal wires declarations
   reg          hrdata_sel_reg;   // select the higher or lower 32
                            // bits data send from slave to master

  //-----------------------------------------------------------
  //Module logic start
  //----------------------------------------------------------

  // Data select signal
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      hrdata_sel_reg <= 1'b0; // by default lower 32 bits are selected
    else if (HREADYS & HSELS & HTRANSS[1])
      hrdata_sel_reg <= HADDRS[2];
    end

  // Outputs
  // The master and slave signals are connected directly, except data bus.
  // This arrangement allows a modular design integration in tools like
  // AMBA Designer
    // from slave to master
   assign HREADYOUTS = HREADYOUTM;
   assign HRESPS     = HRESPM;
   assign HRDATAS    = hrdata_sel_reg ? HRDATAM[63:32] : HRDATAM[31:0];

    // from master to slave
   assign HSELM      = HSELS;
   assign HADDRM     = HADDRS;
   assign HTRANSM    = HTRANSS;
   assign HREADYM    = HREADYS;
   assign HSIZEM     = HSIZES;
   assign HWRITEM    = HWRITES;
   assign HPROTM     = HPROTS;
   assign HBURSTM    = HBURSTS;
   assign HMASTLOCKM = HMASTLOCKS;
   assign HWDATAM    = {HWDATAS,HWDATAS}; // Replicate HWDATAS on lower and
                                          // upper 32 bits

  //-----------------------------------------------------------
  //Module logic end
  //----------------------------------------------------------

endmodule

