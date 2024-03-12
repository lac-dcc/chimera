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
//      Checked In          : $Date: 2013-01-10 15:37:39 +0000 (Thu, 10 Jan 2013) $
//
//      Revision            : $Revision: 233271 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : APB dual timers
//-----------------------------------------------------------------------------
//  ----------------------------------------------------------------------------
//  Purpose             : Timers module containing two 32-bit down-counters.
//
//  --========================================================================--

module cmsdk_apb_dualtimers (
// -----------------------------------------------------------------------------
// Pin Declarations
// -----------------------------------------------------------------------------
  input  wire             PCLK,        // APB clock
  input  wire             PRESETn,     // APB reset
  input  wire             PENABLE,     // APB enable
  input  wire             PSEL,        // APB periph select
  input  wire [11:2]      PADDR,       // APB address bus
  input  wire             PWRITE,      // APB write
  input  wire [31:0]      PWDATA,      // APB write data

  input  wire             TIMCLK,      // Timer clock
  input  wire             TIMCLKEN1,   // Timer clock enable 1
  input  wire             TIMCLKEN2,   // Timer clock enable 2

  input  wire  [3:0]      ECOREVNUM,   // ECO revision number

  output wire [31:0]      PRDATA,      // APB read data

  output wire             TIMINT1,     // Counter 1 interrupt
  output wire             TIMINT2,     // Counter 2 interrupt
  output wire             TIMINTC);    // Counter combined interrupt

`include "cmsdk_apb_dualtimers_defs.v"

//------------------------------------------------------------------------------
//
//                       Timers
//                       ======
//
//------------------------------------------------------------------------------
//
// Overview
// ========
//
// The Timers module is a reference design of an APB-based slave which forms
//  a hardware mechanism to generate timed interrupts.
//
// The Timers module has the following features:
//
//  * Flexible clocking scheme.
//  * Configurable 16 or 32-bit free-running down-counter with an 8-bit
//     prescaler (two instances).
//
//    For each timer channel:
//
//    * Independent clock enable signal.
//    * Three modes of operation: one-shot, periodic and free-running.
//    * Period load register and Background load register.
//    * Control register for mode, size and prescale configuration,
//       including an interrupt enable mask.
//    * Interrupt status register.
//    * Interrupt clear register.
//    * Interrupt generation with separate output.
//
//  * Combined interrupt signal for interrupt controllers.
//  * Common Integration Test registers.
//  * PrimeCell and Peripheral ID registers.
//
// Module Address Map
// ==================
//
// For information about the address map for this module, please refer to
//  the constants defined in the apb_dualtimers_defs.v include file and also the
//  appropriate section of the Technical Reference Manual.
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Signal declarations
//------------------------------------------------------------------------------

// Internal Signals
  wire              frc_sel1;         // FRC1 select (address decoding)
  wire              frc_sel2;         // FRC2 select (address decoding)
  wire [31:0]       frc_data1;        // FRC1 data out
  wire [31:0]       frc_data2;        // FRC2 data out
  reg  [7:0]        timer_id_mux;     // Peripheral/PrimeCell data out
  reg  [31:0]       prdata_next;      // Internal PRDATA
  reg  [31:0]       i_prdata;         // Regd prdata_next
  wire              prdata_next_en;   // PRDATAEn register input
  wire              timer_itcr_wr_en; // Write enable for Integration Test
                                      // Control Register
  reg               timer_itcr;       // Integration Test Control Register
  wire              timer_itop_wr_en; // Write enable for Integration Test
                                      // Output Set Register
  reg  [1:0]        timer_itop;       // Integration Test Output Set Register
  wire              i_frc_int1;       // Counter 1 interrupt
  wire              i_frc_int1_mux;   // Counter 1 irq mux with integration test
  wire              i_frc_int2;       // Counter 2 interrupt
  wire              i_frc_int2_mux;   // Counter 2 irq mux with integration test

//------------------------------------------------------------------------------
// Beginning of main code
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Address Decoder For Frc1/2 Registers
//------------------------------------------------------------------------------

  // Generates select lines to the 2 free running counters.

  assign frc_sel1 = (PSEL & (PADDR [11:5] == `ARM_TIMER1A)) ? 1'b1 : 1'b0;

  assign frc_sel2 = (PSEL & (PADDR [11:5] == `ARM_TIMER2A)) ? 1'b1 : 1'b0;


//------------------------------------------------------------------------------
// Integration Test Registers
//------------------------------------------------------------------------------
  assign timer_itcr_wr_en = (PADDR[11:2] == {4'hF,`ARM_TIMERITCRA}) ?
                          (PSEL & PWRITE & (~PENABLE)) : 1'b0;

  assign timer_itop_wr_en = (PADDR[11:2] == {4'hF,`ARM_TIMERITOPA}) ?
                          (PSEL & PWRITE & (~PENABLE)) : 1'b0;

  always @ (posedge PCLK or negedge PRESETn)
    begin : p_itcr_seq
      if (~PRESETn)
        timer_itcr <= 1'b0;
      else
        if (timer_itcr_wr_en)
          timer_itcr <= PWDATA[0];
    end

  always @ (posedge PCLK or negedge PRESETn)
    begin : p_itop_seq
      if (~PRESETn)
        timer_itop <= 2'b00;
      else
        if (timer_itop_wr_en)
          timer_itop <= PWDATA[1:0];
    end

//------------------------------------------------------------------------------
// Output data generation
//------------------------------------------------------------------------------
// Address decoding for register reads.

  // Selects output data from address bus.
  assign prdata_next_en = (PSEL & (~PWRITE) & (~PENABLE));

  always @ (frc_data1 or frc_data2 or PADDR or prdata_next_en or timer_itcr or timer_id_mux)
  begin : p_prdata_next_comb
    if (prdata_next_en)
      case (PADDR[11:5])
        `ARM_TIMER1A : prdata_next      = frc_data1;
        `ARM_TIMER2A : prdata_next      = frc_data2;
        `ARM_TIMER3A : prdata_next      = {32{1'b0}}; // FRC3 not implemented
        `ARM_TIMER4A : prdata_next      = {32{1'b0}}; // FRC4 not implemented
        `ARM_TIMERIA : prdata_next      = {{31{1'b0}}, timer_itcr};
        `ARM_TIMERP0A,
        `ARM_TIMERP1A: prdata_next      = {{24{1'b0}}, timer_id_mux};
        default      : prdata_next      = {32{1'b0}};
      endcase
    else
      prdata_next = {32{1'b0}};
  end

  // Selection of read data from Peripheral and PrimeCell ID
  //  registers is separated from the prdata_next mux to reduce the
  //  depth of mux needed for Frc register data
  always @ (PADDR or prdata_next_en or ECOREVNUM)
  begin : p_timer_id_mux_comb
      case (prdata_next_en)
      1'b1:
        //------------------------------------------------------------------------------
        // Assign the Timer Peripheral ID
        //
        // The Timer Peripheral ID is a 32-bit value composed of the
        // following 4 fields:
        // Bits[11:0] -> Part Number used to identify the peripheral
        //                For the Timer this is 0x823
        // Bits[18:12] -> Designer ID (ARM)
        //                ARM is designated 0x3B
        // Bits[23:20] -> Peripheral Revision Number
        //                For the Timer this is 0x1
        // Bits[31:24] -> Peripheral Configuration Options
        //                For the Timer this is 0x00
        //
        // The 32-bits are readable via 4 separate address locations with
        // each location returning 8 valid bits at positions[7:0]. The
        // values returned by the 4 Peripheral ID registers are given below:
        //
        // TimerPeriphID0 = 0x23
        // TimerPeriphID1 = 0xB8
        // TimerPeriphID2 = 0x1B
        // TimerPeriphID3 = 0xr0
        // TimerPeriphID4 = 0x04
        // TimerPeriphID5 = 0x00
        // TimerPeriphID6 = 0x00
        // TimerPeriphID7 = 0x00
        //------------------------------------------------------------------------------
        if (PADDR[7:6] == 2'b11) begin
          case (PADDR[5:2])
          `ARM_TPERIPHID4A:  timer_id_mux = 8'h04;
          `ARM_TPERIPHID5A:  timer_id_mux = 8'h00;
          `ARM_TPERIPHID6A:  timer_id_mux = 8'h00;
          `ARM_TPERIPHID7A:  timer_id_mux = 8'h00;
          `ARM_TPERIPHID0A:  timer_id_mux = 8'h23;
          `ARM_TPERIPHID1A:  timer_id_mux = 8'hB8;
          `ARM_TPERIPHID2A:  timer_id_mux = 8'h1B;
          `ARM_TPERIPHID3A:  timer_id_mux = {ECOREVNUM, 4'h0};
        //-------------------------------- ----------------------------------------------
        // Assign the Timer PrimeCell ID
        //
        // TimerPCellID0 = 0x0D
        // TimerPCellID1 = 0xF0
        // TimerPCellID2 = 0x05
        // TimerPCellID3 = 0xB1
        // These PrimeCell ID values should not be changed.
        //------------------------------------------------------------------------------
          `ARM_TPCELLID0A:   timer_id_mux = 8'h0D;
          `ARM_TPCELLID1A:   timer_id_mux = 8'hF0;
          `ARM_TPCELLID2A:   timer_id_mux = 8'h05;
          `ARM_TPCELLID3A:   timer_id_mux = 8'hB1;
          4'h0,4'h1,4'h2,4'h3:  timer_id_mux = 8'h00;
          default: timer_id_mux = {8{1'bx}};
         endcase
       end
       else begin
          timer_id_mux = {8{1'b0}};
       end
     1'b0:
       timer_id_mux = {8{1'b0}};
     default:
       timer_id_mux = {8{1'bx}};
   endcase
  end

  // Register used to reduce output delay during reads.
  always @ (negedge PRESETn or posedge PCLK)
  begin : p_i_prdata_seq
    if (~PRESETn)
      i_prdata <= {32{1'b0}};
    else
      i_prdata <= prdata_next;
  end

  // Drive output with internal version.
  assign PRDATA = i_prdata;

  // Drive Interrupt outputs
  // TIMINT1 and TIMINT2 can be forced directly from the Test Integration
  //  registers.
  assign i_frc_int1_mux = ((timer_itcr == 1'b0) ? i_frc_int1 : timer_itop[0]);

  assign TIMINT1 = i_frc_int1_mux;

  assign i_frc_int2_mux = ((timer_itcr == 1'b0) ? i_frc_int2 : timer_itop[1]);

  assign TIMINT2 = i_frc_int2_mux;

  // TIMINTC is the logical OR of the final interrupts from each individual
  // free running counter.
  assign TIMINTC = (i_frc_int1_mux | i_frc_int2_mux);

//------------------------------------------------------------------------------
// Free running counter blocks
//------------------------------------------------------------------------------
  cmsdk_apb_dualtimers_frc u_apb_timer_frc_1
    (.PCLK     (PCLK),
     .PRESETn  (PRESETn),
     .PENABLE  (PENABLE),
     .PADDR    (PADDR[4:2]),
     .PWRITE   (PWRITE),
     .PWDATA   (PWDATA),
     .frc_sel  (frc_sel1),
     .TIMCLK   (TIMCLK),
     .TIMCLKEN (TIMCLKEN1),
     .frc_int  (i_frc_int1),
     .data_out (frc_data1)
    );

  cmsdk_apb_dualtimers_frc u_apb_timer_frc_2
    (.PCLK     (PCLK),
     .PRESETn  (PRESETn),
     .PENABLE  (PENABLE),
     .PADDR    (PADDR[4:2]),
     .PWRITE   (PWRITE),
     .PWDATA   (PWDATA),
     .frc_sel  (frc_sel2),
     .TIMCLK   (TIMCLK),
     .TIMCLKEN (TIMCLKEN2),
     .frc_int  (i_frc_int2),
     .data_out (frc_data2)
    );

endmodule

// --============================ End ========================================--

