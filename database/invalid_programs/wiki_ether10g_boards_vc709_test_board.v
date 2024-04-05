//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2014 Xilinx, Inc. All rights reserved.
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
//
// Project    : Virtex-7 FPGA Gen3 Integrated Block for PCI Express
// File       : board.v
//-----------------------------------------------------------------------------
//
// Description: Top level testbench
//
//------------------------------------------------------------------------------

`timescale 1ps/100fs

`include "board_common.v"

`define SIMULATION
`ifdef IPI
  `define PCIE_PATH board.dut.PCIe_Path.pcie3_x8_ip.inst
  `define SIM_SPEEDUP_PATH board.dut.Ethernet_Path.sim_speedup_control
  `define DDR3_PATH board.dut.DDR3_Path.mig_axi_mm_dual.u_xt_connectivity_trd_mig_axi_mm_dual_0_mig
  `define RP_PATH board.RP.rport
`else
  `define PCIE_PATH board.dut.pcie_inst.inst
  `define SIM_SPEEDUP_PATH board.dut
  `define DDR3_PATH board.dut.mp_pfifo_inst.mig_axi_mm_dual
  `define RP_PATH board.RP.rport
`endif

module board;

  parameter          REF_CLK_FREQ       = 0 ;      // 0 - 100 MHz, 1 - 125 MHz,  2 - 250 MHz

  localparam         REF_CLK_HALF_CYCLE = (REF_CLK_FREQ == 0) ? 5000 :
                                          (REF_CLK_FREQ == 1) ? 4000 :
                                          (REF_CLK_FREQ == 2) ? 2000 : 0;

  localparam   [2:0] PF0_DEV_CAP_MAX_PAYLOAD_SIZE = 3'h2;
  localparam   [3:0] LINK_WIDTH = 4'h8;
  localparam   [2:0] LINK_SPEED = 3'h4;

`ifdef USE_PIPE_SIM
  parameter PIPE_SIM = "TRUE";
  defparam `PCIE_PATH.PIPE_SIM_MODE = "TRUE";
  defparam `PCIE_PATH.PL_EQ_BYPASS_PHASE23 = "TRUE";
  defparam `RP_PATH.PIPE_SIM_MODE = "TRUE";
`else
  parameter PIPE_SIM = "FALSE";
  defparam `PCIE_PATH.PIPE_SIM_MODE = "FALSE";
  defparam `RP_PATH.PIPE_SIM_MODE = "FALSE";

`endif

  `define EP `PCIE_PATH.pcie_top_i
  `define RP `RP_PATH.pcie_top_i

  `include "pipe_interconnect.v"

//- 5000 * 1ps = 5ns, 200 MHz clock - used for DDR3 MCB
`define MCB_REF_CLK 5000
//- 4288 * 1ps = 4.288ns, 233.2 MHz clock - used for DDR3 MCB
`define MCB_SYS_CLK 4288
//- 6400 * 1ps = 6.4ns, 156.25 MHz clock - used for 10G PHY
`define XG_REF_CLK  6400

reg clk_ref, sys_clk;
reg clk_156;

`ifdef USE_DDR3_FIFO
localparam MEMORY_WIDTH = 8;
localparam CS_WIDTH = 1;
localparam CKE_WIDTH = 1;
localparam CK_WIDTH =1;
localparam nCS_PER_RANK = 1;
localparam ROW_ADDR = 16;
localparam DQ_WIDTH = 64;
localparam NUM_COMP = DQ_WIDTH/MEMORY_WIDTH;
`ifdef IPI
  defparam `DDR3_PATH.C0_SIMULATION = "TRUE";
  defparam `DDR3_PATH.C1_SIMULATION = "TRUE";
  defparam `DDR3_PATH.C0_SIM_BYPASS_INIT_CAL = "FAST";
  defparam `DDR3_PATH.C0_SIM_BYPASS_INIT_CAL = "FAST";
`endif

wire [ROW_ADDR-1:0]                      c0_ddr_addr;               
wire [CK_WIDTH-1:0]                      c0_ddr_ck_p;                 
wire [CK_WIDTH-1:0]                      c0_ddr_ck_n;               
wire [CKE_WIDTH-1:0]                     c0_ddr_cke;                
wire [(CS_WIDTH*nCS_PER_RANK)-1:0]       c0_ddr_cs_n;               
wire [(CS_WIDTH*nCS_PER_RANK)-1:0]       c0_ddr_odt;               
wire [2:0]                               c0_ddr_ba;                 
wire                                     c0_ddr_cas_n;              
wire [7:0]                               c0_ddr_dm;                 
wire [63:0]                              c0_ddr_dq;                 
wire [7:0]                               c0_ddr_dqs;                
wire [7:0]                               c0_ddr_dqs_n;              
wire                                     c0_ddr_ras_n;              
wire                                     c0_ddr_reset_n;            
wire                                     c0_ddr_we_n;               

wire [ROW_ADDR-1:0]                      c1_ddr_addr;               
wire [CK_WIDTH-1:0]                      c1_ddr_ck_p;                 
wire [CK_WIDTH-1:0]                      c1_ddr_ck_n;               
wire [CKE_WIDTH-1:0]                     c1_ddr_cke;                
wire [(CS_WIDTH*nCS_PER_RANK)-1:0]       c1_ddr_cs_n;               
wire [(CS_WIDTH*nCS_PER_RANK)-1:0]       c1_ddr_odt;               
wire [2:0]                               c1_ddr_ba;                 
wire                                     c1_ddr_cas_n;              
wire [7:0]                               c1_ddr_dm;                 
wire [63:0]                              c1_ddr_dq;                 
wire [7:0]                               c1_ddr_dqs;                
wire [7:0]                               c1_ddr_dqs_n;              
wire                                     c1_ddr_ras_n;              
wire                                     c1_ddr_reset_n;            
wire                                     c1_ddr_we_n;               
`endif

  integer            i;

  // System-level clock and reset
  reg                sys_rst_n;

  reg                rp_sys_clk;

  //
  // PCI-Express Serial Interconnect
  //

  wire  [(LINK_WIDTH-1):0]  ep_pci_exp_txn;
  wire  [(LINK_WIDTH-1):0]  ep_pci_exp_txp;
  wire  [(LINK_WIDTH-1):0]  rp_pci_exp_txn;
  wire  [(LINK_WIDTH-1):0]  rp_pci_exp_txp;

`ifdef USE_XPHY
  wire xphy0_txp, xphy0_txn, xphy0_rxp, xphy0_rxn;
  wire xphy1_txp, xphy1_txn, xphy1_rxp, xphy1_rxn;
  wire xphy2_txp, xphy2_txn, xphy2_rxp, xphy2_rxn;
  wire xphy3_txp, xphy3_txn, xphy3_rxp, xphy3_rxn;
`endif
  //
  // PCI-Express Model Root Port Instance
  //

  xilinx_pcie_3_0_7vx_rp #(
     .PL_LINK_CAP_MAX_LINK_WIDTH(LINK_WIDTH),
     .PL_LINK_CAP_MAX_LINK_SPEED(LINK_SPEED),
     .PF0_DEV_CAP_MAX_PAYLOAD_SIZE(PF0_DEV_CAP_MAX_PAYLOAD_SIZE)
  ) RP (

    // SYS Inteface
    .sys_clk_n(rp_sys_clk),
    .sys_clk_p(~rp_sys_clk),
    .sys_rst_n(sys_rst_n),

    // PCI-Express Interface
    .pci_exp_txn(rp_pci_exp_txn),
    .pci_exp_txp(rp_pci_exp_txp),
    .pci_exp_rxn(ep_pci_exp_txn),
    .pci_exp_rxp(ep_pci_exp_txp)

  );

  //
  // PCI-Express Endpoint Instance
  //
  xt_connectivity_trd dut (

    .perst_n    (sys_rst_n),        // PCI Express slot PERST# reset signal
        
    .pcie_clk_p (rp_sys_clk),     // PCIe differential reference clock input
    .pcie_clk_n (~rp_sys_clk),     // PCIe differential reference clock input
    .pcie_tx_p  (ep_pci_exp_txp),           // PCIe differential transmit output
    .pcie_tx_n  (ep_pci_exp_txn),           // PCIe differential transmit output
    .pcie_rx_p  (rp_pci_exp_txp),           // PCIe differential receive output
    .pcie_rx_n  (rp_pci_exp_txn),           // PCIe differential receive output
    .clk_ref_p  (clk_ref  ),
    .clk_ref_n  (~clk_ref  ),
`ifdef USE_DDR3_FIFO

    .c0_ddr3_addr          (c0_ddr_addr),
    .c0_ddr3_ba            (c0_ddr_ba),
    .c0_ddr3_cas_n         (c0_ddr_cas_n),
    .c0_ddr3_ck_p          (c0_ddr_ck_p),
    .c0_ddr3_ck_n          (c0_ddr_ck_n),
    .c0_ddr3_cke           (c0_ddr_cke),
    .c0_ddr3_cs_n          (c0_ddr_cs_n),
    .c0_ddr3_dm            (c0_ddr_dm),
    .c0_ddr3_dq            (c0_ddr_dq),
    .c0_ddr3_dqs_p         (c0_ddr_dqs),
    .c0_ddr3_dqs_n         (c0_ddr_dqs_n),
    .c0_ddr3_odt           (c0_ddr_odt),
    .c0_ddr3_ras_n         (c0_ddr_ras_n),
    .c0_ddr3_reset_n       (c0_ddr_reset_n),
    .c0_ddr3_we_n          (c0_ddr_we_n),

    .c1_ddr3_addr          (c1_ddr_addr),
    .c1_ddr3_ba            (c1_ddr_ba),
    .c1_ddr3_cas_n         (c1_ddr_cas_n),
    .c1_ddr3_ck_p          (c1_ddr_ck_p),
    .c1_ddr3_ck_n          (c1_ddr_ck_n),
    .c1_ddr3_cke           (c1_ddr_cke),
    .c1_ddr3_cs_n          (c1_ddr_cs_n),
    .c1_ddr3_dm            (c1_ddr_dm),
    .c1_ddr3_dq            (c1_ddr_dq),
    .c1_ddr3_dqs_p         (c1_ddr_dqs),
    .c1_ddr3_dqs_n         (c1_ddr_dqs_n),
    .c1_ddr3_odt           (c1_ddr_odt),
    .c1_ddr3_ras_n         (c1_ddr_ras_n),
    .c1_ddr3_reset_n       (c1_ddr_reset_n),
    .c1_ddr3_we_n          (c1_ddr_we_n),

`endif
`ifndef DMA_LOOPBACK
    .xphy_refclk_clk_p          (clk_156),
    .xphy_refclk_clk_n          (~clk_156),
`endif
`ifdef USE_XPHY
    .xphy0_txp              (xphy0_txp),
    .xphy0_txn              (xphy0_txn),
    .xphy0_rxp              (xphy0_rxp),
    .xphy0_rxn              (xphy0_rxn),
    .xphy1_txp              (xphy1_txp),
    .xphy1_txn              (xphy1_txn),
    .xphy1_rxp              (xphy1_rxp),
    .xphy1_rxn              (xphy1_rxn),
    .xphy2_txp              (xphy2_txp),
    .xphy2_txn              (xphy2_txn),
    .xphy2_rxp              (xphy2_rxp),
    .xphy2_rxn              (xphy2_rxn),
    .xphy3_txp              (xphy3_txp),
    .xphy3_txn              (xphy3_txn),
    .xphy3_rxp              (xphy3_rxp),
    .xphy3_rxn              (xphy3_rxn),
`endif

    .led ()            // Diagnostic LEDs
 
    );

`ifdef USE_XPHY
  assign xphy0_rxp  = xphy0_txp;
  assign xphy0_rxn  = xphy0_txn;
  assign xphy1_rxp  = xphy1_txp;
  assign xphy1_rxn  = xphy1_txn;

  assign xphy2_rxp  = xphy2_txp;
  assign xphy2_rxn  = xphy2_txn;
  assign xphy3_rxp  = xphy3_txp;
  assign xphy3_rxn  = xphy3_txn;
  
  reg sim_speedup_reg1 = 1'b0;
  reg sim_speedup_control = 1'b0;
  
  // Create a rising edge on sim_speedup_control to
  // trigger simulation mode in PCS/PMA core
  always @(posedge clk_156)
  begin
    if (glbl.GSR == 1'b0) begin
      sim_speedup_reg1 <= 1'b1;
      sim_speedup_control <= sim_speedup_reg1;
    end
  end
  
  assign `SIM_SPEEDUP_PATH.sim_speedup_control = sim_speedup_control;

`endif


  initial begin

    $display("[%t] : System Reset Asserted...", $realtime);

    sys_rst_n = 1'b0;

    for (i = 0; i < 500; i = i + 1) begin
      @(posedge rp_sys_clk);

    end

    $display("[%t] : System Reset De-asserted...", $realtime);

    sys_rst_n = 1'b1;

  end

  //- 100MHz clock generation for PCIe
  //- 2 * 5000 * 1ps = 10ns, 100MHz
  initial
  begin
    rp_sys_clk  = 1'b0;
    forever #(REF_CLK_HALF_CYCLE) rp_sys_clk  = ~rp_sys_clk;
  end

 // MCB clock generation
 initial 
 begin 
  clk_ref = 1'b0;
  forever #(`MCB_REF_CLK/2) clk_ref = ~clk_ref;
 end

`ifdef USE_DDR3_FIFO
 initial
 begin
  sys_clk = 1'b0;
  forever #(`MCB_SYS_CLK/2) sys_clk = ~sys_clk;
 end

`endif


 initial
 begin
  clk_156 = 1'b0;
  forever #(`XG_REF_CLK/2) clk_156 = ~clk_156;
 end



  `ifdef USE_DDR3_FIFO
//
// Instantiate memories
//

genvar c0_i,c0_r;
  for (c0_r = 0; c0_r < CS_WIDTH; c0_r = c0_r + 1) begin: c0_mem_rnk
    for (c0_i = 0; c0_i < NUM_COMP; c0_i = c0_i + 1) begin: c0_gen_mem
      
          c0_ddr3_model #(
            .DEBUG (0)
          ) c0_u_comp_ddr3
            (
             .rst_n   (c0_ddr_reset_n),
             .ck      (c0_ddr_ck_p[(c0_i*MEMORY_WIDTH)/72]),
             .ck_n    (c0_ddr_ck_n[(c0_i*MEMORY_WIDTH)/72]),
             .cke     (c0_ddr_cke[((c0_i*MEMORY_WIDTH)/72)+(nCS_PER_RANK*c0_r)]),
             .cs_n    (c0_ddr_cs_n[((c0_i*MEMORY_WIDTH)/72)+(nCS_PER_RANK*c0_r)]),
             .ras_n   (c0_ddr_ras_n),
             .cas_n   (c0_ddr_cas_n),
             .we_n    (c0_ddr_we_n),
             .dm_tdqs (c0_ddr_dm[c0_i]),
             .ba      (c0_ddr_ba),
             .addr    (c0_ddr_addr),
             .dq      (c0_ddr_dq[MEMORY_WIDTH*(c0_i+1)-1:MEMORY_WIDTH*(c0_i)]),
             .dqs     (c0_ddr_dqs[c0_i]),
             .dqs_n   (c0_ddr_dqs_n[c0_i]),
             .tdqs_n  (),
             .odt     (c0_ddr_odt[((c0_i*MEMORY_WIDTH)/72)+(nCS_PER_RANK*c0_r)])
             );
      end
    end  

genvar c1_i,c1_r;
  for (c1_r = 0; c1_r < CS_WIDTH; c1_r = c1_r + 1) begin: c1_mem_rnk
    for (c1_i = 0; c1_i < NUM_COMP; c1_i = c1_i + 1) begin: c1_gen_mem
      
          c1_ddr3_model #(
            .DEBUG (0)
          ) c1_u_comp_ddr3
            (
             .rst_n   (c1_ddr_reset_n),
             .ck      (c1_ddr_ck_p[(c1_i*MEMORY_WIDTH)/72]),
             .ck_n    (c1_ddr_ck_n[(c1_i*MEMORY_WIDTH)/72]),
             .cke     (c1_ddr_cke[((c1_i*MEMORY_WIDTH)/72)+(nCS_PER_RANK*c1_r)]),
             .cs_n    (c1_ddr_cs_n[((c1_i*MEMORY_WIDTH)/72)+(nCS_PER_RANK*c1_r)]),
             .ras_n   (c1_ddr_ras_n),
             .cas_n   (c1_ddr_cas_n),
             .we_n    (c1_ddr_we_n),
             .dm_tdqs (c1_ddr_dm[c1_i]),
             .ba      (c1_ddr_ba),
             .addr    (c1_ddr_addr),
             .dq      (c1_ddr_dq[MEMORY_WIDTH*(c1_i+1)-1:MEMORY_WIDTH*(c1_i)]),
             .dqs     (c1_ddr_dqs[c1_i]),
             .dqs_n   (c1_ddr_dqs_n[c1_i]),
             .tdqs_n  (),
             .odt     (c1_ddr_odt[((c1_i*MEMORY_WIDTH)/72)+(nCS_PER_RANK*c1_r)])
             );
      end
    end  

  `endif


endmodule // BOARD
