

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
// APB MIB Defines
//-----------------------------------------------------------------------------

  `define    APBAS_ST_IDLE         2'b00
  `define    APBAS_ST_SETUP        2'b01
  `define    APBAS_ST_ACCESS       2'b10
  `define    APBAS_ST_ACK          2'b11

//-----------------------------------------------------------------------------
// Master interface side of the APB asynchronous bridge
//-----------------------------------------------------------------------------

module cxapbasyncbridge_master_domain
(

    //APB3 Bus
    paddrm,
    pwdatam,
    pwritem,
    penablem,
    pselm,
    prdatam,
    pslverrm,
    preadym,

    //Inter-domain APB bus
    apbs_req_async,
    apbs_ack_async,
    apbs_fwd_data_async,
    apbs_rev_data_async,

    //Clock and reset signals
    pclkenm,
    pclkm,
    presetmn

);

  //----------------------------------------------------------------------------
  // Port Declarations
  //----------------------------------------------------------------------------

  //APB3 Bus
  output  [31:0]      paddrm;                   //address of APB bus
  output  [31:0]      pwdatam;                  //write data of APB bus
  output              pwritem;                  //read/write control of APB bus
  output              penablem;                 //enable of APB bus
  output              pselm;                    //peripheral select of APB bus
  input   [31:0]      prdatam;                  //read data of APB bus
  input               pslverrm;                 //error response of APB bus
  input               preadym;                  //ready of APB bus

  //Inter-domain APB bus
  input               apbs_req_async;           //APB Transaction Req signal
  output              apbs_ack_async;           //APB Transaction Ack signal
  input   [64:0]      apbs_fwd_data_async;      //APB Transaction Forward Payload
  output  [32:0]      apbs_rev_data_async;      //APB Transaction Reverse Payload

  //Clock and reset signals
  input               pclkenm;                  //apb clock enable (master)
  input               pclkm;                    //apb clock (master)
  input               presetmn;                 //apb reset (master)



  //----------------------------------------------------------------------------
  // Wire Declaration
  //----------------------------------------------------------------------------
  reg        [1:0]  current_state_q;
  reg        [1:0]  next_state;
  wire              clk_en;
  reg               psel_q;
  
  wire              psel_q_nxt;

  wire              apbs_req_corrupt_async;
  wire              apbs_req_sync;

  wire              capt_en;

  wire      [64:0]  apbs_fwd_data_corrupt_async;
  wire      [64:0]  apbs_fwd_data_sync;

  wire              apbs_ack_sync;

  wire              clk_rev_en;
  wire      [32:0]  apbs_rev_data_sync;

  //----------------------------------------------------------------------------
  //                Slave interface req -> Master interface
  //----------------------------------------------------------------------------

  assign clk_en = pclkenm & 
                  (apbs_req_sync | (current_state_q == `APBAS_ST_ACK));

  always @ (posedge pclkm or negedge presetmn)
    if (~presetmn)
      current_state_q <= `APBAS_ST_IDLE;
    else if (clk_en)
      current_state_q <= next_state;

  always @(current_state_q or apbs_req_sync or preadym)
  begin
    case (current_state_q)
      `APBAS_ST_IDLE:
        next_state = apbs_req_sync ? `APBAS_ST_SETUP : `APBAS_ST_IDLE;
      `APBAS_ST_SETUP:
        next_state = `APBAS_ST_ACCESS;
      `APBAS_ST_ACCESS:
        next_state = preadym ? `APBAS_ST_ACK : `APBAS_ST_ACCESS;
      `APBAS_ST_ACK:
        next_state = ~apbs_req_sync ? `APBAS_ST_IDLE : `APBAS_ST_ACK;
    endcase
  end

  assign penablem = (current_state_q == `APBAS_ST_ACCESS);
  
  assign psel_q_nxt = apbs_req_sync & (current_state_q == `APBAS_ST_IDLE) | 
                     (current_state_q == `APBAS_ST_SETUP) | 
                     ~preadym & (current_state_q == `APBAS_ST_ACCESS);

  always @ (posedge pclkm or negedge presetmn)
    if (~presetmn)
      psel_q <= 1'b0;
    else if (clk_en)
      psel_q <= psel_q_nxt;

  assign pselm = psel_q;

  //----------------------------------------------------------------------------
  // Incoming Req
  //----------------------------------------------------------------------------

  // Test component to corrupt req going into synchroniser
  cxapbasyncbridge_cdc_corrupt_gry #(1) u_cdc_corrupt_req
  (
      .clk       (pclkm), 
      .resetn    (presetmn), 
      .sync      (1'b0),
      .d_async   (apbs_req_async),
      .q_async   (apbs_req_corrupt_async)
  );

  // Synchroniser to bring the req into the clock domain
  cxapbasyncbridge_cdc_capt_sync #(1) u_cdc_sync_req
  (
      .clk       (pclkm),
      .resetn    (presetmn),
      .sync_en   (1'b1),
      .d_async   (apbs_req_corrupt_async),
      .q         (apbs_req_sync)
  );

  //----------------------------------------------------------------------------
  // Incoming Data
  //----------------------------------------------------------------------------

  // Test component to corrupt data
  cxapbasyncbridge_cdc_corrupt #(65) u_cdc_corrupt_fwd_data
  (
      .clk       (pclkm), 
      .sync      (1'b0),
      .d         (apbs_fwd_data_async),
      .q         (apbs_fwd_data_corrupt_async)
  );

  // Test component to check for corrupted data
  cxapbasyncbridge_cdc_comb_and #(65) u_cdc_comb_and_rev_data
  (
      .q         (apbs_fwd_data_sync),
      .d_async   (apbs_fwd_data_corrupt_async),
      .valid     (capt_en)
  );


  // Enable the cdc capt block from rising edge of synchronised req until rising
  // edge of output ack. 
  assign capt_en = apbs_req_sync & (~apbs_ack_sync);

  // Expand Forward Payload
  assign {paddrm, pwdatam, pwritem} = apbs_fwd_data_sync;

  //----------------------------------------------------------------------------
  // Outgoing Ack
  //----------------------------------------------------------------------------

  cxapbasyncbridge_cdc_launch_gry #(1) u_cdc_launch_ack
  (
      .clk       (pclkm),
      .resetn    (presetmn),
      .enable    (1'b1),
      .in_cdc    (apbs_ack_sync),
      .out_async (apbs_ack_async)
  );

  assign apbs_ack_sync = (current_state_q == `APBAS_ST_ACK);

  //----------------------------------------------------------------------------
  // Outgoing Data
  //----------------------------------------------------------------------------

  // Test component and registering
  cxapbasyncbridge_cdc_launch_data #(33) u_cdc_launch_rev_data
  (
     .clk       (pclkm),
     .resetn    (presetmn),
     .enable    (clk_rev_en),
     .in_cdc    (apbs_rev_data_sync),
     .out_async (apbs_rev_data_async));

  // Generate Clock Enable
  assign clk_rev_en = pclkenm & (current_state_q == `APBAS_ST_ACCESS) & preadym;

  // Concatenate Reverse Payload
  assign apbs_rev_data_sync = {prdatam, pslverrm};


endmodule

//-----------------------------------------------------------------------------
// APB Bridge MIB Undefines
//-----------------------------------------------------------------------------

  `undef     APBAS_ST_IDLE
  `undef     APBAS_ST_SETUP
  `undef     APBAS_ST_ACCESS
  `undef     APBAS_ST_ACK

