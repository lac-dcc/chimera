
//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2007-2010 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//  Version and Release Control Information:
//
//  File Revision       :  7369 
//  File Date           :  2010-04-27 20:30:45 +0530 (Tue, 27 Apr 2010) 
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Slave interface side of the APB asynchronous bridge
//-----------------------------------------------------------------------------

module cxapbasyncbridge_slave_domain
(

    //APB3 Bus
    paddrs,
    pwdatas,
    pwrites,
    penables,
    psels,
    prdatas,
    pslverrs,
    preadys,

    //Inter-domain APB bus
    apbm_req_async,
    apbm_ack_async,
    apbm_fwd_data_async,
    apbm_rev_data_async,

    //Clock and reset signals
    pclkens,
    pclks,
    presetsn

);

  //----------------------------------------------------------------------------
  // Port Declarations
  //----------------------------------------------------------------------------

  //APB3 Bus
  input   [31:0]      paddrs;                   //address of APB bus
  input   [31:0]      pwdatas;                  //write data of APB bus
  input               pwrites;                  //read/write control of APB bus
  input               penables;                 //enable of APB bus
  input               psels;                    //peripheral select of APB bus
  output  [31:0]      prdatas;                  //read data of APB bus
  output              pslverrs;                 //error response of APB bus
  output              preadys;                  //ready of APB bus

  //Inter-domain APB bus
  output              apbm_req_async;           //APB Transaction req signal
  input               apbm_ack_async;           //APB Transaction ack signal
  output  [64:0]      apbm_fwd_data_async;      //APB Transaction Forward Payload
  input   [32:0]      apbm_rev_data_async;      //APB Transaction Reverse Payload

  //Clock and reset signals
  input               pclkens;                  //apb clock enable (slave)
  input               pclks;                    //apb clock (slave)
  input               presetsn;                 //apb reset (slave)



  //----------------------------------------------------------------------------
  // Wire Declaration
  //----------------------------------------------------------------------------

  wire              pending_req;
  reg               hs_req_q;
  wire              nxt_hs_req;
  wire              hs_req_en;
  reg               pready_q;
  wire              clk_ready_en;

  wire              pready_q_nxt;

  wire              apbm_ack_corrupt_async;
  wire              apbm_ack_sync;

  wire              apbm_req_sync;

  wire      [32:0]  apbm_rev_data_corrupt_async;
  wire      [32:0]  apbm_rev_data_sync;

  wire              clk_fwd_en;
  wire      [64:0]  apbm_fwd_data_sync;

  reg       [32:0]  apbm_rev_data_capt;

  //----------------------------------------------------------------------------
  //                Slave interface req -> Master interface
  //----------------------------------------------------------------------------

  // Handshake is initiated when there's a pending request (both PENABLE and
  // PSEL high) and when previous transfer is completed (synchronized
  // acknowledge from core domain is low)

  assign pending_req = penables & psels;

  assign hs_req_en  = pclkens &
                    ((~hs_req_q & ~pready_q & pending_req) |
                     (hs_req_q & apbm_ack_sync));
  assign nxt_hs_req = ~hs_req_q & ~apbm_ack_sync & pending_req;

  always @ (posedge pclks or negedge presetsn)
    if (~presetsn)
      hs_req_q <= 1'b0;
    else if (hs_req_en)
      hs_req_q <= nxt_hs_req;

  //----------------------------------------------------------------------------
  //                Master interface ack -> Slave interface
  //----------------------------------------------------------------------------

  assign clk_ready_en = pclkens & (apbm_ack_sync & hs_req_q | pready_q);

  assign pready_q_nxt = apbm_ack_sync & hs_req_q;

  always @ (posedge pclks or negedge presetsn)
    if (~presetsn)
      pready_q <= 1'b0;
    else if (clk_ready_en)
      pready_q <= pready_q_nxt;

  assign preadys = pready_q;

  //----------------------------------------------------------------------------
  // Incoming Ack
  //----------------------------------------------------------------------------

  // Test component to corrupt ack going into synchroniser
  cxapbasyncbridge_cdc_corrupt_gry #(1) u_cdc_corrupt_ack
  (
      .clk       (pclks),
      .resetn    (presetsn),
      .sync      (1'b0),
      .d_async   (apbm_ack_async),
      .q_async   (apbm_ack_corrupt_async)
  );

  // Synchroniser to bring the ack into the clock domain
  cxapbasyncbridge_cdc_capt_sync #(1) u_cdc_sync_ack
  (
      .clk       (pclks),
      .resetn    (presetsn),
      .sync_en   (1'b1),
      .d_async   (apbm_ack_corrupt_async),
      .q         (apbm_ack_sync)
  );

  //----------------------------------------------------------------------------
  // Incoming Data
  //----------------------------------------------------------------------------

  // Test component to corrupt data
  cxapbasyncbridge_cdc_corrupt #(33) u_cdc_corrupt_rev_data
  (
      .clk       (pclks),
      .sync      (1'b0),
      .d         (apbm_rev_data_async),
      .q         (apbm_rev_data_corrupt_async)
  );

  // Test component to check for corrupted data
  cxapbasyncbridge_cdc_comb_and #(33) u_cdc_comb_and_rev_data
  (
      .q         (apbm_rev_data_sync),
      .d_async   (apbm_rev_data_corrupt_async),
      .valid     (apbm_ack_sync)
  );

  always @(posedge pclks)
    if(hs_req_q)
      begin
       apbm_rev_data_capt <= apbm_rev_data_sync;
      end

  // Expand Reverse Payload
  assign {prdatas, pslverrs} = apbm_rev_data_capt;

  //----------------------------------------------------------------------------
  // Outgoing Req
  //----------------------------------------------------------------------------

  cxapbasyncbridge_cdc_launch_gry #(1) u_cdc_launch_req
  (
      .clk       (pclks),
      .resetn    (presetsn),
      .enable    (hs_req_en),
      .in_cdc    (apbm_req_sync),
      .out_async (apbm_req_async)
  );

  assign apbm_req_sync = nxt_hs_req;

  //----------------------------------------------------------------------------
  // Outgoing Data
  //----------------------------------------------------------------------------

  // Test component and registering
  cxapbasyncbridge_cdc_launch_data #(65) u_cdc_launch_fwd_data
  (
     .clk       (pclks),
     .resetn    (presetsn),
     .enable    (clk_fwd_en),
     .in_cdc    (apbm_fwd_data_sync),
     .out_async (apbm_fwd_data_async));

  // Generate Clock Enable
  assign clk_fwd_en = ~hs_req_q & ~pready_q & pending_req & pclkens;

  // Concatenate Forward Payload
  assign apbm_fwd_data_sync = {paddrs, pwdatas, pwrites};


endmodule


