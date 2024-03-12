//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
//
// Copyright 2016,2017 International Business Machines
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions AND
// limitations under the License.
//
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------

`timescale 1ns / 1ps
module nvme_model (
    sys_reset_n,
    pcie_rc0_rxn,
    pcie_rc0_rxp,
    pcie_rc0_txn,
    pcie_rc0_txp,
    pcie_rc1_rxn,
    pcie_rc1_rxp,
    pcie_rc1_txn,
    pcie_rc1_txp
);

   input        sys_reset_n;
   input  [3:0] pcie_rc0_rxn;
   input  [3:0] pcie_rc0_rxp;
   output [3:0] pcie_rc0_txn;
   output [3:0] pcie_rc0_txp;
   input  [3:0] pcie_rc1_rxn;
   input  [3:0] pcie_rc1_rxp;
   output [3:0] pcie_rc1_txn;
   output [3:0] pcie_rc1_txp;



   initial
     begin
        `ifndef VERDI
        `ifndef NOVCD
        `ifdef CADENCE
        $dumpfile("test.vcd");
        `else
        $dumpfile("test.vcd.gz");
        `endif
 //       $dumpvars(0,surelockex_sim);
        `endif
        `else
        $fsdbDumpfile("test.fsdb",800);
//        $fsdbDumpvars(0,surelockex_sim);
//        $fsdbDumpvars(0,surelock_sim.afu.iFC,"+all");
        `endif
  end

   integer status;
   wire [3:0]pcie_rc0_rxn = 4'h0;
   wire [3:0]pcie_rc0_rxp = 4'h0;

   wire [3:0]pcie_rc1_rxn = 4'h0;
   wire [3:0]pcie_rc1_rxp = 4'h0;


   wire [25:0] pipe_common_commands_in_rp_0;
   wire [83:0] pipe_rx_0_rp_0;
   wire [83:0] pipe_rx_1_rp_0;
   wire [83:0] pipe_rx_2_rp_0;
   wire [83:0] pipe_rx_3_rp_0;
   wire [83:0] pipe_rx_4_rp_0;
   wire [83:0] pipe_rx_5_rp_0;
   wire [83:0] pipe_rx_6_rp_0;
   wire [83:0] pipe_rx_7_rp_0;

   wire [16:0] pipe_common_commands_out_rp_0;
   wire [69:0] pipe_tx_0_rp_0;
   wire [69:0] pipe_tx_1_rp_0;
   wire [69:0] pipe_tx_2_rp_0;
   wire [69:0] pipe_tx_3_rp_0;
   wire [69:0] pipe_tx_4_rp_0;
   wire [69:0] pipe_tx_5_rp_0;
   wire [69:0] pipe_tx_6_rp_0;
   wire [69:0] pipe_tx_7_rp_0;

   wire [25:0] pipe_common_commands_in_rp_1;
   wire [83:0] pipe_rx_0_rp_1;
   wire [83:0] pipe_rx_1_rp_1;
   wire [83:0] pipe_rx_2_rp_1;
   wire [83:0] pipe_rx_3_rp_1;
   wire [83:0] pipe_rx_4_rp_1;
   wire [83:0] pipe_rx_5_rp_1;
   wire [83:0] pipe_rx_6_rp_1;
   wire [83:0] pipe_rx_7_rp_1;

   wire [16:0] pipe_common_commands_out_rp_1;
   wire [69:0] pipe_tx_0_rp_1;
   wire [69:0] pipe_tx_1_rp_1;
   wire [69:0] pipe_tx_2_rp_1;
   wire [69:0] pipe_tx_3_rp_1;
   wire [69:0] pipe_tx_4_rp_1;
   wire [69:0] pipe_tx_5_rp_1;
   wire [69:0] pipe_tx_6_rp_1;
   wire [69:0] pipe_tx_7_rp_1;

   wire   pcie_clk_p;
   wire   pcie_clk_n;

   wire [2:0] cfg_speed_0;
   wire [3:0] cfg_width_0;
   wire [2:0] cfg_speed_1;
   wire [3:0] cfg_width_1;


   `define DUTP0 a0.nvme_top_i.axi_pcie3_0.inst.pcie3_ip_i.inst
   `define DUTP2 a0.nvme_top_i.axi_pcie3_1.inst.pcie3_ip_i.inst


   `define DUTe a0.nvme_top_i



//   `define DUTP1 afu
   `define DUTP1 a0              // ?????
   defparam a0.nvme_top_i.axi_pcie3_0.inst.pcie3_ip_i.inst.EXT_PIPE_SIM = "TRUE";
   defparam a0.nvme_top_i.axi_pcie3_0.inst.pcie3_ip_i.inst.PL_DISABLE_GEN3_DC_BALANCE = "TRUE";
   defparam a0.nvme_top_i.axi_pcie3_1.inst.pcie3_ip_i.inst.PL_DISABLE_GEN3_DC_BALANCE = "TRUE";
   defparam a0.nvme_top_i.axi_pcie3_1.inst.pcie3_ip_i.inst.EXT_PIPE_SIM = "TRUE";


   assign `DUTP0.common_commands_in = pipe_common_commands_in_rp_0;
   assign `DUTP0.pipe_rx_0_sigs     = pipe_rx_0_rp_0;
   assign `DUTP0.pipe_rx_1_sigs     = pipe_rx_1_rp_0;
   assign `DUTP0.pipe_rx_2_sigs     = pipe_rx_2_rp_0;
   assign `DUTP0.pipe_rx_3_sigs     = pipe_rx_3_rp_0;
   assign `DUTP0.pipe_rx_4_sigs     = pipe_rx_4_rp_0;
   assign `DUTP0.pipe_rx_5_sigs     = pipe_rx_5_rp_0;
   assign `DUTP0.pipe_rx_6_sigs     = pipe_rx_6_rp_0;
   assign `DUTP0.pipe_rx_7_sigs     = pipe_rx_7_rp_0;


   assign `DUTP2.common_commands_in = pipe_common_commands_in_rp_1;
   assign `DUTP2.pipe_rx_0_sigs     = pipe_rx_0_rp_1;
   assign `DUTP2.pipe_rx_1_sigs     = pipe_rx_1_rp_1;
   assign `DUTP2.pipe_rx_2_sigs     = pipe_rx_2_rp_1;
   assign `DUTP2.pipe_rx_3_sigs     = pipe_rx_3_rp_1;
   assign `DUTP2.pipe_rx_4_sigs     = pipe_rx_4_rp_1;
   assign `DUTP2.pipe_rx_5_sigs     = pipe_rx_5_rp_1;
   assign `DUTP2.pipe_rx_6_sigs     = pipe_rx_6_rp_1;
   assign `DUTP2.pipe_rx_7_sigs     = pipe_rx_7_rp_1;

   assign  pipe_common_commands_out_rp_0 = `DUTP0.common_commands_out;
   assign  pipe_tx_0_rp_0                = `DUTP0.pipe_tx_0_sigs;
   assign  pipe_tx_1_rp_0                = `DUTP0.pipe_tx_1_sigs;
   assign  pipe_tx_2_rp_0                = `DUTP0.pipe_tx_2_sigs;
   assign  pipe_tx_3_rp_0                = `DUTP0.pipe_tx_3_sigs;
   assign  pipe_tx_4_rp_0                = `DUTP0.pipe_tx_4_sigs;
   assign  pipe_tx_5_rp_0                = `DUTP0.pipe_tx_5_sigs;
   assign  pipe_tx_6_rp_0                = `DUTP0.pipe_tx_6_sigs;
   assign  pipe_tx_7_rp_0                = `DUTP0.pipe_tx_7_sigs;

   assign  pipe_common_commands_out_rp_1 = `DUTP2.common_commands_out;
   assign  pipe_tx_0_rp_1                = `DUTP2.pipe_tx_0_sigs;
   assign  pipe_tx_1_rp_1                = `DUTP2.pipe_tx_1_sigs;
   assign  pipe_tx_2_rp_1                = `DUTP2.pipe_tx_2_sigs;
   assign  pipe_tx_3_rp_1                = `DUTP2.pipe_tx_3_sigs;
   assign  pipe_tx_4_rp_1                = `DUTP2.pipe_tx_4_sigs;
   assign  pipe_tx_5_rp_1                = `DUTP2.pipe_tx_5_sigs;
   assign  pipe_tx_6_rp_1                = `DUTP2.pipe_tx_6_sigs;
   assign  pipe_tx_7_rp_1                = `DUTP2.pipe_tx_7_sigs;

   assign cfg_speed_0 = a0.nvme_top_i.axi_pcie3_0.inst.cfg_current_speed[2:0];
   assign cfg_width_0 = a0.nvme_top_i.axi_pcie3_0.inst.cfg_negotiated_width[3:0];

   assign cfg_speed_1 = a0.nvme_top_i.axi_pcie3_1.inst.cfg_current_speed[2:0];
   assign cfg_width_1 = a0.nvme_top_i.axi_pcie3_1.inst.cfg_negotiated_width[3:0];


`include "denaliPcieTypes.v"
`include "denaliPcieErrTable.v"
denaliPcie den();

   integer ep_id0;
   integer ep_id1;
   integer ep_cfg_id0;
   integer ep_cfg_id1;
   integer ep_adminsq0;
   integer ep_adminsq1;
   integer ep_nsid0;
   integer ep_nvmeregs;
   integer ep_nvmeregs_1;
   integer pcie_status;
   reg [31:0] pcie_data;


   pcie_endp_model pcie_endp_model0
     (/*AUTOINST*/
      // Outputs
      .pipe_common_commands_in_rp(pipe_common_commands_in_rp_0[25:0]),
      .pipe_rx_0_rp       (pipe_rx_0_rp_0[83:0]),
      .pipe_rx_1_rp       (pipe_rx_1_rp_0[83:0]),
      .pipe_rx_2_rp       (pipe_rx_2_rp_0[83:0]),
      .pipe_rx_3_rp       (pipe_rx_3_rp_0[83:0]),
      .pipe_rx_4_rp       (pipe_rx_4_rp_0[83:0]),
      .pipe_rx_5_rp       (pipe_rx_5_rp_0[83:0]),
      .pipe_rx_6_rp       (pipe_rx_6_rp_0[83:0]),
      .pipe_rx_7_rp       (pipe_rx_7_rp_0[83:0]),
      // Inputs
      .pipe_common_commands_out_rp(pipe_common_commands_out_rp_0[16:0]),
      .pipe_tx_0_rp       (pipe_tx_0_rp_0[69:0]),
      .pipe_tx_1_rp       (pipe_tx_1_rp_0[69:0]),
      .pipe_tx_2_rp       (pipe_tx_2_rp_0[69:0]),
      .pipe_tx_3_rp       (pipe_tx_3_rp_0[69:0]),
      .pipe_tx_4_rp       (pipe_tx_4_rp_0[69:0]),
      .pipe_tx_5_rp       (pipe_tx_5_rp_0[69:0]),
      .pipe_tx_6_rp       (pipe_tx_6_rp_0[69:0]),
      .pipe_tx_7_rp       (pipe_tx_7_rp_0[69:0]),
      .sys_rst_n          (sys_reset_n),
      .nperst             (sys_reset_n)
      );

    pcie_endp_model pcie_endp_model1
      (
      .pipe_common_commands_in_rp(pipe_common_commands_in_rp_1[25:0]),
      .pipe_rx_0_rp       (pipe_rx_0_rp_1[83:0]),
      .pipe_rx_1_rp       (pipe_rx_1_rp_1[83:0]),
      .pipe_rx_2_rp       (pipe_rx_2_rp_1[83:0]),
      .pipe_rx_3_rp       (pipe_rx_3_rp_1[83:0]),
      .pipe_rx_4_rp       (pipe_rx_4_rp_1[83:0]),
      .pipe_rx_5_rp       (pipe_rx_5_rp_1[83:0]),
      .pipe_rx_6_rp       (pipe_rx_6_rp_1[83:0]),
      .pipe_rx_7_rp       (pipe_rx_7_rp_1[83:0]),
      .pipe_common_commands_out_rp(pipe_common_commands_out_rp_1[16:0]),
      .pipe_tx_0_rp       (pipe_tx_0_rp_1[69:0]),
      .pipe_tx_1_rp       (pipe_tx_1_rp_1[69:0]),
      .pipe_tx_2_rp       (pipe_tx_2_rp_1[69:0]),
      .pipe_tx_3_rp       (pipe_tx_3_rp_1[69:0]),
      .pipe_tx_4_rp       (pipe_tx_4_rp_1[69:0]),
      .pipe_tx_5_rp       (pipe_tx_5_rp_1[69:0]),
      .pipe_tx_6_rp       (pipe_tx_6_rp_1[69:0]),
      .pipe_tx_7_rp       (pipe_tx_7_rp_1[69:0]),
      .sys_rst_n          (sys_reset_n),
      .nperst             (sys_reset_n)
      );

     initial
     begin
        ep_id0 = $mminstanceid("pcie_endp_model0.endp");
        $display("Created endpoint memory instance\n");
 	ep_cfg_id0 = $mminstanceid ("pcie_endp_model0.endp(cfg_0_0)");
        $display("Created endpoint configuration space instance\n");
 	ep_adminsq0 = $mminstanceid ("pcie_endp_model0.endp(AdminSQ_0)");
     	$display("Created admin submission queue memory instance\n");
 	   ep_nvmeregs = $mminstanceid("pcie_endp_model0.endp(mem_0_0_0)");
 	$display("Created nvme register space memory instance\n");
 	#1

 	ep_id1 = $mminstanceid("pcie_endp_model1.endp");
        $display("Created endpoint memory instance\n");
        ep_cfg_id1 = $mminstanceid ("pcie_endp_model1.endp(cfg_0_0)");
        $display("Created endpoint configuration space instance\n");
        ep_adminsq1 = $mminstanceid ("pcie_endp_model1.endp(AdminSQ_0)");
        $display("Created admin submission queue memory instance\n");
        ep_nvmeregs_1 = $mminstanceid("pcie_endp_model1.endp(mem_0_0_0)");
        $display("Created nvme register space memory instance\n");
        #1



 // gen3 equalization phase - errors reported for illegal FC/C values in TS1
 // // sim isn't trying to validate the xilinx pcie IP, so ignore these
 	pcie_data = (PCIE_ERR_DESTINATION_none << 25) + (PCIE_ERR_CONFIG_disable_callback<<7) + (PCIE_ERR_CONFIG_DIRECTION_RX << 4) + PCIE_ERR_CONFIG_FORMAT_INFO;
 	pcie_status = $mmwriteword4( ep_cfg_id0, PCIE_REG_DEN_ERROR_CTRL,  pcie_data + (PCIE_PL_NONFATAL_8GT_EQ_FS_RNG_PHx<< 8));
 	pcie_status = $mmwriteword4( ep_cfg_id0, PCIE_REG_DEN_ERROR_CTRL,  pcie_data + (PCIE_PL_NONFATAL_8GT_EQ_COND_a<< 8));
 	pcie_status = $mmwriteword4( ep_cfg_id0, PCIE_REG_DEN_ERROR_CTRL,  pcie_data + (PCIE_PL_NONFATAL_8GT_EQ_COND_c<< 8));

 	pcie_data = (PCIE_ERR_DESTINATION_none << 25) + (PCIE_ERR_CONFIG_disable_callback<<7) + (PCIE_ERR_CONFIG_DIRECTION_RX << 4) + PCIE_ERR_CONFIG_FORMAT_INFO;
        pcie_status = $mmwriteword4( ep_cfg_id1, PCIE_REG_DEN_ERROR_CTRL,  pcie_data + (PCIE_PL_NONFATAL_8GT_EQ_FS_RNG_PHx<< 8));
        pcie_status = $mmwriteword4( ep_cfg_id1, PCIE_REG_DEN_ERROR_CTRL,  pcie_data + (PCIE_PL_NONFATAL_8GT_EQ_COND_a<< 8));
        pcie_status = $mmwriteword4( ep_cfg_id1, PCIE_REG_DEN_ERROR_CTRL,  pcie_data + (PCIE_PL_NONFATAL_8GT_EQ_COND_c<< 8));

 	$display("I've reached here before waitDLactive\n");
//	waitPLactive(ep_cfg_id0);
 	$display("Waiting on links of SSDs to be active\n");    @(posedge ( a0.nvme_top_i.axi_pcie3_0.user_link_up && a0.nvme_top_i.axi_pcie3_1.user_link_up));
// 	$display("Waiting on link of SSD1 to be active\n"); 	@(posedge ( a0.nvme_top_i.axi_pcie3_1.user_link_up));
 	$display("Link Training done");
 	$display("Link speed for SSD0 - Trained to G3[%x] - G2[%x] - G1[%x] ",cfg_speed_0[2],cfg_speed_0[1], cfg_speed_0[0]);
 	$display("Link Width for SSD0 - Trained to x%x", cfg_width_0);
//	waitDLactive(ep_cfg_id0);//Not sure if TB needs to waits for DL to be up at this point
//	$display("Post waitDLactive \n");

 	//Initialization sequence for PCIe AXI bridge root complex


//	$display("Waiting on link of SSD1 to be active\n");
  //      @(posedge afu.axi_pcie3_1.user_link_up);
    //    $display("Link Training done");
        $display("Link speed for SSD1 - Trained to G3[%x] - G2[%x] - G1[%x] ",cfg_speed_1[2],cfg_speed_1[1], cfg_speed_1[0]);
        $display("Link Width for SSD1 - Trained to x%x", cfg_width_1);
	//@(posedge(a0:snap_core_i:mmio_to_axi_master:nvme_q));


	$display("-------Configuring namespace for SSD0\n");
        nvme_write_cds(ep_adminsq0, NVME_CDS_FLD_NN, 32'h0000, 32'h0001);  // number of namespaces
        nvme_read_cds(ep_adminsq0, NVME_CDS_FLD_FR );  // Firmware Revision
        // nvme_write_cds(ep_adminsq0, NVME_CDS_FLD_FR, 32'h0000, {"FOOO"});  // Firmware Revision
	nvme_write_cds(ep_adminsq0, NVME_CDS_FLD_IEEE, 32'h0, 32'h00382500); //IEEE OUI
	$display("Configuring namespace\n");
        ep_nsid0 = 0;
        status = $mmwriteword4(ep_adminsq0, NVME_REG_Q_OP_INDEX, ep_nsid0);
        status = $mmwriteword4(ep_adminsq0, NVME_REG_Q_OP, NVME_QOP_CREATE_NDS);

        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_NSZE, 32'h00000000, 32'h000000B0);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_NCAP, 32'h00000000, 32'h000000B0);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_NUSE, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_NSFEAT, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_NLBAF, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_FLBAS, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_MC, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_DPC, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_DPS, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF0, 32'h0000, 32'h01090000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF1, 32'h0000, 32'h02000000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF2, 32'h0000, 32'h03000000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF3, 32'h0000, 32'h04000000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF4, 32'h0000, 32'h05000000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF5, 32'h0000, 32'h06000000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF6, 32'h0000, 32'h07000000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF7, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF8, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF9, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF10, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF11, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF12, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF13, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF14, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq0, ep_nsid0, NVME_NDS_FLD_LBAF15, 32'h0000, 32'h0000);


	$display("-------Configuring namespace of SSD1\n");
	nvme_write_cds(ep_adminsq1, NVME_CDS_FLD_NN, 32'h0000, 32'h0001);  // number of namespaces
        nvme_read_cds(ep_adminsq1, NVME_CDS_FLD_FR );  // Firmware Revision
	nvme_write_cds(ep_adminsq1, NVME_CDS_FLD_IEEE, 32'h0, 32'h00382500); //IEEE OUI
        $display("Configuring namespace\n");
        ep_nsid0 = 0;
        status = $mmwriteword4(ep_adminsq1, NVME_REG_Q_OP_INDEX, ep_nsid0);
        status = $mmwriteword4(ep_adminsq1, NVME_REG_Q_OP, NVME_QOP_CREATE_NDS);

	nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_NSZE, 32'h00000000, 32'h000000B0);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_NCAP, 32'h00000000, 32'h000000B0);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_NUSE, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_NSFEAT, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_NLBAF, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_FLBAS, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_MC, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_DPC, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_DPS, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF0, 32'h0000, 32'h01090000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF1, 32'h0000, 32'h02000000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF2, 32'h0000, 32'h03000000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF3, 32'h0000, 32'h04000000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF4, 32'h0000, 32'h05000000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF5, 32'h0000, 32'h06000000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF6, 32'h0000, 32'h07000000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF7, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF8, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF9, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF10, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF11, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF12, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF13, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF14, 32'h0000, 32'h0000);
        nvme_write_nds(ep_adminsq1, ep_nsid0, NVME_NDS_FLD_LBAF15, 32'h0000, 32'h0000);




      end

   task nvme_read_cds;
      input [31:0] id;
      input [31:0] field;
      reg   [31:0] data0, data1;
      begin
         status = $mmwriteword4(id, NVME_REG_Q_OP_INDEX, field);
         status = $mmwriteword4(id, NVME_REG_Q_OP, NVME_QOP_READ_CDS);
         status = $mmreadword2(id, NVME_REG_Q_DATA_0, data0);
         status = $mmreadword2(id, NVME_REG_Q_DATA_1, data1);
         $display(" data0: %x  data1: %x",data0, data1);
      end
    endtask

   task nvme_write_cds;
      input [31:0] id;
      input [31:0] field;
      input [31:0] data1;
      input [31:0] data0;
      begin
        status = $mmwriteword4(id, NVME_REG_Q_OP_INDEX, field);
        status = $mmwriteword4(id, NVME_REG_Q_DATA_0, data0);
        status = $mmwriteword4(id, NVME_REG_Q_DATA_1, data1);
        status = $mmwriteword4(id, NVME_REG_Q_OP, NVME_QOP_WRITE_CDS);
      end
   endtask // nvme_write_cds

    task nvme_write_nds;
      input [31:0] id;
      input [31:0] nsid;
      input [31:0] field;
      input [31:0] data1;
      input [31:0] data0;
      begin
        status = $mmwriteword4(id, NVME_REG_Q_OP_INDEX, nsid);
        status = $mmwriteword4(id, NVME_REG_Q_OP_INDEX_2, field);
        status = $mmwriteword4(id, NVME_REG_Q_DATA_0, data0);
        status = $mmwriteword4(id, NVME_REG_Q_DATA_1, data1);
        status = $mmwriteword4(id, NVME_REG_Q_OP, NVME_QOP_WRITE_NDS);

      end
    endtask



endmodule












