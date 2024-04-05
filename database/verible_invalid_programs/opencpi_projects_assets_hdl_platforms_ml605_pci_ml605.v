/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

// PCI interface module extracted from old BSV-generated mkFTop_ml605.

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif


module pci_ml605(// PCI signals from hardware
		 input 		pci0_clkp,
		 input 		pci0_clkn,
		 input 		pci0_rstn,
		 input [ 3:0] 	pcie_rxp_i,
		 input [ 3:0] 	pcie_rxn_i,
		 output [ 3:0] 	pcie_txp,
		 output [ 3:0] 	pcie_txn,
		 // PCI signals facing into the rest of the platform
		 output 	pci_blink,
		 output 	pci_link_up,
		 output 	p125clk,
		 output 	p125rstn,
		 output [ 15:0] pci_device,
		 // Requests coming in from PCIE
		 output [152:0] unoc_out_data,
		 output 	unoc_out_valid,
		 output		unoc_out_take,
		 // Responses going to PCIE
		 input [152:0] 	unoc_in_data,
                 input     	unoc_in_valid,
		 input 		unoc_in_take
		 // // Requests coming in from PCIE
		 // output [152:0] server_request_put,
		 // output 	EN_server_request_put,
		 // input 		RDY_server_request_put,
		 // // Responses going to PCIE
		 // input [152:0] 	server_response_get,
                 // output 	EN_server_response_get,
		 // input 		RDY_server_response_get
);

  parameter VENDOR_ID=0;
  parameter DEVICE_ID=0;
  parameter CLASS_CODE=0;
  defparam pciw_pci0_pcie_ep.ep.VENDOR_ID=VENDOR_ID;
  defparam pciw_pci0_pcie_ep.ep.SUBSYSTEM_VENDOR_ID=VENDOR_ID;
  defparam pciw_pci0_pcie_ep.ep.DEVICE_ID=DEVICE_ID;
  defparam pciw_pci0_pcie_ep.ep.SUBSYSTEM_ID=DEVICE_ID;
  defparam pciw_pci0_pcie_ep.ep.CLASS_CODE=CLASS_CODE;
  // signals for module outputs
//  wire [3 : 0] pcie_txn, pcie_txp;
//  wire CLK_GATE_p125clk,
//       p125clk,
//       p125rst;
  
  // inlined wires
  wire [63 : 0] pciw_pci0_wTrnTxDat$wget;
  wire [7 : 0] pciw_pcie_irq_wInterruptDo$wget;
  wire blinkLed$wget,
       pciw_i2pAF_dClear_pw$whas,
       pciw_i2pAF_deq_happened$whas,
       pciw_i2pAF_deq_pw$whas,
       pciw_i2pAF_enq_pw$whas,
       pciw_i2pAF_sClear_pw$whas,
       pciw_p2iAF_dClear_pw$whas,
       pciw_p2iAF_deq_happened$whas,
       pciw_p2iAF_deq_pw$whas,
       pciw_p2iAF_enq_pw$whas,
       pciw_p2iAF_sClear_pw$whas,
       pciw_pci0_pwTrnRx$whas,
       pciw_pci0_pwTrnTx$whas,
       pciw_pci0_wTrnRxCplS_n$wget,
       pciw_pci0_wTrnRxCplS_n$whas,
       pciw_pci0_wTrnRxNpOk_n$wget,
       pciw_pci0_wTrnRxNpOk_n$whas,
       pciw_pci0_wTrnTxDat$whas,
       pciw_pci0_wTrnTxDsc_n$wget,
       pciw_pci0_wTrnTxDsc_n$whas,
       pciw_pci0_wTrnTxEof_n$wget,
       pciw_pci0_wTrnTxEof_n$whas,
       pciw_pci0_wTrnTxRem_n$wget,
       pciw_pci0_wTrnTxRem_n$whas,
       pciw_pci0_wTrnTxSof_n$wget,
       pciw_pci0_wTrnTxSof_n$whas,
       pciw_pcie_irq_wInterruptDo$whas,
       pciw_pcie_irq_wInterruptRdyN$wget,
       pciw_pcie_irq_wInterruptRdyN$whas;

  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;

  // register needs_init
  reg needs_init;
  wire needs_init$D_IN, needs_init$EN;

  // register pciDevice
  reg [15 : 0] pciDevice;
  wire [15 : 0] pciDevice$D_IN;
  wire pciDevice$EN;

  // register pciw_Prelude_inst_changeSpecialWires_1_rg
  reg [81 : 0] pciw_Prelude_inst_changeSpecialWires_1_rg;
  wire [81 : 0] pciw_Prelude_inst_changeSpecialWires_1_rg$D_IN;
  wire pciw_Prelude_inst_changeSpecialWires_1_rg$EN;

  // register pciw_Prelude_inst_changeSpecialWires_2_rg
  reg [81 : 0] pciw_Prelude_inst_changeSpecialWires_2_rg;
  wire [81 : 0] pciw_Prelude_inst_changeSpecialWires_2_rg$D_IN;
  wire pciw_Prelude_inst_changeSpecialWires_2_rg$EN;

  // register pciw_i2pAF_dInReset_isInReset
  reg pciw_i2pAF_dInReset_isInReset;
  wire pciw_i2pAF_dInReset_isInReset$D_IN, pciw_i2pAF_dInReset_isInReset$EN;

  // register pciw_i2pAF_head_wrapped
  reg pciw_i2pAF_head_wrapped;
  wire pciw_i2pAF_head_wrapped$D_IN, pciw_i2pAF_head_wrapped$EN;

  // register pciw_i2pAF_sInReset_isInReset
  reg pciw_i2pAF_sInReset_isInReset;
  wire pciw_i2pAF_sInReset_isInReset$D_IN, pciw_i2pAF_sInReset_isInReset$EN;

  // register pciw_i2pAF_tail_wrapped
  reg pciw_i2pAF_tail_wrapped;
  wire pciw_i2pAF_tail_wrapped$D_IN, pciw_i2pAF_tail_wrapped$EN;

  // register pciw_i2pS
  reg [152 : 0] pciw_i2pS;
  wire [152 : 0] pciw_i2pS$D_IN;
  wire pciw_i2pS$EN;

  // register pciw_p2iAF_dInReset_isInReset
  reg pciw_p2iAF_dInReset_isInReset;
  wire pciw_p2iAF_dInReset_isInReset$D_IN, pciw_p2iAF_dInReset_isInReset$EN;

  // register pciw_p2iAF_head_wrapped
  reg pciw_p2iAF_head_wrapped;
  wire pciw_p2iAF_head_wrapped$D_IN, pciw_p2iAF_head_wrapped$EN;

  // register pciw_p2iAF_sInReset_isInReset
  reg pciw_p2iAF_sInReset_isInReset;
  wire pciw_p2iAF_sInReset_isInReset$D_IN, pciw_p2iAF_sInReset_isInReset$EN;

  // register pciw_p2iAF_tail_wrapped
  reg pciw_p2iAF_tail_wrapped;
  wire pciw_p2iAF_tail_wrapped$D_IN, pciw_p2iAF_tail_wrapped$EN;

  // register pciw_p2iS
  reg [152 : 0] pciw_p2iS;
  wire [152 : 0] pciw_p2iS$D_IN;
  wire pciw_p2iS$EN;

  // register pciw_pcie_irq_rInterruptDi
  reg [7 : 0] pciw_pcie_irq_rInterruptDi;
  wire [7 : 0] pciw_pcie_irq_rInterruptDi$D_IN;
  wire pciw_pcie_irq_rInterruptDi$EN;

  // register pciw_pcie_irq_rInterruptN
  reg pciw_pcie_irq_rInterruptN;
  wire pciw_pcie_irq_rInterruptN$D_IN, pciw_pcie_irq_rInterruptN$EN;

  // register pciw_pcie_irq_rInterrupting
  reg pciw_pcie_irq_rInterrupting;
  wire pciw_pcie_irq_rInterrupting$D_IN, pciw_pcie_irq_rInterrupting$EN;

  // register pciw_pcie_irq_rMMEnabled
  reg [2 : 0] pciw_pcie_irq_rMMEnabled;
  wire [2 : 0] pciw_pcie_irq_rMMEnabled$D_IN;
  wire pciw_pcie_irq_rMMEnabled$EN;

  // register pciw_pcie_irq_rMSIEnabled
  reg pciw_pcie_irq_rMSIEnabled;
  wire pciw_pcie_irq_rMSIEnabled$D_IN, pciw_pcie_irq_rMSIEnabled$EN;

  // ports of submodule pciw_fI2P
  wire [80 : 0] pciw_fI2P$D_IN, pciw_fI2P$D_OUT;
  wire pciw_fI2P$CLR,
       pciw_fI2P$DEQ,
       pciw_fI2P$EMPTY_N,
       pciw_fI2P$ENQ,
       pciw_fI2P$FULL_N;

  // ports of submodule pciw_fP2I
  wire [80 : 0] pciw_fP2I$D_IN, pciw_fP2I$D_OUT;
  wire pciw_fP2I$CLR,
       pciw_fP2I$DEQ,
       pciw_fP2I$EMPTY_N,
       pciw_fP2I$ENQ,
       pciw_fP2I$FULL_N;

  // ports of submodule pciw_i2pAF_dCombinedReset
  wire pciw_i2pAF_dCombinedReset$RST_OUT;

  // ports of submodule pciw_i2pAF_dCrossedsReset
  wire pciw_i2pAF_dCrossedsReset$OUT_RST;

  // ports of submodule pciw_i2pAF_sCombinedReset
  wire pciw_i2pAF_sCombinedReset$RST_OUT;

  // ports of submodule pciw_i2pAF_sCrosseddReset
  wire pciw_i2pAF_sCrosseddReset$OUT_RST;

  // ports of submodule pciw_p125rst
  wire pciw_p125rst$OUT_RST;

  // ports of submodule pciw_p250rst
  wire pciw_p250rst$OUT_RST;

  // ports of submodule pciw_p2iAF_dCombinedReset
  wire pciw_p2iAF_dCombinedReset$RST_OUT;

  // ports of submodule pciw_p2iAF_dCrossedsReset
  wire pciw_p2iAF_dCrossedsReset$OUT_RST;

  // ports of submodule pciw_p2iAF_sCombinedReset
  wire pciw_p2iAF_sCombinedReset$RST_OUT;

  // ports of submodule pciw_p2iAF_sCrosseddReset
  wire pciw_p2iAF_sCrosseddReset$OUT_RST;

  // ports of submodule pciw_pci0_clk
  wire pciw_pci0_clk$O;

  // ports of submodule pciw_pci0_pcie_ep
  wire [63 : 0] pciw_pci0_pcie_ep$cfg_dsn,
		pciw_pci0_pcie_ep$trn_rd,
		pciw_pci0_pcie_ep$trn_td;
  wire [47 : 0] pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header;
  wire [31 : 0] pciw_pci0_pcie_ep$cfg_di;
  wire [9 : 0] pciw_pci0_pcie_ep$cfg_dwaddr;
  wire [7 : 0] pciw_pci0_pcie_ep$cfg_bus_number,
	       pciw_pci0_pcie_ep$cfg_interrupt_di,
	       pciw_pci0_pcie_ep$cfg_interrupt_do;
  wire [6 : 0] pciw_pci0_pcie_ep$trn_rbar_hit_n;
  wire [4 : 0] pciw_pci0_pcie_ep$cfg_device_number;
  wire [3 : 0] pciw_pci0_pcie_ep$cfg_byte_en_n,
	       pciw_pci0_pcie_ep$pci_exp_rxn,
	       pciw_pci0_pcie_ep$pci_exp_rxp,
	       pciw_pci0_pcie_ep$pci_exp_txn,
	       pciw_pci0_pcie_ep$pci_exp_txp;
  wire [2 : 0] pciw_pci0_pcie_ep$cfg_function_number,
	       pciw_pci0_pcie_ep$cfg_interrupt_mmenable,
	       pciw_pci0_pcie_ep$trn_fc_sel;
  wire [1 : 0] pciw_pci0_pcie_ep$pl_directed_link_change,
	       pciw_pci0_pcie_ep$pl_directed_link_width;
  wire pciw_pci0_pcie_ep$cfg_err_cor_n,
       pciw_pci0_pcie_ep$cfg_err_cpl_abort_n,
       pciw_pci0_pcie_ep$cfg_err_cpl_timeout_n,
       pciw_pci0_pcie_ep$cfg_err_cpl_unexpect_n,
       pciw_pci0_pcie_ep$cfg_err_ecrc_n,
       pciw_pci0_pcie_ep$cfg_err_locked_n,
       pciw_pci0_pcie_ep$cfg_err_posted_n,
       pciw_pci0_pcie_ep$cfg_err_ur_n,
       pciw_pci0_pcie_ep$cfg_interrupt_assert_n,
       pciw_pci0_pcie_ep$cfg_interrupt_msienable,
       pciw_pci0_pcie_ep$cfg_interrupt_n,
       pciw_pci0_pcie_ep$cfg_interrupt_rdy_n,
       pciw_pci0_pcie_ep$cfg_pm_wake_n,
       pciw_pci0_pcie_ep$cfg_rd_en_n,
       pciw_pci0_pcie_ep$cfg_trn_pending_n,
       pciw_pci0_pcie_ep$cfg_turnoff_ok_n,
       pciw_pci0_pcie_ep$cfg_wr_en_n,
       pciw_pci0_pcie_ep$pl_directed_link_auton,
       pciw_pci0_pcie_ep$pl_directed_link_speed,
       pciw_pci0_pcie_ep$pl_upstream_prefer_deemph,
       pciw_pci0_pcie_ep$trn2_clk,
       pciw_pci0_pcie_ep$trn_clk,
       pciw_pci0_pcie_ep$trn_lnk_up_n,
       pciw_pci0_pcie_ep$trn_rdst_rdy_n,
       pciw_pci0_pcie_ep$trn_reof_n,
       pciw_pci0_pcie_ep$trn_reset_n,
       pciw_pci0_pcie_ep$trn_rnp_ok_n,
       pciw_pci0_pcie_ep$trn_rrem_n,
       pciw_pci0_pcie_ep$trn_rsof_n,
       pciw_pci0_pcie_ep$trn_rsrc_rdy_n,
       pciw_pci0_pcie_ep$trn_tcfg_gnt_n,
       pciw_pci0_pcie_ep$trn_tdst_rdy_n,
       pciw_pci0_pcie_ep$trn_teof_n,
       pciw_pci0_pcie_ep$trn_terrfwd_n,
       pciw_pci0_pcie_ep$trn_trem_n,
       pciw_pci0_pcie_ep$trn_tsof_n,
       pciw_pci0_pcie_ep$trn_tsrc_dsc_n,
       pciw_pci0_pcie_ep$trn_tsrc_rdy_n,
       pciw_pci0_pcie_ep$trn_tstr_n;

  // ports of submodule pciw_pciDevice
  wire [15 : 0] pciw_pciDevice$dD_OUT, pciw_pciDevice$sD_IN;
  wire pciw_pciDevice$sEN, pciw_pciDevice$sRDY;

  // ports of submodule pciw_pciLinkUp
  wire pciw_pciLinkUp$dD_OUT, pciw_pciLinkUp$sD_IN, pciw_pciLinkUp$sEN;

  // ports of submodule pciw_pcie_irq_fifoAssert
  wire [7 : 0] pciw_pcie_irq_fifoAssert$dD_OUT,
	       pciw_pcie_irq_fifoAssert$sD_IN;
  wire pciw_pcie_irq_fifoAssert$dDEQ,
       pciw_pcie_irq_fifoAssert$dEMPTY_N,
       pciw_pcie_irq_fifoAssert$sENQ;

  // ports of submodule pciw_preEdge
  wire pciw_preEdge$CLK_VAL;

  // ports of submodule sys0_clk
  wire sys0_clk$O;

  // ports of submodule sys0_rst
  wire sys0_rst$OUT_RST;

  // ports of submodule sys1_clk
  wire sys1_clk$O;

  // ports of submodule sys1_clki
  wire sys1_clki$O;

  // rule scheduling signals
  wire WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1,
       WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect2,
       WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1,
       WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect2,
       WILL_FIRE_RL_pciw_i2pAF_deq_update_head,
       WILL_FIRE_RL_pciw_i2pAF_enq_update_tail,
       WILL_FIRE_RL_pciw_p2iAF_deq_update_head,
       WILL_FIRE_RL_pciw_p2iAF_enq_update_tail,
       WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt,
       WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt_done;

  // inputs to muxes for submodule ports
  wire [152 : 0] MUX_pciw_p2iS$write_1__VAL_1, MUX_pciw_p2iS$write_1__VAL_2;
  wire [81 : 0] MUX_pciw_Prelude_inst_changeSpecialWires_1_rg$write_1__VAL_1,
		MUX_pciw_Prelude_inst_changeSpecialWires_2_rg$write_1__VAL_1;
  wire [80 : 0] MUX_pciw_fI2P$enq_1__VAL_1;
  wire MUX_pciw_Prelude_inst_changeSpecialWires_1_rg$write_1__SEL_1,
       MUX_pciw_Prelude_inst_changeSpecialWires_2_rg$write_1__SEL_1,
       MUX_pciw_p2iS$write_1__SEL_1;

  // remaining internal signals
  wire [127 : 0] val_data__h6517, wOut_data__h6626;
  wire [15 : 0] val_be__h6516, wOut_be__h6625;
  wire pciw_p2iAF_head_wrapped_crossed__4_EQ_pciw_p2i_ETC___d123;

  // oscillator and gates for output clock p125clk
  assign pci_device = pciDevice;
  assign p125clk = pciw_pci0_pcie_ep$trn2_clk ;

  // output resets
  assign p125rstn = pciw_p125rst$OUT_RST ;

  // value method pcie_txp
  assign pcie_txp = pciw_pci0_pcie_ep$pci_exp_txp ;

  // value method pcie_txn
  assign pcie_txn = pciw_pci0_pcie_ep$pci_exp_txn ;

  assign pci_link_up = pciw_pciLinkUp$dD_OUT;


  // submodule pciw_fI2P
  SizedFIFO #(.p1width(32'd81),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd1)) pciw_fI2P(.RST(pciw_p250rst$OUT_RST),
					 .CLK(pciw_pci0_pcie_ep$trn_clk),
					 .D_IN(pciw_fI2P$D_IN),
					 .ENQ(pciw_fI2P$ENQ),
					 .DEQ(pciw_fI2P$DEQ),
					 .CLR(pciw_fI2P$CLR),
					 .D_OUT(pciw_fI2P$D_OUT),
					 .FULL_N(pciw_fI2P$FULL_N),
					 .EMPTY_N(pciw_fI2P$EMPTY_N));

  // submodule pciw_fP2I
  SizedFIFO #(.p1width(32'd81),
	      .p2depth(32'd4),
	      .p3cntr_width(32'd2),
	      .guarded(32'd1)) pciw_fP2I(.RST(pciw_p250rst$OUT_RST),
					 .CLK(pciw_pci0_pcie_ep$trn_clk),
					 .D_IN(pciw_fP2I$D_IN),
					 .ENQ(pciw_fP2I$ENQ),
					 .DEQ(pciw_fP2I$DEQ),
					 .CLR(pciw_fP2I$CLR),
					 .D_OUT(pciw_fP2I$D_OUT),
					 .FULL_N(pciw_fP2I$FULL_N),
					 .EMPTY_N(pciw_fP2I$EMPTY_N));

  // submodule pciw_i2pAF_dCombinedReset
  ResetEither pciw_i2pAF_dCombinedReset(.A_RST(pciw_p250rst$OUT_RST),
					.B_RST(pciw_i2pAF_dCrossedsReset$OUT_RST),
					.RST_OUT(pciw_i2pAF_dCombinedReset$RST_OUT));

  // submodule pciw_i2pAF_dCrossedsReset
  SyncReset0 pciw_i2pAF_dCrossedsReset(.IN_RST(pciw_p125rst$OUT_RST),
				       .OUT_RST(pciw_i2pAF_dCrossedsReset$OUT_RST));

  // submodule pciw_i2pAF_sCombinedReset
  ResetEither pciw_i2pAF_sCombinedReset(.A_RST(pciw_p125rst$OUT_RST),
					.B_RST(pciw_i2pAF_sCrosseddReset$OUT_RST),
					.RST_OUT(pciw_i2pAF_sCombinedReset$RST_OUT));

  // submodule pciw_i2pAF_sCrosseddReset
  SyncReset0 pciw_i2pAF_sCrosseddReset(.IN_RST(pciw_p250rst$OUT_RST),
				       .OUT_RST(pciw_i2pAF_sCrosseddReset$OUT_RST));

  // submodule pciw_p125rst
  SyncResetA #(.RSTDELAY(32'd0)) pciw_p125rst(.CLK(pciw_pci0_pcie_ep$trn2_clk),
					      .IN_RST(pciw_pci0_pcie_ep$trn_reset_n),
					      .OUT_RST(pciw_p125rst$OUT_RST));

  // submodule pciw_p250rst
  SyncResetA #(.RSTDELAY(32'd0)) pciw_p250rst(.CLK(pciw_pci0_pcie_ep$trn_clk),
					      .IN_RST(pciw_pci0_pcie_ep$trn_reset_n),
					      .OUT_RST(pciw_p250rst$OUT_RST));

  // submodule pciw_p2iAF_dCombinedReset
  ResetEither pciw_p2iAF_dCombinedReset(.A_RST(pciw_p125rst$OUT_RST),
					.B_RST(pciw_p2iAF_dCrossedsReset$OUT_RST),
					.RST_OUT(pciw_p2iAF_dCombinedReset$RST_OUT));

  // submodule pciw_p2iAF_dCrossedsReset
  SyncReset0 pciw_p2iAF_dCrossedsReset(.IN_RST(pciw_p250rst$OUT_RST),
				       .OUT_RST(pciw_p2iAF_dCrossedsReset$OUT_RST));

  // submodule pciw_p2iAF_sCombinedReset
  ResetEither pciw_p2iAF_sCombinedReset(.A_RST(pciw_p250rst$OUT_RST),
					.B_RST(pciw_p2iAF_sCrosseddReset$OUT_RST),
					.RST_OUT(pciw_p2iAF_sCombinedReset$RST_OUT));

  // submodule pciw_p2iAF_sCrosseddReset
  SyncReset0 pciw_p2iAF_sCrosseddReset(.IN_RST(pciw_p125rst$OUT_RST),
				       .OUT_RST(pciw_p2iAF_sCrosseddReset$OUT_RST));

  // submodule pciw_pci0_clk
//  (* LOC="IBUFDS_GTXE1_X0Y4" *)
  IBUFDS_GTXE1 pciw_pci0_clk(.I(pci0_clkp),
			     .IB(pci0_clkn),
			     .CEB(1'd0),
			     .O(pciw_pci0_clk$O),
			     .ODIV2());

  // submodule pciw_pci0_pcie_ep
  xilinx_v6_pcie_wrapper #(.PL_FAST_TRAIN("FALSE")) pciw_pci0_pcie_ep(.sys_clk(pciw_pci0_clk$O),
								      .sys_reset_n(pci0_rstn),
								      .cfg_byte_en_n(pciw_pci0_pcie_ep$cfg_byte_en_n),
								      .cfg_di(pciw_pci0_pcie_ep$cfg_di),
								      .cfg_dsn(pciw_pci0_pcie_ep$cfg_dsn),
								      .cfg_dwaddr(pciw_pci0_pcie_ep$cfg_dwaddr),
								      .cfg_err_cor_n(pciw_pci0_pcie_ep$cfg_err_cor_n),
								      .cfg_err_cpl_abort_n(pciw_pci0_pcie_ep$cfg_err_cpl_abort_n),
								      .cfg_err_cpl_timeout_n(pciw_pci0_pcie_ep$cfg_err_cpl_timeout_n),
								      .cfg_err_cpl_unexpect_n(pciw_pci0_pcie_ep$cfg_err_cpl_unexpect_n),
								      .cfg_err_ecrc_n(pciw_pci0_pcie_ep$cfg_err_ecrc_n),
								      .cfg_err_locked_n(pciw_pci0_pcie_ep$cfg_err_locked_n),
								      .cfg_err_posted_n(pciw_pci0_pcie_ep$cfg_err_posted_n),
								      .cfg_err_tlp_cpl_header(pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header),
								      .cfg_err_ur_n(pciw_pci0_pcie_ep$cfg_err_ur_n),
								      .cfg_interrupt_assert_n(pciw_pci0_pcie_ep$cfg_interrupt_assert_n),
								      .cfg_interrupt_di(pciw_pci0_pcie_ep$cfg_interrupt_di),
								      .cfg_interrupt_n(pciw_pci0_pcie_ep$cfg_interrupt_n),
								      .cfg_pm_wake_n(pciw_pci0_pcie_ep$cfg_pm_wake_n),
								      .cfg_rd_en_n(pciw_pci0_pcie_ep$cfg_rd_en_n),
								      .cfg_trn_pending_n(pciw_pci0_pcie_ep$cfg_trn_pending_n),
								      .cfg_turnoff_ok_n(pciw_pci0_pcie_ep$cfg_turnoff_ok_n),
								      .cfg_wr_en_n(pciw_pci0_pcie_ep$cfg_wr_en_n),
								      .pci_exp_rxn(pciw_pci0_pcie_ep$pci_exp_rxn),
								      .pci_exp_rxp(pciw_pci0_pcie_ep$pci_exp_rxp),
								      .pl_directed_link_auton(pciw_pci0_pcie_ep$pl_directed_link_auton),
								      .pl_directed_link_change(pciw_pci0_pcie_ep$pl_directed_link_change),
								      .pl_directed_link_speed(pciw_pci0_pcie_ep$pl_directed_link_speed),
								      .pl_directed_link_width(pciw_pci0_pcie_ep$pl_directed_link_width),
								      .pl_upstream_prefer_deemph(pciw_pci0_pcie_ep$pl_upstream_prefer_deemph),
								      .trn_fc_sel(pciw_pci0_pcie_ep$trn_fc_sel),
								      .trn_rdst_rdy_n(pciw_pci0_pcie_ep$trn_rdst_rdy_n),
								      .trn_rnp_ok_n(pciw_pci0_pcie_ep$trn_rnp_ok_n),
								      .trn_tcfg_gnt_n(pciw_pci0_pcie_ep$trn_tcfg_gnt_n),
								      .trn_td(pciw_pci0_pcie_ep$trn_td),
								      .trn_teof_n(pciw_pci0_pcie_ep$trn_teof_n),
								      .trn_terrfwd_n(pciw_pci0_pcie_ep$trn_terrfwd_n),
								      .trn_trem_n(pciw_pci0_pcie_ep$trn_trem_n),
								      .trn_tsof_n(pciw_pci0_pcie_ep$trn_tsof_n),
								      .trn_tsrc_dsc_n(pciw_pci0_pcie_ep$trn_tsrc_dsc_n),
								      .trn_tsrc_rdy_n(pciw_pci0_pcie_ep$trn_tsrc_rdy_n),
								      .trn_tstr_n(pciw_pci0_pcie_ep$trn_tstr_n),
								      .pci_exp_txp(pciw_pci0_pcie_ep$pci_exp_txp),
								      .pci_exp_txn(pciw_pci0_pcie_ep$pci_exp_txn),
								      .cfg_do(),
								      .cfg_rd_wr_done_n(),
								      .cfg_bus_number(pciw_pci0_pcie_ep$cfg_bus_number),
								      .cfg_device_number(pciw_pci0_pcie_ep$cfg_device_number),
								      .cfg_function_number(pciw_pci0_pcie_ep$cfg_function_number),
								      .cfg_status(),
								      .cfg_command(),
								      .cfg_dstatus(),
								      .cfg_dcommand(),
								      .cfg_dcommand2(),
								      .cfg_lstatus(),
								      .cfg_lcommand(),
								      .cfg_to_turnoff_n(),
								      .cfg_pcie_link_state_n(),
								      .cfg_pmcsr_pme_en(),
								      .cfg_pmcsr_pme_status(),
								      .cfg_pmcsr_powerstate(),
								      .trn_rsof_n(pciw_pci0_pcie_ep$trn_rsof_n),
								      .trn_reof_n(pciw_pci0_pcie_ep$trn_reof_n),
								      .trn_rd(pciw_pci0_pcie_ep$trn_rd),
								      .trn_rrem_n(pciw_pci0_pcie_ep$trn_rrem_n),
								      .trn_rerrfwd_n(),
								      .trn_rsrc_rdy_n(pciw_pci0_pcie_ep$trn_rsrc_rdy_n),
								      .trn_rsrc_dsc_n(),
								      .trn_rbar_hit_n(pciw_pci0_pcie_ep$trn_rbar_hit_n),
								      .trn_tdst_rdy_n(pciw_pci0_pcie_ep$trn_tdst_rdy_n),
								      .trn_tbuf_av(),
								      .trn_terr_drop_n(),
								      .trn_tcfg_req_n(),
								      .trn_lnk_up_n(pciw_pci0_pcie_ep$trn_lnk_up_n),
								      .trn_fc_ph(),
								      .trn_fc_pd(),
								      .trn_fc_nph(),
								      .trn_fc_npd(),
								      .trn_fc_cplh(),
								      .trn_fc_cpld(),
								      .cfg_interrupt_rdy_n(pciw_pci0_pcie_ep$cfg_interrupt_rdy_n),
								      .cfg_interrupt_do(pciw_pci0_pcie_ep$cfg_interrupt_do),
								      .cfg_interrupt_mmenable(pciw_pci0_pcie_ep$cfg_interrupt_mmenable),
								      .cfg_interrupt_msienable(pciw_pci0_pcie_ep$cfg_interrupt_msienable),
								      .cfg_interrupt_msixenable(),
								      .cfg_interrupt_msixfm(),
								      .cfg_err_cpl_rdy_n(),
								      .pl_initial_link_width(),
								      .pl_lane_reversal_mode(),
								      .pl_link_gen2_capable(),
								      .pl_link_partner_gen2_supported(),
								      .pl_link_upcfg_capable(),
								      .pl_sel_link_rate(),
								      .pl_sel_link_width(),
								      .pl_ltssm_state(),
								      .pl_received_hot_rst(),
								      .trn_clk(pciw_pci0_pcie_ep$trn_clk),
								      .trn2_clk(pciw_pci0_pcie_ep$trn2_clk),
								      .trn_reset_n(pciw_pci0_pcie_ep$trn_reset_n));

  // submodule pciw_pciDevice
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) pciw_pciDevice(.sCLK(pciw_pci0_pcie_ep$trn_clk),
					      .dCLK(pciw_pci0_pcie_ep$trn2_clk),
					      .sRST(pciw_p250rst$OUT_RST),
					      .sD_IN(pciw_pciDevice$sD_IN),
					      .sEN(pciw_pciDevice$sEN),
					      .dD_OUT(pciw_pciDevice$dD_OUT),
					      .sRDY(pciw_pciDevice$sRDY));

  // submodule pciw_pciLinkUp
  SyncBit #(.init(1'd0)) pciw_pciLinkUp(.sCLK(pciw_pci0_pcie_ep$trn_clk),
					.dCLK(pciw_pci0_pcie_ep$trn2_clk),
					.sRST(pciw_p250rst$OUT_RST),
					.sD_IN(pciw_pciLinkUp$sD_IN),
					.sEN(pciw_pciLinkUp$sEN),
					.dD_OUT(pciw_pciLinkUp$dD_OUT));

  // submodule pciw_pcie_irq_fifoAssert
  SyncFIFO #(.dataWidth(32'd8),
	     .depth(32'd8),
	     .indxWidth(32'd3)) pciw_pcie_irq_fifoAssert(.sCLK(pciw_pci0_pcie_ep$trn_clk),
							 .dCLK(pciw_pci0_pcie_ep$trn_clk),
							 .sRST(pciw_p250rst$OUT_RST),
							 .sD_IN(pciw_pcie_irq_fifoAssert$sD_IN),
							 .sENQ(pciw_pcie_irq_fifoAssert$sENQ),
							 .dDEQ(pciw_pcie_irq_fifoAssert$dDEQ),
							 .dD_OUT(pciw_pcie_irq_fifoAssert$dD_OUT),
							 .sFULL_N(),
							 .dEMPTY_N(pciw_pcie_irq_fifoAssert$dEMPTY_N));

  // submodule pciw_preEdge
  ClockInvToBool pciw_preEdge(.CLK_FAST(pciw_pci0_pcie_ep$trn_clk),
			      .CLK_SLOW(pciw_pci0_pcie_ep$trn2_clk),
			      .CLK_VAL(pciw_preEdge$CLK_VAL));

  // rule RL_pciw_pcie_irq_msi_enabled_assert_interrupt
  assign WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt =
	     pciw_pcie_irq_fifoAssert$dEMPTY_N && pciw_pcie_irq_rMSIEnabled &&
	     !pciw_pcie_irq_rInterrupting &&
	     pciw_pci0_pcie_ep$cfg_interrupt_rdy_n ;

  // rule RL_pciw_pcie_irq_msi_enabled_assert_interrupt_done
  assign WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt_done =
	     pciw_pcie_irq_rMSIEnabled && pciw_pcie_irq_rInterrupting &&
	     !pciw_pci0_pcie_ep$cfg_interrupt_rdy_n ;

  // rule RL_pciw_p2iAF_deq_update_head
  assign WILL_FIRE_RL_pciw_p2iAF_deq_update_head =
	     !pciw_p2iAF_dInReset_isInReset && pciw_p2iAF_deq_pw$whas ;

  // rule RL_pciw_i2pAF_enq_update_tail
  assign WILL_FIRE_RL_pciw_i2pAF_enq_update_tail =
	     !pciw_i2pAF_sInReset_isInReset && pciw_i2pAF_enq_pw$whas ;

  // rule RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1
  assign WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1 =
	     pciw_fP2I$EMPTY_N &&
	     (!pciw_fP2I$D_OUT[79] ||
	      pciw_p2iAF_head_wrapped_crossed__4_EQ_pciw_p2i_ETC___d123) &&
	     !pciw_Prelude_inst_changeSpecialWires_1_rg[81] ;

  // rule RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect2
  assign WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect2 =
	     pciw_p2iAF_head_wrapped_crossed__4_EQ_pciw_p2i_ETC___d123 &&
	     pciw_fP2I$EMPTY_N &&
	     pciw_Prelude_inst_changeSpecialWires_1_rg[81] ;

  // rule RL_pciw_p2iAF_enq_update_tail
  assign WILL_FIRE_RL_pciw_p2iAF_enq_update_tail =
	     !pciw_p2iAF_sInReset_isInReset && pciw_p2iAF_enq_pw$whas ;

  // rule RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1
  assign WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1 =
	     pciw_i2pAF_head_wrapped != pciw_i2pAF_tail_wrapped &&
	     !pciw_i2pAF_dInReset_isInReset &&
	     pciw_preEdge$CLK_VAL &&
	     pciw_fI2P$FULL_N &&
	     !pciw_Prelude_inst_changeSpecialWires_2_rg[81] ;

  // rule RL_pciw_i2pAF_deq_update_head
  assign WILL_FIRE_RL_pciw_i2pAF_deq_update_head =
	     !pciw_i2pAF_dInReset_isInReset &&
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1 ;

  // rule RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect2
  assign WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect2 =
	     pciw_fI2P$FULL_N &&
	     pciw_Prelude_inst_changeSpecialWires_2_rg[81] ;

  // inputs to muxes for submodule ports
  assign MUX_pciw_Prelude_inst_changeSpecialWires_1_rg$write_1__SEL_1 =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1 &&
	     !pciw_fP2I$D_OUT[79] ;
  assign MUX_pciw_Prelude_inst_changeSpecialWires_2_rg$write_1__SEL_1 =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1 &&
	     pciw_i2pS[135:128] != 8'd0 ;
  assign MUX_pciw_p2iS$write_1__SEL_1 =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1 &&
	     pciw_fP2I$D_OUT[79] ;
  assign MUX_pciw_Prelude_inst_changeSpecialWires_1_rg$write_1__VAL_1 =
	     { 1'd1, pciw_fP2I$D_OUT } ;
  assign MUX_pciw_Prelude_inst_changeSpecialWires_2_rg$write_1__VAL_1 =
	     { 2'd2,
	       pciw_i2pS[151:144],
	       pciw_i2pS[135:128],
	       pciw_i2pS[63:0] } ;
  assign MUX_pciw_fI2P$enq_1__VAL_1 =
	     (pciw_i2pS[135:128] == 8'd0) ?
	       { pciw_i2pS[152:136], pciw_i2pS[127:64] } :
	       { pciw_i2pS[152],
		 1'd0,
		 pciw_i2pS[150:136],
		 pciw_i2pS[127:64] } ;
  assign MUX_pciw_p2iS$write_1__VAL_1 =
	     { pciw_fP2I$D_OUT[80:72], val_be__h6516, val_data__h6517 } ;
  assign MUX_pciw_p2iS$write_1__VAL_2 =
	     { pciw_Prelude_inst_changeSpecialWires_1_rg[80],
	       pciw_fP2I$D_OUT[79],
	       pciw_Prelude_inst_changeSpecialWires_1_rg[78:72],
	       wOut_be__h6625,
	       wOut_data__h6626 } ;

  // inlined wires
  assign pciw_pci0_wTrnTxSof_n$wget = !pciw_fI2P$D_OUT[80] ;
  assign pciw_pci0_wTrnTxSof_n$whas = pciw_pci0_pwTrnTx$whas ;
  assign pciw_pci0_wTrnTxEof_n$wget = !pciw_fI2P$D_OUT[79] ;
  assign pciw_pci0_wTrnTxEof_n$whas = pciw_pci0_pwTrnTx$whas ;
  assign pciw_pci0_wTrnTxDsc_n$wget = 1'd1 ;
  assign pciw_pci0_wTrnTxDsc_n$whas = pciw_pci0_pwTrnTx$whas ;
  assign pciw_pci0_wTrnTxRem_n$wget = pciw_fI2P$D_OUT[71:64] != 8'd255 ;
  assign pciw_pci0_wTrnTxRem_n$whas = pciw_pci0_pwTrnTx$whas ;
  assign pciw_pci0_wTrnTxDat$wget = pciw_fI2P$D_OUT[63:0] ;
  assign pciw_pci0_wTrnTxDat$whas = pciw_pci0_pwTrnTx$whas ;
  assign pciw_pci0_wTrnRxNpOk_n$wget = 1'd0 ;
  assign pciw_pci0_wTrnRxNpOk_n$whas = 1'd1 ;
  assign pciw_pci0_wTrnRxCplS_n$wget = 1'b0 ;
  assign pciw_pci0_wTrnRxCplS_n$whas = 1'b0 ;
  assign pciw_pcie_irq_wInterruptRdyN$wget =
	     pciw_pci0_pcie_ep$cfg_interrupt_rdy_n ;
  assign pciw_pcie_irq_wInterruptRdyN$whas = 1'd1 ;
  assign pciw_pcie_irq_wInterruptDo$wget =
	     pciw_pci0_pcie_ep$cfg_interrupt_do ;
  assign pciw_pcie_irq_wInterruptDo$whas = 1'd1 ;
  assign pciw_pci0_pwTrnTx$whas =
	     !pciw_pci0_pcie_ep$trn_tdst_rdy_n && pciw_fI2P$EMPTY_N ;
  assign pciw_pci0_pwTrnRx$whas =
	     !pciw_pci0_pcie_ep$trn_rsrc_rdy_n && pciw_fP2I$FULL_N ;
  assign pciw_p2iAF_enq_pw$whas =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1 &&
	     pciw_fP2I$D_OUT[79] ||
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect2 ;
  assign pciw_p2iAF_deq_pw$whas =
`ifdef not
	     pciw_p2iAF_head_wrapped != pciw_p2iAF_tail_wrapped &&
	     !pciw_p2iAF_dInReset_isInReset &&
	     RDY_server_request_put ;
`else
             unoc_in_take;
`endif
  assign pciw_p2iAF_sClear_pw$whas = 1'b0 ;
  assign pciw_p2iAF_dClear_pw$whas = 1'b0 ;
  assign pciw_p2iAF_deq_happened$whas = 1'b0 ;
  assign pciw_i2pAF_enq_pw$whas =
	     pciw_i2pAF_head_wrapped == pciw_i2pAF_tail_wrapped &&
	     !pciw_i2pAF_sInReset_isInReset &&
`ifdef not
	     RDY_server_response_get ;
`else
             unoc_in_valid;
`endif
  assign pciw_i2pAF_deq_pw$whas =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1 ;
  assign pciw_i2pAF_sClear_pw$whas = 1'b0 ;
  assign pciw_i2pAF_dClear_pw$whas = 1'b0 ;
  assign pciw_i2pAF_deq_happened$whas = 1'b0 ;
  assign pci_blink = freeCnt[25] ;

  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;

  // register needs_init
  assign needs_init$D_IN = 1'd0 ;
  assign needs_init$EN = needs_init ;

  // register pciDevice
  assign pciDevice$D_IN = pciw_pciDevice$dD_OUT ;
  assign pciDevice$EN = 1'd1 ;

  // register pciw_Prelude_inst_changeSpecialWires_1_rg
  assign pciw_Prelude_inst_changeSpecialWires_1_rg$D_IN =
	     MUX_pciw_Prelude_inst_changeSpecialWires_1_rg$write_1__SEL_1 ?
	       MUX_pciw_Prelude_inst_changeSpecialWires_1_rg$write_1__VAL_1 :
	       82'h0AAAAAAAAAAAAAAAAAAAA ;
  assign pciw_Prelude_inst_changeSpecialWires_1_rg$EN =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1 &&
	     !pciw_fP2I$D_OUT[79] ||
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect2 ;

  // register pciw_Prelude_inst_changeSpecialWires_2_rg
  assign pciw_Prelude_inst_changeSpecialWires_2_rg$D_IN =
	     MUX_pciw_Prelude_inst_changeSpecialWires_2_rg$write_1__SEL_1 ?
	       MUX_pciw_Prelude_inst_changeSpecialWires_2_rg$write_1__VAL_1 :
	       82'h0AAAAAAAAAAAAAAAAAAAA ;
  assign pciw_Prelude_inst_changeSpecialWires_2_rg$EN =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1 &&
	     pciw_i2pS[135:128] != 8'd0 ||
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect2 ;

  // register pciw_i2pAF_dInReset_isInReset
  assign pciw_i2pAF_dInReset_isInReset$D_IN = 1'd0 ;
  assign pciw_i2pAF_dInReset_isInReset$EN = pciw_i2pAF_dInReset_isInReset ;

  // register pciw_i2pAF_head_wrapped
  assign pciw_i2pAF_head_wrapped$D_IN =
	     WILL_FIRE_RL_pciw_i2pAF_deq_update_head &&
	     !pciw_i2pAF_head_wrapped ;
  assign pciw_i2pAF_head_wrapped$EN =
	     WILL_FIRE_RL_pciw_i2pAF_deq_update_head ||
	     pciw_i2pAF_dInReset_isInReset ;

  // register pciw_i2pAF_sInReset_isInReset
  assign pciw_i2pAF_sInReset_isInReset$D_IN = 1'd0 ;
  assign pciw_i2pAF_sInReset_isInReset$EN = pciw_i2pAF_sInReset_isInReset ;

  // register pciw_i2pAF_tail_wrapped
  assign pciw_i2pAF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_pciw_i2pAF_enq_update_tail &&
	     !pciw_i2pAF_tail_wrapped ;
  assign pciw_i2pAF_tail_wrapped$EN =
	     WILL_FIRE_RL_pciw_i2pAF_enq_update_tail ||
	     pciw_i2pAF_sInReset_isInReset ;

  // register pciw_i2pS
`ifdef not
  assign pciw_i2pS$D_IN = server_response_get ;
`else
  assign pciw_i2pS$D_IN = unoc_in_data;
`endif
  assign pciw_i2pS$EN = pciw_i2pAF_enq_pw$whas ;

  // register pciw_p2iAF_dInReset_isInReset
  assign pciw_p2iAF_dInReset_isInReset$D_IN = 1'd0 ;
  assign pciw_p2iAF_dInReset_isInReset$EN = pciw_p2iAF_dInReset_isInReset ;

  // register pciw_p2iAF_head_wrapped
  assign pciw_p2iAF_head_wrapped$D_IN =
	     WILL_FIRE_RL_pciw_p2iAF_deq_update_head &&
	     !pciw_p2iAF_head_wrapped ;
  assign pciw_p2iAF_head_wrapped$EN =
	     WILL_FIRE_RL_pciw_p2iAF_deq_update_head ||
	     pciw_p2iAF_dInReset_isInReset ;

  // register pciw_p2iAF_sInReset_isInReset
  assign pciw_p2iAF_sInReset_isInReset$D_IN = 1'd0 ;
  assign pciw_p2iAF_sInReset_isInReset$EN = pciw_p2iAF_sInReset_isInReset ;

  // register pciw_p2iAF_tail_wrapped
  assign pciw_p2iAF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_pciw_p2iAF_enq_update_tail &&
	     !pciw_p2iAF_tail_wrapped ;
  assign pciw_p2iAF_tail_wrapped$EN =
	     WILL_FIRE_RL_pciw_p2iAF_enq_update_tail ||
	     pciw_p2iAF_sInReset_isInReset ;

  // register pciw_p2iS
  assign pciw_p2iS$D_IN =
	     MUX_pciw_p2iS$write_1__SEL_1 ?
	       MUX_pciw_p2iS$write_1__VAL_1 :
	       MUX_pciw_p2iS$write_1__VAL_2 ;
  assign pciw_p2iS$EN = pciw_p2iAF_enq_pw$whas ;

  // register pciw_pcie_irq_rInterruptDi
  assign pciw_pcie_irq_rInterruptDi$D_IN = pciw_pcie_irq_fifoAssert$dD_OUT ;
  assign pciw_pcie_irq_rInterruptDi$EN =
	     WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt ;

  // register pciw_pcie_irq_rInterruptN
  assign pciw_pcie_irq_rInterruptN$D_IN =
	     !WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt ;
  assign pciw_pcie_irq_rInterruptN$EN =
	     WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt ||
	     WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt_done ;

  // register pciw_pcie_irq_rInterrupting
  assign pciw_pcie_irq_rInterrupting$D_IN =
	     !WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt_done ;
  assign pciw_pcie_irq_rInterrupting$EN =
	     WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt_done ||
	     WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt ;

  // register pciw_pcie_irq_rMMEnabled
  assign pciw_pcie_irq_rMMEnabled$D_IN =
	     pciw_pci0_pcie_ep$cfg_interrupt_mmenable ;
  assign pciw_pcie_irq_rMMEnabled$EN = 1'd1 ;

  // register pciw_pcie_irq_rMSIEnabled
  assign pciw_pcie_irq_rMSIEnabled$D_IN =
	     pciw_pci0_pcie_ep$cfg_interrupt_msienable ;
  assign pciw_pcie_irq_rMSIEnabled$EN = 1'd1 ;

`ifdef not
  assign server_request_put = pciw_p2iS ;
  assign EN_server_request_put =
	     pciw_p2iAF_head_wrapped != pciw_p2iAF_tail_wrapped &&
	     !pciw_p2iAF_dInReset_isInReset &&
	     RDY_server_request_put ;
  assign EN_server_response_get =
	     pciw_i2pAF_head_wrapped == pciw_i2pAF_tail_wrapped &&
	     !pciw_i2pAF_sInReset_isInReset &&
	     RDY_server_response_get ;
`else // !`ifdef not
  // assign server_request_put = pciw_p2iS ;
  assign unoc_out_data = pciw_p2iS ;
  assign unoc_out_valid = pciw_p2iAF_head_wrapped != pciw_p2iAF_tail_wrapped &&
			  !pciw_p2iAF_dInReset_isInReset;
  assign unoc_out_take = pciw_i2pAF_head_wrapped == pciw_i2pAF_tail_wrapped &&
			 !pciw_i2pAF_sInReset_isInReset &&
			 unoc_in_valid;
`endif
  // submodule pciw_fI2P
  assign pciw_fI2P$D_IN =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1 ?
	       MUX_pciw_fI2P$enq_1__VAL_1 :
	       pciw_Prelude_inst_changeSpecialWires_2_rg[80:0] ;
  assign pciw_fI2P$ENQ =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect1 ||
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_2_downconv_connect2 ;
  assign pciw_fI2P$DEQ = pciw_pci0_pwTrnTx$whas ;
  assign pciw_fI2P$CLR = 1'b0 ;

  // submodule pciw_fP2I
  assign pciw_fP2I$D_IN =
	     { !pciw_pci0_pcie_ep$trn_rsof_n,
	       !pciw_pci0_pcie_ep$trn_reof_n,
	       ~pciw_pci0_pcie_ep$trn_rbar_hit_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       ~pciw_pci0_pcie_ep$trn_rrem_n,
	       pciw_pci0_pcie_ep$trn_rd } ;
  assign pciw_fP2I$ENQ = pciw_pci0_pwTrnRx$whas ;
  assign pciw_fP2I$DEQ =
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect2 ||
	     WILL_FIRE_RL_pciw_Prelude_inst_changeSpecialWires_1_upconv_connect1 ;
  assign pciw_fP2I$CLR = 1'b0 ;

  // submodule pciw_pci0_pcie_ep
  assign pciw_pci0_pcie_ep$cfg_byte_en_n = 4'd15 ;
  assign pciw_pci0_pcie_ep$cfg_di = 32'd0 ;
  assign pciw_pci0_pcie_ep$cfg_dsn = 64'h0000000101000A35 ;
  assign pciw_pci0_pcie_ep$cfg_dwaddr = 10'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cor_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_abort_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_timeout_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_unexpect_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_err_ecrc_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_err_locked_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_err_posted_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header = 48'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_ur_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_assert_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_di = pciw_pcie_irq_rInterruptDi ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_n = pciw_pcie_irq_rInterruptN ;
  assign pciw_pci0_pcie_ep$cfg_pm_wake_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_rd_en_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_trn_pending_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_turnoff_ok_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$cfg_wr_en_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$pci_exp_rxn = pcie_rxn_i ;
  assign pciw_pci0_pcie_ep$pci_exp_rxp = pcie_rxp_i ;
  assign pciw_pci0_pcie_ep$pl_directed_link_auton = 1'b0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_change = 2'h0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_speed = 1'b0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_width = 2'h0 ;
  assign pciw_pci0_pcie_ep$pl_upstream_prefer_deemph = 1'b0 ;
  assign pciw_pci0_pcie_ep$trn_fc_sel = 3'h0 ;
  assign pciw_pci0_pcie_ep$trn_rdst_rdy_n = !pciw_pci0_pwTrnRx$whas ;
  assign pciw_pci0_pcie_ep$trn_rnp_ok_n = 1'b0 ;
  assign pciw_pci0_pcie_ep$trn_tcfg_gnt_n = 1'd0 ;
  assign pciw_pci0_pcie_ep$trn_td =
	     pciw_pci0_pwTrnTx$whas ? pciw_fI2P$D_OUT[63:0] : 64'h0 ;
  assign pciw_pci0_pcie_ep$trn_teof_n =
	     !pciw_pci0_pwTrnTx$whas || !pciw_fI2P$D_OUT[79] ;
  assign pciw_pci0_pcie_ep$trn_terrfwd_n = 1'd1 ;
  assign pciw_pci0_pcie_ep$trn_trem_n =
	     !pciw_pci0_pwTrnTx$whas || pciw_fI2P$D_OUT[71:64] != 8'd255 ;
  assign pciw_pci0_pcie_ep$trn_tsof_n =
	     !pciw_pci0_pwTrnTx$whas || !pciw_fI2P$D_OUT[80] ;
  assign pciw_pci0_pcie_ep$trn_tsrc_dsc_n = 1'b1 ;
  assign pciw_pci0_pcie_ep$trn_tsrc_rdy_n = !pciw_pci0_pwTrnTx$whas ;
  assign pciw_pci0_pcie_ep$trn_tstr_n = 1'd1 ;

  // submodule pciw_pciDevice
  assign pciw_pciDevice$sD_IN =
	     { pciw_pci0_pcie_ep$cfg_bus_number,
	       pciw_pci0_pcie_ep$cfg_device_number,
	       pciw_pci0_pcie_ep$cfg_function_number } ;
  assign pciw_pciDevice$sEN = pciw_pciDevice$sRDY ;

  // submodule pciw_pciLinkUp
  assign pciw_pciLinkUp$sD_IN = !pciw_pci0_pcie_ep$trn_lnk_up_n ;
  assign pciw_pciLinkUp$sEN = 1'd1 ;

  // submodule pciw_pcie_irq_fifoAssert
  assign pciw_pcie_irq_fifoAssert$sD_IN = 8'h0 ;
  assign pciw_pcie_irq_fifoAssert$sENQ = 1'b0 ;
  assign pciw_pcie_irq_fifoAssert$dDEQ =
	     WILL_FIRE_RL_pciw_pcie_irq_msi_enabled_assert_interrupt ;

  // remaining internal signals
  assign pciw_p2iAF_head_wrapped_crossed__4_EQ_pciw_p2i_ETC___d123 =
	     pciw_p2iAF_head_wrapped == pciw_p2iAF_tail_wrapped &&
	     !pciw_p2iAF_sInReset_isInReset &&
	     pciw_preEdge$CLK_VAL ;
  assign val_be__h6516 = { pciw_fP2I$D_OUT[71:64], 8'd0 } ;
  assign val_data__h6517 = { pciw_fP2I$D_OUT[63:0], 64'hAAAAAAAAAAAAAAAA } ;
  assign wOut_be__h6625 =
	     { pciw_Prelude_inst_changeSpecialWires_1_rg[71:64],
	       pciw_fP2I$D_OUT[71:64] } ;
  assign wOut_data__h6626 =
	     { pciw_Prelude_inst_changeSpecialWires_1_rg[63:0],
	       pciw_fP2I$D_OUT[63:0] } ;

  // handling of inlined registers

  always@(posedge pciw_pci0_pcie_ep$trn_clk)
  begin
    if (pciw_p250rst$OUT_RST == `BSV_RESET_VALUE)
      begin
        pciw_Prelude_inst_changeSpecialWires_1_rg <= `BSV_ASSIGNMENT_DELAY
	    82'h0AAAAAAAAAAAAAAAAAAAA;
	pciw_Prelude_inst_changeSpecialWires_2_rg <= `BSV_ASSIGNMENT_DELAY
	    82'h0AAAAAAAAAAAAAAAAAAAA;
	pciw_i2pAF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pciw_p2iAF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pciw_pcie_irq_rInterruptDi <= `BSV_ASSIGNMENT_DELAY 8'd0;
	pciw_pcie_irq_rInterruptN <= `BSV_ASSIGNMENT_DELAY 1'd1;
	pciw_pcie_irq_rInterrupting <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (pciw_Prelude_inst_changeSpecialWires_1_rg$EN)
	  pciw_Prelude_inst_changeSpecialWires_1_rg <= `BSV_ASSIGNMENT_DELAY
	      pciw_Prelude_inst_changeSpecialWires_1_rg$D_IN;
	if (pciw_Prelude_inst_changeSpecialWires_2_rg$EN)
	  pciw_Prelude_inst_changeSpecialWires_2_rg <= `BSV_ASSIGNMENT_DELAY
	      pciw_Prelude_inst_changeSpecialWires_2_rg$D_IN;
	if (pciw_i2pAF_head_wrapped$EN)
	  pciw_i2pAF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      pciw_i2pAF_head_wrapped$D_IN;
	if (pciw_p2iAF_tail_wrapped$EN)
	  pciw_p2iAF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      pciw_p2iAF_tail_wrapped$D_IN;
	if (pciw_pcie_irq_rInterruptDi$EN)
	  pciw_pcie_irq_rInterruptDi <= `BSV_ASSIGNMENT_DELAY
	      pciw_pcie_irq_rInterruptDi$D_IN;
	if (pciw_pcie_irq_rInterruptN$EN)
	  pciw_pcie_irq_rInterruptN <= `BSV_ASSIGNMENT_DELAY
	      pciw_pcie_irq_rInterruptN$D_IN;
	if (pciw_pcie_irq_rInterrupting$EN)
	  pciw_pcie_irq_rInterrupting <= `BSV_ASSIGNMENT_DELAY
	      pciw_pcie_irq_rInterrupting$D_IN;
      end
    if (pciw_p2iS$EN) pciw_p2iS <= `BSV_ASSIGNMENT_DELAY pciw_p2iS$D_IN;
    if (pciw_pcie_irq_rMMEnabled$EN)
      pciw_pcie_irq_rMMEnabled <= `BSV_ASSIGNMENT_DELAY
	  pciw_pcie_irq_rMMEnabled$D_IN;
    if (pciw_pcie_irq_rMSIEnabled$EN)
      pciw_pcie_irq_rMSIEnabled <= `BSV_ASSIGNMENT_DELAY
	  pciw_pcie_irq_rMSIEnabled$D_IN;
  end

  always@(posedge pciw_pci0_pcie_ep$trn2_clk)
  begin
    if (pciw_p125rst$OUT_RST == `BSV_RESET_VALUE)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	needs_init <= `BSV_ASSIGNMENT_DELAY 1'd1;
	pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_i2pAF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pciw_p2iAF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
	if (needs_init$EN)
	  needs_init <= `BSV_ASSIGNMENT_DELAY needs_init$D_IN;
	if (pciDevice$EN) pciDevice <= `BSV_ASSIGNMENT_DELAY pciDevice$D_IN;
	if (pciw_i2pAF_tail_wrapped$EN)
	  pciw_i2pAF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      pciw_i2pAF_tail_wrapped$D_IN;
	if (pciw_p2iAF_head_wrapped$EN)
	  pciw_p2iAF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      pciw_p2iAF_head_wrapped$D_IN;
      end
    if (pciw_i2pS$EN) pciw_i2pS <= `BSV_ASSIGNMENT_DELAY pciw_i2pS$D_IN;
  end

  always@(posedge pciw_pci0_pcie_ep$trn_clk or
	  `BSV_RESET_EDGE pciw_i2pAF_dCombinedReset$RST_OUT)
  if (pciw_i2pAF_dCombinedReset$RST_OUT == `BSV_RESET_VALUE)
    begin
      pciw_i2pAF_dInReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (pciw_i2pAF_dInReset_isInReset$EN)
	pciw_i2pAF_dInReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    pciw_i2pAF_dInReset_isInReset$D_IN;
    end

  always@(posedge pciw_pci0_pcie_ep$trn_clk or
	  `BSV_RESET_EDGE pciw_p2iAF_sCombinedReset$RST_OUT)
  if (pciw_p2iAF_sCombinedReset$RST_OUT == `BSV_RESET_VALUE)
    begin
      pciw_p2iAF_sInReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (pciw_p2iAF_sInReset_isInReset$EN)
	pciw_p2iAF_sInReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    pciw_p2iAF_sInReset_isInReset$D_IN;
    end

  always@(posedge pciw_pci0_pcie_ep$trn2_clk or
	  `BSV_RESET_EDGE pciw_i2pAF_sCombinedReset$RST_OUT)
  if (pciw_i2pAF_sCombinedReset$RST_OUT == `BSV_RESET_VALUE)
    begin
      pciw_i2pAF_sInReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (pciw_i2pAF_sInReset_isInReset$EN)
	pciw_i2pAF_sInReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    pciw_i2pAF_sInReset_isInReset$D_IN;
    end

  always@(posedge pciw_pci0_pcie_ep$trn2_clk or
	  `BSV_RESET_EDGE pciw_p2iAF_dCombinedReset$RST_OUT)
  if (pciw_p2iAF_dCombinedReset$RST_OUT == `BSV_RESET_VALUE)
    begin
      pciw_p2iAF_dInReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (pciw_p2iAF_dInReset_isInReset$EN)
	pciw_p2iAF_dInReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    pciw_p2iAF_dInReset_isInReset$D_IN;
    end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    freeCnt = 32'hAAAAAAAA;
    needs_init = 1'h0;
    pciDevice = 16'hAAAA;
    pciw_Prelude_inst_changeSpecialWires_1_rg = 82'h2AAAAAAAAAAAAAAAAAAAA;
    pciw_Prelude_inst_changeSpecialWires_2_rg = 82'h2AAAAAAAAAAAAAAAAAAAA;
    pciw_i2pAF_dInReset_isInReset = 1'h0;
    pciw_i2pAF_head_wrapped = 1'h0;
    pciw_i2pAF_sInReset_isInReset = 1'h0;
    pciw_i2pAF_tail_wrapped = 1'h0;
    pciw_i2pS = 153'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    pciw_p2iAF_dInReset_isInReset = 1'h0;
    pciw_p2iAF_head_wrapped = 1'h0;
    pciw_p2iAF_sInReset_isInReset = 1'h0;
    pciw_p2iAF_tail_wrapped = 1'h0;
    pciw_p2iS = 153'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    pciw_pcie_irq_rInterruptDi = 8'hAA;
    pciw_pcie_irq_rInterruptN = 1'h0;
    pciw_pcie_irq_rInterrupting = 1'h0;
    pciw_pcie_irq_rMMEnabled = 3'h2;
    pciw_pcie_irq_rMSIEnabled = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // pci_ml605
