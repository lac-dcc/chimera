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

// PCI interface module extracted from old BSV-generated mkFTop_alst4.

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


module pci_alst4(input          sys0_clk,
		 input          sys0_rstn,
		 // PCI signals from hardware
		 input 		pcie_clk,
		 input 		pcie_rstn,
		 input  [ 3:0] 	pcie_rx,
		 output [ 3:0] 	pcie_tx,

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
);

  parameter VENDOR_ID=0;
  parameter DEVICE_ID=0;
  parameter CLASS_CODE=0;
  defparam pciw_pci0_pcie_ep.epmap.wrapper.VENDOR_ID=VENDOR_ID;
  defparam pciw_pci0_pcie_ep.epmap.wrapper.SUBSYSTEM_VENDOR_ID=VENDOR_ID;
  defparam pciw_pci0_pcie_ep.epmap.wrapper.DEVICE_ID=DEVICE_ID;
  defparam pciw_pci0_pcie_ep.epmap.wrapper.SUBSYSTEM_ID=DEVICE_ID;
  defparam pciw_pci0_pcie_ep.epmap.wrapper.CLASS_CODE=CLASS_CODE;
  // inlined wires
  wire [127 : 0] pciw_pci0_rxDws_new_data$wget, pciw_pci0_txDws_new_data$wget;
  wire [2 : 0] pciw_pci0_rxDws_delta_deq$wget,
	       pciw_pci0_rxDws_delta_enq$wget,
	       pciw_pci0_txDws_delta_deq$wget,
	       pciw_pci0_txDws_delta_enq$wget;
`ifndef orig
  wire [3:0]   rx_word_enable; // derived from the avalon byte enables
`endif
  wire [1 : 0] infLed$wget;
  wire pciw_pci0_avaTxEmpty$wget,
       pciw_pci0_avaTxEmpty$whas,
       pciw_pci0_avaTxEop$wget,
       pciw_pci0_avaTxEop$whas,
       pciw_pci0_avaTxErr$wget,
       pciw_pci0_avaTxErr$whas,
       pciw_pci0_avaTxSop$wget,
       pciw_pci0_avaTxSop$whas,
       pciw_pci0_avaTxValid$wget,
       pciw_pci0_avaTxValid$whas,
       pciw_pci0_rxDws_delta_deq$whas,
       pciw_pci0_rxDws_delta_enq$whas,
       pciw_pci0_rxDws_new_data$whas,
       pciw_pci0_rxInF_doResetClr$whas,
       pciw_pci0_rxInF_doResetDeq$whas,
       pciw_pci0_rxInF_doResetEnq$whas,
       pciw_pci0_rxInF_r_clr$whas,
       pciw_pci0_rxInF_r_deq$whas,
       pciw_pci0_rxInF_r_enq$whas,
       pciw_pci0_txDws_delta_deq$whas,
       pciw_pci0_txDws_delta_enq$whas,
       pciw_pci0_txDws_new_data$whas,
       pciw_pci0_txOutF_doResetClr$whas,
       pciw_pci0_txOutF_doResetDeq$whas,
       pciw_pci0_txOutF_doResetEnq$whas,
       pciw_pci0_txOutF_r_clr$whas,
       pciw_pci0_txOutF_r_deq$whas,
       pciw_pci0_txOutF_r_enq$whas;

  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;

`ifdef not
  // register pciDevice
  reg [15 : 0] pciDevice;
  wire [15 : 0] pciDevice$D_IN;
  wire pciDevice$EN;
`endif
  // register pciw_pci0_cfgDataWr
  reg pciw_pci0_cfgDataWr;
  wire pciw_pci0_cfgDataWr$D_IN, pciw_pci0_cfgDataWr$EN;

  // register pciw_pci0_cfgSample
  reg pciw_pci0_cfgSample;
  wire pciw_pci0_cfgSample$D_IN, pciw_pci0_cfgSample$EN;

  // register pciw_pci0_deviceReg
  reg [15 : 0] pciw_pci0_deviceReg;
  wire [15 : 0] pciw_pci0_deviceReg$D_IN;
  wire pciw_pci0_deviceReg$EN;

  // register pciw_pci0_rxDbgDeDeq
  reg [15 : 0] pciw_pci0_rxDbgDeDeq;
  wire [15 : 0] pciw_pci0_rxDbgDeDeq$D_IN;
  wire pciw_pci0_rxDbgDeDeq$EN;

  // register pciw_pci0_rxDbgDeEof
  reg [15 : 0] pciw_pci0_rxDbgDeEof;
  wire [15 : 0] pciw_pci0_rxDbgDeEof$D_IN;
  wire pciw_pci0_rxDbgDeEof$EN;

  // register pciw_pci0_rxDbgDeSof
  reg [15 : 0] pciw_pci0_rxDbgDeSof;
  wire [15 : 0] pciw_pci0_rxDbgDeSof$D_IN;
  wire pciw_pci0_rxDbgDeSof$EN;

  // register pciw_pci0_rxDbgDestage
  reg [15 : 0] pciw_pci0_rxDbgDestage;
  wire [15 : 0] pciw_pci0_rxDbgDestage$D_IN;
  wire pciw_pci0_rxDbgDestage$EN;

  // register pciw_pci0_rxDbgEnEnq
  reg [15 : 0] pciw_pci0_rxDbgEnEnq;
  wire [15 : 0] pciw_pci0_rxDbgEnEnq$D_IN;
  wire pciw_pci0_rxDbgEnEnq$EN;

  // register pciw_pci0_rxDbgEnEof
  reg [15 : 0] pciw_pci0_rxDbgEnEof;
  wire [15 : 0] pciw_pci0_rxDbgEnEof$D_IN;
  wire pciw_pci0_rxDbgEnEof$EN;

  // register pciw_pci0_rxDbgEnSof
  reg [15 : 0] pciw_pci0_rxDbgEnSof;
  wire [15 : 0] pciw_pci0_rxDbgEnSof$D_IN;
  wire pciw_pci0_rxDbgEnSof$EN;

  // register pciw_pci0_rxDbgEnstage
  reg [15 : 0] pciw_pci0_rxDbgEnstage;
  wire [15 : 0] pciw_pci0_rxDbgEnstage$D_IN;
  wire pciw_pci0_rxDbgEnstage$EN;

  // register pciw_pci0_rxDbgInstage
  reg [15 : 0] pciw_pci0_rxDbgInstage;
  wire [15 : 0] pciw_pci0_rxDbgInstage$D_IN;
  wire pciw_pci0_rxDbgInstage$EN;

  // register pciw_pci0_rxDwrDeq
  reg [10 : 0] pciw_pci0_rxDwrDeq;
  wire [10 : 0] pciw_pci0_rxDwrDeq$D_IN;
  wire pciw_pci0_rxDwrDeq$EN;

  // register pciw_pci0_rxDwrEnq
  reg [10 : 0] pciw_pci0_rxDwrEnq;
  wire [10 : 0] pciw_pci0_rxDwrEnq$D_IN;
  wire pciw_pci0_rxDwrEnq$EN;

  // register pciw_pci0_rxDws_num_empty
  reg [3 : 0] pciw_pci0_rxDws_num_empty;
  wire [3 : 0] pciw_pci0_rxDws_num_empty$D_IN;
  wire pciw_pci0_rxDws_num_empty$EN;

  // register pciw_pci0_rxDws_num_full
  reg [3 : 0] pciw_pci0_rxDws_num_full;
  wire [3 : 0] pciw_pci0_rxDws_num_full$D_IN;
  wire pciw_pci0_rxDws_num_full$EN;

  // register pciw_pci0_rxDws_vec
  reg [255 : 0] pciw_pci0_rxDws_vec;
  wire [255 : 0] pciw_pci0_rxDws_vec$D_IN;
  wire pciw_pci0_rxDws_vec$EN;

  // register pciw_pci0_rxInF_countReg
  reg [5 : 0] pciw_pci0_rxInF_countReg;
  wire [5 : 0] pciw_pci0_rxInF_countReg$D_IN;
  wire pciw_pci0_rxInF_countReg$EN;

  // register pciw_pci0_rxInF_levelsValid
  reg pciw_pci0_rxInF_levelsValid;
  wire pciw_pci0_rxInF_levelsValid$D_IN, pciw_pci0_rxInF_levelsValid$EN;

  // register pciw_pci0_rxInFlight
  reg pciw_pci0_rxInFlight;
  wire pciw_pci0_rxInFlight$D_IN, pciw_pci0_rxInFlight$EN;

  // register pciw_pci0_txDbgDeDeq
  reg [15 : 0] pciw_pci0_txDbgDeDeq;
  wire [15 : 0] pciw_pci0_txDbgDeDeq$D_IN;
  wire pciw_pci0_txDbgDeDeq$EN;

  // register pciw_pci0_txDbgDeEof
  reg [15 : 0] pciw_pci0_txDbgDeEof;
  wire [15 : 0] pciw_pci0_txDbgDeEof$D_IN;
  wire pciw_pci0_txDbgDeEof$EN;

  // register pciw_pci0_txDbgDeSof
  reg [15 : 0] pciw_pci0_txDbgDeSof;
  wire [15 : 0] pciw_pci0_txDbgDeSof$D_IN;
  wire pciw_pci0_txDbgDeSof$EN;

  // register pciw_pci0_txDbgDestage
  reg [15 : 0] pciw_pci0_txDbgDestage;
  wire [15 : 0] pciw_pci0_txDbgDestage$D_IN;
  wire pciw_pci0_txDbgDestage$EN;

  // register pciw_pci0_txDbgEnEnq
  reg [15 : 0] pciw_pci0_txDbgEnEnq;
  wire [15 : 0] pciw_pci0_txDbgEnEnq$D_IN;
  wire pciw_pci0_txDbgEnEnq$EN;

  // register pciw_pci0_txDbgEnEof
  reg [15 : 0] pciw_pci0_txDbgEnEof;
  wire [15 : 0] pciw_pci0_txDbgEnEof$D_IN;
  wire pciw_pci0_txDbgEnEof$EN;

  // register pciw_pci0_txDbgEnSof
  reg [15 : 0] pciw_pci0_txDbgEnSof;
  wire [15 : 0] pciw_pci0_txDbgEnSof$D_IN;
  wire pciw_pci0_txDbgEnSof$EN;

  // register pciw_pci0_txDbgEnstage
  reg [15 : 0] pciw_pci0_txDbgEnstage;
  wire [15 : 0] pciw_pci0_txDbgEnstage$D_IN;
  wire pciw_pci0_txDbgEnstage$EN;

  // register pciw_pci0_txDbgExstage
  reg [15 : 0] pciw_pci0_txDbgExstage;
  wire [15 : 0] pciw_pci0_txDbgExstage$D_IN;
  wire pciw_pci0_txDbgExstage$EN;

  // register pciw_pci0_txDwrDeq
  reg [10 : 0] pciw_pci0_txDwrDeq;
  wire [10 : 0] pciw_pci0_txDwrDeq$D_IN;
  wire pciw_pci0_txDwrDeq$EN;

  // register pciw_pci0_txDwrEnq
  reg [10 : 0] pciw_pci0_txDwrEnq;
  wire [10 : 0] pciw_pci0_txDwrEnq$D_IN;
  wire pciw_pci0_txDwrEnq$EN;

  // register pciw_pci0_txDws_num_empty
  reg [3 : 0] pciw_pci0_txDws_num_empty;
  wire [3 : 0] pciw_pci0_txDws_num_empty$D_IN;
  wire pciw_pci0_txDws_num_empty$EN;

  // register pciw_pci0_txDws_num_full
  reg [3 : 0] pciw_pci0_txDws_num_full;
  wire [3 : 0] pciw_pci0_txDws_num_full$D_IN;
  wire pciw_pci0_txDws_num_full$EN;

  // register pciw_pci0_txDws_vec
  reg [255 : 0] pciw_pci0_txDws_vec;
  wire [255 : 0] pciw_pci0_txDws_vec$D_IN;
  wire pciw_pci0_txDws_vec$EN;

  // register pciw_pci0_txInFlight
  reg pciw_pci0_txInFlight;
  wire pciw_pci0_txInFlight$D_IN, pciw_pci0_txInFlight$EN;

  // register pciw_pci0_txOutF_countReg
  reg [9 : 0] pciw_pci0_txOutF_countReg;
  wire [9 : 0] pciw_pci0_txOutF_countReg$D_IN;
  wire pciw_pci0_txOutF_countReg$EN;

  // register pciw_pci0_txOutF_levelsValid
  reg pciw_pci0_txOutF_levelsValid;
  wire pciw_pci0_txOutF_levelsValid$D_IN, pciw_pci0_txOutF_levelsValid$EN;

  // register pciw_pci0_txReadyD
  reg pciw_pci0_txReadyD;
  wire pciw_pci0_txReadyD$D_IN, pciw_pci0_txReadyD$EN;

  // register pciw_pciDevice
  reg [15 : 0] pciw_pciDevice;
  wire [15 : 0] pciw_pciDevice$D_IN;
  wire pciw_pciDevice$EN;

  // ports of submodule pciw_aliveLed_sb
  wire pciw_aliveLed_sb$dD_OUT, pciw_aliveLed_sb$sD_IN, pciw_aliveLed_sb$sEN;

  // ports of submodule pciw_i2pF
  wire [152 : 0] pciw_i2pF$D_IN, pciw_i2pF$D_OUT;
  wire pciw_i2pF$CLR,
       pciw_i2pF$DEQ,
       pciw_i2pF$EMPTY_N,
       pciw_i2pF$ENQ,
       pciw_i2pF$FULL_N;

  // ports of submodule pciw_linkLed_sb
  wire pciw_linkLed_sb$dD_OUT, pciw_linkLed_sb$sD_IN, pciw_linkLed_sb$sEN;

  // ports of submodule pciw_p2iF
  wire [152 : 0] pciw_p2iF$D_IN, pciw_p2iF$D_OUT;
  wire pciw_p2iF$CLR,
       pciw_p2iF$DEQ,
       pciw_p2iF$EMPTY_N,
       pciw_p2iF$ENQ,
       pciw_p2iF$FULL_N;

  // ports of submodule pciw_pci0_pcie_ep
  wire [127 : 0] pciw_pci0_pcie_ep$rx_st_data0, pciw_pci0_pcie_ep$tx_st_data0;
  wire [31 : 0] pciw_pci0_pcie_ep$ava_debug, pciw_pci0_pcie_ep$tl_cfg_ctl;
  wire [15 : 0] pciw_pci0_pcie_ep$rx_st_be0;
  wire [7 : 0] pciw_pci0_pcie_ep$rx_st_bardec0;
  wire [3 : 0] pciw_pci0_pcie_ep$pcie_rx_in,
	       pciw_pci0_pcie_ep$pcie_tx_out,
	       pciw_pci0_pcie_ep$tl_cfg_add;
  wire pciw_pci0_pcie_ep$ava_alive,
       pciw_pci0_pcie_ep$ava_core_clk_out,
       pciw_pci0_pcie_ep$ava_lnk_up,
       pciw_pci0_pcie_ep$ava_srstn,
       pciw_pci0_pcie_ep$rx_st_empty0,
       pciw_pci0_pcie_ep$rx_st_eop0,
       pciw_pci0_pcie_ep$rx_st_mask0,
       pciw_pci0_pcie_ep$rx_st_ready0,
       pciw_pci0_pcie_ep$rx_st_sop0,
       pciw_pci0_pcie_ep$rx_st_valid0,
       pciw_pci0_pcie_ep$tl_cfg_ctl_wr,
       pciw_pci0_pcie_ep$tx_st_empty0,
       pciw_pci0_pcie_ep$tx_st_eop0,
       pciw_pci0_pcie_ep$tx_st_err0,
       pciw_pci0_pcie_ep$tx_st_ready0,
       pciw_pci0_pcie_ep$tx_st_sop0,
       pciw_pci0_pcie_ep$tx_st_valid0;

  // ports of submodule pciw_pci0_rxEofF
  wire [2 : 0] pciw_pci0_rxEofF$D_IN;
  wire pciw_pci0_rxEofF$CLR,
       pciw_pci0_rxEofF$DEQ,
       pciw_pci0_rxEofF$EMPTY_N,
       pciw_pci0_rxEofF$ENQ,
       pciw_pci0_rxEofF$FULL_N;

  // ports of submodule pciw_pci0_rxHeadF
  wire [30 : 0] pciw_pci0_rxHeadF$D_IN, pciw_pci0_rxHeadF$D_OUT;
  wire pciw_pci0_rxHeadF$CLR,
       pciw_pci0_rxHeadF$DEQ,
       pciw_pci0_rxHeadF$EMPTY_N,
       pciw_pci0_rxHeadF$ENQ,
       pciw_pci0_rxHeadF$FULL_N;

  // ports of submodule pciw_pci0_rxInF
  wire [154 : 0] pciw_pci0_rxInF$D_IN, pciw_pci0_rxInF$D_OUT;
  wire pciw_pci0_rxInF$CLR,
       pciw_pci0_rxInF$DEQ,
       pciw_pci0_rxInF$EMPTY_N,
       pciw_pci0_rxInF$ENQ,
       pciw_pci0_rxInF$FULL_N;

  // ports of submodule pciw_pci0_rxOutF
  wire [152 : 0] pciw_pci0_rxOutF$D_IN, pciw_pci0_rxOutF$D_OUT;
  wire pciw_pci0_rxOutF$CLR,
       pciw_pci0_rxOutF$DEQ,
       pciw_pci0_rxOutF$EMPTY_N,
       pciw_pci0_rxOutF$ENQ,
       pciw_pci0_rxOutF$FULL_N;

  // ports of submodule pciw_pci0_txEofF
  wire [2 : 0] pciw_pci0_txEofF$D_IN;
  wire pciw_pci0_txEofF$CLR,
       pciw_pci0_txEofF$DEQ,
       pciw_pci0_txEofF$EMPTY_N,
       pciw_pci0_txEofF$ENQ,
       pciw_pci0_txEofF$FULL_N;

  // ports of submodule pciw_pci0_txExF
  wire pciw_pci0_txExF$CLR,
       pciw_pci0_txExF$DEQ,
       pciw_pci0_txExF$D_IN,
       pciw_pci0_txExF$EMPTY_N,
       pciw_pci0_txExF$ENQ,
       pciw_pci0_txExF$FULL_N;

  // ports of submodule pciw_pci0_txHeadF
  wire [30 : 0] pciw_pci0_txHeadF$D_IN, pciw_pci0_txHeadF$D_OUT;
  wire pciw_pci0_txHeadF$CLR,
       pciw_pci0_txHeadF$DEQ,
       pciw_pci0_txHeadF$EMPTY_N,
       pciw_pci0_txHeadF$ENQ,
       pciw_pci0_txHeadF$FULL_N;

  // ports of submodule pciw_pci0_txInF
  wire [152 : 0] pciw_pci0_txInF$D_IN, pciw_pci0_txInF$D_OUT;
  wire pciw_pci0_txInF$CLR,
       pciw_pci0_txInF$DEQ,
       pciw_pci0_txInF$EMPTY_N,
       pciw_pci0_txInF$ENQ,
       pciw_pci0_txInF$FULL_N;

  // ports of submodule pciw_pci0_txOutF
  wire [154 : 0] pciw_pci0_txOutF$D_IN, pciw_pci0_txOutF$D_OUT;
  wire pciw_pci0_txOutF$CLR,
       pciw_pci0_txOutF$DEQ,
       pciw_pci0_txOutF$EMPTY_N,
       pciw_pci0_txOutF$ENQ,
       pciw_pci0_txOutF$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_pciw_pci0_rxInF_reset,
       WILL_FIRE_RL_pciw_pci0_rx_destage,
       WILL_FIRE_RL_pciw_pci0_rx_enstage,
       WILL_FIRE_RL_pciw_pci0_txOutF_reset,
       WILL_FIRE_RL_pciw_pci0_tx_destage,
       WILL_FIRE_RL_pciw_pci0_tx_enstage,
       WILL_FIRE_RL_pciw_pci0_tx_exstage;

  // inputs to muxes for submodule ports
  wire MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3;

  // remaining internal signals
  reg [15 : 0] IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787;
  wire [255 : 0] _0_CONCAT_pciw_pci0_rxDws_new_data_wget__2_BITS_ETC___d832,
		 _0_CONCAT_pciw_pci0_txDws_new_data_wget__8_BITS_ETC___d833,
		 pciw_pci0_rxDws_vec_3_SRL_IF_pciw_pci0_rxDws_d_ETC___d834,
		 pciw_pci0_txDws_vec_9_SRL_IF_pciw_pci0_txDws_d_ETC___d835;
  wire [127 : 0] x__h14478, x__h4523, x_data__h27615, x_data__h46011;
  wire [95 : 0] IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d481;
  wire [31 : 0] IF_pciw_pci0_txHeadF_first__59_BIT_11_60_THEN__ETC___d468,
		IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d492,
		pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831,
		x__h56415,
		x__h56417,
		x__h56419,
		x__h56421,
		x__h56423,
		x__h56425,
		x__h56427,
		x__h56429,
		x__h56431,
		x__h56433,
		x__h56435,
		x__h56437,
		x__h56439,
		x__h56441,
		x__h56443,
		x__h56445,
		x__h56447,
		x__h56449,
		x__h56451,
		y__h56416,
		y__h56418,
		y__h56420,
		y__h56422,
		y__h56424,
		y__h56426,
		y__h56428,
		y__h56430,
		y__h56432,
		y__h56434,
		y__h56436,
		y__h56438,
		y__h56440,
		y__h56442,
		y__h56444,
		y__h56446,
		y__h56448,
		y__h56450,
		y__h56452,
		y__h56454;
  wire [15 : 0] x_be__h27614;
  wire [10 : 0] IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1,
		IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2,
		IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_IF_p_ETC___d837,
		IF_pciw_pci0_rxEofF_notEmpty__62_AND_pciw_pci0_ETC___d288,
		IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_rxDw_ETC___d769,
		IF_pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_ETC___d523,
		IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d838;
  wire [8 : 0] x__h15731, x__h5776;
  wire [7 : 0] INV_swReg_35_BIT_0_36_XOR_swReg_35_BIT_1_37_38_ETC___d764,
	       bar___1__h22106,
	       x__h18832,
	       x__h8877,
	       x_hit__h22096;
  wire [2 : 0] IF_pciw_pci0_rxDws_delta_deq_whas__3_THEN_pciw_ETC___d801,
	       IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771,
	       IF_pciw_pci0_txDws_delta_deq_whas__9_THEN_pciw_ETC___d804,
	       IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770;
  wire NOT_pciw_pci0_txEofF_notEmpty__52_53_OR_NOT_pc_ETC___d495,
       pciw_pci0_rxDws_num_full_7_ULE_4___d836,
       pciw_pci0_txDws_num_full_3_ULE_4___d774,
       pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817,
       pciw_pci0_txOutF_i_notFull__48_AND_pciw_pci0_t_ETC___d502,
       swParity__h48492,
       z__h55844,
       z__h55851,
       z__h55858,
       z__h55865,
       z__h55872,
       z__h55879,
       z__h56129,
       z__h56136,
       z__h56143,
       z__h56150,
       z__h56157,
       z__h56164,
       z__h56171,
       z__h56178,
       z__h56185,
       z__h56192,
       z__h56199,
       z__h56206,
       z__h56213,
       z__h56220,
       z__h56227,
       z__h56234,
       z__h56241,
       z__h56248,
       z__h56255,
       z__h56262,
       z__h56269,
       z__h56276,
       z__h56283,
       z__h56290,
       z__h56297,
       z__h56304,
       z__h56311,
       z__h56318,
       z__h56325,
       z__h56332;

`ifndef orig
  wire rx_destage_eof; // the (fixed) eof variable in the rx_destage rule
`endif
  // oscillator and gates for output clock p125clk
  assign p125clk = pciw_pci0_pcie_ep$ava_core_clk_out ;
//  assign CLK_GATE_p125clk = 1'b1 ;

  // output resets
  assign p125rstn = pciw_pci0_pcie_ep$ava_srstn ;

  // value method pcie_tx
  assign pcie_tx = pciw_pci0_pcie_ep$pcie_tx_out ;

`ifdef not
  assign ctop$server_request_put = pciw_p2iF$D_OUT ;
  assign ctop$cpServer_request_put = 59'h0 ;
`else
  assign unoc_out_data = pciw_p2iF$D_OUT;
`endif  



//

  // submodule pciw_aliveLed_sb
  SyncBit #(.init(1'd0)) pciw_aliveLed_sb(.sCLK(sys0_clk),
					  .dCLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					  .sRST(sys0_rstn),
					  .sD_IN(pciw_aliveLed_sb$sD_IN),
					  .sEN(pciw_aliveLed_sb$sEN),
					  .dD_OUT(pciw_aliveLed_sb$dD_OUT));

  // submodule pciw_i2pF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_i2pF(.RST(pciw_pci0_pcie_ep$ava_srstn),
				     .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
				     .D_IN(pciw_i2pF$D_IN),
				     .ENQ(pciw_i2pF$ENQ),
				     .DEQ(pciw_i2pF$DEQ),
				     .CLR(pciw_i2pF$CLR),
				     .D_OUT(pciw_i2pF$D_OUT),
				     .FULL_N(pciw_i2pF$FULL_N),
				     .EMPTY_N(pciw_i2pF$EMPTY_N));

  // submodule pciw_linkLed_sb
  SyncBit #(.init(1'd0)) pciw_linkLed_sb(.sCLK(sys0_clk),
					 .dCLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					 .sRST(sys0_rstn),
					 .sD_IN(pciw_linkLed_sb$sD_IN),
					 .sEN(pciw_linkLed_sb$sEN),
					 .dD_OUT(pciw_linkLed_sb$dD_OUT));

  // submodule pciw_p2iF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_p2iF(.RST(pciw_pci0_pcie_ep$ava_srstn),
				     .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
				     .D_IN(pciw_p2iF$D_IN),
				     .ENQ(pciw_p2iF$ENQ),
				     .DEQ(pciw_p2iF$DEQ),
				     .CLR(pciw_p2iF$CLR),
				     .D_OUT(pciw_p2iF$D_OUT),
				     .FULL_N(pciw_p2iF$FULL_N),
				     .EMPTY_N(pciw_p2iF$EMPTY_N));

  // submodule pciw_pci0_pcie_ep
  pcie_hip_s4gx_gen2_x4_128_wrapper pciw_pci0_pcie_ep(.sys0_clk(sys0_clk),
						      .sys0_rstn(sys0_rstn),
						      .pcie_clk(pcie_clk),
						      .pcie_rstn(pcie_rstn),
						      .pcie_rx_in(pciw_pci0_pcie_ep$pcie_rx_in),
						      .rx_st_mask0(pciw_pci0_pcie_ep$rx_st_mask0),
						      .rx_st_ready0(pciw_pci0_pcie_ep$rx_st_ready0),
						      .tx_st_data0(pciw_pci0_pcie_ep$tx_st_data0),
						      .tx_st_empty0(pciw_pci0_pcie_ep$tx_st_empty0),
						      .tx_st_eop0(pciw_pci0_pcie_ep$tx_st_eop0),
						      .tx_st_err0(pciw_pci0_pcie_ep$tx_st_err0),
						      .tx_st_sop0(pciw_pci0_pcie_ep$tx_st_sop0),
						      .tx_st_valid0(pciw_pci0_pcie_ep$tx_st_valid0),
						      .tl_cfg_add(pciw_pci0_pcie_ep$tl_cfg_add),
						      .tl_cfg_ctl(pciw_pci0_pcie_ep$tl_cfg_ctl),
						      .tl_cfg_ctl_wr(pciw_pci0_pcie_ep$tl_cfg_ctl_wr),
						      .tl_cfg_sts(),
						      .tl_cfg_sts_wr(),
						      .pcie_tx_out(pciw_pci0_pcie_ep$pcie_tx_out),
						      .ava_alive(pciw_pci0_pcie_ep$ava_alive),
						      .ava_lnk_up(pciw_pci0_pcie_ep$ava_lnk_up),
						      .ava_debug(pciw_pci0_pcie_ep$ava_debug),
						      .rx_st_valid0(pciw_pci0_pcie_ep$rx_st_valid0),
						      .rx_st_bardec0(pciw_pci0_pcie_ep$rx_st_bardec0),
						      .rx_st_be0(pciw_pci0_pcie_ep$rx_st_be0),
						      .rx_st_data0(pciw_pci0_pcie_ep$rx_st_data0),
						      .rx_st_sop0(pciw_pci0_pcie_ep$rx_st_sop0),
						      .rx_st_eop0(pciw_pci0_pcie_ep$rx_st_eop0),
						      .rx_st_empty0(pciw_pci0_pcie_ep$rx_st_empty0),
						      .rx_st_err0(),
						      .tx_st_ready0(pciw_pci0_pcie_ep$tx_st_ready0),
						      .tx_cred0(),
						      .tx_fifo_empty0(),
						      .ava_core_clk_out(pciw_pci0_pcie_ep$ava_core_clk_out),
						      .ava_srstn(pciw_pci0_pcie_ep$ava_srstn));

  // submodule pciw_pci0_rxEofF
  FIFO2 #(.width(32'd3),
	  .guarded(32'd1)) pciw_pci0_rxEofF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					    .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					    .D_IN(pciw_pci0_rxEofF$D_IN),
					    .ENQ(pciw_pci0_rxEofF$ENQ),
					    .DEQ(pciw_pci0_rxEofF$DEQ),
					    .CLR(pciw_pci0_rxEofF$CLR),
					    .D_OUT(),
					    .FULL_N(pciw_pci0_rxEofF$FULL_N),
					    .EMPTY_N(pciw_pci0_rxEofF$EMPTY_N));

  // submodule pciw_pci0_rxHeadF
  FIFO2 #(.width(32'd31),
	  .guarded(32'd1)) pciw_pci0_rxHeadF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					     .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					     .D_IN(pciw_pci0_rxHeadF$D_IN),
					     .ENQ(pciw_pci0_rxHeadF$ENQ),
					     .DEQ(pciw_pci0_rxHeadF$DEQ),
					     .CLR(pciw_pci0_rxHeadF$CLR),
					     .D_OUT(pciw_pci0_rxHeadF$D_OUT),
					     .FULL_N(pciw_pci0_rxHeadF$FULL_N),
					     .EMPTY_N(pciw_pci0_rxHeadF$EMPTY_N));

  // submodule pciw_pci0_rxInF
  SizedFIFO #(.p1width(32'd155),
	      .p2depth(32'd32),
	      .p3cntr_width(32'd5),
	      .guarded(32'd1)) pciw_pci0_rxInF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					       .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					       .D_IN(pciw_pci0_rxInF$D_IN),
					       .ENQ(pciw_pci0_rxInF$ENQ),
					       .DEQ(pciw_pci0_rxInF$DEQ),
					       .CLR(pciw_pci0_rxInF$CLR),
					       .D_OUT(pciw_pci0_rxInF$D_OUT),
					       .FULL_N(pciw_pci0_rxInF$FULL_N),
					       .EMPTY_N(pciw_pci0_rxInF$EMPTY_N));

  // submodule pciw_pci0_rxOutF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_rxOutF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					    .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					    .D_IN(pciw_pci0_rxOutF$D_IN),
					    .ENQ(pciw_pci0_rxOutF$ENQ),
					    .DEQ(pciw_pci0_rxOutF$DEQ),
					    .CLR(pciw_pci0_rxOutF$CLR),
					    .D_OUT(pciw_pci0_rxOutF$D_OUT),
					    .FULL_N(pciw_pci0_rxOutF$FULL_N),
					    .EMPTY_N(pciw_pci0_rxOutF$EMPTY_N));

  // submodule pciw_pci0_txEofF
  FIFO2 #(.width(32'd3),
	  .guarded(32'd1)) pciw_pci0_txEofF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					    .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					    .D_IN(pciw_pci0_txEofF$D_IN),
					    .ENQ(pciw_pci0_txEofF$ENQ),
					    .DEQ(pciw_pci0_txEofF$DEQ),
					    .CLR(pciw_pci0_txEofF$CLR),
					    .D_OUT(),
					    .FULL_N(pciw_pci0_txEofF$FULL_N),
					    .EMPTY_N(pciw_pci0_txEofF$EMPTY_N));

  // submodule pciw_pci0_txExF
  FIFO2 #(.width(32'd1),
	  .guarded(32'd1)) pciw_pci0_txExF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					   .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					   .D_IN(pciw_pci0_txExF$D_IN),
					   .ENQ(pciw_pci0_txExF$ENQ),
					   .DEQ(pciw_pci0_txExF$DEQ),
					   .CLR(pciw_pci0_txExF$CLR),
					   .D_OUT(),
					   .FULL_N(pciw_pci0_txExF$FULL_N),
					   .EMPTY_N(pciw_pci0_txExF$EMPTY_N));

  // submodule pciw_pci0_txHeadF
  FIFO2 #(.width(32'd31),
	  .guarded(32'd1)) pciw_pci0_txHeadF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					     .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					     .D_IN(pciw_pci0_txHeadF$D_IN),
					     .ENQ(pciw_pci0_txHeadF$ENQ),
					     .DEQ(pciw_pci0_txHeadF$DEQ),
					     .CLR(pciw_pci0_txHeadF$CLR),
					     .D_OUT(pciw_pci0_txHeadF$D_OUT),
					     .FULL_N(pciw_pci0_txHeadF$FULL_N),
					     .EMPTY_N(pciw_pci0_txHeadF$EMPTY_N));

  // submodule pciw_pci0_txInF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_txInF(.RST(pciw_pci0_pcie_ep$ava_srstn),
					   .CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
					   .D_IN(pciw_pci0_txInF$D_IN),
					   .ENQ(pciw_pci0_txInF$ENQ),
					   .DEQ(pciw_pci0_txInF$DEQ),
					   .CLR(pciw_pci0_txInF$CLR),
					   .D_OUT(pciw_pci0_txInF$D_OUT),
					   .FULL_N(pciw_pci0_txInF$FULL_N),
					   .EMPTY_N(pciw_pci0_txInF$EMPTY_N));

  // submodule pciw_pci0_txOutF
  SizedFIFO #(.p1width(32'd155),
	      .p2depth(32'd515),
	      .p3cntr_width(32'd10),
	      .guarded(32'd1)) pciw_pci0_txOutF(.RST(pciw_pci0_pcie_ep$ava_srstn),
						.CLK(pciw_pci0_pcie_ep$ava_core_clk_out),
						.D_IN(pciw_pci0_txOutF$D_IN),
						.ENQ(pciw_pci0_txOutF$ENQ),
						.DEQ(pciw_pci0_txOutF$DEQ),
						.CLR(pciw_pci0_txOutF$CLR),
						.D_OUT(pciw_pci0_txOutF$D_OUT),
						.FULL_N(pciw_pci0_txOutF$FULL_N),
						.EMPTY_N(pciw_pci0_txOutF$EMPTY_N));


  // rule RL_pciw_pci0_rx_destage
  assign WILL_FIRE_RL_pciw_pci0_rx_destage =
	     pciw_pci0_rxDws_num_full != 4'd0 && pciw_pci0_rxHeadF$EMPTY_N &&
	     pciw_pci0_rxOutF$FULL_N &&
	     (pciw_pci0_rxDws_num_full >= 4'd4 || pciw_pci0_rxEofF$EMPTY_N) ;

  // rule RL_pciw_pci0_rx_enstage
  assign WILL_FIRE_RL_pciw_pci0_rx_enstage =
	     pciw_pci0_rxInF$EMPTY_N &&
	     (!pciw_pci0_rxInF$D_OUT[153] || pciw_pci0_rxHeadF$FULL_N) &&
	     (!pciw_pci0_rxInF$D_OUT[152] || pciw_pci0_rxEofF$FULL_N) &&
	     pciw_pci0_rxDws_num_empty >= 4'd4 ;

  // rule RL_pciw_pci0_tx_exstage
  assign WILL_FIRE_RL_pciw_pci0_tx_exstage =
	     pciw_pci0_txOutF$EMPTY_N && pciw_pci0_txReadyD &&
	     pciw_pci0_txExF$EMPTY_N ;

  // rule RL_pciw_pci0_tx_destage
  assign WILL_FIRE_RL_pciw_pci0_tx_destage =
	     pciw_pci0_txDws_num_full != 4'd0 &&
	     pciw_pci0_txOutF_i_notFull__48_AND_pciw_pci0_t_ETC___d502 &&
	     (pciw_pci0_txDws_num_full >= 4'd4 || pciw_pci0_txEofF$EMPTY_N) ;

  // rule RL_pciw_pci0_tx_enstage
  assign WILL_FIRE_RL_pciw_pci0_tx_enstage =
	     pciw_pci0_txInF$EMPTY_N &&
	     (!pciw_pci0_txInF$D_OUT[152] || pciw_pci0_txHeadF$FULL_N) &&
	     (!pciw_pci0_txInF$D_OUT[151] || pciw_pci0_txEofF$FULL_N) &&
`ifdef orig
	     pciw_pci0_txDws_num_empty >= 4'd4 ;
`else // change on 11-12-2013
      // This ensures we will not put in an SOF unless the DWS is EMPTY
      // This will prevent the DWS from ever having multiple messages in it.
      // This is not the best fix, but it is what we can do for now (BSV)
      // The right fix is to insert the word count into the EOF fifo that is parallel to the DWS
	     pciw_pci0_txDws_num_empty >= 4'd4 && // txDws.space_available >= 4
            (!pciw_pci0_txInF$D_OUT[152] || // !sof
	     pciw_pci0_txDws_num_full == 4'd0);
`endif

  // rule RL_pciw_pci0_rxInF_reset
  assign WILL_FIRE_RL_pciw_pci0_rxInF_reset =
	     MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 ||
	     WILL_FIRE_RL_pciw_pci0_rx_enstage ;

  // rule RL_pciw_pci0_txOutF_reset
  assign WILL_FIRE_RL_pciw_pci0_txOutF_reset =
	     WILL_FIRE_RL_pciw_pci0_tx_destage ||
	     WILL_FIRE_RL_pciw_pci0_tx_exstage ;

  // inputs to muxes for submodule ports
  assign MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 =
	     pciw_pci0_rxInF$FULL_N && pciw_pci0_pcie_ep$rx_st_valid0 ;

  // inlined wires
  assign pciw_pci0_avaTxValid$wget = 1'd1 ;
  assign pciw_pci0_avaTxValid$whas = WILL_FIRE_RL_pciw_pci0_tx_exstage ;
  assign pciw_pci0_avaTxErr$wget = 1'b0 ;
  assign pciw_pci0_avaTxErr$whas = 1'b0 ;
  assign pciw_pci0_avaTxSop$wget = pciw_pci0_txOutF$D_OUT[153] ;
  assign pciw_pci0_avaTxSop$whas = WILL_FIRE_RL_pciw_pci0_tx_exstage ;
  assign pciw_pci0_avaTxEop$wget = pciw_pci0_txOutF$D_OUT[152] ;
  assign pciw_pci0_avaTxEop$whas = WILL_FIRE_RL_pciw_pci0_tx_exstage ;
  assign pciw_pci0_avaTxEmpty$wget = pciw_pci0_txOutF$D_OUT[154] ;
  assign pciw_pci0_avaTxEmpty$whas = WILL_FIRE_RL_pciw_pci0_tx_exstage ;
`ifdef orig
  assign pciw_pci0_rxDws_delta_enq$wget =
	     (pciw_pci0_rxInF$D_OUT[153] && !pciw_pci0_rxInF$D_OUT[30] &&
	      !pciw_pci0_rxInF$D_OUT[29]) ?
	       3'd3 :
	       ((pciw_pci0_rxInF$D_OUT[153] &&
		 (pciw_pci0_rxInF$D_OUT[29] ||
		  pciw_pci0_rxInF$D_OUT[30] && pciw_pci0_rxInF$D_OUT[66])) ?
		  3'd4 :
		  ((pciw_pci0_rxInF$D_OUT[153] && pciw_pci0_rxInF$D_OUT[30] &&
		    !pciw_pci0_rxInF$D_OUT[29] &&
		    !pciw_pci0_rxInF$D_OUT[66]) ?
		     3'd3 :
		     ((!pciw_pci0_rxInF$D_OUT[153] &&
		       !pciw_pci0_rxInF$D_OUT[154] &&
		       pciw_pci0_rxInF$D_OUT[143:128] == 16'hFFFF) ?
			3'd4 :
			((!pciw_pci0_rxInF$D_OUT[153] &&
			  !pciw_pci0_rxInF$D_OUT[154] &&
			  pciw_pci0_rxInF$D_OUT[143:128] == 16'h0FFF) ?
			   3'd3 :
			   ((!pciw_pci0_rxInF$D_OUT[153] &&
			     pciw_pci0_rxInF$D_OUT[154] &&
			     pciw_pci0_rxInF$D_OUT[143:136] == 8'hFF) ?
			      3'd2 :
			      ((!pciw_pci0_rxInF$D_OUT[153] &&
				pciw_pci0_rxInF$D_OUT[154] &&
				pciw_pci0_rxInF$D_OUT[143:136] == 8'h0F) ?
				 3'd1 :
				 3'd0)))))) ;
`else // !`ifdef orig
  // derive word enables from byte enables
  // this fixes the bug when writing sub-32-bit entities
  assign rx_word_enable = {
			pciw_pci0_rxInF$D_OUT[143:140] == 4'h0 ? 1'b0 : 1'b1,
			pciw_pci0_rxInF$D_OUT[139:136] == 4'h0 ? 1'b0 : 1'b1,
			pciw_pci0_rxInF$D_OUT[135:132] == 4'h0 ? 1'b0 : 1'b1,
			pciw_pci0_rxInF$D_OUT[131:128] == 4'h0 ? 1'b0 : 1'b1
			};
  
  assign pciw_pci0_rxDws_delta_enq$wget =
	     (pciw_pci0_rxInF$D_OUT[153] && !pciw_pci0_rxInF$D_OUT[30] &&
	      !pciw_pci0_rxInF$D_OUT[29]) ?
	       3'd3 :
	       ((pciw_pci0_rxInF$D_OUT[153] &&
		 (pciw_pci0_rxInF$D_OUT[29] ||
		  pciw_pci0_rxInF$D_OUT[30] && pciw_pci0_rxInF$D_OUT[66])) ?
		  3'd4 :
		  ((pciw_pci0_rxInF$D_OUT[153] && pciw_pci0_rxInF$D_OUT[30] &&
		    !pciw_pci0_rxInF$D_OUT[29] &&
		    !pciw_pci0_rxInF$D_OUT[66]) ?
		     3'd3 :
		     ((!pciw_pci0_rxInF$D_OUT[153] &&
		       !pciw_pci0_rxInF$D_OUT[154] &&
		       rx_word_enable == 4'b1111) ?
//		       pciw_pci0_rxInF$D_OUT[143:128] == 16'hFFFF) ?
			3'd4 :
			((!pciw_pci0_rxInF$D_OUT[153] &&
			  !pciw_pci0_rxInF$D_OUT[154] &&
		          rx_word_enable == 4'b0111) ?
//			  pciw_pci0_rxInF$D_OUT[143:128] == 16'h0FFF) ?
			   3'd3 :
			   ((!pciw_pci0_rxInF$D_OUT[153] &&
			     pciw_pci0_rxInF$D_OUT[154] &&
		             rx_word_enable[3:2] == 2'b11) ?
//			     pciw_pci0_rxInF$D_OUT[143:136] == 8'hFF) ?
			      3'd2 :
			      ((!pciw_pci0_rxInF$D_OUT[153] &&
				pciw_pci0_rxInF$D_OUT[154] &&
		                rx_word_enable[3:2] == 2'b01) ?
//				pciw_pci0_rxInF$D_OUT[143:136] == 8'h0F) ?
				 3'd1 :
				 3'd0)))))) ;
`endif
  assign pciw_pci0_rxDws_delta_enq$whas = WILL_FIRE_RL_pciw_pci0_rx_enstage ;
  assign pciw_pci0_rxDws_delta_deq$wget =
	     IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2[2:0] ;
  assign pciw_pci0_rxDws_delta_deq$whas = WILL_FIRE_RL_pciw_pci0_rx_destage ;
  assign pciw_pci0_rxDws_new_data$wget =
	     pciw_pci0_rxInF$D_OUT[153] ?
	       { pciw_pci0_rxInF$D_OUT[29] ?
		   { pciw_pci0_rxInF$D_OUT[103:96],
		     pciw_pci0_rxInF$D_OUT[111:104],
		     pciw_pci0_rxInF$D_OUT[119:112],
		     pciw_pci0_rxInF$D_OUT[127:120] } :
		   pciw_pci0_rxInF$D_OUT[127:96],
		 pciw_pci0_rxInF$D_OUT[71:64],
		 pciw_pci0_rxInF$D_OUT[79:72],
		 pciw_pci0_rxInF$D_OUT[87:80],
		 pciw_pci0_rxInF$D_OUT[95:88],
		 pciw_pci0_rxInF$D_OUT[39:32],
		 pciw_pci0_rxInF$D_OUT[47:40],
		 pciw_pci0_rxInF$D_OUT[55:48],
		 pciw_pci0_rxInF$D_OUT[63:56],
		 pciw_pci0_rxInF$D_OUT[7:0],
		 pciw_pci0_rxInF$D_OUT[15:8],
		 pciw_pci0_rxInF$D_OUT[23:16],
		 pciw_pci0_rxInF$D_OUT[31:24] } :
	       pciw_pci0_rxInF$D_OUT[127:0] ;
  assign pciw_pci0_rxDws_new_data$whas = WILL_FIRE_RL_pciw_pci0_rx_enstage ;
  assign pciw_pci0_txDws_delta_enq$wget =
	     (pciw_pci0_txInF$D_OUT[152] && !pciw_pci0_txInF$D_OUT[126] &&
	      !pciw_pci0_txInF$D_OUT[125]) ?
	       3'd3 :
	       ((pciw_pci0_txInF$D_OUT[152] &&
		 (pciw_pci0_txInF$D_OUT[125] ||
		  pciw_pci0_txInF$D_OUT[126] &&
		  pciw_pci0_txInF$D_OUT[143:128] == 16'hFFFF)) ?
		  3'd4 :
		  ((pciw_pci0_txInF$D_OUT[152] &&
		    pciw_pci0_txInF$D_OUT[126] &&
		    !pciw_pci0_txInF$D_OUT[125] &&
		    pciw_pci0_txInF$D_OUT[143:128] == 16'hFFF0) ?
		     3'd3 :
		     ((!pciw_pci0_txInF$D_OUT[152] &&
		       pciw_pci0_txInF$D_OUT[143:128] == 16'hFFFF) ?
			3'd4 :
			((!pciw_pci0_txInF$D_OUT[152] &&
			  pciw_pci0_txInF$D_OUT[143:128] == 16'hFFF0) ?
			   3'd3 :
			   ((!pciw_pci0_txInF$D_OUT[152] &&
			     pciw_pci0_txInF$D_OUT[143:128] == 16'hFF00) ?
			      3'd2 :
			      ((!pciw_pci0_txInF$D_OUT[152] &&
				pciw_pci0_txInF$D_OUT[143:128] == 16'hF000) ?
				 3'd1 :
				 3'd0)))))) ;
  assign pciw_pci0_txDws_delta_enq$whas = WILL_FIRE_RL_pciw_pci0_tx_enstage ;
  assign pciw_pci0_txDws_delta_deq$wget =
	     IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1[2:0] ;
  assign pciw_pci0_txDws_delta_deq$whas = WILL_FIRE_RL_pciw_pci0_tx_destage ;
  assign pciw_pci0_txDws_new_data$wget =
	     { pciw_pci0_txInF$D_OUT[7:0],
	       pciw_pci0_txInF$D_OUT[15:8],
	       pciw_pci0_txInF$D_OUT[23:16],
	       pciw_pci0_txInF$D_OUT[31:24],
	       pciw_pci0_txInF$D_OUT[39:32],
	       pciw_pci0_txInF$D_OUT[47:40],
	       pciw_pci0_txInF$D_OUT[55:48],
	       pciw_pci0_txInF$D_OUT[63:56],
	       pciw_pci0_txInF$D_OUT[71:64],
	       pciw_pci0_txInF$D_OUT[79:72],
	       pciw_pci0_txInF$D_OUT[87:80],
	       pciw_pci0_txInF$D_OUT[95:88],
	       pciw_pci0_txInF$D_OUT[103:96],
	       pciw_pci0_txInF$D_OUT[111:104],
	       pciw_pci0_txInF$D_OUT[119:112],
	       pciw_pci0_txInF$D_OUT[127:120] } ;
  assign pciw_pci0_txDws_new_data$whas = WILL_FIRE_RL_pciw_pci0_tx_enstage ;
  assign pciw_pci0_rxInF_r_enq$whas =
	     MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 ;
  assign pciw_pci0_rxInF_r_deq$whas = WILL_FIRE_RL_pciw_pci0_rx_enstage ;
  assign pciw_pci0_rxInF_r_clr$whas = 1'b0 ;
  assign pciw_pci0_rxInF_doResetEnq$whas =
	     MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 ;
  assign pciw_pci0_rxInF_doResetDeq$whas = WILL_FIRE_RL_pciw_pci0_rx_enstage ;
  assign pciw_pci0_rxInF_doResetClr$whas = 1'b0 ;
  assign pciw_pci0_txOutF_r_enq$whas = WILL_FIRE_RL_pciw_pci0_tx_destage ;
  assign pciw_pci0_txOutF_r_deq$whas = WILL_FIRE_RL_pciw_pci0_tx_exstage ;
  assign pciw_pci0_txOutF_r_clr$whas = 1'b0 ;
  assign pciw_pci0_txOutF_doResetEnq$whas =
	     WILL_FIRE_RL_pciw_pci0_tx_destage ;
  assign pciw_pci0_txOutF_doResetDeq$whas =
	     WILL_FIRE_RL_pciw_pci0_tx_exstage ;
  assign pciw_pci0_txOutF_doResetClr$whas = 1'b0 ;

  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;

`ifdef not
    // register pciDevice
  assign pciDevice$D_IN = pciw_pciDevice ;
  assign pciDevice$EN = 1'd1 ;
`else
  assign pci_device = pciw_pciDevice;
  assign pci_link_up = pciw_linkLed_sb$dD_OUT;
  assign pci_blink = freeCnt[25] ;
`endif
  // register pciw_pci0_cfgDataWr
  assign pciw_pci0_cfgDataWr$D_IN = pciw_pci0_pcie_ep$tl_cfg_ctl_wr ;
  assign pciw_pci0_cfgDataWr$EN = 1'd1 ;

  // register pciw_pci0_cfgSample
  assign pciw_pci0_cfgSample$D_IN =
	     pciw_pci0_cfgDataWr != pciw_pci0_pcie_ep$tl_cfg_ctl_wr ;
  assign pciw_pci0_cfgSample$EN = 1'd1 ;

  // register pciw_pci0_deviceReg
  assign pciw_pci0_deviceReg$D_IN =
	     { pciw_pci0_pcie_ep$tl_cfg_ctl[12:0], 3'd0 } ;
  assign pciw_pci0_deviceReg$EN =
	     pciw_pci0_cfgSample && pciw_pci0_pcie_ep$tl_cfg_add == 4'hF ;

  // register pciw_pci0_rxDbgDeDeq
  assign pciw_pci0_rxDbgDeDeq$D_IN =
	     pciw_pci0_rxDbgDeDeq +
	     { 13'd0,
	       IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2[2:0] } ;
  assign pciw_pci0_rxDbgDeDeq$EN = WILL_FIRE_RL_pciw_pci0_rx_destage ;

  // register pciw_pci0_rxDbgDeEof
  assign pciw_pci0_rxDbgDeEof$D_IN = pciw_pci0_rxDbgDeEof + 16'd1 ;
  assign pciw_pci0_rxDbgDeEof$EN =
`ifdef orig
	     WILL_FIRE_RL_pciw_pci0_rx_destage && pciw_pci0_rxEofF$EMPTY_N &&
	     pciw_pci0_rxDws_num_full_7_ULE_4___d836 ;
`else
				  WILL_FIRE_RL_pciw_pci0_rx_destage && 
				  rx_destage_eof
				  ;
`endif

  // register pciw_pci0_rxDbgDeSof
  assign pciw_pci0_rxDbgDeSof$D_IN = pciw_pci0_rxDbgDeSof + 16'd1 ;
  assign pciw_pci0_rxDbgDeSof$EN =
	     WILL_FIRE_RL_pciw_pci0_rx_destage && !pciw_pci0_rxInFlight ;

  // register pciw_pci0_rxDbgDestage
  assign pciw_pci0_rxDbgDestage$D_IN = pciw_pci0_rxDbgDestage + 16'd1 ;
  assign pciw_pci0_rxDbgDestage$EN = WILL_FIRE_RL_pciw_pci0_rx_destage ;

  // register pciw_pci0_rxDbgEnEnq
  assign pciw_pci0_rxDbgEnEnq$D_IN =
	     pciw_pci0_rxDbgEnEnq +
	     { 13'd0,
	       (pciw_pci0_rxInF$D_OUT[153] && !pciw_pci0_rxInF$D_OUT[30] &&
		!pciw_pci0_rxInF$D_OUT[29]) ?
		 3'd3 :
		 ((pciw_pci0_rxInF$D_OUT[153] &&
		   (pciw_pci0_rxInF$D_OUT[29] ||
		    pciw_pci0_rxInF$D_OUT[30] && pciw_pci0_rxInF$D_OUT[66])) ?
		    3'd4 :
		    ((pciw_pci0_rxInF$D_OUT[153] &&
		      pciw_pci0_rxInF$D_OUT[30] &&
		      !pciw_pci0_rxInF$D_OUT[29] &&
		      !pciw_pci0_rxInF$D_OUT[66]) ?
		       3'd3 :
		       ((!pciw_pci0_rxInF$D_OUT[153] &&
			 !pciw_pci0_rxInF$D_OUT[154] &&
			 pciw_pci0_rxInF$D_OUT[143:128] == 16'hFFFF) ?
			  3'd4 :
			  ((!pciw_pci0_rxInF$D_OUT[153] &&
			    !pciw_pci0_rxInF$D_OUT[154] &&
			    pciw_pci0_rxInF$D_OUT[143:128] == 16'h0FFF) ?
			     3'd3 :
			     ((!pciw_pci0_rxInF$D_OUT[153] &&
			       pciw_pci0_rxInF$D_OUT[154] &&
			       pciw_pci0_rxInF$D_OUT[143:136] == 8'hFF) ?
				3'd2 :
				((!pciw_pci0_rxInF$D_OUT[153] &&
				  pciw_pci0_rxInF$D_OUT[154] &&
				  pciw_pci0_rxInF$D_OUT[143:136] == 8'h0F) ?
				   3'd1 :
				   3'd0)))))) } ;
  assign pciw_pci0_rxDbgEnEnq$EN = WILL_FIRE_RL_pciw_pci0_rx_enstage ;

  // register pciw_pci0_rxDbgEnEof
  assign pciw_pci0_rxDbgEnEof$D_IN = pciw_pci0_rxDbgEnEof + 16'd1 ;
  assign pciw_pci0_rxDbgEnEof$EN =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage && pciw_pci0_rxInF$D_OUT[152] ;

  // register pciw_pci0_rxDbgEnSof
  assign pciw_pci0_rxDbgEnSof$D_IN = pciw_pci0_rxDbgEnSof + 16'd1 ;
  assign pciw_pci0_rxDbgEnSof$EN =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage && pciw_pci0_rxInF$D_OUT[153] ;

  // register pciw_pci0_rxDbgEnstage
  assign pciw_pci0_rxDbgEnstage$D_IN = pciw_pci0_rxDbgEnstage + 16'd1 ;
  assign pciw_pci0_rxDbgEnstage$EN = WILL_FIRE_RL_pciw_pci0_rx_enstage ;

  // register pciw_pci0_rxDbgInstage
  assign pciw_pci0_rxDbgInstage$D_IN = pciw_pci0_rxDbgInstage + 16'd1 ;
  assign pciw_pci0_rxDbgInstage$EN =
	     MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 ;

  // register pciw_pci0_rxDwrDeq
  assign pciw_pci0_rxDwrDeq$D_IN =
	     pciw_pci0_rxInFlight ?
	       pciw_pci0_rxDwrDeq -
	       { 8'd0,
		 IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2[2:0] } :
	       IF_pciw_pci0_rxEofF_notEmpty__62_AND_pciw_pci0_ETC___d288 ;
  assign pciw_pci0_rxDwrDeq$EN = WILL_FIRE_RL_pciw_pci0_rx_destage ;

  // register pciw_pci0_rxDwrEnq
  assign pciw_pci0_rxDwrEnq$D_IN = 11'h0 ;
  assign pciw_pci0_rxDwrEnq$EN = 1'b0 ;

  // register pciw_pci0_rxDws_num_empty
  assign pciw_pci0_rxDws_num_empty$D_IN =
	     pciw_pci0_rxDws_num_empty +
	     { 1'd0,
	       IF_pciw_pci0_rxDws_delta_deq_whas__3_THEN_pciw_ETC___d801 } -
	     { 1'd0,
	       IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771 } ;
  assign pciw_pci0_rxDws_num_empty$EN = 1'd1 ;

  // register pciw_pci0_rxDws_num_full
  assign pciw_pci0_rxDws_num_full$D_IN =
	     pciw_pci0_rxDws_num_full +
	     { 1'd0,
	       IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771 } -
	     { 1'd0,
	       IF_pciw_pci0_rxDws_delta_deq_whas__3_THEN_pciw_ETC___d801 } ;
  assign pciw_pci0_rxDws_num_full$EN = 1'd1 ;

  // register pciw_pci0_rxDws_vec
  assign pciw_pci0_rxDws_vec$D_IN =
	     { (WILL_FIRE_RL_pciw_pci0_rx_enstage ?
		  _0_CONCAT_pciw_pci0_rxDws_new_data_wget__2_BITS_ETC___d832[255:32] :
		  224'd0) |
	       pciw_pci0_rxDws_vec_3_SRL_IF_pciw_pci0_rxDws_d_ETC___d834[255:32],
	       (WILL_FIRE_RL_pciw_pci0_rx_enstage ?
		  _0_CONCAT_pciw_pci0_rxDws_new_data_wget__2_BITS_ETC___d832[31:0] :
		  32'd0) |
	       pciw_pci0_rxDws_vec_3_SRL_IF_pciw_pci0_rxDws_d_ETC___d834[31:0] } ;
  assign pciw_pci0_rxDws_vec$EN = 1'd1 ;

  // register pciw_pci0_rxInF_countReg
  assign pciw_pci0_rxInF_countReg$D_IN =
	     MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 ?
	       pciw_pci0_rxInF_countReg + 6'd1 :
	       pciw_pci0_rxInF_countReg - 6'd1 ;
  assign pciw_pci0_rxInF_countReg$EN =
	     MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 !=
	     WILL_FIRE_RL_pciw_pci0_rx_enstage ;

  // register pciw_pci0_rxInF_levelsValid
  assign pciw_pci0_rxInF_levelsValid$D_IN =
	     WILL_FIRE_RL_pciw_pci0_rxInF_reset ;
  assign pciw_pci0_rxInF_levelsValid$EN =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage ||
	     pciw_pci0_rxInF$FULL_N && pciw_pci0_pcie_ep$rx_st_valid0 ||
	     WILL_FIRE_RL_pciw_pci0_rxInF_reset ;

  // register pciw_pci0_rxInFlight
  assign pciw_pci0_rxInFlight$D_IN =
`ifdef orig
	     !pciw_pci0_rxEofF$EMPTY_N ||
	     !pciw_pci0_rxDws_num_full_7_ULE_4___d836 ;
`else
             !rx_destage_eof;
`endif
  assign pciw_pci0_rxInFlight$EN = WILL_FIRE_RL_pciw_pci0_rx_destage ;

  // register pciw_pci0_txDbgDeDeq
  assign pciw_pci0_txDbgDeDeq$D_IN =
	     pciw_pci0_txDbgDeDeq +
	     { 13'd0,
	       IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1[2:0] } ;
  assign pciw_pci0_txDbgDeDeq$EN = WILL_FIRE_RL_pciw_pci0_tx_destage ;

  // register pciw_pci0_txDbgDeEof
  assign pciw_pci0_txDbgDeEof$D_IN = pciw_pci0_txDbgDeEof + 16'd1 ;
  assign pciw_pci0_txDbgDeEof$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_destage &&
	     pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817 ;

  // register pciw_pci0_txDbgDeSof
  assign pciw_pci0_txDbgDeSof$D_IN = pciw_pci0_txDbgDeSof + 16'd1 ;
  assign pciw_pci0_txDbgDeSof$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_destage && !pciw_pci0_txInFlight ;

  // register pciw_pci0_txDbgDestage
  assign pciw_pci0_txDbgDestage$D_IN = pciw_pci0_txDbgDestage + 16'd1 ;
  assign pciw_pci0_txDbgDestage$EN = WILL_FIRE_RL_pciw_pci0_tx_destage ;

  // register pciw_pci0_txDbgEnEnq
  assign pciw_pci0_txDbgEnEnq$D_IN =
	     pciw_pci0_txDbgEnEnq +
	     { 13'd0,
	       (pciw_pci0_txInF$D_OUT[152] && !pciw_pci0_txInF$D_OUT[126] &&
		!pciw_pci0_txInF$D_OUT[125]) ?
		 3'd3 :
		 ((pciw_pci0_txInF$D_OUT[152] &&
		   (pciw_pci0_txInF$D_OUT[125] ||
		    pciw_pci0_txInF$D_OUT[126] &&
		    pciw_pci0_txInF$D_OUT[143:128] == 16'hFFFF)) ?
		    3'd4 :
		    ((pciw_pci0_txInF$D_OUT[152] &&
		      pciw_pci0_txInF$D_OUT[126] &&
		      !pciw_pci0_txInF$D_OUT[125] &&
		      pciw_pci0_txInF$D_OUT[143:128] == 16'hFFF0) ?
		       3'd3 :
		       ((!pciw_pci0_txInF$D_OUT[152] &&
			 pciw_pci0_txInF$D_OUT[143:128] == 16'hFFFF) ?
			  3'd4 :
			  ((!pciw_pci0_txInF$D_OUT[152] &&
			    pciw_pci0_txInF$D_OUT[143:128] == 16'hFFF0) ?
			     3'd3 :
			     ((!pciw_pci0_txInF$D_OUT[152] &&
			       pciw_pci0_txInF$D_OUT[143:128] == 16'hFF00) ?
				3'd2 :
				((!pciw_pci0_txInF$D_OUT[152] &&
				  pciw_pci0_txInF$D_OUT[143:128] ==
				  16'hF000) ?
				   3'd1 :
				   3'd0)))))) } ;
  assign pciw_pci0_txDbgEnEnq$EN = WILL_FIRE_RL_pciw_pci0_tx_enstage ;

  // register pciw_pci0_txDbgEnEof
  assign pciw_pci0_txDbgEnEof$D_IN = pciw_pci0_txDbgEnEof + 16'd1 ;
  assign pciw_pci0_txDbgEnEof$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage && pciw_pci0_txInF$D_OUT[151] ;

  // register pciw_pci0_txDbgEnSof
  assign pciw_pci0_txDbgEnSof$D_IN = pciw_pci0_txDbgEnSof + 16'd1 ;
  assign pciw_pci0_txDbgEnSof$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage && pciw_pci0_txInF$D_OUT[152] ;

  // register pciw_pci0_txDbgEnstage
  assign pciw_pci0_txDbgEnstage$D_IN = pciw_pci0_txDbgEnstage + 16'd1 ;
  assign pciw_pci0_txDbgEnstage$EN = WILL_FIRE_RL_pciw_pci0_tx_enstage ;

  // register pciw_pci0_txDbgExstage
  assign pciw_pci0_txDbgExstage$D_IN = pciw_pci0_txDbgExstage + 16'd1 ;
  assign pciw_pci0_txDbgExstage$EN = WILL_FIRE_RL_pciw_pci0_tx_exstage ;

  // register pciw_pci0_txDwrDeq
  assign pciw_pci0_txDwrDeq$D_IN =
	     pciw_pci0_txInFlight ?
	       pciw_pci0_txDwrDeq -
	       { 8'd0,
		 IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1[2:0] } :
	       IF_pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_ETC___d523 ;
  assign pciw_pci0_txDwrDeq$EN = WILL_FIRE_RL_pciw_pci0_tx_destage ;

  // register pciw_pci0_txDwrEnq
  assign pciw_pci0_txDwrEnq$D_IN = 11'h0 ;
  assign pciw_pci0_txDwrEnq$EN = 1'b0 ;

  // register pciw_pci0_txDws_num_empty
  assign pciw_pci0_txDws_num_empty$D_IN =
	     pciw_pci0_txDws_num_empty +
	     { 1'd0,
	       IF_pciw_pci0_txDws_delta_deq_whas__9_THEN_pciw_ETC___d804 } -
	     { 1'd0,
	       IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770 } ;
  assign pciw_pci0_txDws_num_empty$EN = 1'd1 ;

  // register pciw_pci0_txDws_num_full
  assign pciw_pci0_txDws_num_full$D_IN =
	     pciw_pci0_txDws_num_full +
	     { 1'd0,
	       IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770 } -
	     { 1'd0,
	       IF_pciw_pci0_txDws_delta_deq_whas__9_THEN_pciw_ETC___d804 } ;
  assign pciw_pci0_txDws_num_full$EN = 1'd1 ;

  // register pciw_pci0_txDws_vec
  assign pciw_pci0_txDws_vec$D_IN =
	     { (WILL_FIRE_RL_pciw_pci0_tx_enstage ?
		  _0_CONCAT_pciw_pci0_txDws_new_data_wget__8_BITS_ETC___d833[255:32] :
		  224'd0) |
	       pciw_pci0_txDws_vec_9_SRL_IF_pciw_pci0_txDws_d_ETC___d835[255:32],
	       (WILL_FIRE_RL_pciw_pci0_tx_enstage ?
		  _0_CONCAT_pciw_pci0_txDws_new_data_wget__8_BITS_ETC___d833[31:0] :
		  32'd0) |
	       pciw_pci0_txDws_vec_9_SRL_IF_pciw_pci0_txDws_d_ETC___d835[31:0] } ;
  assign pciw_pci0_txDws_vec$EN = 1'd1 ;

  // register pciw_pci0_txInFlight
  assign pciw_pci0_txInFlight$D_IN =
	     NOT_pciw_pci0_txEofF_notEmpty__52_53_OR_NOT_pc_ETC___d495 ;
  assign pciw_pci0_txInFlight$EN = WILL_FIRE_RL_pciw_pci0_tx_destage ;

  // register pciw_pci0_txOutF_countReg
  assign pciw_pci0_txOutF_countReg$D_IN =
	     WILL_FIRE_RL_pciw_pci0_tx_destage ?
	       pciw_pci0_txOutF_countReg + 10'd1 :
	       pciw_pci0_txOutF_countReg - 10'd1 ;
  assign pciw_pci0_txOutF_countReg$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_destage !=
	     WILL_FIRE_RL_pciw_pci0_tx_exstage ;

  // register pciw_pci0_txOutF_levelsValid
  assign pciw_pci0_txOutF_levelsValid$D_IN =
	     WILL_FIRE_RL_pciw_pci0_txOutF_reset ;
  assign pciw_pci0_txOutF_levelsValid$EN =
	     WILL_FIRE_RL_pciw_pci0_tx_exstage ||
	     WILL_FIRE_RL_pciw_pci0_tx_destage ||
	     WILL_FIRE_RL_pciw_pci0_txOutF_reset ;

  // register pciw_pci0_txReadyD
  assign pciw_pci0_txReadyD$D_IN = pciw_pci0_pcie_ep$tx_st_ready0 ;
  assign pciw_pci0_txReadyD$EN = 1'd1 ;

  // register pciw_pciDevice
  assign pciw_pciDevice$D_IN = pciw_pci0_deviceReg ;
  assign pciw_pciDevice$EN = 1'd1 ;

  // submodule pciw_aliveLed_sb
  assign pciw_aliveLed_sb$sD_IN = pciw_pci0_pcie_ep$ava_alive ;
  assign pciw_aliveLed_sb$sEN = 1'd1 ;

  // submodule pciw_i2pF
`ifdef not
  assign pciw_i2pF$D_IN = ctop$server_response_get ;
  assign pciw_i2pF$ENQ = ctop$RDY_server_response_get && pciw_i2pF$FULL_N ;
`else
  // 
  assign pciw_i2pF$D_IN = unoc_in_data;
  assign pciw_i2pF$ENQ = unoc_in_valid && pciw_i2pF$FULL_N;
  assign unoc_out_take = unoc_in_valid && pciw_i2pF$FULL_N;
`endif
  assign pciw_i2pF$DEQ = pciw_i2pF$EMPTY_N && pciw_pci0_txInF$FULL_N ;
  assign pciw_i2pF$CLR = 1'b0 ;

  // submodule pciw_linkLed_sb
  assign pciw_linkLed_sb$sD_IN = pciw_pci0_pcie_ep$ava_lnk_up ;
  assign pciw_linkLed_sb$sEN = 1'd1 ;

  // submodule pciw_p2iF
  assign pciw_p2iF$D_IN = pciw_pci0_rxOutF$D_OUT ;
  assign pciw_p2iF$ENQ = pciw_pci0_rxOutF$EMPTY_N && pciw_p2iF$FULL_N ;
`ifdef not
  assign pciw_p2iF$DEQ = ctop$RDY_server_request_put && pciw_p2iF$EMPTY_N ;
`else
  assign pciw_p2iF$DEQ = unoc_in_take;
  assign unoc_out_valid = pciw_p2iF$EMPTY_N;
`endif
  assign pciw_p2iF$CLR = 1'b0 ;

  // submodule pciw_pci0_pcie_ep
  assign pciw_pci0_pcie_ep$pcie_rx_in = pcie_rx ;
  assign pciw_pci0_pcie_ep$rx_st_mask0 = 1'd0 ;
  assign pciw_pci0_pcie_ep$rx_st_ready0 = pciw_pci0_rxInF_countReg < 6'd30 ;
  assign pciw_pci0_pcie_ep$tx_st_data0 = pciw_pci0_txOutF$D_OUT[127:0] ;
  assign pciw_pci0_pcie_ep$tx_st_empty0 =
	     WILL_FIRE_RL_pciw_pci0_tx_exstage &&
	     pciw_pci0_txOutF$D_OUT[154] ;
  assign pciw_pci0_pcie_ep$tx_st_eop0 =
	     WILL_FIRE_RL_pciw_pci0_tx_exstage &&
	     pciw_pci0_txOutF$D_OUT[152] ;
  assign pciw_pci0_pcie_ep$tx_st_err0 = 1'b0 ;
  assign pciw_pci0_pcie_ep$tx_st_sop0 =
	     WILL_FIRE_RL_pciw_pci0_tx_exstage &&
	     pciw_pci0_txOutF$D_OUT[153] ;
  assign pciw_pci0_pcie_ep$tx_st_valid0 = WILL_FIRE_RL_pciw_pci0_tx_exstage ;

  // submodule pciw_pci0_rxEofF
  assign pciw_pci0_rxEofF$D_IN = 3'b010 /* unspecified value */  ;
  assign pciw_pci0_rxEofF$ENQ =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage && pciw_pci0_rxInF$D_OUT[152] ;
  assign pciw_pci0_rxEofF$DEQ =
`ifdef orig
	     WILL_FIRE_RL_pciw_pci0_rx_destage && pciw_pci0_rxEofF$EMPTY_N &&
	     pciw_pci0_rxDws_num_full_7_ULE_4___d836 ;
`else
	     WILL_FIRE_RL_pciw_pci0_rx_destage && 
	     rx_destage_eof;
`endif
  assign pciw_pci0_rxEofF$CLR = 1'b0 ;

  // submodule pciw_pci0_rxHeadF
  assign pciw_pci0_rxHeadF$D_IN =
	     { pciw_pci0_rxInF$D_OUT[151:144],
	       pciw_pci0_rxInF$D_OUT[9:0],
	       pciw_pci0_rxInF$D_OUT[30:29],
	       (pciw_pci0_rxInF$D_OUT[29] ? 11'd4 : 11'd3) +
	       (pciw_pci0_rxInF$D_OUT[30] ?
		  ((pciw_pci0_rxInF$D_OUT[9:0] == 10'd0) ?
		     11'd1024 :
		     { 1'd0, pciw_pci0_rxInF$D_OUT[9:0] }) :
		  11'd0) } ;
  assign pciw_pci0_rxHeadF$ENQ =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage && pciw_pci0_rxInF$D_OUT[153] ;
  assign pciw_pci0_rxHeadF$DEQ =
`ifdef orig
	     WILL_FIRE_RL_pciw_pci0_rx_destage && pciw_pci0_rxEofF$EMPTY_N &&
	     pciw_pci0_rxDws_num_full_7_ULE_4___d836 ;
`else
	     WILL_FIRE_RL_pciw_pci0_rx_destage &&
	     rx_destage_eof;
`endif
  assign pciw_pci0_rxHeadF$CLR = 1'b0 ;

  // submodule pciw_pci0_rxInF
  assign pciw_pci0_rxInF$D_IN =
	     { pciw_pci0_pcie_ep$rx_st_empty0,
	       pciw_pci0_pcie_ep$rx_st_sop0,
	       pciw_pci0_pcie_ep$rx_st_eop0,
	       x_hit__h22096,
	       pciw_pci0_pcie_ep$rx_st_be0,
	       pciw_pci0_pcie_ep$rx_st_data0 } ;
  assign pciw_pci0_rxInF$ENQ =
	     MUX_pciw_pci0_rxInF_levelsValid$write_1__SEL_3 ;
  assign pciw_pci0_rxInF$DEQ = WILL_FIRE_RL_pciw_pci0_rx_enstage ;
  assign pciw_pci0_rxInF$CLR = 1'b0 ;

  // submodule pciw_pci0_rxOutF
  assign pciw_pci0_rxOutF$D_IN =
	     { !pciw_pci0_rxInFlight,
`ifdef orig
	       pciw_pci0_rxEofF$EMPTY_N &&
	       pciw_pci0_rxDws_num_full_7_ULE_4___d836,
`else
	       rx_destage_eof,
`endif
	       pciw_pci0_rxHeadF$D_OUT[29:23],
	       x_be__h27614,
	       x_data__h27615 } ;
  assign pciw_pci0_rxOutF$ENQ = WILL_FIRE_RL_pciw_pci0_rx_destage ;
  assign pciw_pci0_rxOutF$DEQ = pciw_pci0_rxOutF$EMPTY_N && pciw_p2iF$FULL_N ;
  assign pciw_pci0_rxOutF$CLR = 1'b0 ;

  // submodule pciw_pci0_txEofF
  assign pciw_pci0_txEofF$D_IN = 3'b010 /* unspecified value */  ;
  assign pciw_pci0_txEofF$ENQ =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage && pciw_pci0_txInF$D_OUT[151] ;
  assign pciw_pci0_txEofF$DEQ =
	     WILL_FIRE_RL_pciw_pci0_tx_destage &&
	     pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817 ;
  assign pciw_pci0_txEofF$CLR = 1'b0 ;

  // submodule pciw_pci0_txExF
  assign pciw_pci0_txExF$D_IN = 1'd0 ;
  assign pciw_pci0_txExF$ENQ =
	     WILL_FIRE_RL_pciw_pci0_tx_destage &&
	     pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817 ;
  assign pciw_pci0_txExF$DEQ =
	     WILL_FIRE_RL_pciw_pci0_tx_exstage &&
	     pciw_pci0_txOutF$D_OUT[152] ;
  assign pciw_pci0_txExF$CLR = 1'b0 ;

  // submodule pciw_pci0_txHeadF
  assign pciw_pci0_txHeadF$D_IN =
	     { 8'd0,
	       pciw_pci0_txInF$D_OUT[105:96],
	       pciw_pci0_txInF$D_OUT[126:125],
	       (pciw_pci0_txInF$D_OUT[125] ? 11'd4 : 11'd3) +
	       (pciw_pci0_txInF$D_OUT[126] ?
		  ((pciw_pci0_txInF$D_OUT[105:96] == 10'd0) ?
		     11'd1024 :
		     { 1'd0, pciw_pci0_txInF$D_OUT[105:96] }) :
		  11'd0) } ;
  assign pciw_pci0_txHeadF$ENQ =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage && pciw_pci0_txInF$D_OUT[152] ;
  assign pciw_pci0_txHeadF$DEQ =
	     WILL_FIRE_RL_pciw_pci0_tx_destage &&
	     pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817 ;
  assign pciw_pci0_txHeadF$CLR = 1'b0 ;

  // submodule pciw_pci0_txInF
  assign pciw_pci0_txInF$D_IN = pciw_i2pF$D_OUT ;
  assign pciw_pci0_txInF$ENQ = pciw_i2pF$EMPTY_N && pciw_pci0_txInF$FULL_N ;
  assign pciw_pci0_txInF$DEQ = WILL_FIRE_RL_pciw_pci0_tx_enstage ;
  assign pciw_pci0_txInF$CLR = 1'b0 ;

  // submodule pciw_pci0_txOutF
  assign pciw_pci0_txOutF$D_IN =
	     { IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1[2:0] <
	       3'd3,
	       !pciw_pci0_txInFlight,
	       pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817,
	       24'd0,
	       x_data__h46011 } ;
  assign pciw_pci0_txOutF$ENQ = WILL_FIRE_RL_pciw_pci0_tx_destage ;
  assign pciw_pci0_txOutF$DEQ = WILL_FIRE_RL_pciw_pci0_tx_exstage ;
  assign pciw_pci0_txOutF$CLR = 1'b0 ;

  // remaining internal signals
  assign IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1 =
	     (IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_IF_p_ETC___d837 <=
	      IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d838) ?
	       IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_IF_p_ETC___d837 :
	       IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d838 ;
  assign IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2 =
	     (IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_rxDw_ETC___d769 <
	      11'd4) ?
	       IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_rxDw_ETC___d769 :
	       11'd4 ;
  assign IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_IF_p_ETC___d837 =
	     (!pciw_pci0_txInFlight &&
	      !IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d481[34] &&
	      IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d492[30]) ?
	       11'd3 :
	       11'd4 ;
  assign IF_pciw_pci0_rxDws_delta_deq_whas__3_THEN_pciw_ETC___d801 =
	     WILL_FIRE_RL_pciw_pci0_rx_destage ?
	       IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2[2:0] :
	       3'd0 ;
  assign IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771 =
	     WILL_FIRE_RL_pciw_pci0_rx_enstage ?
	       pciw_pci0_rxDws_delta_enq$wget :
	       3'd0 ;
`ifndef orig
      // The eof should be:
      // eof = rxEofF.notEmpty && deq_amount == amount_left
      // deq_amount = min(4, sof ? rxh.length : previous_amount_left) (as in the BSV)
      // amount_left = sof ? rxh.length : previous_amount_left;
      // We are comparing the amount to dequeue in this cycle to the amount
      // left to dequeue in this message.
  assign rx_destage_eof
    = pciw_pci0_rxEofF$EMPTY_N && // There is an EOF token in the EOF FIFO
      { 8'd0, IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2[2:0] } == // deqAmount this cycle
      (pciw_pci0_rxInFlight ?
       pciw_pci0_rxDwrDeq :            // not SOF, left over amount
       pciw_pci0_rxHeadF$D_OUT[10:0]); // SOF: rxh.length
`endif
  assign IF_pciw_pci0_rxEofF_notEmpty__62_AND_pciw_pci0_ETC___d288 =
`ifdef orig
// This is the BSV:
//      rxDwrDeq <= sof ? (eof ? 0 : rxh.length-extend(deqAmount)) : rxDwrDeq-extend(deqAmount);
// this is inlining eof as rxEofF.notEmpty && (rxDws.dwords_available <= 4);
// But this is the wrong definition of eof
	     (pciw_pci0_rxEofF$EMPTY_N &&
	      pciw_pci0_rxDws_num_full_7_ULE_4___d836) ?
`else
             rx_destage_eof ?
`endif
	       11'd0 :
	       pciw_pci0_rxHeadF$D_OUT[10:0] -
	       { 8'd0,
		 IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2[2:0] } ;
  assign IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_rxDw_ETC___d769 =
	     pciw_pci0_rxInFlight ?
	       pciw_pci0_rxDwrDeq :
	       pciw_pci0_rxHeadF$D_OUT[10:0] ;
  assign IF_pciw_pci0_txDws_delta_deq_whas__9_THEN_pciw_ETC___d804 =
	     WILL_FIRE_RL_pciw_pci0_tx_destage ?
	       IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1[2:0] :
	       3'd0 ;
  assign IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770 =
	     WILL_FIRE_RL_pciw_pci0_tx_enstage ?
	       pciw_pci0_txDws_delta_enq$wget :
	       3'd0 ;
  assign IF_pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_ETC___d523 =
	     pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817 ?
	       11'd0 :
	       pciw_pci0_txHeadF$D_OUT[10:0] -
	       { 8'd0,
		 IF_IF_NOT_pciw_pci0_txInFlight_49_57_AND_NOT_I_ETC__q1[2:0] } ;
  assign IF_pciw_pci0_txHeadF_first__59_BIT_11_60_THEN__ETC___d468 =
	     pciw_pci0_txHeadF$D_OUT[11] ?
	       { pciw_pci0_txDws_vec[103:96],
		 pciw_pci0_txDws_vec[111:104],
		 pciw_pci0_txDws_vec[119:112],
		 pciw_pci0_txDws_vec[127:120] } :
	       pciw_pci0_txDws_vec[127:96] ;
  assign IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d481 =
	     pciw_pci0_txInFlight ?
	       pciw_pci0_txDws_vec[127:32] :
	       { IF_pciw_pci0_txHeadF_first__59_BIT_11_60_THEN__ETC___d468,
		 pciw_pci0_txDws_vec[71:64],
		 pciw_pci0_txDws_vec[79:72],
		 pciw_pci0_txDws_vec[87:80],
		 pciw_pci0_txDws_vec[95:88],
		 pciw_pci0_txDws_vec[39:32],
		 pciw_pci0_txDws_vec[47:40],
		 pciw_pci0_txDws_vec[55:48],
		 pciw_pci0_txDws_vec[63:56] } ;
  assign IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d492 =
	     pciw_pci0_txInFlight ?
	       pciw_pci0_txDws_vec[31:0] :
	       { pciw_pci0_txDws_vec[7:0],
		 pciw_pci0_txDws_vec[15:8],
		 pciw_pci0_txDws_vec[23:16],
		 pciw_pci0_txDws_vec[31:24] } ;
  assign IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d838 =
	     pciw_pci0_txInFlight ?
	       pciw_pci0_txDwrDeq :
	       pciw_pci0_txHeadF$D_OUT[10:0] ;

    assign NOT_pciw_pci0_txEofF_notEmpty__52_53_OR_NOT_pc_ETC___d495 =
	     !pciw_pci0_txEofF$EMPTY_N ||
	     !pciw_pci0_txDws_num_full_3_ULE_4___d774 ||
	     !pciw_pci0_txInFlight &&
	     !IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d481[34] &&
	     IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d492[30] ;
  assign _0_CONCAT_pciw_pci0_rxDws_new_data_wget__2_BITS_ETC___d832 =
	     { 128'd0, x__h4523 } << x__h5776 ;
  assign _0_CONCAT_pciw_pci0_txDws_new_data_wget__8_BITS_ETC___d833 =
	     { 128'd0, x__h14478 } << x__h15731 ;
  assign bar___1__h22106 =
	     (pciw_pci0_pcie_ep$rx_st_data0[28:24] == 5'd0) ?
	       pciw_pci0_pcie_ep$rx_st_bardec0 :
	       8'd0 ;
  assign pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831 =
	     x__h56415 | y__h56416 ;
  assign pciw_pci0_rxDws_num_full_7_ULE_4___d836 =
	     pciw_pci0_rxDws_num_full <= 4'd4 ;
  assign pciw_pci0_rxDws_vec_3_SRL_IF_pciw_pci0_rxDws_d_ETC___d834 =
	     pciw_pci0_rxDws_vec >> x__h8877 ;
  assign pciw_pci0_txDws_num_full_3_ULE_4___d774 =
	     pciw_pci0_txDws_num_full <= 4'd4 ;
  assign pciw_pci0_txDws_vec_9_SRL_IF_pciw_pci0_txDws_d_ETC___d835 =
	     pciw_pci0_txDws_vec >> x__h18832 ;
  assign pciw_pci0_txEofF_notEmpty__52_AND_pciw_pci0_tx_ETC___d817 =
	     pciw_pci0_txEofF$EMPTY_N &&
	     pciw_pci0_txDws_num_full_3_ULE_4___d774 &&
	     (pciw_pci0_txInFlight ||
	      IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d481[34] ||
	      !IF_pciw_pci0_txInFlight_49_THEN_pciw_pci0_txDw_ETC___d492[30]) ;
  assign pciw_pci0_txOutF_i_notFull__48_AND_pciw_pci0_t_ETC___d502 =
	     pciw_pci0_txOutF$FULL_N &&
	     (pciw_pci0_txInFlight || pciw_pci0_txHeadF$EMPTY_N) &&
	     (NOT_pciw_pci0_txEofF_notEmpty__52_53_OR_NOT_pc_ETC___d495 ||
	      pciw_pci0_txHeadF$EMPTY_N && pciw_pci0_txEofF$EMPTY_N &&
	      pciw_pci0_txExF$FULL_N) ;
  assign x__h14478 =
	     { pciw_pci0_txDws_new_data$wget[127:32] &
	       { (IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770 <=
		  3'd3) ?
		   32'd0 :
		   32'hFFFFFFFF,
		 (IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770 <=
		  3'd2) ?
		   32'd0 :
		   32'hFFFFFFFF,
		 (IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770 <=
		  3'd1) ?
		   32'd0 :
		   32'hFFFFFFFF },
	       pciw_pci0_txDws_new_data$wget[31:0] &
	       ((IF_pciw_pci0_txDws_delta_enq_whas__4_THEN_pciw_ETC___d770 ==
		 3'd0) ?
		  32'd0 :
		  32'hFFFFFFFF) } ;
  assign x__h15731 =
	     { pciw_pci0_txDws_num_full -
	       { 1'd0,
		 IF_pciw_pci0_txDws_delta_deq_whas__9_THEN_pciw_ETC___d804 },
	       5'd0 } ;
  assign x__h18832 =
	     { IF_pciw_pci0_txDws_delta_deq_whas__9_THEN_pciw_ETC___d804,
	       5'd0 } ;
  assign x__h4523 =
	     { pciw_pci0_rxDws_new_data$wget[127:32] &
	       { (IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771 <=
		  3'd3) ?
		   32'd0 :
		   32'hFFFFFFFF,
		 (IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771 <=
		  3'd2) ?
		   32'd0 :
		   32'hFFFFFFFF,
		 (IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771 <=
		  3'd1) ?
		   32'd0 :
		   32'hFFFFFFFF },
	       pciw_pci0_rxDws_new_data$wget[31:0] &
	       ((IF_pciw_pci0_rxDws_delta_enq_whas__8_THEN_pciw_ETC___d771 ==
		 3'd0) ?
		  32'd0 :
		  32'hFFFFFFFF) } ;
  assign x__h56415 = x__h56417 | y__h56418 ;
  assign x__h56417 = x__h56419 | y__h56420 ;
  assign x__h56419 = x__h56421 | y__h56422 ;
  assign x__h56421 = x__h56423 | y__h56424 ;
  assign x__h56423 = x__h56425 | y__h56426 ;
  assign x__h56425 = x__h56427 | y__h56428 ;
  assign x__h56427 = x__h56429 | y__h56430 ;
  assign x__h56429 = x__h56431 | y__h56432 ;
  assign x__h56431 = x__h56433 | y__h56434 ;
  assign x__h56433 = x__h56435 | y__h56436 ;
  assign x__h56435 = x__h56437 | y__h56438 ;
  assign x__h56437 = x__h56439 | y__h56440 ;
  assign x__h56439 = x__h56441 | y__h56442 ;
  assign x__h56441 = x__h56443 | y__h56444 ;
  assign x__h56443 = x__h56445 | y__h56446 ;
  assign x__h56445 = x__h56447 | y__h56448 ;
  assign x__h56447 = x__h56449 | y__h56450 ;
  assign x__h56449 = x__h56451 | y__h56452 ;
  assign x__h56451 = pciw_pci0_pcie_ep$ava_debug | y__h56454 ;
  assign x__h5776 =
	     { pciw_pci0_rxDws_num_full -
	       { 1'd0,
		 IF_pciw_pci0_rxDws_delta_deq_whas__3_THEN_pciw_ETC___d801 },
	       5'd0 } ;
  assign x__h8877 =
	     { IF_pciw_pci0_rxDws_delta_deq_whas__3_THEN_pciw_ETC___d801,
	       5'd0 } ;
  assign x_be__h27614 =
	     { IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[0],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[1],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[2],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[3],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[4],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[5],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[6],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[7],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[8],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[9],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[10],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[11],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[12],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[13],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[14],
	       IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787[15] } ;
  assign x_data__h27615 =
	     { pciw_pci0_rxDws_vec[7:0],
	       pciw_pci0_rxDws_vec[15:8],
	       pciw_pci0_rxDws_vec[23:16],
	       pciw_pci0_rxDws_vec[31:24],
	       pciw_pci0_rxDws_vec[39:32],
	       pciw_pci0_rxDws_vec[47:40],
	       pciw_pci0_rxDws_vec[55:48],
	       pciw_pci0_rxDws_vec[63:56],
	       pciw_pci0_rxDws_vec[71:64],
	       pciw_pci0_rxDws_vec[79:72],
	       pciw_pci0_rxDws_vec[87:80],
	       pciw_pci0_rxDws_vec[95:88],
	       pciw_pci0_rxDws_vec[103:96],
	       pciw_pci0_rxDws_vec[111:104],
	       pciw_pci0_rxDws_vec[119:112],
	       pciw_pci0_rxDws_vec[127:120] } ;
  assign x_data__h46011 =
	     pciw_pci0_txInFlight ?
	       pciw_pci0_txDws_vec[127:0] :
	       { IF_pciw_pci0_txHeadF_first__59_BIT_11_60_THEN__ETC___d468,
		 pciw_pci0_txDws_vec[71:64],
		 pciw_pci0_txDws_vec[79:72],
		 pciw_pci0_txDws_vec[87:80],
		 pciw_pci0_txDws_vec[95:88],
		 pciw_pci0_txDws_vec[39:32],
		 pciw_pci0_txDws_vec[47:40],
		 pciw_pci0_txDws_vec[55:48],
		 pciw_pci0_txDws_vec[63:56],
		 pciw_pci0_txDws_vec[7:0],
		 pciw_pci0_txDws_vec[15:8],
		 pciw_pci0_txDws_vec[23:16],
		 pciw_pci0_txDws_vec[31:24] } ;
  assign x_hit__h22096 =
	     pciw_pci0_pcie_ep$rx_st_sop0 ? bar___1__h22106 : 8'd0 ;
  assign y__h56416 = { 16'd0, pciw_pci0_txDbgDeDeq } ;
  assign y__h56418 = { 16'd0, pciw_pci0_txDbgEnEnq } ;
  assign y__h56420 = { 16'd0, pciw_pci0_txDbgDeEof } ;
  assign y__h56422 = { 16'd0, pciw_pci0_txDbgDeSof } ;
  assign y__h56424 = { 16'd0, pciw_pci0_txDbgEnEof } ;
  assign y__h56426 = { 16'd0, pciw_pci0_txDbgEnSof } ;
  assign y__h56428 = { 16'd0, pciw_pci0_txDbgDestage } ;
  assign y__h56430 = { 16'd0, pciw_pci0_txDbgEnstage } ;
  assign y__h56432 = { 16'd0, pciw_pci0_txDbgExstage } ;
  assign y__h56434 = { 31'd0, pciw_pci0_txInFlight } ;
  assign y__h56436 = { 16'd0, pciw_pci0_rxDbgDeDeq } ;
  assign y__h56438 = { 16'd0, pciw_pci0_rxDbgEnEnq } ;
  assign y__h56440 = { 16'd0, pciw_pci0_rxDbgDeEof } ;
  assign y__h56442 = { 16'd0, pciw_pci0_rxDbgDeSof } ;
  assign y__h56444 = { 16'd0, pciw_pci0_rxDbgEnEof } ;
  assign y__h56446 = { 16'd0, pciw_pci0_rxDbgEnSof } ;
  assign y__h56448 = { 16'd0, pciw_pci0_rxDbgDestage } ;
  assign y__h56450 = { 16'd0, pciw_pci0_rxDbgEnstage } ;
  assign y__h56452 = { 16'd0, pciw_pci0_rxDbgInstage } ;
  assign y__h56454 = { 31'd0, pciw_pci0_rxInFlight } ;
  assign z__h56129 =
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[0] ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[1] ;
  assign z__h56136 =
	     z__h56129 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[2] ;
  assign z__h56143 =
	     z__h56136 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[3] ;
  assign z__h56150 =
	     z__h56143 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[4] ;
  assign z__h56157 =
	     z__h56150 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[5] ;
  assign z__h56164 =
	     z__h56157 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[6] ;
  assign z__h56171 =
	     z__h56164 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[7] ;
  assign z__h56178 =
	     z__h56171 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[8] ;
  assign z__h56185 =
	     z__h56178 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[9] ;
  assign z__h56192 =
	     z__h56185 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[10] ;
  assign z__h56199 =
	     z__h56192 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[11] ;
  assign z__h56206 =
	     z__h56199 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[12] ;
  assign z__h56213 =
	     z__h56206 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[13] ;
  assign z__h56220 =
	     z__h56213 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[14] ;
  assign z__h56227 =
	     z__h56220 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[15] ;
  assign z__h56234 =
	     z__h56227 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[16] ;
  assign z__h56241 =
	     z__h56234 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[17] ;
  assign z__h56248 =
	     z__h56241 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[18] ;
  assign z__h56255 =
	     z__h56248 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[19] ;
  assign z__h56262 =
	     z__h56255 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[20] ;
  assign z__h56269 =
	     z__h56262 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[21] ;
  assign z__h56276 =
	     z__h56269 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[22] ;
  assign z__h56283 =
	     z__h56276 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[23] ;
  assign z__h56290 =
	     z__h56283 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[24] ;
  assign z__h56297 =
	     z__h56290 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[25] ;
  assign z__h56304 =
	     z__h56297 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[26] ;
  assign z__h56311 =
	     z__h56304 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[27] ;
  assign z__h56318 =
	     z__h56311 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[28] ;
  assign z__h56325 =
	     z__h56318 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[29] ;
  assign z__h56332 =
	     z__h56325 ^
	     pciw_pci0_pcie_ep_ava_debug__52_OR_0_CONCAT_pc_ETC___d831[30] ;
  always@(IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2)
  begin
    case (IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci0_r_ETC__q2[2:0])
      3'd0: IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787 = 16'h0;
      3'd1:
	  IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787 =
	      16'h000F;
      3'd2:
	  IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787 =
	      16'h00FF;
      3'd3:
	  IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787 =
	      16'h0FFF;
      default: IF_IF_IF_pciw_pci0_rxInFlight_76_THEN_pciw_pci_ETC___d787 =
		   16'hFFFF;
    endcase
  end

  // handling of inlined registers

  always@(posedge pciw_pci0_pcie_ep$ava_core_clk_out)
  begin
    if (pciw_pci0_pcie_ep$ava_srstn == `BSV_RESET_VALUE)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
//	pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_cfgDataWr <= `BSV_ASSIGNMENT_DELAY 1'h0;
	pciw_pci0_cfgSample <= `BSV_ASSIGNMENT_DELAY 1'h0;
	pciw_pci0_deviceReg <= `BSV_ASSIGNMENT_DELAY 16'hAAAA;
	pciw_pci0_rxDbgDeDeq <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgDeEof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgDeSof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgDestage <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgEnEnq <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgEnEof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgEnSof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgEnstage <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDbgInstage <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_rxDwrDeq <= `BSV_ASSIGNMENT_DELAY 11'd0;
	pciw_pci0_rxDwrEnq <= `BSV_ASSIGNMENT_DELAY 11'd0;
	pciw_pci0_rxDws_num_empty <= `BSV_ASSIGNMENT_DELAY 4'd8;
	pciw_pci0_rxDws_num_full <= `BSV_ASSIGNMENT_DELAY 4'd0;
	pciw_pci0_rxDws_vec <= `BSV_ASSIGNMENT_DELAY 256'd0;
	pciw_pci0_rxInF_countReg <= `BSV_ASSIGNMENT_DELAY 6'd0;
	pciw_pci0_rxInF_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	pciw_pci0_rxInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pciw_pci0_txDbgDeDeq <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgDeEof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgDeSof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgDestage <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgEnEnq <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgEnEof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgEnSof <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgEnstage <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDbgExstage <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pci0_txDwrDeq <= `BSV_ASSIGNMENT_DELAY 11'd0;
	pciw_pci0_txDwrEnq <= `BSV_ASSIGNMENT_DELAY 11'd0;
	pciw_pci0_txDws_num_empty <= `BSV_ASSIGNMENT_DELAY 4'd8;
	pciw_pci0_txDws_num_full <= `BSV_ASSIGNMENT_DELAY 4'd0;
	pciw_pci0_txDws_vec <= `BSV_ASSIGNMENT_DELAY 256'd0;
	pciw_pci0_txInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pciw_pci0_txOutF_countReg <= `BSV_ASSIGNMENT_DELAY 10'd0;
	pciw_pci0_txOutF_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	pciw_pci0_txReadyD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
//	if (pciDevice$EN) pciDevice <= `BSV_ASSIGNMENT_DELAY pciDevice$D_IN;
	if (pciw_pci0_cfgDataWr$EN)
	  pciw_pci0_cfgDataWr <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_cfgDataWr$D_IN;
	if (pciw_pci0_cfgSample$EN)
	  pciw_pci0_cfgSample <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_cfgSample$D_IN;
	if (pciw_pci0_deviceReg$EN)
	  pciw_pci0_deviceReg <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_deviceReg$D_IN;
	if (pciw_pci0_rxDbgDeDeq$EN)
	  pciw_pci0_rxDbgDeDeq <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgDeDeq$D_IN;
	if (pciw_pci0_rxDbgDeEof$EN)
	  pciw_pci0_rxDbgDeEof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgDeEof$D_IN;
	if (pciw_pci0_rxDbgDeSof$EN)
	  pciw_pci0_rxDbgDeSof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgDeSof$D_IN;
	if (pciw_pci0_rxDbgDestage$EN)
	  pciw_pci0_rxDbgDestage <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgDestage$D_IN;
	if (pciw_pci0_rxDbgEnEnq$EN)
	  pciw_pci0_rxDbgEnEnq <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgEnEnq$D_IN;
	if (pciw_pci0_rxDbgEnEof$EN)
	  pciw_pci0_rxDbgEnEof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgEnEof$D_IN;
	if (pciw_pci0_rxDbgEnSof$EN)
	  pciw_pci0_rxDbgEnSof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgEnSof$D_IN;
	if (pciw_pci0_rxDbgEnstage$EN)
	  pciw_pci0_rxDbgEnstage <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgEnstage$D_IN;
	if (pciw_pci0_rxDbgInstage$EN)
	  pciw_pci0_rxDbgInstage <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDbgInstage$D_IN;
	if (pciw_pci0_rxDwrDeq$EN)
	  pciw_pci0_rxDwrDeq <= `BSV_ASSIGNMENT_DELAY pciw_pci0_rxDwrDeq$D_IN;
	if (pciw_pci0_rxDwrEnq$EN)
	  pciw_pci0_rxDwrEnq <= `BSV_ASSIGNMENT_DELAY pciw_pci0_rxDwrEnq$D_IN;
	if (pciw_pci0_rxDws_num_empty$EN)
	  pciw_pci0_rxDws_num_empty <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDws_num_empty$D_IN;
	if (pciw_pci0_rxDws_num_full$EN)
	  pciw_pci0_rxDws_num_full <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDws_num_full$D_IN;
	if (pciw_pci0_rxDws_vec$EN)
	  pciw_pci0_rxDws_vec <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxDws_vec$D_IN;
	if (pciw_pci0_rxInF_countReg$EN)
	  pciw_pci0_rxInF_countReg <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxInF_countReg$D_IN;
	if (pciw_pci0_rxInF_levelsValid$EN)
	  pciw_pci0_rxInF_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxInF_levelsValid$D_IN;
	if (pciw_pci0_rxInFlight$EN)
	  pciw_pci0_rxInFlight <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_rxInFlight$D_IN;
	if (pciw_pci0_txDbgDeDeq$EN)
	  pciw_pci0_txDbgDeDeq <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgDeDeq$D_IN;
	if (pciw_pci0_txDbgDeEof$EN)
	  pciw_pci0_txDbgDeEof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgDeEof$D_IN;
	if (pciw_pci0_txDbgDeSof$EN)
	  pciw_pci0_txDbgDeSof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgDeSof$D_IN;
	if (pciw_pci0_txDbgDestage$EN)
	  pciw_pci0_txDbgDestage <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgDestage$D_IN;
	if (pciw_pci0_txDbgEnEnq$EN)
	  pciw_pci0_txDbgEnEnq <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgEnEnq$D_IN;
	if (pciw_pci0_txDbgEnEof$EN)
	  pciw_pci0_txDbgEnEof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgEnEof$D_IN;
	if (pciw_pci0_txDbgEnSof$EN)
	  pciw_pci0_txDbgEnSof <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgEnSof$D_IN;
	if (pciw_pci0_txDbgEnstage$EN)
	  pciw_pci0_txDbgEnstage <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgEnstage$D_IN;
	if (pciw_pci0_txDbgExstage$EN)
	  pciw_pci0_txDbgExstage <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDbgExstage$D_IN;
	if (pciw_pci0_txDwrDeq$EN)
	  pciw_pci0_txDwrDeq <= `BSV_ASSIGNMENT_DELAY pciw_pci0_txDwrDeq$D_IN;
	if (pciw_pci0_txDwrEnq$EN)
	  pciw_pci0_txDwrEnq <= `BSV_ASSIGNMENT_DELAY pciw_pci0_txDwrEnq$D_IN;
	if (pciw_pci0_txDws_num_empty$EN)
	  pciw_pci0_txDws_num_empty <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDws_num_empty$D_IN;
	if (pciw_pci0_txDws_num_full$EN)
	  pciw_pci0_txDws_num_full <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDws_num_full$D_IN;
	if (pciw_pci0_txDws_vec$EN)
	  pciw_pci0_txDws_vec <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txDws_vec$D_IN;
	if (pciw_pci0_txInFlight$EN)
	  pciw_pci0_txInFlight <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txInFlight$D_IN;
	if (pciw_pci0_txOutF_countReg$EN)
	  pciw_pci0_txOutF_countReg <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txOutF_countReg$D_IN;
	if (pciw_pci0_txOutF_levelsValid$EN)
	  pciw_pci0_txOutF_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      pciw_pci0_txOutF_levelsValid$D_IN;
	if (pciw_pci0_txReadyD$EN)
	  pciw_pci0_txReadyD <= `BSV_ASSIGNMENT_DELAY pciw_pci0_txReadyD$D_IN;
	if (pciw_pciDevice$EN)
	  pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY pciw_pciDevice$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    freeCnt = 32'hAAAAAAAA;
//    pciDevice = 16'hAAAA;
    pciw_pci0_cfgDataWr = 1'h0;
    pciw_pci0_cfgSample = 1'h0;
    pciw_pci0_deviceReg = 16'hAAAA;
    pciw_pci0_rxDbgDeDeq = 16'hAAAA;
    pciw_pci0_rxDbgDeEof = 16'hAAAA;
    pciw_pci0_rxDbgDeSof = 16'hAAAA;
    pciw_pci0_rxDbgDestage = 16'hAAAA;
    pciw_pci0_rxDbgEnEnq = 16'hAAAA;
    pciw_pci0_rxDbgEnEof = 16'hAAAA;
    pciw_pci0_rxDbgEnSof = 16'hAAAA;
    pciw_pci0_rxDbgEnstage = 16'hAAAA;
    pciw_pci0_rxDbgInstage = 16'hAAAA;
    pciw_pci0_rxDwrDeq = 11'h2AA;
    pciw_pci0_rxDwrEnq = 11'h2AA;
    pciw_pci0_rxDws_num_empty = 4'hA;
    pciw_pci0_rxDws_num_full = 4'hA;
    pciw_pci0_rxDws_vec =
	256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    pciw_pci0_rxInF_countReg = 6'h2A;
    pciw_pci0_rxInF_levelsValid = 1'h0;
    pciw_pci0_rxInFlight = 1'h0;
    pciw_pci0_txDbgDeDeq = 16'hAAAA;
    pciw_pci0_txDbgDeEof = 16'hAAAA;
    pciw_pci0_txDbgDeSof = 16'hAAAA;
    pciw_pci0_txDbgDestage = 16'hAAAA;
    pciw_pci0_txDbgEnEnq = 16'hAAAA;
    pciw_pci0_txDbgEnEof = 16'hAAAA;
    pciw_pci0_txDbgEnSof = 16'hAAAA;
    pciw_pci0_txDbgEnstage = 16'hAAAA;
    pciw_pci0_txDbgExstage = 16'hAAAA;
    pciw_pci0_txDwrDeq = 11'h2AA;
    pciw_pci0_txDwrEnq = 11'h2AA;
    pciw_pci0_txDws_num_empty = 4'hA;
    pciw_pci0_txDws_num_full = 4'hA;
    pciw_pci0_txDws_vec =
	256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    pciw_pci0_txInFlight = 1'h0;
    pciw_pci0_txOutF_countReg = 10'h2AA;
    pciw_pci0_txOutF_levelsValid = 1'h0;
    pciw_pci0_txReadyD = 1'h0;
    pciw_pciDevice = 16'hAAAA;
  end


  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // pci_ml605


