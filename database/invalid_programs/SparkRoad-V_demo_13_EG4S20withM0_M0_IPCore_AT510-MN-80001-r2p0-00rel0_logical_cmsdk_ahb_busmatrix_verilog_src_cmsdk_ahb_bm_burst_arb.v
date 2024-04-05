//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2001-2013-<<copyright_year>> ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-10-15 18:01:36 +0100 (Mon, 15 Oct 2012) $
//
//      Revision            : $Revision: 225465 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//  Abstract            : The Output Arbitration is used to determine which
//                        of the input stages will be given access to the
//                        shared slave.
//
//  Notes               : The bus matrix has <<connectivity>> connectivity.
//
//-----------------------------------------------------------------------------

<<timescale_directive>>

module <<output_arb_name>> (

    // Common AHB signals
    HCLK ,
    HRESETn,

    // Input port request signals
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    req_port<<in>>,
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

    HREADYM,
    HSELM,
    HTRANSM,
    HBURSTM,
    HMASTLOCKM,

    // Arbiter outputs
    addr_in_port,
    no_port

    );


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    input        HCLK;         // AHB system clock
    input        HRESETn;      // AHB system reset
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    input        req_port<<in>>;     // Port <<in>> request signal
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
    input        HREADYM;      // Transfer done
    input        HSELM;        // Slave select line
    input  [1:0] HTRANSM;      // Transfer type
    input  [2:0] HBURSTM;      // Burst type
    input        HMASTLOCKM;   // Locked transfer
    output [<<idw_si>>:0] addr_in_port;   // Port address input
    output       no_port;       // No port selected signal


// -----------------------------------------------------------------------------
// Constant declarations
// -----------------------------------------------------------------------------

// HTRANS transfer type signal encoding
`define TRN_IDLE   2'b00       // Idle transfer
`define TRN_BUSY   2'b01       // Busy transfer
`define TRN_NONSEQ 2'b10       // NonSequential transfer
`define TRN_SEQ    2'b11       // Sequential transfer

// HBURST transfer type signal encoding
`define BUR_SINGLE 3'b000       // Single
`define BUR_INCR   3'b001       // Incremental
`define BUR_WRAP4  3'b010       // 4-beat wrap
`define BUR_INCR4  3'b011       // 4-beat Incr
`define BUR_WRAP8  3'b100       // 8-beat wrap
`define BUR_INCR8  3'b101       // 8-beat Incr
`define BUR_WRAP16 3'b110       // 16-beat Wrap
`define BUR_INCR16 3'b111       // 16-beat Incr


// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
    wire       HCLK;           // AHB system clock
    wire       HRESETn;        // AHB system reset
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    wire       req_port<<in>>;       // Port <<in>> request signal
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
    wire       HREADYM;        // Transfer done
    wire       HSELM;          // Slave select line
    wire [1:0] HTRANSM;        // Transfer type
    wire [2:0] HBURSTM;        // Burst type
    wire       HMASTLOCKM;     // Locked transfer
    wire [<<idw_si>>:0] addr_in_port;     // Address input port
    reg        no_port;         // No port selected signal

// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------
    reg  [<<idw_si>>:0] addr_in_port_next; // D-input of addr_in_port
    reg  [<<idw_si>>:0] i_addr_in_port;    // Internal version of addr_in_port
    reg        no_port_next;       // D-input of no_port
    reg  [3:0] next_burst_count;   // D-input of reg_burst_count
    reg  [3:0] reg_burst_count;    // Burst counter
    reg        next_burst_hold;    // D-input of reg_burst_hold
    reg        reg_burst_hold;     // Burst hold signal


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// BURST TRANSFER COUNTER
// -----------------------------------------------------------------------------
//
// The Burst counter is used to count down from the number of transfers the
// master should perform and when the counter reaches zero the bus may be
// passed to another master.
//
// reg_burst_count indicates the number of transfers remaining in the
// current fixed length burst.
// reg_burst_hold is actually a decode of reg_burst_count=0 but is driven from a register
// to improve timing

  always @ (HREADYM or HTRANSM or HSELM or HBURSTM or reg_burst_count or reg_burst_hold)
    begin : p_next_burst_count_comb
      // Only update the counters on a valid phase
      if (!HREADYM)
        begin
          next_burst_count = reg_burst_count;
          next_burst_hold  = reg_burst_hold;
        end

      // Force the Burst logic to reset if this port is de-selected.  This can
      // happen for two reasons:
      //   1. The master performs 2 fixed-length bursts back-to-back, but the
      //      second is to an alternate output port
      //   2. The master is performing a fixed-length burst but is de-granted mid-
      //      way by a local AHB Arbiter
      else if (!HSELM)
        begin
          next_burst_count = 4'b0000;
          next_burst_hold  = 1'b0;
        end

      // Burst logic is initialised on a NONSEQ transfer (i.e. start of burst)
      // IDLE transfers cause the logic to reset
      // BUSY transfers pause the decrementer
      // SEQ transfers decrement the counter
      else
        case (HTRANSM)

          `TRN_NONSEQ : begin
            case (HBURSTM)
              `BUR_INCR16, `BUR_WRAP16 : begin
                next_burst_count = 4'b1111;
                next_burst_hold = 1'b1;
              end // case: BUR_INCR16 | BUR_WRAP16

              `BUR_INCR8, `BUR_WRAP8 : begin
                next_burst_count = 4'b0111;
                next_burst_hold = 1'b1;
              end // case: BUR_INCR8  | BUR_WRAP8

              `BUR_INCR4, `BUR_WRAP4 : begin
                next_burst_count = 4'b0011;
                next_burst_hold = 1'b1;
              end // case: BUR_INCR4  | BUR_WRAP4

              `BUR_SINGLE, `BUR_INCR : begin
                next_burst_count = 4'b0000;
                next_burst_hold = 1'b0;
              end // case: BUR_SINGLE | BUR_INCR

              default : begin
                next_burst_count = 4'bxxxx;
                next_burst_hold = 1'bx;
              end // case: default
            endcase // case(HBURSTM)
          end // case: `TRN_NONSEQ

          `TRN_SEQ : begin
            next_burst_count = reg_burst_count - 1'b1;
            if (reg_burst_count == 4'b0001)
              next_burst_hold = 1'b0;
            else
              next_burst_hold = reg_burst_hold;
          end // case: `TRN_SEQ

          `TRN_BUSY : begin
            next_burst_count = reg_burst_count;
            next_burst_hold = reg_burst_hold;
          end // case: `TRN_BUSY

          `TRN_IDLE : begin
            next_burst_count = 4'b0000;
            next_burst_hold = 1'b0;
          end // case: `TRN_IDLE

          default : begin
            next_burst_count = 4'bxxxx;
            next_burst_hold = 1'bx;
          end // case: default

        endcase // case(HTRANSM)
    end // block: p_next_burst_countComb


  // Sequential process
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_burst_seq
      if (!HRESETn)
        begin
          reg_burst_count <= 4'b0000;
          reg_burst_hold  <= 1'b0;
        end // if (HRESETn == 1'b0)
      else
        begin
          reg_burst_count <= next_burst_count;
          reg_burst_hold  <= next_burst_hold;
        end
    end // block: p_burst_seq


// -----------------------------------------------------------------------------
// Port Selection
// -----------------------------------------------------------------------------
// The Output Arbitration function looks at all the requests to use the
//  output port and determines which is the highest priority request. This
//  version of the arbitration logic uses a fixed priority scheme that is
//  gated by a tracking function of the burst boundary. Input port 0 is the
//  highest priority, input port 1 is the second highest priority, etc.
// If none of the input ports are requesting then the current port will
//  remain active if it is performing IDLE transfers to the selected slave. If
//  this is not the case then the no_port signal will be asserted which
//  indicates that no input port should be selected.

  always @ (
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
             req_port<<in>> or
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
             HSELM or HTRANSM or HMASTLOCKM or next_burst_hold or i_addr_in_port
           )
    begin : p_sel_port_comb
      // Default values are used for addr_in_port_next and no_port_next
      no_port_next = 1'b0;
      addr_in_port_next = i_addr_in_port;

      if ( HMASTLOCKM | next_burst_hold )
        addr_in_port_next = i_addr_in_port;
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
      else if ( req_port<<in>> | ( (i_addr_in_port == <<idw_si_v>>'b<<bin_in>>) & HSELM &
                              (HTRANSM != 2'b00) ) )
        addr_in_port_next = <<idw_si_v>>'b<<bin_in>>;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
      else if (HSELM)
        addr_in_port_next = i_addr_in_port;
      else
        no_port_next = 1'b1;
    end // block: p_sel_port_comb


  // Sequential process
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_addr_in_port_reg
      if (!HRESETn)
        begin
          no_port        <= 1'b1;
          i_addr_in_port <= {<<idw_si_v>>{1'b0}};
        end
      else
        if (HREADYM)
          begin
            no_port        <= no_port_next;
            i_addr_in_port <= addr_in_port_next;
          end
    end // block: p_addr_in_port_reg

  // Drive output with internal version
  assign addr_in_port = i_addr_in_port;


endmodule

// --================================= End ===================================--
