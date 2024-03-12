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
// Abstract : APB domain logic for asynchronous AHB to APB bridge
//-----------------------------------------------------------------------------
//
module cmsdk_ahb_to_apb_async_p #(
  // Parameter to define address width
  // 16 = 2^16 = 64KB APB address space
  parameter     ADDRWIDTH = 16)
 (
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------

  input  wire                 PCLK,      // Un-gated peripheral bus clock
  input  wire                 PRESETn,   // Peripheral bus reset

  input  wire                 s_req_p,   // Handshaking Output
  output wire                 s_ack_p,   // Handshaking Input

  input  wire [ADDRWIDTH-3:0] s_addr,     // Address
  input  wire                 s_trans_valid, // Transfer valid
  input  wire           [1:0] s_prot,     // PROT information
  input  wire           [3:0] s_strb,     // Byte strobe information
  input  wire                 s_write,
  input  wire          [31:0] s_wdata,

  output reg           [31:0] s_rdata,    // Sampled bus outputs
  output reg                  s_resp,

                                          // APB Output
  output wire [ADDRWIDTH-1:0] PADDR,      // APB Address
  output wire                 PENABLE,    // APB Enable
  output wire                 PWRITE,     // APB Write
  output wire           [3:0] PSTRB,      // APB Byte Strobe
  output wire           [2:0] PPROT,      // APB Prot
  output wire          [31:0] PWDATA,     // APB write data
  output wire                 PSEL,       // APB Select

  input  wire          [31:0] PRDATA,     // APB Input
  input  wire                 PREADY,
  input  wire                 PSLVERR,

  output wire                 APBACTIVE); // APB bus is active, for clock gating
                                          // of APB bus

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------
  reg                    last_s_req_p; // Stored last request signal
  reg                    reg_s_ack_p;  // Register for ack output
  reg                    nxt_s_ack_p;  // Next state for ack output

  // State machine
  localparam fsm_apb_idle = 2'b00; // 00 - IDLE / DONE / Second cycle of Error response
  localparam fsm_apb_cyc1 = 2'b01; // 01 - first cycle of transfer
  localparam fsm_apb_wait = 2'b11; // 11 - other cycles of transfer
  localparam fsm_apb_unused = 2'b10;
  reg              [1:0] curr_state;
  reg              [1:0] next_state;

  wire                   req_detect; // Transfer request detect
  wire                   trans_done; // Transfer done

  reg                    s_write_reg;
  reg                    s_trans_valid_reg;

  // --------------------------------------------------------------------------
  // Start of main code
  // --------------------------------------------------------------------------

  // Sampling request
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    last_s_req_p <= 1'b0;
  else
    last_s_req_p <= s_req_p;
  end

  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    s_trans_valid_reg <= 1'b0;
  else if (req_detect)
    s_trans_valid_reg <= s_trans_valid;
  end

  assign req_detect = (s_req_p != last_s_req_p); // toggle of request is detected
  assign trans_done = (curr_state==fsm_apb_wait) & PREADY;

  // Finite state machine
  always @(curr_state or req_detect or PREADY or s_trans_valid_reg)
  begin
    case (curr_state)
      fsm_apb_idle : // Idle
        begin
        if  (req_detect)
          next_state = fsm_apb_cyc1;  // First cycle of APB transfer
        else
          next_state = fsm_apb_idle;  // remain idle
        end
      fsm_apb_cyc1 : // First cycle of APB transfer,
              // if transfer is invalid (due to sync glitch) return to idle
        next_state = (s_trans_valid_reg) ? fsm_apb_wait : fsm_apb_idle;
      fsm_apb_wait : // Remaining cycles of APB transfer
        begin
        if (PREADY)
          next_state = fsm_apb_idle;  // return to idle
        else
          next_state = fsm_apb_wait;  // wait for PREADY
        end
      default:
        next_state = 2'bxx;    // Should not be here
    endcase
  end

  // Sequential part of the state machine
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    curr_state <= fsm_apb_idle;
  else
    curr_state <= next_state;
  end

  // Sampling of read data
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    s_rdata <= {32{1'b0}};
  else if (trans_done)
    s_rdata <= PRDATA;
  end

  // Sampling of response
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    s_resp <= 1'b0;
  else if (trans_done)
    s_resp <= PSLVERR;
  end

  // Acknowledge generation
  always @(curr_state or s_trans_valid_reg or PREADY or s_req_p or reg_s_ack_p)
  begin
  if ((curr_state==fsm_apb_cyc1) & (~s_trans_valid_reg))
    nxt_s_ack_p = s_req_p; // Request detect but !s_trans_valid_reg -> reset
  else if ((curr_state==fsm_apb_wait) & PREADY)  // Acknowledge generation
    nxt_s_ack_p = s_req_p; // End of transfer
  else
    nxt_s_ack_p = reg_s_ack_p; // unchange
  end

  // Acknowledge registering
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_s_ack_p <= 1'b0;
  else
    reg_s_ack_p <= nxt_s_ack_p;
  end

  // Sampling request
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    s_write_reg <= 1'b0;
  else if (req_detect)
    s_write_reg <= s_write;
  end

  assign s_ack_p     = reg_s_ack_p; // connect to top level
  assign APBACTIVE = req_detect | curr_state[0];

  // The following logic use bit encoding directly for best logic optimization
  assign PENABLE   = curr_state[1] ; // assert during fsm_apb_wait
  assign PSEL      = curr_state[0] & s_trans_valid_reg; // assert during fsm_apb_cyc1 and fsm_apb_wait
  assign PWRITE    = (curr_state[0]) ? s_write_reg : 1'b0;
  assign PPROT     = (curr_state[0]) ? {s_prot[1], 1'b0, s_prot[0]} : 3'b000;
  assign PSTRB     = (curr_state[0]) ? s_strb[3:0] : 4'b0000;
  assign PADDR     = (curr_state[0]) ? {s_addr, 2'b00} : {(ADDRWIDTH){1'b0}};
  assign PWDATA    = (curr_state[0]) ? s_wdata : {32{1'b0}};



`ifdef ARM_APB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`include "std_ovl_defines.h"
   // Ensure curr_state must not be 2'b10
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "state in illegal state")
   u_ovl_curr_state_illegal
     (.clk(PCLK), .reset_n(PRESETn),
      .test_expr(curr_state==fsm_apb_unused));
`endif

endmodule


