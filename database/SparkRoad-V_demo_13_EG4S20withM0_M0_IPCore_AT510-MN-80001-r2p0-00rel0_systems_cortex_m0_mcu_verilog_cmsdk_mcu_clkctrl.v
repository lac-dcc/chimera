//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2015 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368442 $
//  File Date           : $Date: 2017-07-25 15:07:59 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//------------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------
// Abstract : Simple clock controller for Cortex-M0 example system
//-----------------------------------------------------------------------------
// Note : Most of the clock gating are handled by the example PMU provided
//        in the Cortex-M0/Cortex-M0+ deliverable.

`include "cmsdk_mcu_defs.v"

module cmsdk_mcu_clkctrl #(
  parameter CLKGATE_PRESENT = 0)
 (
  input  wire       XTAL1,       // Clock source
  input  wire       NRST,        // active low external reset

  input  wire       APBACTIVE,   // APB active status
  input  wire       SLEEPING,    // Sleep status
  input  wire       SLEEPDEEP,   // Deep Sleep status
  input  wire       SYSRESETREQ, // System reset request
  input  wire       DBGRESETREQ, // Debug reset request
  input  wire       LOCKUP,      // LOCKUP status
  input  wire       LOCKUPRESET, // Config - generation reset if locked up

  input  wire       CGBYPASS,    // Clock gating bypass
  input  wire       RSTBYPASS,   // Reset by pass

  output wire       XTAL2,       // Feedback for Crystal oscillator
  output wire       FCLK,        // Free running clock
  output wire       PCLK,        // Peripheral clock
  output wire       PCLKG,       // Gated PCLK for APB transfers
  output wire       PCLKEN,      // Clock divide control for AHB to APB bridge
  output wire       PORESETn,    // Power on reset
  output wire       DBGRESETn,   // Debug reset
  output wire       HRESETn,     // System and AHB reset
  output wire       PRESETn);    // Peripheral reset

  wire         clk;
  wire         reset_n;
  reg  [2:0]   reset_sync_reg;
  wire [2:0]   nxt_reset_sync;
  reg          hrst_reg;
  wire         nxt_hrst;
  reg          dbgrst_reg;
  reg          prst_reg;
  wire         nxt_prst;
  wire         i_pclken;
  wire         i_pclkgen;

  // Crystal oscillator inverter
  assign  XTAL2 =  (~(XTAL1 | SLEEPDEEP));

  // Clock source
  assign clk   = XTAL1;

  // Reset synchronizer
  assign nxt_reset_sync = {reset_sync_reg[1:0], 1'b1};

  always @(posedge clk or negedge NRST)
  begin
  if (~NRST)
    reset_sync_reg <= 3'b000;
  else
    reset_sync_reg <= nxt_reset_sync;
  end

  assign reset_n = reset_sync_reg[2];

  // AHB HRESETn
  assign nxt_hrst = ~(SYSRESETREQ | (LOCKUP & LOCKUPRESET));

  always @(posedge clk or negedge reset_n)
  begin
  if (~reset_n)
    hrst_reg <= 1'b0;
  else
    hrst_reg <= nxt_hrst;
  end

  // Debug Reset
  always @(posedge clk or negedge reset_n)
  begin
  if (~reset_n)
    dbgrst_reg <= 1'b0;
  else
    dbgrst_reg <= ~DBGRESETREQ;
  end

  // APB PRESETn
  assign nxt_prst = ~(SYSRESETREQ | (LOCKUP & LOCKUPRESET));

  always @(posedge clk or negedge reset_n)
  begin
  if (~reset_n)
    prst_reg <= 1'b0;
  else
    prst_reg <= nxt_prst;
  end

  generate if (CLKGATE_PRESENT == 0) begin : gen_no_clock_gating

  // No clock gating for PCLK
  assign i_pclken   = 1'b1;  // Currently PCLK = HCLK (for AHB to APB bridge)
  assign i_pclkgen  = 1'b1;  // Not used
  assign PCLK       = clk;   // Peripheral clock
  assign PCLKG      = clk;   // Peripheral clock for APB interface

  end else
  begin : gen_clock_gating
  // Clock gate is present.
  // Testing of divided PCLK is only possible when clock gating is available
  assign i_pclken   = 1'b1;  // PCLK = HCLK
  assign i_pclkgen  = i_pclken & APBACTIVE;

  // PCLK generation
  cmsdk_clock_gate
    #(.CLKGATE_PRESENT(CLKGATE_PRESENT))
    u_cmsdk_clock_gate_pclk(
    .CLK       (clk),
    .CLKENABLE (i_pclken),
    .DISABLEG  (CGBYPASS),
    .GATEDCLK  (PCLK));

  // Gated PCLK (PCLKG) generation
  cmsdk_clock_gate
    #(.CLKGATE_PRESENT(CLKGATE_PRESENT))
    u_cmsdk_clock_gate_pclkg(
    .CLK       (clk),
    .CLKENABLE (i_pclkgen),
    .DISABLEG  (CGBYPASS),
    .GATEDCLK  (PCLKG));

  end endgenerate

  // Connect to top level
  assign PORESETn = (RSTBYPASS) ? NRST : reset_n;
  assign HRESETn  = (RSTBYPASS) ? NRST : hrst_reg;
  assign DBGRESETn= (RSTBYPASS) ? NRST : dbgrst_reg;
  assign PRESETn  = (RSTBYPASS) ? NRST : prst_reg;
  assign FCLK     = clk;  // Free running clock
  assign PCLKEN   = i_pclken;

endmodule
