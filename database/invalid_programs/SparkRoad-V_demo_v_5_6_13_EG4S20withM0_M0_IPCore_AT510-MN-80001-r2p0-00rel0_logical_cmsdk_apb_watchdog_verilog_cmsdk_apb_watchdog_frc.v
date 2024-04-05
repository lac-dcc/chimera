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
//  ----------------------------------------------------------------------------
//  Purpose            : Free Running Counter (apb_watchdog_frc) module used in
//                       APB watchdog.
//                       Runs from WDOGCLK which has edges synchronous to PCLK.
//                       Can be used to generate an interrupt.
//  --========================================================================--

module cmsdk_apb_watchdog_frc (
// -----------------------------------------------------------------------------
// Pin Declarations
// -----------------------------------------------------------------------------
  input  wire         PCLK,       // APB clock
  input  wire         PRESETn,    // APB reset
  input  wire         PENABLE,    // APB enable
  input  wire [4:2]   PADDR,      // APB address bus
  input  wire         PWRITE,     // APB write
  input  wire [31:0]  PWDATA,     // APB write data

  input  wire         frc_sel,    // Frc register select
  input  wire         wdog_lock,  // Lock register value
  input  wire         WDOGCLK,    // Watchdog clock
  input  wire         WDOGCLKEN,  // Watchdog clock
  input  wire         WDOGRESn,   // Watchdog clock reset

  output wire         WDOGINT,    // FRC interrupt
  output wire         WDOGRES,    // FRC reset
  output reg  [31:0]  frc_data);  // Read data output

`include "cmsdk_apb_watchdog_defs.v"

//------------------------------------------------------------------------------
//
//                            WdogFrc
//                            =======
//
//------------------------------------------------------------------------------
//
// Overview
// ========
//
// The Watchdog Free-Running Counter (WdogFrc) is a sub-component of the
//  Watchdog module. It essentially contains:
//
// * The 32-bit free-running down-counter.
// * Period load register.
// * Control register to enable reset and interrupt signals.
// * Interrupt status register.
// * Lock register to prevent accidental write access.
// * Interrupt and Reset generation logic.
//
// If necessary, this block can be instantiated more than once in the
//  top-level structural description, to form a multi-channel Watchdog.
//
// Module Address Map
// ==================
//
// For information about the address map for this module, please refer to
//  the constants defined in the WdogPackage include file and also the
//  appropriate section of the Technical Reference Manual.
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Signal declarations
//------------------------------------------------------------------------------

  // Internal Signals
  wire          wdog_ctrl_en;     // Ctrl write enable
  reg [1:0]     wdog_control;     // Control register
  wire          load_en;          // Load write enable
  reg           load_en_reg;      // Registered load enable
  reg [31:0]    wdog_load;        // wdog_load register

  wire          load_tog_en;      // Enable for load request toggle
  reg           load_req_tog_p;   // Load request toggle, PCLK domain
  reg           load_req_tog_w;   // Load request toggle, WDOGCLK domain
  wire          load_req_w;       // Load request pulse, WDOGCLK domain

  wire          count_stop;       // Halt counter
  reg           count_stop_reg;   // Registered count_stop

  reg [15:0]    nxt_count_low;    // Count - 1 [15:0]
  reg [15:0]    nxt_count_high;   // Count - 1 [31:16]
  reg           nxt_carry_0;      // Decrement carry in
  reg           nxt_carry_1;      // Decrement carry in
  wire [1:0]    nxt_carry_mux;    // Decrement carry in (muxed)
  reg [1:0]     reg_carry;        // Decrement carry in
  wire          carry_msb;        // Multiplexed carry for 16/32-bit count
  wire [31:0]   count_mux1;       // Count mux value
  wire [31:0]   count_mux2;       // Count mux value
  reg [31:0]    reg_count;        // Current count
  wire [31:0]   count_read;       // Current count mux
  wire [15:0]   high_count;       // Upper half-word mux

  wire          wdog_int_en;      // Interrupt enable
  reg           wdog_int_en_reg;  // Registered interrupt enable
  wire          wdog_int_en_rise; // Rising edge on interrupt enable
  wire          wdog_res_en;      // Reset enable
  reg           i_wdog_res;       // Registered internal counter reset
  wire          nxt_wdog_res;     // Next i_wdog_res value

  wire          int_clr_en;       // Interrupt clear enable
  reg           int_clr_tog_p;    // Int Clear toggle in PCLK domain
  reg           int_clr_tog_w;    // Int Clear toggle in WDOGCLK domain
  wire          int_clr_pulse;    // Int Clear pulse in PCLK and WDOGCLK
  wire          int_clr_w;        // Int Clear signal in WDOGCLK domain
  reg           int_clr_reg_w;    // Registered int_clr_w, WDOGCLK domain

  wire          nxt_wdog_ris;     // Next wdog_ris value
  reg           wdog_ris;        // Registered internal counter interrupt
  wire          read_wdog_ris;    // Registered internal counter interrupt
  wire          wdog_mis;        // Masked counter interrupt

  //----------------------------------------------------------------------------
  // Beginning of main code
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Control Register
  //----------------------------------------------------------------------------
  // Contains values of Control register:
  //   1 - Watchdog Reset Enable
  //   0 - Watchdog Counter and Interrupt Enable
  assign wdog_ctrl_en = (PADDR == `ARM_WDOGCONTROLA) ?
                       (PWRITE & frc_sel & (~PENABLE) & (~wdog_lock)) : 1'b0;

  always @ (negedge PRESETn or posedge PCLK)
    begin : p_ctrl_seq
      if (~PRESETn)
        wdog_control[1:0] <= 2'b00;
      else
        if (wdog_ctrl_en)
          wdog_control[1:0] <= PWDATA[1:0];
    end

  assign wdog_res_en = wdog_control[1];
  assign wdog_int_en = wdog_control[0];

  // The counter (in the WDOGCLK domain) needs to be reset to wdog_load
  // when the interrupt is re-enabled.  wdog_int_en_rise will assert for
  // one WDOGCLK cycle after a rising edge on wdog_int_en and is
  // factored into the counter reset

  always @ (negedge WDOGRESn or posedge WDOGCLK)
    begin : p_wdog_int_en_reg_seq
      if (~WDOGRESn)
        wdog_int_en_reg <= 1'b0;
      else
        if (WDOGCLKEN)
          wdog_int_en_reg <= wdog_int_en;
    end

  assign wdog_int_en_rise = wdog_int_en & (~wdog_int_en_reg);

//------------------------------------------------------------------------------
// wdog_load Register
//------------------------------------------------------------------------------
// wdog_load value for Watchdog - when this register is written to,
// the counter will be loaded with this value before carrying on counting.

  // Decode a Watchdog Load write transaction
  assign load_en = (PADDR == `ARM_WDOGLOADA) ?
                   (PWRITE & frc_sel & (~PENABLE) & (~wdog_lock)) : 1'b0;

  // Register load_en so it is aligned with the data in the Load register
  always @(negedge PRESETn or posedge PCLK)
  begin : p_load_en_seq
    if (~PRESETn)
      load_en_reg <= 1'b0;
    else
      load_en_reg <= load_en;
  end

  // wdog_load register implementation
  always @ (negedge PRESETn or posedge PCLK)
    begin : p_load_seq
      if (~PRESETn)
        wdog_load <= {32{1'b1}};
      else
        if (load_en)
          wdog_load <= PWDATA;
    end

//------------------------------------------------------------------------------
// Load enable register
//------------------------------------------------------------------------------
// The load_en pulse needs to be sampled into the WDOGCLK domain even if PCLK
// is subsequently disabled.

  // load_req_tog_p is toggled if a new load request is received and there are no
  //  pending load requests. This prevents multiple toggles before the next
  //  WDOGCLK edge.
  assign load_tog_en = load_en_reg & (~load_req_w); // New load request and none pending

  // load_tog_en high toggles LoadReqTog on next PCLK
  always @ (negedge PRESETn or posedge PCLK)
    begin : p_load_req_tog_p_seq
      if (~PRESETn)
        load_req_tog_p <= 1'b0;
      else
        if (load_tog_en)
          load_req_tog_p <= (~load_req_tog_p);
    end

  // Register LoadReqTog into WDOGCLK domain
  always @(negedge WDOGRESn or posedge WDOGCLK)
  begin : p_load_req_tog_w_seq
    if (~WDOGRESn)
      load_req_tog_w <= 1'b0;
    else
      if (WDOGCLKEN)
        load_req_tog_w <= load_req_tog_p;
  end

  // load_req_w goes high on the PCLK edge after load_tog_en and low on the next
  //  valid WDOGCLK edge
  assign load_req_w = load_req_tog_p ^ load_req_tog_w;

//------------------------------------------------------------------------------
// 32-bit count down with load.
//------------------------------------------------------------------------------
// nxt_count is set to Count when reg_carry = 0 so that loads also change the
//  value of nxt_count.
// 32 bit counter is implemented as two 16 bit counters to improve FPGA
//  implementation.

  // Halfword 0, bits 15:0
  always @ (reg_count)
    begin : p_dec0comb
      nxt_count_low[15:0] = (reg_count[15:0] - 1'b1);
    end

  always @ (load_req_w or carry_msb or wdog_load or wdog_int_en_rise or
            int_clr_w or reg_count)
    begin : p_nxt_carry_0_comb
      // Select the value source to be evaluated for the lower half-word
      if (load_req_w | carry_msb | wdog_int_en_rise | int_clr_w)
        if (wdog_load[15:0] == 16'h0000)
          nxt_carry_0 = 1'b1;
        else
          nxt_carry_0 = 1'b0;
      else if (reg_count[15:0] == 16'h0001)
        nxt_carry_0 = 1'b1;
      else
        nxt_carry_0 = 1'b0;
    end

  // Halfword 1, bits 31:16
  always @ (reg_count or reg_carry)
    begin : p_dec1comb
      if (reg_carry[0])
        nxt_count_high[15:0] = (reg_count[31:16] - 1'b1);
      else
        nxt_count_high[15:0] = reg_count[31:16];
    end

// Select the value source to be evaluated for the upper half-word
  assign high_count = (load_req_w | carry_msb | wdog_int_en_rise | int_clr_w) ?
                      wdog_load[31:16] : reg_count[31:16];

  always @ (high_count or nxt_carry_0 or carry_msb)
    begin : p_nxt_carry_1_comb
      if ((high_count == 16'h0000) & nxt_carry_0 & (~carry_msb))
        nxt_carry_1 = 1'b1;
      else
        nxt_carry_1 = 1'b0;
    end

  // Only change reg_carry when counter is enabled (as per setting of
  // count_mux2 below)
  assign nxt_carry_mux = ((wdog_int_en & (~count_stop)) |
                        load_req_w) ? {nxt_carry_1, nxt_carry_0} :
                       reg_carry;

  // Registered carry bits to improve timing, enabled by the same
  //  terms as the reg_count register

  always @ (negedge WDOGRESn or posedge WDOGCLK)
  begin : p_reg_carry_seq
    if (~WDOGRESn)
      reg_carry <= 2'b00;
    else
      if (WDOGCLKEN)
        reg_carry <= nxt_carry_mux;
  end


  // The most significant reg_carry bit changes when in 16 or 32-bit counter modes.
  assign carry_msb = reg_carry[1];

//------------------------------------------------------------------------------
// Counter register
//------------------------------------------------------------------------------
// Reloads from Load when carry_msb is set.

  // Load the counter with the value from wdog_load when:
  assign count_mux1 = (load_req_w |            // New value written
                      carry_msb |              // Count reaches zero
                      wdog_int_en_rise |         // IRQ output enabled
                      int_clr_w) ? wdog_load :   // IRQ output cleared
                      {nxt_count_high, nxt_count_low}; // Otherwise decrement the counter

  // The counter only changes on a valid WDOGCLKEN, when either:
  //   1. The watchdog is enabled, and the counter is not stopped.
  //   2. A new value is loaded.
  assign count_mux2 = ((wdog_int_en & (~count_stop)) |
                      load_req_w) ? count_mux1 :

                     reg_count;

  // The counter needs to be disabled after the Watchdog has generated a reset.
  // It is re-enabled when a new value is written to the Load register.
  assign count_stop = (i_wdog_res ? 1'b1 :

                      load_req_w ? 1'b0 :

                      count_stop_reg);

  always @ (negedge WDOGRESn or posedge WDOGCLK)
    begin : p_count_stop_seq
      if (~WDOGRESn)
        count_stop_reg <= 1'b0;
      else
        if (WDOGCLKEN)
          count_stop_reg <= count_stop;
    end

  // Counter registers using rising edge of WDOGCLK.
  // WDOGCLKEN is used to enable the counter.
  // Reset sets all outputs HIGH to avoid interrupt generation at
  //  start.
  always @ (negedge WDOGRESn or posedge WDOGCLK)
    begin : p_count_seq
      if (~WDOGRESn)
        reg_count <= {32{1'b1}};
      else
        if (WDOGCLKEN)
          reg_count <= count_mux2;
    end

  // count_read is set to the value of wdog_load so that when this
  // register is written to, and then immediately followed by a read
  // from the Count register, the newly loaded value is read back even
  // if no WDOGCLK/WDOGCLKEN edge has yet occurred.
  assign count_read = load_req_w ? wdog_load : reg_count;

//------------------------------------------------------------------------------
// Interrupt clear
//------------------------------------------------------------------------------
// carry_msb can be valid for multiple clock cycles, and may not have cleared
//  until after an interrupt clear has been asserted, allowing the interrupt
//  to be entered again. The interrupt clear is extended to ensure that it
//  remains valid until the interrupt is actually cleared in the WDOGCLK
//  domain. A toggle based handshake is used in case PCLK is removed before
//  the interrupt clear operation is complete.

  // Decode IntClr transaction
  assign int_clr_en = ((~int_clr_w) &                  // No pending IntClr operation
                     PWRITE & frc_sel & (~PENABLE) & (~wdog_lock) &
                     (PADDR == `ARM_WDOGCLEARA)) ? 1'b1 :
                     1'b0;


  // IntClr high toggles int_clr_tog_p on next PCLK
  always @(negedge PRESETn or posedge PCLK)
  begin : p_int_clr_tog_p_seq
    if (~PRESETn)
      int_clr_tog_p <= 1'b0;
    else
      if (int_clr_en)
        int_clr_tog_p <= (~int_clr_tog_p);
  end

  // Register int_clr_tog_p into WDOGCLK domain
  always @(negedge WDOGRESn or posedge WDOGCLK)
  begin : p_int_clr_tog_w_seq
    if (~WDOGRESn)
      int_clr_tog_w <= 1'b0;
    else
      if (WDOGCLKEN)
        int_clr_tog_w <= int_clr_tog_p;
  end

  // int_clr_pulse is high on PCLK edge, low on WDOGCLK edge
  assign int_clr_pulse = int_clr_tog_p ^ int_clr_tog_w;

  // int_clr_w is used to clear the interrupt. It is asserted when the APB IntClr
  //  transaction is detected and de-asserted when the counter is no longer zero
  //  (to prevent multiple interrupts from one counter event).
  assign int_clr_w = (int_clr_pulse ? 1'b1 : // IntClr transaction sampled into
                                         //  WDOGCLK domain

                    (~carry_msb) ? 1'b0 :   // Counter no longer zero

                    int_clr_reg_w);

  // Register int_clr_w to hold it until counter is non-zero.
  always @(negedge WDOGRESn or posedge WDOGCLK)
  begin : p_int_clr_reg_seq
    if (~WDOGRESn)
      int_clr_reg_w <= 1'b0;
    else
      if (WDOGCLKEN)
        int_clr_reg_w <= int_clr_w;
  end

//------------------------------------------------------------------------------
// Interrupt generation
//------------------------------------------------------------------------------

  // The interrupt is generated (HIGH) when the counter reaches zero.
  // The interrupt is cleared (LOW) when the WdogIntClr address is written to.
  assign nxt_wdog_ris = (carry_msb | wdog_ris) & (~int_clr_w);

  // Register and hold interrupt until cleared.  WDOGCLK is used to ensure that
  //  an interrupt is still generated even if PCLK is disabled.
  always @ (negedge WDOGRESn or posedge WDOGCLK)
    begin : p_int_seq
      if (~WDOGRESn)
        wdog_ris <= 1'b0;
      else
        if (WDOGCLKEN)
          wdog_ris <= nxt_wdog_ris;
    end

  // Factor int_clr_w into version of raw interrupt status which is read
  // back from the RIS register so that a read from RIS or MIS will
  // show the cleared value immediately
  assign read_wdog_ris = wdog_ris & (~int_clr_w);

  // Gate raw interrupt with enable bit
  assign wdog_mis = read_wdog_ris & wdog_int_en;

  // Drive output with internal signal
  assign WDOGINT = wdog_mis;

//----------------------------------------------------------------------------
// Reset generation
//----------------------------------------------------------------------------

  // The reset output is activated when the counter reaches zero and the
  //  interrupt output is active, indicating that the counter has previously
  //  reached zero but not been serviced.
  assign nxt_wdog_res = ((~wdog_res_en) ? 1'b0 :            // Watchdog reset disabled

                       (wdog_ris & carry_msb) ? 1'b1 : // Raw IRQ asserted and
                                                      // Counter is zero

                       i_wdog_res);

  // WdogRes register
  always @ (negedge WDOGRESn or posedge WDOGCLK)
    begin : p_res_seq
      if (~WDOGRESn)
        i_wdog_res <= 1'b0;
      else
        if (WDOGCLKEN)
          i_wdog_res <= nxt_wdog_res;
    end

  // Drive reset output
  assign WDOGRES = i_wdog_res;

//------------------------------------------------------------------------------
// Output data generation
//------------------------------------------------------------------------------
// Zero data is used as padding for other register reads

  always @ (PWRITE or frc_sel or PADDR or wdog_load or count_read or
            wdog_control or read_wdog_ris or wdog_mis)
    begin : p_frc_data_comb

      frc_data = {32{1'b0}}; // Drive zeros by default

      if ((~PWRITE) & frc_sel)
        case (PADDR)
          `ARM_WDOGLOADA :
            // wdog_load address
            frc_data = wdog_load;

          `ARM_WDOGVALUEA :
            // WdogValue address
            frc_data = count_read;

          `ARM_WDOGCONTROLA :
            // wdog_control address
            frc_data[1:0] = wdog_control[1:0];

          `ARM_WDOGINTRAWA :
            // wdog_ris address
            frc_data[0] = read_wdog_ris;

          `ARM_WDOGINTA :
            // wdog_mis address
            frc_data[0] = wdog_mis;

          default:
            frc_data = {32{1'b0}};

        endcase
      else
        frc_data = {32{1'b0}};
    end

endmodule

// --============================ End ========================================--
