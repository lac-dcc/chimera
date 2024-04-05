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
//      Checked In          : $Date: 2012-07-31 10:47:23 +0100 (Tue, 31 Jul 2012) $
//
//      Revision            : $Revision: 217027 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Free Running Timer for APB dual timer
//-----------------------------------------------------------------------------
//  ----------------------------------------------------------------------------
//  Purpose             : Free Running Counter (FRC) module used in Timers.
//                        Runs from TIMCLK which has edges synchronous to PCLK.
//                        Can be used to generate an interrupt.
//  --========================================================================--

module cmsdk_apb_dualtimers_frc (
// -----------------------------------------------------------------------------
// Pin Declarations
// -----------------------------------------------------------------------------
  input  wire         PCLK,         // APB clock
  input  wire         PRESETn,      // APB reset
  input  wire         PENABLE,      // APB enable
  input  wire   [4:2] PADDR,        // APB address bus
  input  wire         PWRITE,       // APB write
  input  wire  [31:0] PWDATA,       // APB write data

  input  wire         frc_sel,      // Frc register select
  input  wire         TIMCLK,       // Timer clock
  input  wire         TIMCLKEN,     // Timer clock enable

  output wire         frc_int,      // FRC interrupt
  output reg   [31:0] data_out);    // Timer read data output

`include "cmsdk_apb_dualtimers_defs.v"

//------------------------------------------------------------------------------
//
//                       TimersFrc
//                       =========
//
//------------------------------------------------------------------------------
//
// Overview
// ========
//
// The Timers Free-Running Counter (apb_dualtimers_frc) is a sub-component of the
//  Timers module. It essentially contains:
//
//  * The configurable 16 or 32-bit free-running down-counter with an 8-bit
//     prescaler, using an independent clock enable signal.
//  * Period load register and Background load register.
//  * Control register for mode, size and prescale configuration,
//     including an interrupt enable mask.
//  * Interrupt status register.
//  * Interrupt clear register.
//  * Interrupt generation logic with separate output.
//
// If necessary, this block can be instantiated more than once in the
//  top-level structural description, to form a multi-channel Timer.
//
// Module Address Map
// ==================
//
// For information about the address map for this module, please refer to
//  the constants defined in the TimersPackage include file and also the
//  appropriate section of the Technical Reference Manual.
//
//------------------------------------------------------------------------------


// -----------------------------------------------------------------------------
// Signal Declarations
// -----------------------------------------------------------------------------

// Internal Signals
  wire         ctrl_en;        // Ctrl write enable
  reg    [7:5] ctrl_75;        // Control register bit 7 to 5
  reg    [3:0] ctrl_30;        // Control register bit 3 to 0
  wire   [7:0] ctrl_val;       // Control register value

  wire         load_en;        // Load write enable
  reg          load_en_reg;    // Registered load enable
  reg   [31:0] load_val;       // Stores the load value
  wire         load_bg_en;     // Load background enable
  wire         load_period_en; // Last load reg enable
  reg   [31:0] load_period;    // Stores last load data

  wire         load_tog_en;    // Enable for load request toggle
  reg          load_req_tog_p; // Load request toggle, PCLK domain
  reg          load_req_tog_t; // Load request toggle, TIMCLK domain
  wire         load_req_t;     // Load request pulse, TIMCLK domain

  wire         timer_en;       // Timer enable
  wire         timer_mode;     // Timer mode
  wire   [3:2] timer_pre;      // Timer pre-scale
  wire         timer_size;     // Timer size
  wire         one_shot;       // One-shot count enable

  wire   [7:0] nxt_prescale;   // Prescale reg input
  reg    [7:0] prescale_cnt;   // Prescale counter
  wire         enable_16;      // Prescale 16 enable
  wire         enable_256;     // Prescale 256 enable

  wire         stop1shot;      // Stop at end of one-shot count
  reg          stop_reg;       // Registered stop1shot

  reg          pre_enable;     // Selected enable_16/256 signal

  reg   [15:0] nxt_count_low;  // Count - 1
  reg   [15:0] nxt_count_high; // Count - 1
  reg          nxt_carry_0;    // Decrement carry in
  reg          nxt_carry_1;    // Decrement carry in
  wire   [1:0] nxt_carry_mux;  // Decr carry in (muxed)
  reg    [1:0] carry_reg;      // Registered carry in
  wire         carry_msb;      // Multiplexed carry for 16/32-bit count
  reg   [31:0] count_mux_1;    // Count mux value
  wire  [31:0] count_mux_2;    // Count mux value
  reg   [31:0] count_reg;      // Current count
  wire  [31:0] count_read;     // Current count mux
  wire  [15:0] high_count;     // Upper half-word mux

  wire         int_clr_en;     // Interrupt Clear enable
  reg          int_clr_tog_p;  // Int Clear toggle in PCLK domain
  reg          int_clr_tog_t;  // Int Clear toggle in TIMCLK domain
  wire         int_clr_pulse_t;// Int Clear pulse in TIMCLK domain
  wire         int_clr_t;      // Int Clear signal, TIMCLK domain
  reg          int_clr_reg_t;  // Registered IntClr signal, TIMCLK domain

  wire         int_enable;     // Interrupt enable control bit
  wire         nxt_raw_intfrc; // i_frc_int next value
  reg          raw_intfrc;     // Registered internal counter interrupt
  wire         read_raw_intfrc;// Read-back internal counter interrupt
  wire         i_frc_int;      // Internal version of interrupt output

//------------------------------------------------------------------------------
// Beginning of main code
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Control Register
//------------------------------------------------------------------------------
// Contains values of Control register:
//   7 - Timer Enable
//   6 - Timer Mode
//   5 - Interrupt Enable
// 3:2 - Prescale
//   1 - Timer Size
//   0 - One Shot Count

  // Control write enable
  assign ctrl_en = ((PADDR == `ARM_TIMERCONTROLA) ?
                   ((PWRITE & frc_sel) & (~PENABLE)) : 1'b0);

  // Control register implementation
  always @(negedge PRESETn or posedge PCLK)
  begin : p_ctrl_seq
    if (~PRESETn)
      begin
        ctrl_75 [7:5] <= 3'b001;
        ctrl_30 [3:0] <= 4'b0000;
      end
    else
      if (ctrl_en)
        begin
          ctrl_75 [7:5] <= PWDATA [7:5];
          ctrl_30 [3:0] <= PWDATA [3:0];
        end
  end

  assign ctrl_val = {ctrl_75, 1'b0, ctrl_30};

  // Assign control information
  assign timer_en   = ctrl_75 [7];
  assign timer_mode = ctrl_75 [6];
  assign int_enable = ctrl_75 [5];
  assign timer_pre  = ctrl_30 [3:2];
  assign timer_size = ctrl_30 [1];
  assign one_shot   = ctrl_30 [0];

//------------------------------------------------------------------------------
// Load Register
//------------------------------------------------------------------------------
// Stores the load value for use on the next enabled TIMCLK edge.

  // Decode a TimerLoad write transaction
  assign load_en = ((PADDR == `ARM_TIMERLOADA) ? (PWRITE & frc_sel & (~PENABLE)) :
                   1'b0);

  // Register load_en so it is aligned with the data in the Load register
  always @(negedge PRESETn or posedge PCLK)
  begin : p_load_en_seq
    if (~PRESETn)
      load_en_reg <= 1'b0;
    else
      load_en_reg <= load_en;
  end

  // Load register implementation
  always @(negedge PRESETn or posedge PCLK)
  begin : p_load_seq
    if (~PRESETn)
      load_val <= {32{1'b0}};
    else
      if (load_en)
        load_val <= PWDATA;
  end

  // Background load value for timer - when this register is written to, the
  //  counter will keep on counting using the current value and will only be
  //  loaded with the new value after it has wrapped past zero.
  assign load_bg_en = ((PADDR == `ARM_TIMERLOADBGA) ?
                    (PWRITE & frc_sel & (~PENABLE)) :
                     1'b0);

//------------------------------------------------------------------------------
// Load Period Register
//------------------------------------------------------------------------------
// Stores last load or loadbg request which is read from the TimerLoad address.
// This value indicates the period of the count i.e. the next start value when
// the counter wraps.

  // Update the load register on a load or background load request
  assign load_period_en = load_en | load_bg_en;


  // Register implementation
  always @(negedge PRESETn or posedge PCLK)
  begin : p_load_period_seq
    if (~PRESETn)
      load_period <= {32{1'b0}};
    else
      if (load_period_en)
        load_period <= PWDATA;
  end

//------------------------------------------------------------------------------
// Clock prescaler (PreScale registers with decrementer)
//------------------------------------------------------------------------------

  // Select next PreScale value.  Set to 0 when a Load is performed,
  // to ensure that the first count period is not reduced. Otherwise decremented
  // only if the timer is enabled.
  assign nxt_prescale = (load_req_t ? {8{1'b0}} :

                        timer_en ? (prescale_cnt - 1'b1) :

                        prescale_cnt);

  // PreScaler runs in TIMCLK domain
  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_prescale_cntr_seq
    if (~PRESETn)
      prescale_cnt <= {8{1'b0}};
    else
      if (TIMCLKEN)
        prescale_cnt <= nxt_prescale;
  end

//------------------------------------------------------------------------------
// PreScale enable generation
//------------------------------------------------------------------------------

  // High round every 16th rising TIMCLK and TIMCLKEN is high.
  assign enable_16 = ((prescale_cnt [3:0] == 4'b0001) ? 1'b1 : 1'b0);

  // High round every 256th rising TIMCLK and TIMCLKEN is high,
  //  equivalent to every 16th Enable1 pulse.
  assign enable_256 = ((prescale_cnt == 8'h01) ? 1'b1 : 1'b0);

  // Selects the enable line depending on the prescale selected with control
  //  register bits 3:2.
  always @(enable_16 or enable_256 or timer_pre)
  begin : p_pre_enable_comb
    case (timer_pre)
      2'b00:   pre_enable = 1'b1;
      2'b01:   pre_enable = enable_16;
      2'b10:   pre_enable = enable_256;
      2'b11:   pre_enable = enable_256; // Unspecified PreScale value
      default: pre_enable = 1'bx;
    endcase
  end

//------------------------------------------------------------------------------
// Load enable logic
//------------------------------------------------------------------------------
// The load_en_reg pulse needs to be sampled into TIMCLK domain even if PCLK is
// subsequently disabled.

  // load_req_tog_p is toggled if a new load request is received and there are no
  // pending load requests. This prevents multiple toggles before the next
  // TIMCLK edge.
  assign load_tog_en = load_en_reg & (~load_req_t); // New load request and none pending

  // load_tog_en high toggles load_req_tog_p on next PCLK
  always @(negedge PRESETn or posedge PCLK)
  begin : p_load_req_tog_p_seq
    if (~PRESETn)
      load_req_tog_p <= 1'b0;
    else
      if (load_tog_en)
        load_req_tog_p <= (~load_req_tog_p);
  end

  // Register load_req_tog_p into TIMCLK domain
  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_load_req_tog_t_seq
    if (~PRESETn)
      load_req_tog_t <= 1'b0;
    else
      if (TIMCLKEN)
        load_req_tog_t <= load_req_tog_p;
  end

  // load_req_t is high for one valid TIMCLK period
  assign load_req_t = load_req_tog_p ^ load_req_tog_t;


//------------------------------------------------------------------------------
// stop1shot generation
//------------------------------------------------------------------------------
// The stop1shot signal is used to halt the counters immediately after zero is
//  reached when in one-shot count mode. The counting is started again when
//  the Load register is written to or one-shot mode is exited.

  assign stop1shot = (load_req_t |      // New load value
                (~one_shot))            // Not in one-shot mode
                ? 1'b0 :

                carry_msb ? 1'b1 :      // Counter is zero in one-shot mode

                stop_reg;

  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_stop_reg_seq
    if (~PRESETn)
      stop_reg <= 1'b0;
    else
      if (TIMCLKEN)
        stop_reg <= stop1shot;
  end

//------------------------------------------------------------------------------
// 32-bit count down with load.
//------------------------------------------------------------------------------
// nxt_count is set to Count when Carry = 0 so that loads also change the
//  value of nxt_count.
// Top halfword is only enabled when in 32-bit counter mode.

  // Halfword 0, bits 15:0
  always @(count_reg)
  begin : p_dec0comb
    nxt_count_low[15:0] = (count_reg [15:0] - 1'b1);
  end

  always @(load_req_t or carry_msb or timer_mode or load_period or count_reg)
  begin : p_nxt_carry_0_comb
    if (load_req_t | (carry_msb & timer_mode))
      if (load_period[15:0] == 16'h0000)
        nxt_carry_0 = 1'b1;
      else
        nxt_carry_0 = 1'b0;
    else if (count_reg [15:0] == 16'h0001)
      nxt_carry_0 = 1'b1;
    else
      nxt_carry_0 = 1'b0;
  end

  // Halfword 1, bits 31:16.
  always @(timer_size or carry_reg or count_reg)
  begin : p_dec1comb
    if (timer_size & carry_reg [0])
      nxt_count_high[15:0] = (count_reg [31:16] - 1'b1);
    else
      nxt_count_high[15:0] = count_reg [31:16];
  end

// Select the value source to be evaluated for the upper half-word
  assign high_count = (load_req_t | (carry_msb & timer_mode)) ?
                     load_period[31:16] : count_reg[31:16];

  always @(timer_size or high_count or nxt_carry_0 or carry_msb)
  begin : p_nxt_carry_1_comb
    if (~timer_size)                   // Prevent carry_msb from toggling if
      nxt_carry_1 = nxt_carry_0;    //  timer size is toggled
    else if (nxt_carry_0 & (~carry_msb) &
             (high_count == 16'h0000))
      nxt_carry_1 = 1'b1;
    else
      nxt_carry_1 = 1'b0;
  end


  // Only change carry_reg when counter is enabled (as per setting of
  // count_mux_2 below)
  assign nxt_carry_mux = ((timer_en & pre_enable & (~stop1shot)) |
                        load_req_t) ? {nxt_carry_1 , nxt_carry_0} :

                       carry_reg;

  // Registered carry bits to improve timing, enabled by the same
  //  terms as the count_reg register

  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_carry_seq
    if (~PRESETn)
      carry_reg <= 2'b00;
    else
      if (TIMCLKEN)
        carry_reg <= nxt_carry_mux;
  end

  // The most significant carry bit changes when in 16 or 32-bit counter modes.
  assign carry_msb = (timer_size ? carry_reg [1] : carry_reg [0]);

//------------------------------------------------------------------------------
// Counter register
//------------------------------------------------------------------------------
// If periodic mode is set, reloads from Load when carry_msb is set.

  always @(carry_msb or load_val or load_period or load_req_t or nxt_count_low or
          nxt_count_high or timer_mode)
  begin : p_count_mux_1_comb
    if (load_req_t)                    // Load request is highest priority
      count_mux_1 = load_val;
    else
      begin
        if ((carry_msb & timer_mode)) // Periodic counter wrap
          count_mux_1 = load_period;
        else
          count_mux_1 = {nxt_count_high,nxt_count_low}; // Normal counter decrement
      end
  end

  // The counter only changes on a valid TIMCLKEN, when either:
  //   1. The timer is enabled, in a valid PreScale cycle and the counter is
  //      not stopped in one-shot mode.
  //   2. A new value is loaded.
  assign count_mux_2 = ((timer_en & pre_enable & (~stop1shot)) |
                      load_req_t) ? count_mux_1 :

                     count_reg;

  // Counter registers (all nibbles clocked on each cycle) using rising edge
  //  of TIMCLK. TIMCLKEN is used to enable the counter. Reset sets all outputs
  //  HIGH to avoid interrupt generation at start.
  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_count_reg_seq
    if (~PRESETn)
      count_reg <= {32{1'b1}};
    else
      if (TIMCLKEN)
        count_reg <= count_mux_2;
  end

  // count_read is set to the value of Load so that when the Load
  // register is written to, and then immediately followed by a read
  // from the Count register, the newly loaded value is read back even
  // if no TIMCLK/TIMCLKEN edge has yet occurred.
  assign count_read = load_req_t ? load_val : count_reg;

//------------------------------------------------------------------------------
// Interrupt clear
//------------------------------------------------------------------------------
// carry_msb can be valid for multiple clock cycles, and may not have cleared
//  until after an interrupt clear has been asserted, allowing the interrupt
//  to be entered again. The interrupt clear is extended to ensure that it
//  remains valid until the interrupt is actually cleared in the TIMCLK domain.
// A toggle based handshake is used in case PCLK is removed before the interrupt
//  clear operation is complete.

  assign int_clr_en = ((~int_clr_t) &                  // No pending IntClr operation
                     PWRITE & frc_sel & (~PENABLE) & (PADDR == `ARM_TIMERCLEARA))
                     ? 1'b1 :                          // New IntClr transaction
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

  // Register int_clr_tog_p into TIMCLK domain
  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_int_clr_tog_t_seq
    if (~PRESETn)
      int_clr_tog_t <= 1'b0;
    else
      if (TIMCLKEN)
        int_clr_tog_t <= int_clr_tog_p;
  end

  // int_clr_pulse_t is high for one valid TIMCLK edge
  assign int_clr_pulse_t = int_clr_tog_p ^ int_clr_tog_t;

  // int_clr_t is used to clear the interrupt. It is asserted when the APB IntClr
  //  transaction is detected and de-asserted when the counter is no longer zero
  //  (to prevent multiple interrupts from one counter event).
  assign int_clr_t = (int_clr_pulse_t ? 1'b1 :

                    (~carry_msb) ? 1'b0 :

                    int_clr_reg_t);

  // Register int_clr_t to hold it until counter is non-zero
  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_int_clr_reg_seq
    if (~PRESETn)
      int_clr_reg_t <= 1'b0;
    else
      if (TIMCLKEN)
        int_clr_reg_t <= int_clr_t;
  end

//------------------------------------------------------------------------------
// Interrupt generation
//------------------------------------------------------------------------------
// The interrupt is generated (set HIGH) when the counter reaches zero.
// The interrupt is cleared (set LOW) when the TimerClear address is
//  written to.

  assign nxt_raw_intfrc = (carry_msb | raw_intfrc) & (~int_clr_t);

  // Register and hold interrupt until cleared.  TIMCLK is used to
  // ensure that an interrupt is still generated even if PCLK is disabled.
  always @(negedge PRESETn or posedge TIMCLK)
  begin : p_int_seq
    if (~PRESETn)
      raw_intfrc <= 1'b0;
    else
      if (TIMCLKEN)
        raw_intfrc <= nxt_raw_intfrc;
  end

  // Factor int_clr_t into version of raw interrupt status which is read
  // back from the RIS register so that a read from RIS or MIS will
  // show the cleared value immediately
  assign read_raw_intfrc = raw_intfrc & (~int_clr_t);

  // Gate raw interrupt with enable bit
  assign i_frc_int = read_raw_intfrc & int_enable;

  // Drive output with internal signal
  assign frc_int = i_frc_int;

//------------------------------------------------------------------------------
// Output data generation
//------------------------------------------------------------------------------
// The current count value is driven out to the Timer which is then used
//  to generate the read data.
// Zero data is used as padding for register reads

  always @(count_read or ctrl_val or frc_sel or load_period or PADDR or
           PWRITE or read_raw_intfrc or i_frc_int)
    begin : p_data_out_comb

      data_out = {32{1'b0}}; // Drive zeros by default

      if ((~PWRITE) & frc_sel)
        case (PADDR)
          `ARM_TIMERLOADA :
            // TimerLoad address (returns next wrapping value)
            data_out = load_period;

          `ARM_TIMERVALUEA :
            // TimerValue address
            data_out = count_read;

          `ARM_TIMERCONTROLA :
            // TimerControl address
            data_out [7:0] = ctrl_val[7:0];

          `ARM_TIMERINTRAWA :
            // TimerIntRaw address
            data_out [0] = read_raw_intfrc;

          `ARM_TIMERINTA :
            // TimerInt address
            data_out [0] = i_frc_int;

          `ARM_TIMERLOADBGA :
            // TimerLoadBg address (returns next wrapping value)
            data_out = load_period;

          default:
            data_out = {32{1'b0}};

        endcase
      else
        data_out = {32{1'b0}};
    end

endmodule

// --================================= End ===================================--
