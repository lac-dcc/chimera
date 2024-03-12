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
// AHB-Lite to AHB-Lite and APB4 Asynchronous Bridge - Master side
// ----------------------------------------------------------------------------

module cmsdk_ahb_to_ahb_apb_async_master (
      input  wire        HCLKM,
      input  wire        HRESETMn,

      // --------
      // CDC interface with slave side

      // Slave to master

      input  wire        m_rx_sema_q,     // Semaphore-in (receive)
      input  wire        m_lock_q,       // Synchronized version of s_hmastlock_q

      output wire        m_mask,         // Slave to master buffers mask
      input  wire [ 1:0] m_haddr_q_1to0, // Slave to master HADDRS buffer (bits[1:0])
      input  wire        m_hmastlock_q,  //                 HMASTLOCKS
      input  wire        m_hselapb_q,    //                 HSELAPBS
      input  wire [ 1:0] m_hsize_1to0_q, //                 HSIZES[1:0]
      input  wire        m_hwrite_q,     //                 HWRITES

      // Master to slave

      output wire        m_tx_sema_en,   // Semaphore-out (transmit) enable
      output wire        m_tx_sema_nxt,  // Semaphore-out (transmit) next value
      input  wire        m_tx_sema_q,    // Semaphore-out (transmit)

      output wire        m_rd_en,        // Response and read data buffer enable

      output wire        m_resp,         // Response
      output wire [31:0] m_rdata,        // Read data

      // --------
      // AHB-Lite master interface

      input  wire        HREADYM,
      input  wire        HRESPM,
      input  wire [31:0] HRDATAM,

      output wire        m_htrans,       // HTRASM[1]
      output wire        m_hmastlock,    // HMASTLOCKM

      // --------
      // APB master interface

      input  wire        PREADYM,
      input  wire        PSLVERRM,
      input  wire [31:0] PRDATAM,

      output wire        m_psel,         // PSELM
      output wire        m_penable,      // PENABLEM
      output wire [ 3:0] m_pstrb,        // PSTRBM

      // --------
      // Clock gating control interface

      output wire        m_hactive,      // HACTIVEM
      output wire        m_pactive       // PACTIVEM
   );

   // -------------------------------------------------------------------------
   // Master side state
   // -------------------------------------------------------------------------

   reg         m_mode_q;           // FSM state (mode + semaphores = FSM state)

   reg         m_force_lock_q;     // Drive HMASTLOCKM HIGH outside transfer
   reg         m_delayed_unlock_q; // Delayed unlock cycle

   reg         m_in_rst_q;         // In reset

   // -------------------------------------------------------------------------
   // Master side state machine
   // -------------------------------------------------------------------------

   // For the APB4 master interface:
   //  - cycle_0 is the setup phase
   //  - cycle_1 is the access phase

   // For the AHB-Lite master interface:
   //  - cycle_0 is the address phase
   //  - cycle_1 is the data phase

   // Reset and HMASTLOCKM create complications and require special care.

   wire        m_new_req        = m_rx_sema_q != m_mode_q;

   wire        m_need_unlock    = ( (m_force_lock_q | m_delayed_unlock_q) &
                                    ~m_hmastlock_q );
   wire        m_need_unlock_h  = ~m_hselapb_q & m_need_unlock;
   wire        m_need_unlock_p  =  m_hselapb_q & m_need_unlock;

   wire        m_cycle_unlock_p = m_new_req &  m_need_unlock_p;

   wire        m_cycle_unlock_h = m_new_req &  m_need_unlock_h;
   wire        m_cycle_0        = m_new_req & ~m_need_unlock_h;
   wire        m_cycle_1        = m_mode_q != m_tx_sema_q;
   wire        m_cycle_any      = m_rx_sema_q != m_tx_sema_q;

   wire        m_preadym        = PREADYM | ~m_cycle_1;
   wire        m_ready_run      = m_hselapb_q ? m_preadym : HREADYM;
   wire        m_ready          = m_ready_run;

   wire        m_mode_en        = m_ready & ~m_cycle_unlock_h & ~m_in_rst_q;
   wire        m_mode_nxt       = m_rx_sema_q;

   // Maintain HMASTLOCKM HIGH during locked sequence

   wire        m_force_lock_en  = 1'b1;
   wire        m_force_lock_nxt = ( ~m_cycle_any & (m_force_lock_q & m_lock_q) |
                                    m_cycle_any & m_hmastlock_q );

   // Guard against reconvergence between m_rx_sema_q and m_lock_q

   wire        m_delayed_unlock_en  = 1'b1;
   wire        m_delayed_unlock_nxt = ~m_cycle_any & ~m_lock_q & m_force_lock_q;

   // Reset awareness

   wire        m_in_rst_en  = 1'b1;
   wire        m_in_rst_nxt = 1'b0;

   // -------------------------------------------------------------------------
   // CDC logic
   // -------------------------------------------------------------------------

   // Semaphore

   assign      m_tx_sema_en     = m_mode_en;
   assign      m_tx_sema_nxt    = m_mode_q;

   // Slave to master buffers mask

   assign      m_mask           = ~m_cycle_any;

   // Master to slave buffers update

   assign      m_rd_en          = m_cycle_1 & m_ready;

   // -------------------------------------------------------------------------
   // Bus interface signals
   // -------------------------------------------------------------------------

   assign      m_hmastlock      = ( ~m_cycle_any & m_force_lock_q |
                                    m_new_req & m_hmastlock_q |
                                    m_cycle_1 & m_hmastlock_q );

   assign      m_psel           =  m_hselapb_q & m_cycle_any & ~m_in_rst_q;
   assign      m_penable        =  m_hselapb_q & m_cycle_1;

   assign      m_htrans         = ~m_hselapb_q & m_cycle_0   & ~m_in_rst_q;

   // APB4 strobes

   wire [ 3:0] m_strb           = { ( m_hsize_1to0_q[1] |
                                      m_hsize_1to0_q[0] & m_haddr_q_1to0[1] |
                                      ( (m_hsize_1to0_q == 2'b00) &
                                        (m_haddr_q_1to0 == 2'b11) ) ),

                                    ( m_hsize_1to0_q[1] |
                                      m_hsize_1to0_q[0] & m_haddr_q_1to0[1] |
                                      ( (m_hsize_1to0_q == 2'b00) &
                                        (m_haddr_q_1to0 == 2'b10) ) ),

                                    ( m_hsize_1to0_q[1] |
                                      m_hsize_1to0_q[0] & ~m_haddr_q_1to0[1] |
                                      ( (m_hsize_1to0_q == 2'b00) &
                                        (m_haddr_q_1to0 == 2'b01) ) ),

                                    ( m_hsize_1to0_q[1] |
                                      m_hsize_1to0_q[0] & ~m_haddr_q_1to0[1] |
                                      ( (m_hsize_1to0_q == 2'b00) &
                                        (m_haddr_q_1to0 == 2'b00) ) )
                                    };

   assign      m_pstrb          = {4{m_hwrite_q}} & m_strb[3:0];

   // -------------------------------------------------------------------------
   // Response and read data selection
   // -------------------------------------------------------------------------

   assign      m_resp           = m_hselapb_q ? PSLVERRM : HRESPM;

   assign      m_rdata          = ( {32{ m_hselapb_q}} & PRDATAM[31:0] |
                                    {32{~m_hselapb_q}} & HRDATAM[31:0] );

   // -------------------------------------------------------------------------
   // External clock gating control creation
   // -------------------------------------------------------------------------

   assign      m_hactive        = ( m_cycle_any & ~m_hselapb_q |
                                    m_in_rst_q |
                                    m_delayed_unlock_q |
                                    m_cycle_unlock_p );

   assign      m_pactive        = ( m_cycle_any &  m_hselapb_q |
                                    m_in_rst_q );

   // -------------------------------------------------------------------------
   // Synchronous state update in HCLKM domain
   // -------------------------------------------------------------------------

   always @(posedge HCLKM or negedge HRESETMn)
      if(~HRESETMn)
         m_mode_q <= 1'b0;
      else if(m_mode_en)
         m_mode_q <= m_mode_nxt;

   always @(posedge HCLKM or negedge HRESETMn)
      if(~HRESETMn)
         m_force_lock_q <= 1'b0;
      else if(m_force_lock_en)
         m_force_lock_q <= m_force_lock_nxt;

   always @(posedge HCLKM or negedge HRESETMn)
      if(~HRESETMn)
         m_delayed_unlock_q <= 1'b0;
      else if(m_delayed_unlock_en)
         m_delayed_unlock_q <= m_delayed_unlock_nxt;

   always @(posedge HCLKM or negedge HRESETMn)
      if(~HRESETMn)
         m_in_rst_q <= 1'b1;
      else if(m_in_rst_en)
         m_in_rst_q <= m_in_rst_nxt;

   // -------------------------------------------------------------------------

endmodule

// ----------------------------------------------------------------------------
// EOF
// ----------------------------------------------------------------------------
