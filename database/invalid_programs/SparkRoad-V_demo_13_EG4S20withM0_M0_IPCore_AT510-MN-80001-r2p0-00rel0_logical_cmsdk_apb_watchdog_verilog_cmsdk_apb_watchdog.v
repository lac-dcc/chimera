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
//      Checked In          : $Date: 2013-04-18 11:30:44 +0100 (Thu, 18 Apr 2013) $
//
//      Revision            : $Revision: 244427 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : APB watchdog timer
//-----------------------------------------------------------------------------
//  Purpose            : Watchdog module containing 32-bit down-counter.
//

module cmsdk_apb_watchdog (
  // ---------------------------------------------------------------------------
  // Pin Declarations
  // ---------------------------------------------------------------------------

  input  wire         PCLK,        // APB clock
  input  wire         PRESETn,     // APB reset
  input  wire         PENABLE,     // APB enable
  input  wire         PSEL,        // APB periph select
  input  wire [11:2]  PADDR,       // APB address bus
  input  wire         PWRITE,      // APB write
  input  wire [31:0]  PWDATA,      // APB write data

  input  wire         WDOGCLK,     // Watchdog clock
  input  wire         WDOGCLKEN,   // Watchdog clock enable
  input  wire         WDOGRESn,    // Watchdog clock reset

  input  wire  [3:0]  ECOREVNUM,   // ECO revision number

  output wire [31:0]  PRDATA,      // APB read data

  output wire         WDOGINT,     // Watchdog interrupt
  output wire         WDOGRES);    // Watchdog timeout reset

`include "cmsdk_apb_watchdog_defs.v"

  //----------------------------------------------------------------------------
  //
  //                       Watchdog
  //                       ========
  //
  //----------------------------------------------------------------------------
  //
  // Overview
  // ========
  //
  // The Watchdog is a reference design of an APB-based slave which forms the
  //  hardware of a mechanism to monitor the correct behaviour of software
  //  execution and allow recovery after a system crash. The Watchdog generates
  //  a periodic interrupt, which must be serviced (cleared) by software
  //  interaction, but if this does not occur as the result of a fault that
  //  hangs the system, then a hard-reset is generated.
  //
  // The Watchdog has the following features:
  //
  //  * Flexible clocking scheme with separate clock enable.
  //  * 32-bit free-running down-counter (one instance).
  //  * Period load register.
  //  * Control register to enable reset and interrupt signals.
  //  * Interrupt status register.
  //  * Interrupt clear register.
  //  * Software controlled lock to prevent accidental write access.
  //  * Interrupt and Reset generation.
  //  * Integration Test registers.
  //  * PrimeCell and Peripheral ID registers.
  //
  // Module Address Map
  // ==================
  //
  // For information about the address map for this module, please refer to
  //  the constants defined in the WdogPackage include file and also the
  //  appropriate section of the Technical Reference Manual.
  //
  //----------------------------------------------------------------------------

//----------------------------------------------------------------------------
  // Watchdog Peripheral ID
  //
  // The Watchdog Peripheral ID is a 32-bit value composed of the
  // following 4 fields:
  // Bits[11:0] -> Part Number used to identify the peripheral
  //                For the Watchdog this is 0x824
  // Bits[19:12] -> Designer ID (ARM)
  //                ARM is designated 0x3B
  // Bits[23:20] -> Peripheral Revision Number
  //                For the Watchdog this is 0x1
  // Bits[31:24] -> Peripheral Configuration Options
  //                For the Watchdog this is 0x00
  //
  // The 32-bits are readable via 4 separate address locations with
  // each location returning 8 valid bits at positions[7:0]. The
  // values returned by the 4 Peripheral ID registers are given below:
  //
  // WDOG_PERIPH_ID0 = 0x24
  // WDOG_PERIPH_ID1 = 0xB8
  // WDOG_PERIPH_ID2 = 0x1B
  // WDOG_PERIPH_ID3 = 0xr0
  // WDOG_PERIPH_ID4 = 0x04
  // WDOG_PERIPH_ID5 = 0x00
  // WDOG_PERIPH_ID6 = 0x00
  // WDOG_PERIPH_ID7 = 0x00
  //----------------------------------------------------------------------------

  localparam  WDOG_PERIPH_ID0 = 8'h24;
  localparam  WDOG_PERIPH_ID1 = 8'hB8;
  localparam  WDOG_PERIPH_ID2 = 8'h1B;
  localparam  WDOG_PERIPH_ID3 = 4'h0;
  localparam  WDOG_PERIPH_ID4 = 8'h04;
  localparam  WDOG_PERIPH_ID5 = 8'h00;
  localparam  WDOG_PERIPH_ID6 = 8'h00;
  localparam  WDOG_PERIPH_ID7 = 8'h00;

  //----------------------------------------------------------------------------
  // Watchdog PrimeCell ID
  //
  // WDOG_PCELL_ID0 = 0x0D
  // WDOG_PCELL_ID1 = 0xF0
  // WDOG_PCELL_ID2 = 0x05
  // WDOG_PCELL_ID3 = 0xB1
  // These PrimeCell ID values should not be changed.
  //----------------------------------------------------------------------------
  localparam  WDOG_PCELL_ID0 = 8'h0D;
  localparam  WDOG_PCELL_ID1 = 8'hF0;
  localparam  WDOG_PCELL_ID2 = 8'h05;
  localparam  WDOG_PCELL_ID3 = 8'hB1;

  //----------------------------------------------------------------------------
  // Signal declarations
  //----------------------------------------------------------------------------

  // Internal Signals
  wire          frc_sel;          //  FRC select (address decoding)
  wire [31:0]   frc_data;         //  FRC data out
  reg [7:0]     wdog_pdata;       //  Peripheral/PrimeCell data out
  reg [31:0]    prdata_next;      //  Internal PRDATA
  reg [31:0]    i_prdata;         //  Registered prdata_next
  wire          prdata_next_en;   //  PRDATAEn register input
  wire          wdog_itcr_wr_en;  //  Write enable for Integration Test
                                  // Control Register
  reg           wdog_itcr;        //  Integration Test Control Register
  wire          wdog_itop_wr_en;  //  Write enable for Integration Test
                                  // Output Set Register
  reg [1:0]     wdog_itop;        //  Integration Test Output Set
                                  // Register
  wire          wdog_lock_wr_en;  //  Watchdog lock register write enable
  wire          wdog_lock_wr_val; //  Next Watchdog lock register value
  reg           wdog_lock;        //  Watchdog lock register
  wire          i_wdogint;      //  Counter interrupt
  wire          i_wdogres;      //  Counter reset

  //----------------------------------------------------------------------------
  // Beginning of main code
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Address Decoder for the Frc Register
  //----------------------------------------------------------------------------
  // Generates select line to the Watchdog free-running counter.

  assign frc_sel  = (PSEL & (PADDR [11:5] == `ARM_WDOG1A)) ? 1'b1 : 1'b0;


  //----------------------------------------------------------------------------
  // Watchdog Lock Register
  //----------------------------------------------------------------------------
  assign wdog_lock_wr_en = (PADDR == {`ARM_WDOGLA,`ARM_WDOGLOCKA}) ?
                        ((PSEL & PWRITE) & (~PENABLE)) : 1'b0;

  assign wdog_lock_wr_val =
  // 0x1ACCE551 - unlock
         (PWDATA == 32'h1ACCE551) ? 1'b0 :
  // any other value - lock
         1'b1;

  always @ (posedge PCLK or negedge PRESETn)
    begin : p_lock_seq
      // process p_LockSeq
      if (PRESETn == 1'b0)
        // asynchronous reset (active low)
        wdog_lock <= 1'b0;
      else
        // rising clock edge
        if (wdog_lock_wr_en)
          wdog_lock <= wdog_lock_wr_val;
    end

  //----------------------------------------------------------------------------
  // Integration Test Registers
  //----------------------------------------------------------------------------
  assign wdog_itcr_wr_en = (PADDR == {`ARM_WDOGIA,`ARM_WDOGTCRA}) ?
                        (PSEL & PWRITE & (~PENABLE) & (~wdog_lock)) : 1'b0;

  assign wdog_itop_wr_en = (PADDR == {`ARM_WDOGIA,`ARM_WDOGTOPA}) ?
                        (PSEL & PWRITE & (~PENABLE) & (~wdog_lock)) : 1'b0;

  always @ (posedge PCLK or negedge PRESETn)
    begin : p_tcr_seq
      // process p_TcrSeq
      if (PRESETn == 1'b0)
        // asynchronous reset (active low)
        wdog_itcr <= 1'b0;
      else
        // rising clock edge
        if (wdog_itcr_wr_en)
          wdog_itcr <= PWDATA[0];
    end

  always @ (posedge PCLK or negedge PRESETn)
    begin : p_top_seq
      // process p_TopSeq
      if (PRESETn == 1'b0)
        // asynchronous reset (active low)
        wdog_itop <= 2'b00;
      else
        // rising clock edge
          if (wdog_itop_wr_en)
            wdog_itop <= PWDATA[1:0];
    end

  //----------------------------------------------------------------------------
  // Output data generation
  //----------------------------------------------------------------------------

  // Address decoding for register reads.
  assign prdata_next_en = PSEL & (~PWRITE) & (~PENABLE);

  // Selects output data from address bus.
  always @ (prdata_next_en or PADDR or frc_data or wdog_pdata or wdog_lock
            or wdog_itcr)
    begin : p_prdata_next_comb
      case (prdata_next_en)
       1'b1:
         prdata_next =
             ((PADDR[11:5]==`ARM_WDOG1A)? frc_data : {32{1'b0}})|
             ((PADDR[11:5]==`ARM_WDOGLA)? {{31{1'b0}},wdog_lock}: {32{1'b0}})|
             ((PADDR[11:5]==`ARM_WDOGIA)? {{31{1'b0}},wdog_itcr}: {32{1'b0}})|
             (((PADDR[11:5]==`ARM_WDOGPA1)|
             (PADDR[11:5]==`ARM_WDOGPA2))?  {{24{1'b0}}, wdog_pdata} : {32{1'b0}});
       1'b0:
         prdata_next = {32{1'b0}};
       default:
         prdata_next = {32{1'bx}};
       endcase
    end

  // Selection of read data from Peripheral and PrimeCell ID
  // registers is separated from the prdata_next mux to reduce the
  // depth of mux needed for Frc register data
  always @ (prdata_next_en or PADDR or
            ECOREVNUM )
    begin : p_wdog_pdata_comb
      case (prdata_next_en)
       1'b1: begin
         case (PADDR[5:2])
          `ARM_WPERIPHID4A:   wdog_pdata = WDOG_PERIPH_ID4;
          `ARM_WPERIPHID5A:   wdog_pdata = WDOG_PERIPH_ID5;
          `ARM_WPERIPHID6A:   wdog_pdata = WDOG_PERIPH_ID6;
          `ARM_WPERIPHID7A:   wdog_pdata = WDOG_PERIPH_ID7;
          `ARM_WPERIPHID0A:   wdog_pdata = WDOG_PERIPH_ID0;
          `ARM_WPERIPHID1A:   wdog_pdata = WDOG_PERIPH_ID1;
          `ARM_WPERIPHID2A:   wdog_pdata = WDOG_PERIPH_ID2;
          `ARM_WPERIPHID3A:   wdog_pdata = {ECOREVNUM,WDOG_PERIPH_ID3} ;
          `ARM_WPCELLID0A :   wdog_pdata = WDOG_PCELL_ID0;
          `ARM_WPCELLID1A :   wdog_pdata = WDOG_PCELL_ID1;
          `ARM_WPCELLID2A :   wdog_pdata = WDOG_PCELL_ID2;
          `ARM_WPCELLID3A :   wdog_pdata = WDOG_PCELL_ID3;
          4'h0, 4'h1,4'h2,4'h3: wdog_pdata = {8{1'b0}};
          default:  wdog_pdata = {8{1'bx}};
         endcase
       end
       1'b0: begin
         wdog_pdata = {8{1'b0}};
       end
       default: begin
         wdog_pdata = {8{1'bx}};
       end
      endcase
    end // block: p_wdog_pdata_comb

  // Register used to reduce output delay during reads.
  always @ (negedge PRESETn or posedge PCLK)
    begin : p_i_prdata_seq
      if (PRESETn == 1'b0)
        i_prdata <= {32{1'b0}};
      else
        i_prdata <= prdata_next;
    end

  // Drive output with internal version.
  assign PRDATA = i_prdata;

  //----------------------------------------------------------------------------
  // Free running counter block
  //----------------------------------------------------------------------------

  cmsdk_apb_watchdog_frc  u_apb_watchdog_frc
    (.PCLK      (PCLK),
     .PRESETn   (PRESETn),
     .PADDR     (PADDR[4:2]),
     .PWRITE    (PWRITE),
     .PWDATA    (PWDATA),
     .PENABLE   (PENABLE),
     .frc_sel   (frc_sel),
     .wdog_lock (wdog_lock),
     .WDOGCLK   (WDOGCLK),
     .WDOGCLKEN (WDOGCLKEN),
     .WDOGRESn  (WDOGRESn),
     .WDOGINT   (i_wdogint),
     .WDOGRES   (i_wdogres),
     .frc_data  (frc_data)
    );
  // Drive interrupt and reset outputs
  assign WDOGINT = (wdog_itcr == 1'b0) ? i_wdogint : wdog_itop[1];
  assign WDOGRES = (wdog_itcr == 1'b0) ? i_wdogres : wdog_itop[0];


endmodule
