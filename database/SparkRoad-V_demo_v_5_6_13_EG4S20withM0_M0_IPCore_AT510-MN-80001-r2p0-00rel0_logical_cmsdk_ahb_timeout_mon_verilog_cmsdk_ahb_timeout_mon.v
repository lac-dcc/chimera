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
//      Checked In          : $Date: 2013-04-16 13:31:29 +0100 (Tue, 16 Apr 2013) $
//
//      Revision            : $Revision: 244163 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB-Lite timeout monitor, used to monitor a slave's HREADYOUT
//            signal.
//            This component is transparent when there is no timeout.
//            After the HREADYOUT signal remains LOW for a pre-defined number
//            of cycles, the timeout monitor issues an error response to the
//            master initiating transfers and blocks transfers to the slave.
//-----------------------------------------------------------------------------

module cmsdk_ahb_timeout_mon #(

      // Number of wait state cycles to trigger the timeout.
      // Must be between 2 and 1024 inclusive.
      parameter TIME_OUT_VALUE = 16

   ) (

      // --------
      // Clock and reset

      input  wire        HCLK,
      input  wire        HRESETn,

      // --------
      // AHB-Lite slave interface

      input  wire        HSELS,
      input  wire [ 1:0] HTRANSS,
      input  wire        HREADYS,

      output wire        HREADYOUTS,
      output wire        HRESPS,

      // --------
      // AHB-Lite master interface

      output wire        HSELM,
      output wire [ 1:0] HTRANSM,
      output wire        HREADYM,

      input  wire        HREADYOUTM,
      input  wire        HRESPM,

      // --------
      // Status interface

      output wire        TIMEOUT // Timeout monitor is in the timeout state

   );

   //--------------------------------------------------------------------------
   // Local parameters
   //--------------------------------------------------------------------------

   localparam CNT_WIDTH = (TIME_OUT_VALUE <= 16 ) ?  4 :
                          (TIME_OUT_VALUE <= 32 ) ?  5 :
                          (TIME_OUT_VALUE <= 64 ) ?  6 :
                          (TIME_OUT_VALUE <= 128) ?  7 :
                          (TIME_OUT_VALUE <= 256) ?  8 :
                          (TIME_OUT_VALUE <= 512) ?  9 :
                                                    10;

   //--------------------------------------------------------------------------
   // Internal state
   //--------------------------------------------------------------------------

   reg                 s_dphase_q; // slave side data phase

   reg [CNT_WIDTH-1:0] tout_cnt_q; // wait state counter

   reg                 m_tout_q;   // master side timeout
   reg                 s_tout_q;   // slave  side timeout

   reg                 s_ec2_q;    // 2nd cycle of 2-cycle error response

   //--------------------------------------------------------------------------
   // Timeout counter and state machine
   //--------------------------------------------------------------------------

   // Slave interface is in the data phase of an NSEQ or SEQ transfer
   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         s_dphase_q <= 1'b0;
      else if (HREADYS)
         s_dphase_q <= HSELS & HTRANSS[1];

   // --------
   // Timeout counter
   // Counts the number of wait states transfers incur

   wire tout_cnt_en = s_dphase_q;

   wire [CNT_WIDTH  :0] tout_cnt_plus1 = tout_cnt_q + 1'b1;
   wire [CNT_WIDTH-1:0] tout_cnt_nxt   = HREADYS ? {CNT_WIDTH{1'b0}} : tout_cnt_plus1[CNT_WIDTH-1:0];

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         tout_cnt_q <= {CNT_WIDTH{1'b0}};
      else if (tout_cnt_en)
         tout_cnt_q <= tout_cnt_nxt;

   // --------
   // Timeout state
   // Uses two bits of state, m_tout_q and s_tout_q, in order to transition out of timeout state correctly.
   // {s_tout_q, m_tout_q} | meaning
   //                2'b00 | not in timeout state
   //                2'b11 | in timeout state and transfer that timed out still ongoing
   //                2'b10 | in timeout state and transfer that timed out complete
   // Both get set at the same time when the counter has reached the timeout value.
   // m_tout_q gets cleared as soon as the transfer that timed out has completed on the master side.
   // s_tout_q gets cleared when it is OK for the timeout monitor to become transparent again.

   wire [CNT_WIDTH-1:0] time_out_value_minus1 = TIME_OUT_VALUE[CNT_WIDTH-1:0] - 1'b1;
   wire tout_cnt_max = tout_cnt_q == time_out_value_minus1;
   // Don't go into the timeout state if:
   //  . HREADYOUTM is HIGH (transfer complete) OR
   //  . HRESP is HIGH (transfer complete next cycle)
   wire tout_set = ~s_tout_q & tout_cnt_max & ~HREADYOUTM & ~HRESPM;

   wire m_tout_clr = HREADYOUTM;

   // During timeout, HREADYOUTS is HIGH if not in a data phase or if in the 2nd cycle of an error response
   wire hreadyouts_tout = ~s_dphase_q | s_ec2_q;

   // Become transparent again only when:
   //  . the transfer that timed out has completed on the master side AND
   //  . the component is either not processing a slave transfer or in the last cycle of processing one AND
   //  . the connected master is not in the middle of a burst (HTRANSS BUSY OR SEQ)
   wire s_tout_clr = ~m_tout_q & hreadyouts_tout & ~HTRANSS[0];

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         m_tout_q <= 1'b0;
      else if (tout_set | m_tout_clr)
         m_tout_q <= tout_set;

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         s_tout_q <= 1'b0;
      else if (tout_set | s_tout_clr)
         s_tout_q <= tout_set;

   //--------------------------------------------------------------------------
   // Error response generation
   //--------------------------------------------------------------------------

   // 2nd cycle of 2-cycle error response
   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         s_ec2_q <= 1'b0;
      else if (s_tout_q)
         s_ec2_q <= s_dphase_q & ~s_ec2_q;

   //--------------------------------------------------------------------------
   // Outputs generation
   //--------------------------------------------------------------------------

   assign TIMEOUT = s_tout_q;

   // Mask master side outputs during timeout state but be transparent if getting out of timeout state
   wire m_from_s = ~s_tout_q | s_tout_clr;

   assign HSELM   = m_from_s ? HSELS   :       1'b0;
   assign HTRANSM = m_from_s ? HTRANSS :      2'b00;
   assign HREADYM = m_from_s ? HREADYS : HREADYOUTM;

   // Generated timeout error responses to transfers while in timeout state
   wire s_from_m = ~s_tout_q;

   assign HREADYOUTS = s_from_m ? HREADYOUTM : hreadyouts_tout;
   assign HRESPS     = s_from_m ? HRESPM     :      s_dphase_q;

   //--------------------------------------------------------------------------
   // Module logic end
   //--------------------------------------------------------------------------

   //--------------------------------------------------------------------------
   // Assertions
   //--------------------------------------------------------------------------

`ifdef ARM_AHB_ASSERT_ON

   `include "std_ovl_defines.h"

   wire [1:0] asrt_tout_st = {s_tout_q, m_tout_q};
   reg  [1:0] asrt_tout_st_reg; always @(posedge HCLK) asrt_tout_st_reg <= asrt_tout_st;

   assert_implication #( `OVL_ERROR, `OVL_ASSERT,
      "Timeout state transition must be legal"
   ) u_ovl_timeout_state_transition (
      .clk             ( HCLK                                                                                      ),
      .reset_n         ( HRESETn                                                                                   ),
      .antecedent_expr ( 1'b1                                                                                      ),
      .consequent_expr ( ( (asrt_tout_st_reg == 2'b00) & ( (asrt_tout_st == 2'b00) | (asrt_tout_st == 2'b11) ) ) |
                         ( (asrt_tout_st_reg == 2'b11) & ( (asrt_tout_st == 2'b11) | (asrt_tout_st == 2'b10) ) ) |
                         ( (asrt_tout_st_reg == 2'b10) & ( (asrt_tout_st == 2'b10) | (asrt_tout_st == 2'b00) ) )   )
   );

   // The timeout monitor is transparent when not in the timeout state
   assert_implication #( `OVL_ERROR, `OVL_ASSERT,
      "Timeout monitor must be transparent when not in timeout state"
   ) u_ovl_transparent_outside_timeout (
      .clk             ( HCLK                         ),
      .reset_n         ( HRESETn                      ),
      .antecedent_expr ( ~TIMEOUT                     ),
      .consequent_expr ( (HSELS      == HSELM     ) &
                         (HTRANSS    == HTRANSM   ) &
                         (HREADYS    == HREADYM   ) &
                         (HREADYOUTS == HREADYOUTM) &
                         (HRESPS     == HRESPM    )   )
   );

   // When in the timeout state, the timeout monitor must respond to slave NSEQ and SEQ transfers with an error response
   // (unless it's coming out of timeout state)
   assert_next #( `OVL_ERROR, 1, 1, 0, `OVL_ASSERT,
      "In timeout state, timeout monitor must respond to transfers with error response"
   ) u_ovl_ahb_timeout_err_resp (
      .clk         ( HCLK                                   ),
      .reset_n     ( HRESETn                                ),
      .start_event ( TIMEOUT & HSELS & HTRANSS[1] & HREADYS ),
      .test_expr   ( HRESPS | ~TIMEOUT                      )
   );

   // The counter value cannot reach or exceed the timeout value unless in timeout state
   // (Unless the first cycle of an error response was detected on the previous cycle,
   // in which case it can reach the timeout value )
   assert_implication #( `OVL_ERROR, `OVL_ASSERT,
      "Counter value must be less than timeout value when not in timeout state"
   ) u_ovl_tout_cnt_q_less_than_timeout_val (
      .clk             ( HCLK                                                            ),
      .reset_n         ( HRESETn                                                         ),
      .antecedent_expr ( ~TIMEOUT                                                        ),
      .consequent_expr ( (tout_cnt_q < TIME_OUT_VALUE) | (s_dphase_q & HREADYS & HRESPS) )
   );

   // The counter value cannot reach or exceed the timeout value unless in timeout state
   // (Unless the first cycle of an error response was detected on the previous cycle,
   // in which case it can reach the timeout value )
   assert_implication #( `OVL_ERROR, `OVL_ASSERT,
      "Counter value must be less than timeout value when not in timeout state"
   ) u_ovl_tout_cnt_q_less_than_timeout_val_plus_one (
      .clk             ( HCLK                           ),
      .reset_n         ( HRESETn                        ),
      .antecedent_expr ( ~TIMEOUT                       ),
      .consequent_expr ( (tout_cnt_q <= TIME_OUT_VALUE) )
   );

   // Timeout value parameter range check
   assert_implication #( `OVL_ERROR, `OVL_ASSERT,
      "TIME_OUT_VALUE parameter value must be >=2 and <=1024"
   ) u_ovl_timeout_val_param (
      .clk             ( HCLK                                             ),
      .reset_n         ( HRESETn                                          ),
      .antecedent_expr ( 1'b1                                             ),
      .consequent_expr ( (TIME_OUT_VALUE >= 2) & (TIME_OUT_VALUE <= 1024) )
   );

`endif

endmodule
