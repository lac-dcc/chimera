// Copyright (c) 2009  Bluespec, Inc.  ALL RIGHTS RESERVED

`ifdef BSV_ASSIGNMENT_DELAY
`else
 `define BSV_ASSIGNMENT_DELAY
`endif

module xilinx_v6_pcie_wrapper
  (
   // Outputs
   trn_terr_drop_n, trn_tdst_rdy_n, trn_tcfg_req_n, trn_tbuf_av, 
   trn_rsrc_rdy_n, trn_rsrc_dsc_n, trn_rsof_n, trn_rrem_n, 
   trn_reset_n, trn_rerrfwd_n, trn_reof_n, trn_rd, trn_rbar_hit_n, 
   trn_lnk_up_n, trn_fc_ph, trn_fc_pd, trn_fc_nph, trn_fc_npd, 
   trn_fc_cplh, trn_fc_cpld, trn_clk, trn2_clk, pl_sel_link_width, 
   pl_sel_link_rate, pl_received_hot_rst, pl_ltssm_state, 
   pl_link_upcfg_capable, pl_link_partner_gen2_supported, 
   pl_link_gen2_capable, pl_lane_reversal_mode, 
   pl_initial_link_width, pci_exp_txn, pci_exp_txp, 
   cfg_to_turnoff_n, cfg_status, cfg_rd_wr_done_n, cfg_pmcsr_powerstate, 
   cfg_pmcsr_pme_status, cfg_pmcsr_pme_en, cfg_pcie_link_state_n, 
   cfg_lstatus, cfg_lcommand, cfg_interrupt_rdy_n, 
   cfg_interrupt_msixfm, cfg_interrupt_msixenable, 
   cfg_interrupt_msienable, cfg_interrupt_mmenable, cfg_interrupt_do, 
   cfg_function_number, cfg_err_cpl_rdy_n, cfg_dstatus, cfg_do, 
   cfg_device_number, cfg_dcommand2, cfg_dcommand, cfg_command, 
   cfg_bus_number, 
   // Inputs
   trn_tstr_n, trn_tsrc_rdy_n, trn_tsrc_dsc_n, trn_tsof_n, 
   trn_trem_n, trn_terrfwd_n, trn_teof_n, trn_td, trn_tcfg_gnt_n, 
   trn_rnp_ok_n, trn_rdst_rdy_n, trn_fc_sel, sys_reset_n, sys_clk, 
   pl_upstream_prefer_deemph, pl_directed_link_width, 
   pl_directed_link_speed, pl_directed_link_change, 
   pl_directed_link_auton, pci_exp_rxp, pci_exp_rxn, cfg_wr_en_n, 
   cfg_turnoff_ok_n, cfg_trn_pending_n, cfg_rd_en_n, cfg_pm_wake_n, 
   cfg_interrupt_n, cfg_interrupt_di, cfg_interrupt_assert_n, 
   cfg_err_ur_n, cfg_err_tlp_cpl_header, cfg_err_posted_n, 
   cfg_err_locked_n, cfg_err_ecrc_n, cfg_err_cpl_unexpect_n, 
   cfg_err_cpl_timeout_n, cfg_err_cpl_abort_n, cfg_err_cor_n, 
   cfg_dwaddr, cfg_dsn, cfg_di, cfg_byte_en_n
   );

   // synthesis attribute keep of trn_clk is "true";
   // synthesis attribute keep of trn2_clk is "true";
   // synthesis attribute keep of trn_reset_n is "true";
   // synthesis attribute keep of trn_fc_ph is "true";
   // synthesis attribute keep of trn_fc_pd is "true";
   // synthesis attribute keep of trn_fc_nph is "true";
   // synthesis attribute keep of trn_fc_npd is "true";
   // synthesis attribute keep of trn_fc_cplh is "true";
   // synthesis attribute keep of trn_fc_cpld is "true";
   // synthesis attribute keep of trn_fc_sel is "true";
   // synthesis attribute keep of trn_tsof_n is "true";
   // synthesis attribute keep of trn_teof_n is "true";
   // synthesis attribute keep of trn_td is "true";
   // synthesis attribute keep of trn_trem_n is "true";
   // synthesis attribute keep of trn_tsrc_rdy_n is "true";
   // synthesis attribute keep of trn_tdst_rdy_n is "true";
   // synthesis attribute keep of trn_tsrc_dsc_n is "true";
   // synthesis attribute keep of trn_tbuf_av is "true";
   // synthesis attribute keep of trn_terr_drop_n is "true";
   // synthesis attribute keep of trn_tstr_n is "true";
   // synthesis attribute keep of trn_tcfg_req_n is "true";
   // synthesis attribute keep of trn_tcfg_gnt_n is "true";
   // synthesis attribute keep of trn_terrfwd_n is "true";
   // synthesis attribute keep of trn_rsof_n is "true";
   // synthesis attribute keep of trn_reof_n is "true";
   // synthesis attribute keep of trn_rd is "true";
   // synthesis attribute keep of trn_rrem_n is "true";
   // synthesis attribute keep of trn_rerrfwd_n is "true";
   // synthesis attribute keep of trn_rsrc_rdy_n is "true";
   // synthesis attribute keep of trn_rdst_rdy_n is "true";
   // synthesis attribute keep of trn_rsrc_dsc_n is "true";
   // synthesis attribute keep of trn_rnp_ok_n is "true";
   // synthesis attribute keep of trn_rbar_hit_n is "true";   
   // synthesis attribute keep of trn_lnk_up_n is "true";


   parameter            PL_FAST_TRAIN = "FALSE";
      
   input [3:0]		cfg_byte_en_n;		// To endpoint of pcie_endpoint.v
   input [31:0]		cfg_di;			// To endpoint of pcie_endpoint.v
   input [63:0]		cfg_dsn;		// To endpoint of pcie_endpoint.v
   input [9:0]		cfg_dwaddr;		// To endpoint of pcie_endpoint.v
   input		cfg_err_cor_n;		// To endpoint of pcie_endpoint.v
   input		cfg_err_cpl_abort_n;	// To endpoint of pcie_endpoint.v
   input		cfg_err_cpl_timeout_n;	// To endpoint of pcie_endpoint.v
   input		cfg_err_cpl_unexpect_n;	// To endpoint of pcie_endpoint.v
   input		cfg_err_ecrc_n;		// To endpoint of pcie_endpoint.v
   input		cfg_err_locked_n;	// To endpoint of pcie_endpoint.v
   input		cfg_err_posted_n;	// To endpoint of pcie_endpoint.v
   input [47:0]		cfg_err_tlp_cpl_header;	// To endpoint of pcie_endpoint.v
   input		cfg_err_ur_n;		// To endpoint of pcie_endpoint.v
   input		cfg_interrupt_assert_n;	// To endpoint of pcie_endpoint.v
   input [7:0]		cfg_interrupt_di;	// To endpoint of pcie_endpoint.v
   input		cfg_interrupt_n;	// To endpoint of pcie_endpoint.v
   input		cfg_pm_wake_n;		// To endpoint of pcie_endpoint.v
   input		cfg_rd_en_n;		// To endpoint of pcie_endpoint.v
   input		cfg_trn_pending_n;	// To endpoint of pcie_endpoint.v
   input		cfg_turnoff_ok_n;	// To endpoint of pcie_endpoint.v
   input		cfg_wr_en_n;		// To endpoint of pcie_endpoint.v
   //input [7:0]		pci_exp_rxn;		// To endpoint of pcie_endpoint.v
   //input [7:0]		pci_exp_rxp;		// To endpoint of pcie_endpoint.v
   input [3:0]		pci_exp_rxn;		// To endpoint of pcie_endpoint.v
   input [3:0]		pci_exp_rxp;		// To endpoint of pcie_endpoint.v
   input		pl_directed_link_auton;	// To endpoint of pcie_endpoint.v
   input [1:0]		pl_directed_link_change;// To endpoint of pcie_endpoint.v
   input		pl_directed_link_speed;	// To endpoint of pcie_endpoint.v
   input [1:0]		pl_directed_link_width;	// To endpoint of pcie_endpoint.v
   input		pl_upstream_prefer_deemph;// To endpoint of pcie_endpoint.v
   input		sys_clk;		// To endpoint of pcie_endpoint.v
   input		sys_reset_n;		// To endpoint of pcie_endpoint.v
   input [2:0]		trn_fc_sel;		// To endpoint of pcie_endpoint.v
   input		trn_rdst_rdy_n;		// To endpoint of pcie_endpoint.v
   input		trn_rnp_ok_n;		// To endpoint of pcie_endpoint.v
   input		trn_tcfg_gnt_n;		// To endpoint of pcie_endpoint.v
   input [63:0]		trn_td;			// To endpoint of pcie_endpoint.v
   input		trn_teof_n;		// To endpoint of pcie_endpoint.v
   input		trn_terrfwd_n;		// To endpoint of pcie_endpoint.v
   input		trn_trem_n;		// To endpoint of pcie_endpoint.v
   input		trn_tsof_n;		// To endpoint of pcie_endpoint.v
   input		trn_tsrc_dsc_n;		// To endpoint of pcie_endpoint.v
   input		trn_tsrc_rdy_n;		// To endpoint of pcie_endpoint.v
   input		trn_tstr_n;		// To endpoint of pcie_endpoint.v

   output [7:0]		cfg_bus_number;		// From endpoint of pcie_endpoint.v
   output [15:0]	cfg_command;		// From endpoint of pcie_endpoint.v
   output [15:0]	cfg_dcommand;		// From endpoint of pcie_endpoint.v
   output [15:0]	cfg_dcommand2;		// From endpoint of pcie_endpoint.v
   output [4:0]		cfg_device_number;	// From endpoint of pcie_endpoint.v
   output [31:0]	cfg_do;			// From endpoint of pcie_endpoint.v
   output [15:0]	cfg_dstatus;		// From endpoint of pcie_endpoint.v
   output		cfg_err_cpl_rdy_n;	// From endpoint of pcie_endpoint.v
   output [2:0]		cfg_function_number;	// From endpoint of pcie_endpoint.v
   output [7:0]		cfg_interrupt_do;	// From endpoint of pcie_endpoint.v
   output [2:0]		cfg_interrupt_mmenable;	// From endpoint of pcie_endpoint.v
   output		cfg_interrupt_msienable;// From endpoint of pcie_endpoint.v
   output		cfg_interrupt_msixenable;// From endpoint of pcie_endpoint.v
   output		cfg_interrupt_msixfm;	// From endpoint of pcie_endpoint.v
   output		cfg_interrupt_rdy_n;	// From endpoint of pcie_endpoint.v
   output [15:0]	cfg_lcommand;		// From endpoint of pcie_endpoint.v
   output [15:0]	cfg_lstatus;		// From endpoint of pcie_endpoint.v
   output [2:0]		cfg_pcie_link_state_n;	// From endpoint of pcie_endpoint.v
   output		cfg_pmcsr_pme_en;	// From endpoint of pcie_endpoint.v
   output		cfg_pmcsr_pme_status;	// From endpoint of pcie_endpoint.v
   output [1:0]		cfg_pmcsr_powerstate;	// From endpoint of pcie_endpoint.v
   output		cfg_rd_wr_done_n;	// From endpoint of pcie_endpoint.v
   output [15:0]	cfg_status;		// From endpoint of pcie_endpoint.v
   output		cfg_to_turnoff_n;	// From endpoint of pcie_endpoint.v
   //output [7:0]         pci_exp_txn;            // From endpoint of pcie_endpoint.v
   //output [7:0]         pci_exp_txp;            // From endpoint of pcie_endpoint.v
   output [3:0]         pci_exp_txn;            // From endpoint of pcie_endpoint.v
   output [3:0]         pci_exp_txp;            // From endpoint of pcie_endpoint.v
   output [2:0]		pl_initial_link_width;	// From endpoint of pcie_endpoint.v
   output [1:0]		pl_lane_reversal_mode;	// From endpoint of pcie_endpoint.v
   output		pl_link_gen2_capable;	// From endpoint of pcie_endpoint.v
   output		pl_link_partner_gen2_supported;// From endpoint of pcie_endpoint.v
   output		pl_link_upcfg_capable;	// From endpoint of pcie_endpoint.v
   output [5:0]		pl_ltssm_state;		// From endpoint of pcie_endpoint.v
   output		pl_received_hot_rst;	// From endpoint of pcie_endpoint.v
   output		pl_sel_link_rate;	// From endpoint of pcie_endpoint.v
   output [1:0]		pl_sel_link_width;	// From endpoint of pcie_endpoint.v
   output		trn_clk;		// From endpoint of pcie_endpoint.v
   output               trn2_clk;               // From endpoint of pcie_endpoint.v
   output [11:0]	trn_fc_cpld;		// From endpoint of pcie_endpoint.v
   output [7:0]		trn_fc_cplh;		// From endpoint of pcie_endpoint.v
   output [11:0]	trn_fc_npd;		// From endpoint of pcie_endpoint.v
   output [7:0]		trn_fc_nph;		// From endpoint of pcie_endpoint.v
   output [11:0]	trn_fc_pd;		// From endpoint of pcie_endpoint.v
   output [7:0]  	trn_fc_ph;		// From endpoint of pcie_endpoint.v
   output		trn_lnk_up_n;		// From endpoint of pcie_endpoint.v
   output [6:0]		trn_rbar_hit_n;		// From endpoint of pcie_endpoint.v
   output [63:0]	trn_rd;			// From endpoint of pcie_endpoint.v
   output		trn_reof_n;		// From endpoint of pcie_endpoint.v
   output		trn_rerrfwd_n;		// From endpoint of pcie_endpoint.v
   output		trn_reset_n;		// From endpoint of pcie_endpoint.v
   output		trn_rrem_n;		// From endpoint of pcie_endpoint.v
   output		trn_rsof_n;		// From endpoint of pcie_endpoint.v
   output		trn_rsrc_dsc_n;		// From endpoint of pcie_endpoint.v
   output		trn_rsrc_rdy_n;		// From endpoint of pcie_endpoint.v
   output [5:0]		trn_tbuf_av;		// From endpoint of pcie_endpoint.v
   output		trn_tcfg_req_n;		// From endpoint of pcie_endpoint.v
   output		trn_tdst_rdy_n;		// From endpoint of pcie_endpoint.v
   output		trn_terr_drop_n;	// From endpoint of pcie_endpoint.v

   
   // endpoint instance
   v6_pcie_v1_7 #(
		   .PL_FAST_TRAIN       ( PL_FAST_TRAIN )
		   )
   ep
     (
      // Outputs
      .pci_exp_txn		(pci_exp_txn),
      .pci_exp_txp    (pci_exp_txp),
      .trn_clk				(trn_clk),
      .drp_clk	 	  	(trn2_clk) ,        //use MMCM for clock divide 125 MHz
      .trn_reset_n			(trn_reset_n),
      .trn_lnk_up_n			(trn_lnk_up_n),
      .trn_tbuf_av			(trn_tbuf_av),
      .trn_tcfg_req_n			(trn_tcfg_req_n),
      .trn_terr_drop_n			(trn_terr_drop_n),
      .trn_tdst_rdy_n			(trn_tdst_rdy_n),
      .trn_rd				(trn_rd),
      .trn_rrem_n			(trn_rrem_n),
      .trn_rsof_n			(trn_rsof_n),
      .trn_reof_n			(trn_reof_n),
      .trn_rsrc_rdy_n			(trn_rsrc_rdy_n),
      .trn_rsrc_dsc_n			(trn_rsrc_dsc_n),
      .trn_rerrfwd_n			(trn_rerrfwd_n),
      .trn_rbar_hit_n			(trn_rbar_hit_n),
      .trn_fc_cpld			(trn_fc_cpld),
      .trn_fc_cplh			(trn_fc_cplh),
      .trn_fc_npd			(trn_fc_npd),
      .trn_fc_nph			(trn_fc_nph),
      .trn_fc_pd			(trn_fc_pd),
      .trn_fc_ph			(trn_fc_ph),
      .cfg_do				(cfg_do),
      .cfg_rd_wr_done_n			(cfg_rd_wr_done_n),
      .cfg_err_cpl_rdy_n		(cfg_err_cpl_rdy_n),
      .cfg_interrupt_rdy_n		(cfg_interrupt_rdy_n),
      .cfg_interrupt_do			(cfg_interrupt_do),
      .cfg_interrupt_mmenable		(cfg_interrupt_mmenable),
      .cfg_interrupt_msienable		(cfg_interrupt_msienable),
      .cfg_interrupt_msixenable		(cfg_interrupt_msixenable),
      .cfg_interrupt_msixfm		(cfg_interrupt_msixfm),
      .cfg_to_turnoff_n			(cfg_to_turnoff_n),
      .cfg_bus_number			(cfg_bus_number),
      .cfg_device_number		(cfg_device_number),
      .cfg_function_number		(cfg_function_number),
      .cfg_status			(cfg_status),
      .cfg_command			(cfg_command),
      .cfg_dstatus			(cfg_dstatus),
      .cfg_dcommand			(cfg_dcommand),
      .cfg_lstatus			(cfg_lstatus),
      .cfg_lcommand			(cfg_lcommand),
      .cfg_dcommand2			(cfg_dcommand2),
      .cfg_pcie_link_state_n		(cfg_pcie_link_state_n),
      .cfg_pmcsr_pme_en			(cfg_pmcsr_pme_en),
      .cfg_pmcsr_pme_status		(cfg_pmcsr_pme_status),
      .cfg_pmcsr_powerstate		(cfg_pmcsr_powerstate),
      .pl_initial_link_width		(pl_initial_link_width),
      .pl_lane_reversal_mode		(pl_lane_reversal_mode),
      .pl_link_gen2_capable		(pl_link_gen2_capable),
      .pl_link_partner_gen2_supported	(pl_link_partner_gen2_supported),
      .pl_link_upcfg_capable		(pl_link_upcfg_capable),
      .pl_ltssm_state			(pl_ltssm_state),
      .pl_received_hot_rst		(pl_received_hot_rst),
      .pl_sel_link_rate			(pl_sel_link_rate),
      .pl_sel_link_width		(pl_sel_link_width),
      // Inputs
      .pci_exp_rxp			(pci_exp_rxp),
      .pci_exp_rxn			(pci_exp_rxn),
      .trn_td				(trn_td),
      .trn_trem_n			(trn_trem_n),
      .trn_tsof_n			(trn_tsof_n),
      .trn_teof_n			(trn_teof_n),
      .trn_tsrc_rdy_n			(trn_tsrc_rdy_n),
      .trn_tsrc_dsc_n			(trn_tsrc_dsc_n),
      .trn_terrfwd_n			(trn_terrfwd_n),
      .trn_tcfg_gnt_n			(trn_tcfg_gnt_n),
      .trn_tstr_n			(trn_tstr_n),
      .trn_rdst_rdy_n			(trn_rdst_rdy_n),
      .trn_rnp_ok_n			(trn_rnp_ok_n),
      .trn_fc_sel			(trn_fc_sel),
      .cfg_di				(cfg_di),
      .cfg_byte_en_n			(cfg_byte_en_n),
      .cfg_dwaddr			(cfg_dwaddr),
      .cfg_wr_en_n			(cfg_wr_en_n),
      .cfg_rd_en_n			(cfg_rd_en_n),
      .cfg_err_cor_n			(cfg_err_cor_n),
      .cfg_err_ur_n			(cfg_err_ur_n),
      .cfg_err_ecrc_n			(cfg_err_ecrc_n),
      .cfg_err_cpl_timeout_n		(cfg_err_cpl_timeout_n),
      .cfg_err_cpl_abort_n		(cfg_err_cpl_abort_n),
      .cfg_err_cpl_unexpect_n		(cfg_err_cpl_unexpect_n),
      .cfg_err_posted_n			(cfg_err_posted_n),
      .cfg_err_locked_n			(cfg_err_locked_n),
      .cfg_err_tlp_cpl_header		(cfg_err_tlp_cpl_header),
      .cfg_interrupt_n			(cfg_interrupt_n),
      .cfg_interrupt_assert_n		(cfg_interrupt_assert_n),
      .cfg_interrupt_di			(cfg_interrupt_di),
      .cfg_turnoff_ok_n			(cfg_turnoff_ok_n),
      .cfg_trn_pending_n		(cfg_trn_pending_n),
      .cfg_pm_wake_n			(cfg_pm_wake_n),
      .cfg_dsn				(cfg_dsn),
      .pl_directed_link_auton		(pl_directed_link_auton),
      .pl_directed_link_change		(pl_directed_link_change),
      .pl_directed_link_speed		(pl_directed_link_speed),
      .pl_directed_link_width		(pl_directed_link_width),
      .pl_upstream_prefer_deemph	(pl_upstream_prefer_deemph),
      .sys_clk				(sys_clk),
      .sys_reset_n			(sys_reset_n));
   
endmodule // xilinx_v6_pcie_wrapper

