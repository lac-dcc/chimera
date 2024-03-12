//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2012-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//   Checked In : $Date: 2013-03-27 10:42:39 +0000 (Wed, 27 Mar 2013) $
//   Revision   : $Revision: 242361 $
//   Release    : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//-----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// AHB-Lite to AHB-Lite and APB4 Asynchronous Bridge - Slave side
// ----------------------------------------------------------------------------

module cmsdk_ahb_to_ahb_apb_async_slave (
      // --------
      // AHB-Lite slave interface

      input  wire        HCLKS,
      input  wire        HRESETSn,

      input  wire        HREADYS,
      input  wire        HSELAHBS,
      input  wire        HSELAPBS,
      input  wire        HTRANSS_bit1,
      input  wire        HWRITES,

      output wire        s_hready_out,  // HREADYOUTS
      output wire        s_hresp_out,   // HRESPS

      // --------
      // CDC interface with master side

      // Slave to master

      output wire        s_tx_sema_en,  // Semaphore-out (transmit) enable
      output wire        s_tx_sema_nxt, // Semaphore-out (transmit) next value
      input  wire        s_tx_sema_q,   // Semaphore-out (transmit)

      output wire        s_ad_en,       // Address phase buffer enable
      output wire        s_wd_en,       // Write data buffer enable

      // Master to slave

      input  wire        s_rx_sema_q,   // Semaphore-in (receive)

      output wire        s_mask,        // Master to slave buffers mask
      input  wire        s_hresp_q      // Master to slave HRESP/PSLVERR buffer
   );

   // -------------------------------------------------------------------------
   // Slave side state machine
   // -------------------------------------------------------------------------

   localparam ST_BITS = 2;

   localparam [ST_BITS-1:0] ST_IDLE = 2'b00; // Idle, waiting for transaction
   localparam [ST_BITS-1:0] ST_DATA = 2'b01; // Write data phase
   localparam [ST_BITS-1:0] ST_BUSY = 2'b10; // Waiting for bridge response
   localparam [ST_BITS-1:0] ST_RESP = 2'b11; // Second cycle of error response

   reg [ST_BITS-1:0] s_state_q; // FSM state

   // -------------------------------------------------------------------------
   // Determine whether an AHB transaction is being presented
   // -------------------------------------------------------------------------

   wire s_req_sel   = HSELAHBS | HSELAPBS;    // Either master selected
   wire s_req_trans = HTRANSS_bit1 & s_req_sel; // Any transaction to bridge
   wire s_req_read  = s_req_trans & ~HWRITES; // ... of READ type
   wire s_req_write = s_req_trans &  HWRITES; // ... of WRITE type

   // -------------------------------------------------------------------------
   // Determine current posture of bridge
   // -------------------------------------------------------------------------

   wire   s_sema_match = s_rx_sema_q == s_tx_sema_q;
   assign s_mask       = ~s_sema_match;

   // -------------------------------------------------------------------------
   // Perform state specific computation
   // -------------------------------------------------------------------------

   // --------
   // IDLE state : Capture address

   wire s_idle_activate       = HREADYS & s_req_read;
   wire s_idle_ad_en          = HREADYS & s_req_trans;
   wire s_idle_hready_out     = 1'b1;
   wire s_idle_state_en       = HREADYS & s_req_trans;
   wire s_idle_state_sel_data = s_req_write;
   wire s_idle_state_sel_busy = s_req_read;

   // --------
   // DATA state : Capture write data before bridging (skipped for reads)

   wire s_data_activate       = 1'b1;
   wire s_data_state_en       = 1'b1;
   wire s_data_state_sel_busy = 1'b1;
   wire s_data_wd_en          = 1'b1;

   // --------
   // BUSY state : Wait for bridge to complete transaction

   wire s_busy_activate       = s_sema_match & ~s_hresp_q & s_req_read;
   wire s_busy_ad_en          = s_sema_match & ~s_hresp_q & s_req_trans;
   wire s_busy_hready_out     = s_sema_match & ~s_hresp_q;
   wire s_busy_hresp_out      = s_hresp_q;
   wire s_busy_state_en       = s_sema_match;
   wire s_busy_state_sel_idle = ~s_hresp_q & ~s_req_trans;
   wire s_busy_state_sel_data = ~s_hresp_q & s_req_write;
   wire s_busy_state_sel_busy = ~s_hresp_q & s_req_read;
   wire s_busy_state_sel_resp = s_hresp_q;

   // --------
   // RESP state : Second cycle of any error response

   wire s_resp_activate       = s_req_read;
   wire s_resp_ad_en          = s_req_trans;
   wire s_resp_hresp_out      = 1'b1;
   wire s_resp_hready_out     = 1'b1;
   wire s_resp_state_en       = 1'b1;
   wire s_resp_state_sel_idle = ~s_req_trans;
   wire s_resp_state_sel_data = s_req_write;
   wire s_resp_state_sel_busy = s_req_read;

   // -------------------------------------------------------------------------
   // Combine state specific computation based on current state
   // -------------------------------------------------------------------------

   wire s_run_idle = s_state_q == ST_IDLE;
   wire s_run_data = s_state_q == ST_DATA;
   wire s_run_busy = s_state_q == ST_BUSY;
   wire s_run_resp = s_state_q == ST_RESP;

   // --------

   wire   s_activate       = ( s_run_idle & s_idle_activate |
                               s_run_data & s_data_activate |
                               s_run_busy & s_busy_activate |
                               s_run_resp & s_resp_activate );

   assign s_ad_en          = ( s_run_idle & s_idle_ad_en |
                               s_run_busy & s_busy_ad_en |
                               s_run_resp & s_resp_ad_en );

   assign s_hready_out     = ( s_run_idle & s_idle_hready_out |
                               s_run_busy & s_busy_hready_out |
                               s_run_resp & s_resp_hready_out );

   assign s_hresp_out      = ( s_run_busy & s_busy_hresp_out |
                               s_run_resp & s_resp_hresp_out );

   wire   s_state_en       = ( s_run_idle & s_idle_state_en |
                               s_run_data & s_data_state_en |
                               s_run_busy & s_busy_state_en |
                               s_run_resp & s_resp_state_en );

   wire   s_state_sel_busy = ( s_run_idle & s_idle_state_sel_busy |
                               s_run_data & s_data_state_sel_busy |
                               s_run_busy & s_busy_state_sel_busy |
                               s_run_resp & s_resp_state_sel_busy );

   wire   s_state_sel_data = ( s_run_idle & s_idle_state_sel_data |
                               s_run_busy & s_busy_state_sel_data |
                               s_run_resp & s_resp_state_sel_data );

   wire   s_state_sel_idle = ( s_run_busy & s_busy_state_sel_idle |
                               s_run_resp & s_resp_state_sel_idle );

   wire   s_state_sel_resp = ( s_run_busy & s_busy_state_sel_resp );

   assign s_wd_en          = ( s_run_data & s_data_wd_en );

   // -------------------------------------------------------------------------
   // Determine next-state value
   // -------------------------------------------------------------------------

   wire [ST_BITS-1:0] s_state_nxt = ( {ST_BITS{s_state_sel_busy}} & ST_BUSY |
                                      {ST_BITS{s_state_sel_data}} & ST_DATA |
                                      {ST_BITS{s_state_sel_idle}} & ST_IDLE |
                                      {ST_BITS{s_state_sel_resp}} & ST_RESP );

   // -------------------------------------------------------------------------
   // Generate semaphore for each new transaction
   // -------------------------------------------------------------------------

   assign s_tx_sema_en  = s_activate;
   assign s_tx_sema_nxt = ~s_tx_sema_q;

   // -------------------------------------------------------------------------
   // Synchronous state update in HCLKS domain
   // -------------------------------------------------------------------------

   always @(posedge HCLKS or negedge HRESETSn)
      if(~HRESETSn)
         s_state_q <= ST_IDLE;
      else if(s_state_en)
         s_state_q <= s_state_nxt;

   // -------------------------------------------------------------------------

endmodule

// ----------------------------------------------------------------------------
// EOF
// ----------------------------------------------------------------------------
