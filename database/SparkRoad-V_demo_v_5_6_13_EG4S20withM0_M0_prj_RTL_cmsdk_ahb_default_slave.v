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
//      Checked In          : $Date: 2013-01-14 16:53:05 +0000 (Mon, 14 Jan 2013) $
//
//      Revision            : $Revision: 233581 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB-Lite Default Slave
//-----------------------------------------------------------------------------
//
// Returns an error response when selected for a transfer
//

module cmsdk_ahb_default_slave (
  // Inputs
 input  wire       HCLK,      // Clock
 input  wire       HRESETn,   // Reset
 input  wire       HSEL,      // Slave select
 input  wire [1:0] HTRANS,    // Transfer type
 input  wire       HREADY,    // System ready

  // Outputs
 output wire       HREADYOUT, // Slave ready
 output wire       HRESP);    // Slave response

//
// Start of main code
//

// Internal signals
wire         trans_req;  // Transfer Request
reg    [1:0] resp_state; // Current FSM state for two-cycle error response
wire   [1:0] next_state; // Next FSM state

// Transfer address phase completes
assign trans_req = HSEL & HTRANS[1] & HREADY;

// Generate next state for the FSM.
// Bit 0 is connected to HREADYOUT and bit 1 is connected to HRESP,
// so the state encodings are:
//   01 - Idle
//   10 - 1st cycle of error response
//   11 - 2nd cycle of error response
assign next_state = { trans_req | (~resp_state[0]),
                      ~trans_req };

// Registering FSM state
always @(posedge HCLK or negedge HRESETn)
  if (~HRESETn)
    resp_state <= 2'b01; // ensure HREADYOUT is HIGH at reset
  else
    resp_state <= next_state;

// Connect to output
assign HREADYOUT = resp_state[0];
assign HRESP     = resp_state[1];

`ifdef ARM_AHB_ASSERT_ON

   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
  `include "std_ovl_defines.h"
  reg        ovl_last_hreadyout;
  reg        ovl_last_hsel;
  reg  [1:0] ovl_last_htrans;
  reg        ovl_last_hready;

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    ovl_last_hreadyout <= 1'b1;
    ovl_last_hsel      <= 1'b0;
    ovl_last_htrans    <= 2'b00;
    ovl_last_hready    <= 1'b1;
    end
  else
    begin
    ovl_last_hreadyout <= HREADYOUT;
    ovl_last_hsel      <= HSEL;
    ovl_last_htrans    <= HTRANS;
    ovl_last_hready    <= HREADY;
    end
  end

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "If HREADYOUT is 0, HRESP must be high")
   u_ovl_error_response_check_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(~HREADYOUT),
      .consequent_expr(HRESP)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "If in last cycle HREADYOUT is 0, this cycle both HRESP and HREADYOUT")
   u_ovl_error_response_check_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(~ovl_last_hreadyout),
      .consequent_expr(HRESP & HREADYOUT)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "If device is not selected, or if transfer is idle/busy, response must be OKAY")
   u_ovl_error_fault_check_1
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(~(ovl_last_hsel & ovl_last_htrans[1]) & ovl_last_hready),
      .consequent_expr((~HRESP) & HREADYOUT)
      );

   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "If device is selected, and if transfer is nseq/seq, response must be ERROR")
   u_ovl_error_fault_check_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_last_hsel & ovl_last_htrans[1] & ovl_last_hready),
      .consequent_expr(HRESP & (~HREADYOUT))
      );

`endif

endmodule
