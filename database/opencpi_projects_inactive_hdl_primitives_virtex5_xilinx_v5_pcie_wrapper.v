// Copyright (c) 2009  Bluespec, Inc.  ALL RIGHTS RESERVED

`ifdef BSV_ASSIGNMENT_DELAY
`else
 `define BSV_ASSIGNMENT_DELAY
`endif

module xilinx_v5_pcie_wrapper
  (
   // Outputs
   refclkout, cfg_to_turnoff_n, trn_tdst_dsc_n, trn_tdst_rdy_n, 
   trn_reof_n, cfg_interrupt_rdy_n, trn_reset_n, trn_rsrc_dsc_n, 
   trn_clk, trn2_clk, trn_rerrfwd_n, trn_lnk_up_n, 
   cfg_interrupt_msienable, trn_rsof_n, cfg_rd_wr_done_n, 
   trn_rsrc_rdy_n, cfg_err_cpl_rdy_n, cfg_interrupt_do, 
   trn_rfc_ph_av, trn_rd, trn_rbar_hit_n, cfg_dstatus, cfg_lcommand, 
   trn_rrem_n, cfg_status, cfg_interrupt_mmenable, pci_exp_txn, 
   cfg_command, pci_exp_txp, cfg_do, cfg_bus_number, 
   cfg_device_number, trn_rfc_npd_av, cfg_dcommand, trn_rfc_nph_av, 
   cfg_pcie_link_state_n, cfg_function_number, cfg_lstatus, 
   trn_rfc_pd_av, trn_tbuf_av, 
   // Inputs
   trn_rcpl_streaming_n, trn_rdst_rdy_n, cfg_err_posted_n, 
   cfg_trn_pending_n, cfg_err_cpl_timeout_n, trn_terrfwd_n, 
   trn_rnp_ok_n, cfg_interrupt_n, cfg_rd_en_n, cfg_err_ur_n, 
   cfg_err_ecrc_n, cfg_err_cpl_abort_n, cfg_err_locked_n, 
   cfg_interrupt_assert_n, cfg_wr_en_n, trn_teof_n, trn_tsrc_dsc_n, 
   fast_train_simulation_only, cfg_err_cor_n, sys_reset_n, 
   trn_tsrc_rdy_n, sys_clk, cfg_err_cpl_unexpect_n, trn_tsof_n, 
   cfg_pm_wake_n, cfg_byte_en_n, trn_td, cfg_err_tlp_cpl_header, 
   cfg_dsn, trn_trem_n, cfg_di, cfg_dwaddr, pci_exp_rxn, pci_exp_rxp, 
   cfg_interrupt_di
   );

   // synthesis attribute keep of trn_rdst_rdy_n is "true";
   // synthesis attribute keep of trn_tdst_dsc_n is "true";
   // synthesis attribute keep of trn_tdst_rdy_n is "true";
   // synthesis attribute keep of trn_terrfwd_n is "true";
   // synthesis attribute keep of trn_reof_n is "true";
   // synthesis attribute keep of trn_rnp_ok_n is "true";
   // synthesis attribute keep of trn_reset_n is "true";
   // synthesis attribute keep of trn_rsrc_dsc_n is "true";
   // synthesis attribute keep of trn_rerrfwd_n is "true";
   // synthesis attribute keep of trn_lnk_up_n is "true";
   // synthesis attribute keep of trn_teof_n is "true";
   // synthesis attribute keep of trn_rsof_n is "true";
   // synthesis attribute keep of trn_tsrc_dsc_n is "true";
   // synthesis attribute keep of trn_rsrc_rdy_n is "true";
   // synthesis attribute keep of trn_tsrc_rdy_n is "true";
   // synthesis attribute keep of trn_tsof_n is "true";
   // synthesis attribute keep of trn_rfc_ph_av is "true";
   // synthesis attribute keep of trn_rd is "true";
   // synthesis attribute keep of trn_td is "true";
   // synthesis attribute keep of trn_rbar_hit_n is "true";
   // synthesis attribute keep of trn_rrem_n is "true";
   // synthesis attribute keep of trn_trem_n is "true";
   // synthesis attribute keep of trn_rfc_npd_av is "true";
   // synthesis attribute keep of trn_rfc_nph_av is "true";
   // synthesis attribute keep of trn_rfc_pd_av is "true";
   // synthesis attribute keep of trn_tbuf_av is "true";


   
  output refclkout;
  input trn_rcpl_streaming_n;
  output cfg_to_turnoff_n;
  input trn_rdst_rdy_n;
  output trn_tdst_dsc_n;
  input cfg_err_posted_n;
  output trn_tdst_rdy_n;
  input cfg_trn_pending_n;
  input cfg_err_cpl_timeout_n;
  input trn_terrfwd_n;
  output trn_reof_n;
  input trn_rnp_ok_n;
  input cfg_interrupt_n;
  output cfg_interrupt_rdy_n;
  input cfg_rd_en_n;
  input cfg_err_ur_n;
  output trn_reset_n;
  input cfg_err_ecrc_n;
  input cfg_err_cpl_abort_n;
  output trn_rsrc_dsc_n;
  output trn_clk;
  output trn2_clk;
  input cfg_err_locked_n;
  input cfg_interrupt_assert_n;
  output trn_rerrfwd_n;
  input cfg_wr_en_n;
  output trn_lnk_up_n;
  output cfg_interrupt_msienable;
  input trn_teof_n;
  output trn_rsof_n;
  output cfg_rd_wr_done_n;
  input trn_tsrc_dsc_n;
  output trn_rsrc_rdy_n;
  input fast_train_simulation_only;
  input cfg_err_cor_n;
  input sys_reset_n;
  output cfg_err_cpl_rdy_n;
  input trn_tsrc_rdy_n;
  input sys_clk;
  input cfg_err_cpl_unexpect_n;
  input trn_tsof_n;
  input cfg_pm_wake_n;
  input [3 : 0] cfg_byte_en_n;
  output [7 : 0] cfg_interrupt_do;
  output [7 : 0] trn_rfc_ph_av;
  output [63 : 0] trn_rd;
  input [63 : 0] trn_td;
  input [47 : 0] cfg_err_tlp_cpl_header;
  output [6 : 0] trn_rbar_hit_n;
  output [15 : 0] cfg_dstatus;
  output [15 : 0] cfg_lcommand;
  input [63 : 0] cfg_dsn;
  output [7 : 0] trn_rrem_n;
  output [15 : 0] cfg_status;
  output [2 : 0] cfg_interrupt_mmenable;
  output [7 : 0] pci_exp_txn;
  output [15 : 0] cfg_command;
  output [7 : 0] pci_exp_txp;
  input [7 : 0] trn_trem_n;
  input [31 : 0] cfg_di;
  output [31 : 0] cfg_do;
  output [7 : 0] cfg_bus_number;
  output [4 : 0] cfg_device_number;
  input [9 : 0] cfg_dwaddr;
  output [11 : 0] trn_rfc_npd_av;
  output [15 : 0] cfg_dcommand;
  output [7 : 0] trn_rfc_nph_av;
  output [2 : 0] cfg_pcie_link_state_n;
  output [2 : 0] cfg_function_number;
  output [15 : 0] cfg_lstatus;
  input [7 : 0] pci_exp_rxn;
  input [7 : 0] pci_exp_rxp;
  output [11 : 0] trn_rfc_pd_av;
  output [3 : 0] trn_tbuf_av;
  input [7 : 0] cfg_interrupt_di;

   wire         trn_clk_i;
   
   // endpoint instance
 endpoint_blk_plus_v1_14 ep
   //pcie_endpoint endpoint
     (
      // Outputs
      .refclkout                        (refclkout),
      .cfg_to_turnoff_n                 (cfg_to_turnoff_n),
      .trn_tdst_dsc_n                   (trn_tdst_dsc_n),
      .trn_tdst_rdy_n                   (trn_tdst_rdy_n),
      .trn_reof_n                       (trn_reof_n),
      .cfg_interrupt_rdy_n              (cfg_interrupt_rdy_n),
      .trn_reset_n                      (trn_reset_n),
      .trn_rsrc_dsc_n                   (trn_rsrc_dsc_n),
      .trn_clk                          (trn_clk_i),
      .trn_rerrfwd_n                    (trn_rerrfwd_n),
      .trn_lnk_up_n                     (trn_lnk_up_n),
      .cfg_interrupt_msienable          (cfg_interrupt_msienable),
      .trn_rsof_n                       (trn_rsof_n),
      .cfg_rd_wr_done_n                 (cfg_rd_wr_done_n),
      .trn_rsrc_rdy_n                   (trn_rsrc_rdy_n),
      .cfg_err_cpl_rdy_n                (cfg_err_cpl_rdy_n),
      .cfg_interrupt_do                 (cfg_interrupt_do[7:0]),
      .trn_rfc_ph_av                    (trn_rfc_ph_av[7:0]),
      .trn_rd                           (trn_rd[63:0]),
      .trn_rbar_hit_n                   (trn_rbar_hit_n[6:0]),
      .cfg_dstatus                      (cfg_dstatus[15:0]),
      .cfg_lcommand                     (cfg_lcommand[15:0]),
      .trn_rrem_n                       (trn_rrem_n[7:0]),
      .cfg_status                       (cfg_status[15:0]),
      .cfg_interrupt_mmenable           (cfg_interrupt_mmenable[2:0]),
      .pci_exp_txn                      (pci_exp_txn[7:0]),
      .cfg_command                      (cfg_command[15:0]),
      .pci_exp_txp                      (pci_exp_txp[7:0]),
      .cfg_do                           (cfg_do[31:0]),
      .cfg_bus_number                   (cfg_bus_number[7:0]),
      .cfg_device_number                (cfg_device_number[4:0]),
      .trn_rfc_npd_av                   (trn_rfc_npd_av[11:0]),
      .cfg_dcommand                     (cfg_dcommand[15:0]),
      .trn_rfc_nph_av                   (trn_rfc_nph_av[7:0]),
      .cfg_pcie_link_state_n            (cfg_pcie_link_state_n[2:0]),
      .cfg_function_number              (cfg_function_number[2:0]),
      .cfg_lstatus                      (cfg_lstatus[15:0]),
      .trn_rfc_pd_av                    (trn_rfc_pd_av[11:0]),
      .trn_tbuf_av                      (trn_tbuf_av[3:0]),
      // Inputs
      .trn_rcpl_streaming_n             (trn_rcpl_streaming_n),
      .trn_rdst_rdy_n                   (trn_rdst_rdy_n),
      .cfg_err_posted_n                 (cfg_err_posted_n),
      .cfg_trn_pending_n                (cfg_trn_pending_n),
      .cfg_err_cpl_timeout_n            (cfg_err_cpl_timeout_n),
      .trn_terrfwd_n                    (trn_terrfwd_n),
      .trn_rnp_ok_n                     (trn_rnp_ok_n),
      .cfg_interrupt_n                  (cfg_interrupt_n),
      .cfg_rd_en_n                      (cfg_rd_en_n),
      .cfg_err_ur_n                     (cfg_err_ur_n),
      .cfg_err_ecrc_n                   (cfg_err_ecrc_n),
      .cfg_err_cpl_abort_n              (cfg_err_cpl_abort_n),
      .cfg_err_locked_n                 (cfg_err_locked_n),
      .cfg_interrupt_assert_n           (cfg_interrupt_assert_n),
      .cfg_wr_en_n                      (cfg_wr_en_n),
      .trn_teof_n                       (trn_teof_n),
      .trn_tsrc_dsc_n                   (trn_tsrc_dsc_n),
      .fast_train_simulation_only       (fast_train_simulation_only),
      .cfg_err_cor_n                    (cfg_err_cor_n),
      .sys_reset_n                      (sys_reset_n),
      .trn_tsrc_rdy_n                   (trn_tsrc_rdy_n),
      .sys_clk                          (sys_clk),
      .cfg_err_cpl_unexpect_n           (cfg_err_cpl_unexpect_n),
      .trn_tsof_n                       (trn_tsof_n),
      .cfg_pm_wake_n                    (cfg_pm_wake_n),
      .cfg_byte_en_n                    (cfg_byte_en_n[3:0]),
      .trn_td                           (trn_td[63:0]),
      .cfg_err_tlp_cpl_header           (cfg_err_tlp_cpl_header[47:0]),
      .cfg_dsn                          (cfg_dsn[63:0]),
      .trn_trem_n                       (trn_trem_n[7:0]),
      .cfg_di                           (cfg_di[31:0]),
      .cfg_dwaddr                       (cfg_dwaddr[9:0]),
      .pci_exp_rxn                      (pci_exp_rxn[7:0]),
      .pci_exp_rxp                      (pci_exp_rxp[7:0]),
      .cfg_interrupt_di                 (cfg_interrupt_di[7:0]));
   
   // clock divider instance
   DCM_ADV #(
             .CLKDV_DIVIDE(2.0),
             .CLKIN_PERIOD(4.0),
             .DFS_FREQUENCY_MODE("HIGH"),
             .DLL_FREQUENCY_MODE("HIGH"),
             .SIM_DEVICE("VIRTEX5")
             ) divider
     (
      // Outputs
      .CLK0                             (trn_clk),
      .CLK180                           (),
      .CLK270                           (),
      .CLK2X180                         (),
      .CLK2X                            (),
      .CLK90                            (),
      .CLKDV                            (trn2_clk),
      .CLKFX180                         (),
      .CLKFX                            (),
      .DRDY                             (),
      .LOCKED                           (),
      .PSDONE                           (),
      .DO                               (),
      // Inputs
      .CLKFB                            (trn_clk),
      .CLKIN                            (trn_clk_i),
      .DCLK                             (1'b0),
      .DEN                              (1'b0),
      .DWE                              (1'b0),
      .PSCLK                            (1'b0),
      .PSEN                             (1'b0),
      .PSINCDEC                         (1'b0),
      .RST                              (!sys_reset_n),
      .DI                               (16'h0000),
      .DADDR                            (7'h0));


      
endmodule // xilinx_v5_pcie_wrapper

