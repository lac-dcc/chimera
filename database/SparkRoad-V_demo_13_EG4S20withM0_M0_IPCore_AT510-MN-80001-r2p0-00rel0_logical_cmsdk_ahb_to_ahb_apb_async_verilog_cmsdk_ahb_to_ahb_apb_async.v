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
//   Checked In : $Date: 2013-04-15 00:30:48 +0100 (Mon, 15 Apr 2013) $
//   Revision   : $Revision: 243946 $
//   Release    : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//-----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// AHB-Lite to AHB-Lite and APB4 Asynchronous Bridge
// ----------------------------------------------------------------------------

// Asynchronous 32-bit AHB-Lite bridge, supporting any relationship between
// HCLKS and HCLKM.

// Supports propagation of the non-AHB-Lite HMASTER signal.

// Transfers initiated on the slave side while the master side is in reset
// are delayed until the master side comes out of reset.

module cmsdk_ahb_to_ahb_apb_async #(
      parameter MW = 1
   ) (
      // --------
      // AHB-Lite slave interface
      input  wire        HCLKS,
      input  wire        HRESETSn,

      input  wire [31:0] HADDRS,
      input  wire [ 2:0] HBURSTS,
      input  wire        HMASTLOCKS,
      input  wire [ 3:0] HPROTS,
      input  wire        HREADYS,
      input  wire        HSELAHBS,
      input  wire        HSELAPBS,
      input  wire [ 2:0] HSIZES,
      input  wire [ 1:0] HTRANSS,
      input  wire [31:0] HWDATAS,
      input  wire        HWRITES,
      input  wire [MW-1:0] HMASTERS,

      output wire [31:0] HRDATAS,
      output wire        HREADYOUTS,
      output wire        HRESPS,

      // --------
      // AHB-Lite master interface
      input  wire        HCLKM,
      input  wire        HRESETMn,

      output wire [31:0] HADDRM,
      output wire  [2:0] HBURSTM,
      output wire        HMASTLOCKM,
      output wire [ 3:0] HPROTM,
      output wire [ 2:0] HSIZEM,
      output wire [ 1:0] HTRANSM,
      output wire [31:0] HWDATAM,
      output wire        HWRITEM,
      output wire [MW-1:0] HMASTERM,

      input  wire [31:0] HRDATAM,
      input  wire        HREADYM,
      input  wire        HRESPM,

      // --------
      // APB4 master interface
      // part of HCLKM and HRESETMn domain
      output wire [31:0] PADDRM,
      output wire        PENABLEM,
      output wire [ 2:0] PPROTM,
      output wire        PSELM,
      output wire [ 3:0] PSTRBM,
      output wire [31:0] PWDATAM,
      output wire        PWRITEM,
      output wire [MW-1:0] PMASTERM,

      input  wire [31:0] PRDATAM,
      input  wire        PREADYM,
      input  wire        PSLVERRM,

      // --------
      // Clock gating control interface
      // part of HCLKM and HRESETMn domain
      output wire        HACTIVEM, // AHB-Lite system clock gating control
      output wire        PACTIVEM  // APB4 system clock gating control
   );

   // -------------------------------------------------------------------------
   // Discard unused interface signals
   // -------------------------------------------------------------------------

   wire [ 4:0] unused = { HBURSTS[2:0], HSIZES[2], HTRANSS[0] };

   // -------------------------------------------------------------------------
   // Intermediate wires
   // -------------------------------------------------------------------------

   // --------
   // From slave to master
   wire        s_ad_en;        // Slave to master buffers address phase enable
   wire        s_wd_en;        // Slave to master buffers write data enable

   wire        m_mask;         // Slave to master buffers mask

   wire [31:0] m_haddr_q;      // Slave to master HADDRS buffer
   wire [MW-1:0] m_hmaster_q;  //                 HMASTERS
   wire        m_hmastlock_q;  //                 HMASTLOCKS
   wire [ 3:0] m_hprot_q;      //                 HPROTS
   wire        m_hselapb_q;    //                 HSELAPBS
   wire [ 1:0] m_hsize_1to0_q; //                 HSIZES[1:0]
   wire [31:0] m_hwdata_q;     //                 HWDATAS
   wire        m_hwrite_q;     //                 HWRITES

   wire        s_tx_sema_en;   // Slave semaphore-out (transmit) enable
   wire        s_tx_sema_nxt;  // Slave semaphore-out (transmit) next value
   wire        s_tx_sema_q;    // Slave semaphore-out (transmit) to master
   wire        s_hmastlock_q;  // Registered HMASTLOCKS

   wire        m_rx_sema_q;    // Master semaphore-in (receive) from slave
                               // (M-synchronized version of s_tx_sema_q)
   wire        m_lock_q;       // M-synchronized version of s_hmastlock_q

   // --------
   // From master to top-level

   wire        m_htrans;      // HTRANSM
   wire        m_hmastlock;   // HMASTLOCKM

   wire        m_psel;        // PSELM
   wire        m_penable;     // PENABLEM
   wire [ 3:0] m_pstrb;       // PSTRBM

   wire        m_hactive;     // HACTIVEM
   wire        m_pactive;     // PACTIVEM

   // --------
   // From master to slave
   wire        m_resp;        // Master combined (AHB-Lite/APB) error response
   wire [31:0] m_rdata;       // Master combined (AHB-Lite/APB) read data

   wire        m_rd_en;       // Master to slave buffers enable

   wire        s_mask;        // Master to slave buffers mask

   wire [31:0] s_hrdata_q;    // Master to slave HRDATAS buffer
   wire        s_hresp_q;     // Master to slave HRESPS buffer

   wire        m_tx_sema_en;  // Master semaphore-out (transmit) enable
   wire        m_tx_sema_nxt; // Master semaphore-out (transmit) next value
   wire        m_tx_sema_q;   // Master semaphore-out (transmit) to slave

   wire        s_rx_sema_q;   // Slave semaphore-in (receive) from master
                              // (S-synchronized version of m_tx_sema)

   // --------
   // From slave to top-level

   wire        s_hready_out;  // HREADYOUTS
   wire        s_hresp_out;   // HRESPS

   // -------------------------------------------------------------------------
   // Slave side
   // -------------------------------------------------------------------------

   cmsdk_ahb_to_ahb_apb_async_slave u_s (
      .HCLKS         (HCLKS),
      .HRESETSn      (HRESETSn),

      .HREADYS       (HREADYS),
      .HSELAHBS      (HSELAHBS),
      .HSELAPBS      (HSELAPBS),
      .HTRANSS_bit1  (HTRANSS[1]),
      .HWRITES       (HWRITES),

      .s_hready_out  (s_hready_out),
      .s_hresp_out   (s_hresp_out),

      .s_tx_sema_en  (s_tx_sema_en),
      .s_tx_sema_nxt (s_tx_sema_nxt),
      .s_tx_sema_q   (s_tx_sema_q),

      .s_ad_en       (s_ad_en),
      .s_wd_en       (s_wd_en),

      .s_rx_sema_q   (s_rx_sema_q),

      .s_mask        (s_mask),
      .s_hresp_q     (s_hresp_q)
   );

   // -------------------------------------------------------------------------
   // Launch flops
   // -------------------------------------------------------------------------

   // --------
   // From slave to master

   cmsdk_ahb_to_ahb_apb_async_launch #( .WIDTH(1) ) u_sema_s (
      .CLK(HCLKS), .RSTn(HRESETSn), .EN(s_tx_sema_en), .D(s_tx_sema_nxt), .Q(s_tx_sema_q  )
   );

   cmsdk_ahb_to_ahb_apb_async_launch #( .WIDTH(1) ) u_hmastlock_s (
      .CLK(HCLKS), .RSTn(HRESETSn), .EN(        1'b1), .D(HMASTLOCKS   ), .Q(s_hmastlock_q)
   );

   // --------
   // From master to slave

   cmsdk_ahb_to_ahb_apb_async_launch #( .WIDTH(1) ) u_sema_m (
      .CLK(HCLKM), .RSTn(HRESETMn), .EN(m_tx_sema_en), .D(m_tx_sema_nxt), .Q(m_tx_sema_q  )
   );

   // -------------------------------------------------------------------------
   // Synchronizer paths
   // -------------------------------------------------------------------------

   // --------
   // From slave to master

   cmsdk_ahb_to_ahb_apb_async_synchronizer u_sema_m_from_s (
      .CLK(HCLKM), .D(s_tx_sema_q  ), .Q(m_rx_sema_q)
   );

   cmsdk_ahb_to_ahb_apb_async_synchronizer u_lock_m_from_s (
      .CLK(HCLKM), .D(s_hmastlock_q), .Q(m_lock_q   )
   );

   // --------
   // From master to slave

   cmsdk_ahb_to_ahb_apb_async_synchronizer u_sema_s_from_m (
      .CLK(HCLKS), .D(m_tx_sema_q  ), .Q(s_rx_sema_q)
   );

   // -------------------------------------------------------------------------
   // Sampling and hardening
   // -------------------------------------------------------------------------

   // --------
   // Control data from slave to master

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH(32) ) u_haddr      (
      .CLK(HCLKS), .EN(s_ad_en), .D(HADDRS     ), .MASK(m_mask), .Q(m_haddr_q     )
   );

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH(MW) ) u_hmaster    (
      .CLK(HCLKS), .EN(s_ad_en), .D(HMASTERS   ), .MASK(m_mask), .Q(m_hmaster_q   )
   );

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH( 1) ) u_hmastlock  (
      .CLK(HCLKS), .EN(s_ad_en), .D(HMASTLOCKS ), .MASK(m_mask), .Q(m_hmastlock_q )
   );

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH( 4) ) u_hprot      (
      .CLK(HCLKS), .EN(s_ad_en), .D(HPROTS     ), .MASK(m_mask), .Q(m_hprot_q     )
   );

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH( 1) ) u_hselapb    (
      .CLK(HCLKS), .EN(s_ad_en), .D(HSELAPBS   ), .MASK(m_mask), .Q(m_hselapb_q   )
   );

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH( 2) ) u_hsize_1to0 (
      .CLK(HCLKS), .EN(s_ad_en), .D(HSIZES[1:0]), .MASK(m_mask), .Q(m_hsize_1to0_q)
   );

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH( 1) ) u_hwrite     (
      .CLK(HCLKS), .EN(s_ad_en), .D(HWRITES    ), .MASK(m_mask), .Q(m_hwrite_q    )
   );

   // --------
   // Write data from slave to master

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH(32) ) u_hwdata (
      .CLK(HCLKS), .EN(s_wd_en), .D(HWDATAS), .MASK(m_mask), .Q(m_hwdata_q)
   );

   // --------
   // Response and read data from master to slave

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH( 1) ) u_resp  (
      .CLK(HCLKM), .EN(m_rd_en), .D(m_resp ), .MASK(s_mask), .Q(s_hresp_q )
   );

   cmsdk_ahb_to_ahb_apb_async_sample_and_hold #( .WIDTH(32) ) u_rdata (
      .CLK(HCLKM), .EN(m_rd_en), .D(m_rdata), .MASK(s_mask), .Q(s_hrdata_q)
   );

   // -------------------------------------------------------------------------
   // Master side
   // -------------------------------------------------------------------------

   cmsdk_ahb_to_ahb_apb_async_master u_m (
      .HCLKM          (HCLKM),
      .HRESETMn       (HRESETMn),

      .m_rx_sema_q    (m_rx_sema_q),
      .m_lock_q       (m_lock_q),

      .m_mask         (m_mask),
      .m_haddr_q_1to0 (m_haddr_q[1:0]),
      .m_hmastlock_q  (m_hmastlock_q),
      .m_hselapb_q    (m_hselapb_q),
      .m_hsize_1to0_q (m_hsize_1to0_q),
      .m_hwrite_q     (m_hwrite_q),

      .m_tx_sema_en   (m_tx_sema_en),
      .m_tx_sema_nxt  (m_tx_sema_nxt),
      .m_tx_sema_q    (m_tx_sema_q),

      .m_rd_en        (m_rd_en),

      .m_resp         (m_resp),
      .m_rdata        (m_rdata),

      .HREADYM        (HREADYM),
      .HRESPM         (HRESPM),
      .HRDATAM        (HRDATAM),

      .m_htrans       (m_htrans),
      .m_hmastlock    (m_hmastlock),

      .PREADYM        (PREADYM),
      .PSLVERRM       (PSLVERRM),
      .PRDATAM        (PRDATAM),

      .m_psel         (m_psel),
      .m_penable      (m_penable),
      .m_pstrb        (m_pstrb),

      .m_hactive      (m_hactive),
      .m_pactive      (m_pactive)
   );

   // -------------------------------------------------------------------------
   // Assign outputs
   // -------------------------------------------------------------------------

   // --------
   // AHB master interface port

   assign HACTIVEM   = m_hactive;
   assign HADDRM     = m_haddr_q[31:0];
   assign HBURSTM    = 3'b000;
   assign HMASTERM   = m_hmaster_q[MW-1:0];
   assign HMASTLOCKM = m_hmastlock;
   assign HPROTM     = m_hprot_q[3:0];
   assign HSIZEM     = { 1'b0, m_hsize_1to0_q };
   assign HTRANSM    = { m_htrans, 1'b0 };
   assign HWDATAM    = m_hwdata_q[31:0];
   assign HWRITEM    = m_hwrite_q;

   // --------
   // APB master interface port

   assign PACTIVEM   = m_pactive;
   assign PADDRM     = { m_haddr_q[31:2] , 2'b00 };
   assign PMASTERM   = m_hmaster_q[MW-1:0];
   assign PPROTM     = { ~m_hprot_q[0], 1'b0, m_hprot_q[1] };
   assign PSTRBM     = m_pstrb[3:0];
   assign PSELM      = m_psel;
   assign PENABLEM   = m_penable;
   assign PWDATAM    = m_hwdata_q[31:0];
   assign PWRITEM    = m_hwrite_q;

   // --------
   // AHB-Lite slave interface

   assign HRDATAS    = s_hrdata_q[31:0];
   assign HREADYOUTS = s_hready_out;
   assign HRESPS     = s_hresp_out;

   // -------------------------------------------------------------------------

`ifdef ARM_AHB_ASSERT_ON

   `include "std_ovl_defines.h"

   ovl_never_unknown #(
      .severity_level (`OVL_FATAL),
      .width          (4),
      .property_type  (`OVL_ASSERT),
      .msg            ("Register enables must never be X"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE))
   u_ovl_reg_en_nx_s (
      .clock     (HCLKS),
      .reset     (HRESETSn),
      .enable    (1'b1),
      .qualifier (1'b1),
      .test_expr ({ u_s.s_state_en,
                    u_s.s_tx_sema_en,
                    u_s.s_ad_en,
                    u_s.s_wd_en }),
      .fire      ()
   );

   ovl_never_unknown #(
      .severity_level (`OVL_FATAL),
      .width          (3),
      .property_type  (`OVL_ASSERT),
      .msg            ("Register enables must never be X"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE))
   u_ovl_reg_en_nx_m (
      .clock     (HCLKM),
      .reset     (HRESETMn),
      .enable    (1'b1),
      .qualifier (1'b1),
      .test_expr ({ u_m.m_mode_en,
                    u_m.m_force_lock_en,
                    u_m.m_rd_en }),
      .fire      ()
   );

   ovl_zero_one_hot #(
      .severity_level (`OVL_FATAL),
      .width          (4),
      .property_type  (`OVL_ASSERT),
      .msg            ("At most one next state must be selected for slave FSM"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE))
   u_asrt_actv_bit (
      .clock     (HCLKS),
      .reset     (HRESETSn),
      .enable    (1'b1),
      .test_expr ({ u_s.s_state_sel_busy,
                    u_s.s_state_sel_data,
                    u_s.s_state_sel_idle,
                    u_s.s_state_sel_resp }),
      .fire      ()
   );

   // {u_m.m_tx_sema_q, m_mode_q, m_rx_sema_q} cycles though these states from reset:
   // 00_0 -> 00_1 -> 01_1 -> 11_1 -> 11_0 -> 10_0 -> 00_0

   wire [2:0] a_master_fsm_state = {u_m.m_tx_sema_q, u_m.m_mode_q, u_m.m_rx_sema_q};

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Master FSM state invalid"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_fsm_m (
      .clock           (HCLKM),
      .reset           (HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (1'b1),
      .consequent_expr ( (a_master_fsm_state == 3'b00_0) |
                         (a_master_fsm_state == 3'b00_1) |
                         (a_master_fsm_state == 3'b01_1) |
                         (a_master_fsm_state == 3'b11_1) |
                         (a_master_fsm_state == 3'b11_0) |
                         (a_master_fsm_state == 3'b10_0) ),
      .fire            ()
   );

   reg  [2:0] a_master_fsm_state_reg;
   always @(posedge HCLKM)
      a_master_fsm_state_reg <= a_master_fsm_state;

   reg HRESETMn_reg;
   always @(posedge HCLKM)
      HRESETMn_reg <= HRESETMn;

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Master FSM state transition invalid"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_fsm_trans_m (
      .clock           (HCLKM),
      .reset           (HRESETMn & HRESETMn_reg),
      .enable          (1'b1),
      .antecedent_expr (1'b1),
      .consequent_expr ( (a_master_fsm_state_reg == 3'b00_0) & ((a_master_fsm_state == 3'b00_0) | (a_master_fsm_state == 3'b00_1)) |
                         (a_master_fsm_state_reg == 3'b00_1) & ((a_master_fsm_state == 3'b00_1) | (a_master_fsm_state == 3'b01_1)) |
                         (a_master_fsm_state_reg == 3'b01_1) & ((a_master_fsm_state == 3'b01_1) | (a_master_fsm_state == 3'b11_1)) |
                         (a_master_fsm_state_reg == 3'b11_1) & ((a_master_fsm_state == 3'b11_1) | (a_master_fsm_state == 3'b11_0)) |
                         (a_master_fsm_state_reg == 3'b11_0) & ((a_master_fsm_state == 3'b11_0) | (a_master_fsm_state == 3'b10_0)) |
                         (a_master_fsm_state_reg == 3'b10_0) & ((a_master_fsm_state == 3'b10_0) | (a_master_fsm_state == 3'b00_0)) ),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Slave and master FSM state combination invalid"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_fsm_s_m_hclks (
      .clock           (HCLKS),
      .reset           (HRESETSn & HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (u_s.s_run_idle),
      .consequent_expr (~u_m.m_cycle_any),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Slave and master FSM state combination invalid"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_fsm_s_m_hclkm (
      .clock           (HCLKM),
      .reset           (HRESETSn & HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (u_s.s_run_idle),
      .consequent_expr (~u_m.m_cycle_any),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Semaphore value combination invalid"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_sema_s_m_hclks (
      .clock           (HCLKS),
      .reset           (HRESETSn & HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (u_s.s_rx_sema_q == u_s.s_tx_sema_q),
      .consequent_expr ( (u_m.m_rx_sema_q == u_s.s_tx_sema_q) &
                         (u_m.m_mode_q    == u_s.s_tx_sema_q) &
                         (u_m.m_tx_sema_q == u_s.s_tx_sema_q) ),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Semaphore value combination invalid"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_sema_s_m_hclkm (
      .clock           (HCLKM),
      .reset           (HRESETSn & HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (u_s.s_rx_sema_q == u_s.s_tx_sema_q),
      .consequent_expr ( (u_m.m_rx_sema_q == u_s.s_tx_sema_q) &
                         (u_m.m_mode_q    == u_s.s_tx_sema_q) &
                         (u_m.m_tx_sema_q == u_s.s_tx_sema_q) ),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("HREADYS must be LOW when the master side is active"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_mactive_hready0_p1_hclks (
      .clock           (HCLKS),
      .reset           (HRESETSn & HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (u_m.m_cycle_any),
      .consequent_expr (~HREADYS),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("HREADYS must be LOW when the master side is active"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_mactive_hready0_p1_hclkm (
      .clock           (HCLKS),
      .reset           (HRESETSn & HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (u_m.m_cycle_any),
      .consequent_expr (~HREADYS),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("HREADYS must be LOW when the master side is active"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_mactive_hready0_p2 (
      .clock           (HCLKM),
      .reset           (HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (HTRANSM[1] | ~HREADYM | HRESPM |
                        PSELM | PENABLEM), //but not | ~PREADYM | PSLVERR
      .consequent_expr (u_m.m_cycle_any),
      .fire            ()
   );

   wire [ 3:0] m_hw_byte_v = {
      m_hsize_1to0_q[1] | (m_hsize_1to0_q[0] &  m_haddr_q[1]) | (m_haddr_q[1:0]==2'h3),
      m_hsize_1to0_q[1] | (m_hsize_1to0_q[0] &  m_haddr_q[1]) | (m_haddr_q[1:0]==2'h2),
      m_hsize_1to0_q[1] | (m_hsize_1to0_q[0] & ~m_haddr_q[1]) | (m_haddr_q[1:0]==2'h1),
      m_hsize_1to0_q[1] | (m_hsize_1to0_q[0] & ~m_haddr_q[1]) | (m_haddr_q[1:0]==2'h0)
   };

   wire [31:0] m_hwdata_mask = { {8{m_hw_byte_v[3]}}, {8{m_hw_byte_v[2]}}, {8{m_hw_byte_v[1]}}, {8{m_hw_byte_v[0]}} };

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Buffered data must match HWDATAS during write"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_hwdata_match_during_write (
      .clock           (HCLKS),
      .reset           (HRESETSn & HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (~u_s.s_run_idle & m_hwrite_q),
      .consequent_expr ((m_hwdata_q & m_hwdata_mask) == (HWDATAS & m_hwdata_mask)),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Slave state and semaphore value combination invalid"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_fsm_sema_s (
      .clock           (HCLKS),
      .reset           (HRESETSn),
      .enable          (1'b1),
      .antecedent_expr (u_s.s_run_idle | u_s.s_run_data | u_s.s_run_resp),
      .consequent_expr (u_s.s_rx_sema_q == u_s.s_tx_sema_q),
      .fire            ()
   );

   reg asrt_dp_m;
   always @(posedge HCLKM or negedge HRESETMn)
      if (~HRESETMn)
         asrt_dp_m <= 1'b0;
      else if (HREADYM)
         asrt_dp_m <= HTRANSM[1];

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Bridge must be active when a transfer is in progress"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_hactive_m (
      .clock           (HCLKM),
      .reset           (HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (HTRANSM[1] | asrt_dp_m),
      .consequent_expr (HACTIVEM),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Bridge must be active when a transfer is in progress"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_pactive_m (
      .clock           (HCLKM),
      .reset           (HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (PSELM),
      .consequent_expr (PACTIVEM),
      .fire            ()
   );

   reg asrt_m_cycle_unlock_h_reg;
   always @(posedge HCLKM or negedge HRESETMn)
      if (~HRESETMn)
         asrt_m_cycle_unlock_h_reg <= 1'b0;
      else
         asrt_m_cycle_unlock_h_reg <= u_m.m_cycle_unlock_h;

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("Insert only one unlock transfer"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_unlock_single_cycle (
      .clock           (HCLKM),
      .reset           (HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (asrt_m_cycle_unlock_h_reg),
      .consequent_expr (~u_m.m_cycle_unlock_h),
      .fire            ()
   );

   wire asrt_ap_s = (HSELAHBS | HSELAPBS) & HTRANSS[1] & HREADYS;
   reg asrt_ap_s_reg;
   always @(posedge HCLKS or negedge HRESETSn)
      if (~HRESETSn)
         asrt_ap_s_reg <= 1'b0;
      else
         asrt_ap_s_reg <= asrt_ap_s;

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("HREADYOUTS must drop after a slave transfer starts"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_hreadyouts_drops_trans_starts (
      .clock           (HCLKS),
      .reset           (HRESETSn),
      .enable          (1'b1),
      .antecedent_expr (asrt_ap_s_reg),
      .consequent_expr (~HREADYOUTS),
      .fire            ()
   );

   ovl_implication #(
      .severity_level (`OVL_FATAL),
      .property_type  (`OVL_ASSERT),
      .msg            ("force_lock and _unlock can't be high at the same time"),
      .coverage_level (`OVL_COVER_DEFAULT),
      .clock_edge     (`OVL_POSEDGE),
      .reset_polarity (`OVL_ACTIVE_LOW),
      .gating_type    (`OVL_GATE_NONE)
   ) u_asrt_force_lock_unlock_excl (
      .clock           (HCLKM),
      .reset           (HRESETMn),
      .enable          (1'b1),
      .antecedent_expr (u_m.m_delayed_unlock_q),
      .consequent_expr (~u_m.m_force_lock_q),
      .fire            ()
   );

`endif

endmodule

// ----------------------------------------------------------------------------
// EOF
// ----------------------------------------------------------------------------
