


//-----------------------------------------------------------------------------
//
// (c) Copyright 2009-2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
// Project    : V5-Block Plus for PCI Express
// File       : pci_exp_1_lane_64b_ep.v

(* box_type="user_black_box" *)
module   endpoint_blk_plus_v1_14 (

            // PCI Express Fabric Interface
            //------------------------------

            pci_exp_txp,
            pci_exp_txn,
            pci_exp_rxp,
            pci_exp_rxn,

            // Transaction (TRN) Interface
            //----------------------------

            trn_clk,
            trn_reset_n,
            trn_lnk_up_n,

            // Tx
            trn_td,
            trn_trem_n,
            trn_tsof_n,
            trn_teof_n,
            trn_tsrc_rdy_n,
            trn_tdst_rdy_n,
            trn_tdst_dsc_n,
            trn_tsrc_dsc_n,
            trn_terrfwd_n,
            trn_tbuf_av,

            // Rx
            trn_rd,
            trn_rrem_n,
            trn_rsof_n,
            trn_reof_n,
            trn_rsrc_rdy_n,
            trn_rsrc_dsc_n,
            trn_rdst_rdy_n,
            trn_rerrfwd_n,
            trn_rnp_ok_n,
            trn_rbar_hit_n,
            trn_rfc_nph_av,
            trn_rfc_npd_av,
            trn_rfc_ph_av,
            trn_rfc_pd_av,
            trn_rcpl_streaming_n,

            // Host (CFG) Interface
            //---------------------

            cfg_do,
            cfg_rd_wr_done_n,
            cfg_di,
            cfg_byte_en_n,
            cfg_dwaddr,
            cfg_wr_en_n,
            cfg_rd_en_n,

            cfg_err_ur_n,
            cfg_err_cpl_rdy_n,
            cfg_err_cor_n,
            cfg_err_ecrc_n,
            cfg_err_cpl_timeout_n,
            cfg_err_cpl_abort_n,
            cfg_err_cpl_unexpect_n,
            cfg_err_posted_n,
            cfg_err_tlp_cpl_header,
            cfg_err_locked_n,
            cfg_interrupt_n,
            cfg_interrupt_rdy_n,

            cfg_interrupt_assert_n,
            cfg_interrupt_di,
            cfg_interrupt_do,
            cfg_interrupt_mmenable,
            cfg_interrupt_msienable,

            cfg_to_turnoff_n,
            cfg_pm_wake_n,
            cfg_pcie_link_state_n,
            cfg_trn_pending_n,
            cfg_dsn,

            cfg_bus_number,
            cfg_device_number,
            cfg_function_number,
            cfg_status,
            cfg_command,
            cfg_dstatus,
            cfg_dcommand,
            cfg_lstatus,
            cfg_lcommand,    

            //cfg_cfg,
            fast_train_simulation_only,

            // System (SYS) Interface
            //-----------------------
            sys_clk,
            sys_reset_n,
            refclkout

            ); //synthesis syn_black_box

    //-------------------------------------------------------
    // 1. PCI-Express (PCI_EXP) Interface
    //-------------------------------------------------------

    // Tx
    output  [(1 - 1):0]          pci_exp_txp;
    output  [(1 - 1):0]          pci_exp_txn;

    // Rx
    input   [(1 - 1):0]          pci_exp_rxp;
    input   [(1 - 1):0]          pci_exp_rxn;

    //-------------------------------------------------------
    // 2. Transaction (TRN) Interface
    //-------------------------------------------------------

    // Common
    output                                         trn_clk;
    output                                         trn_reset_n;
    output                                         trn_lnk_up_n;

    // Tx
    input   [(64 - 1):0]      trn_td;
    input   [(8 - 1):0]       trn_trem_n;
    input                                          trn_tsof_n;
    input                                          trn_teof_n;
    input                                          trn_tsrc_rdy_n;
    output                                         trn_tdst_rdy_n;
    output                                         trn_tdst_dsc_n;
    input                                          trn_tsrc_dsc_n;
    input                                          trn_terrfwd_n;
    output  [(4 - 1):0]    trn_tbuf_av;
    
    // Rx
    output  [(64 - 1):0]      trn_rd;
    output  [(8 - 1):0]       trn_rrem_n;
    output                                         trn_rsof_n;
    output                                         trn_reof_n;
    output                                         trn_rsrc_rdy_n;
    output                                         trn_rsrc_dsc_n;
    input                                          trn_rdst_rdy_n;
    output                                         trn_rerrfwd_n;
    input                                          trn_rnp_ok_n;
    output  [(7 - 1):0]   trn_rbar_hit_n;
    output  [(8 - 1):0]    trn_rfc_nph_av;
    output  [(12 - 1):0]   trn_rfc_npd_av;
    output  [(8 - 1):0]    trn_rfc_ph_av;
    output  [(12 - 1):0]   trn_rfc_pd_av;
    input                                          trn_rcpl_streaming_n;

    //-------------------------------------------------------
    // 3. Host (CFG) Interface
    //-------------------------------------------------------

    output  [(32 - 1):0]      cfg_do;
    output                                         cfg_rd_wr_done_n;
    input   [(32 - 1):0]      cfg_di;
    input   [(32/8 - 1):0]    cfg_byte_en_n;
    input   [(10 - 1):0]      cfg_dwaddr;
    input                                          cfg_wr_en_n;
    input                                          cfg_rd_en_n;

    input                                          cfg_err_ur_n;
    output                                         cfg_err_cpl_rdy_n;
    input                                          cfg_err_cor_n;
    input                                          cfg_err_ecrc_n;
    input                                          cfg_err_cpl_timeout_n;
    input                                          cfg_err_cpl_abort_n;
    input                                          cfg_err_cpl_unexpect_n;
    input                                          cfg_err_posted_n;
    input                                          cfg_err_locked_n;
    input   [(48 - 1):0]    cfg_err_tlp_cpl_header;
    input                                          cfg_interrupt_n;
    output                                         cfg_interrupt_rdy_n;

    input                                          cfg_interrupt_assert_n;
    input   [7:0]                                  cfg_interrupt_di;
    output  [7:0]                                  cfg_interrupt_do;
    output  [2:0]                                  cfg_interrupt_mmenable;
    output                                         cfg_interrupt_msienable;

    output                                         cfg_to_turnoff_n;
    input                                          cfg_pm_wake_n;
    output  [(3 - 1):0]     cfg_pcie_link_state_n;
    input                                          cfg_trn_pending_n;
    input   [(64 - 1):0]       cfg_dsn;
    output  [(8 - 1):0]    cfg_bus_number;
    output  [(5 - 1):0]    cfg_device_number;
    output  [(3 - 1):0]    cfg_function_number;
    output  [(16 - 1):0]       cfg_status;
    output  [(16 - 1):0]       cfg_command;
    output  [(16 - 1):0]       cfg_dstatus;
    output  [(16 - 1):0]       cfg_dcommand;
    output  [(16 - 1):0]       cfg_lstatus;
    output  [(16 - 1):0]       cfg_lcommand;

    //input   [(1024 - 1):0]       cfg_cfg;
    input                                          fast_train_simulation_only; 

    //-------------------------------------------------------
    // 4. System (SYS) Interface
    //-------------------------------------------------------

    input                                          sys_clk;
    input                                          sys_reset_n;
    output                                         refclkout;

endmodule // endpoint_blk_plus_v1_14
