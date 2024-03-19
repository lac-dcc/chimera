//======================================================================
//
// pcie_axi.v
// ----------
// Wrapper for the PCIe and AXI backplane
//
// Author: Rolf Andersson (rolf@mechanicalmen.se)
//
//
// Copyright 2016-2021 Netnod Internet Exchange i Sverige AB
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module pcie_axi #(
		  parameter NUM_PCIE_LANES = 16,
		  parameter NUM_SLAVES = 8
		  )
   (
  input wire                   reset,
  input wire 		       pcie_perst,

  input wire 		       pcie_clk,
  input wire 		       pcie_clk_gt,

  input wire 		       clk_300MHz_p,
  input wire 		       clk_300MHz_n,

  output wire [NUM_PCIE_LANES-1:0] pci_exp_txp,
  output wire [NUM_PCIE_LANES-1:0] pci_exp_txn,
  input  wire [NUM_PCIE_LANES-1:0] pci_exp_rxp,
  input  wire [NUM_PCIE_LANES-1:0] pci_exp_rxn,

  output wire         axi_aresetn,
  output wire         axi_aclk,
  output wire [NUM_SLAVES*32-1:0]   m_axi_awaddr,
  output wire [NUM_SLAVES*3-1:0]    m_axi_awprot,
  output wire [NUM_SLAVES-1:0]      m_axi_awvalid,
  input wire  [NUM_SLAVES-1:0]      m_axi_awready,
  output wire [NUM_SLAVES*32-1:0]   m_axi_wdata,
  output wire [NUM_SLAVES*32/8-1:0] m_axi_wstrb,
  output wire [NUM_SLAVES-1:0]      m_axi_wvalid,
  input wire  [NUM_SLAVES-1:0]      m_axi_wready,
  input wire  [NUM_SLAVES*2-1:0]    m_axi_bresp,
  input wire  [NUM_SLAVES-1:0]      m_axi_bvalid,
  output wire [NUM_SLAVES-1:0]      m_axi_bready,
  output wire [NUM_SLAVES*32-1:0]   m_axi_araddr,
  output wire [NUM_SLAVES*3-1:0]    m_axi_arprot,
  output wire [NUM_SLAVES-1:0]      m_axi_arvalid,
  input wire  [NUM_SLAVES-1:0]      m_axi_arready,
  input wire  [NUM_SLAVES*32-1:0]   m_axi_rdata,
  input wire  [NUM_SLAVES*2-1:0]    m_axi_rresp,
  input wire  [NUM_SLAVES-1:0]      m_axi_rvalid,
  output wire [NUM_SLAVES-1:0]      m_axi_rready,
  output wire 	      user_link_up
);

  //----------------------------------------------------------------
  // Reset synchronizer
  //----------------------------------------------------------------
  wire interconnect_aresetn;

  ntps_top_rst_axi_pcie3_0_250M_0 rst_axi_pcie3_0_125M (
     .slowest_sync_clk     (axi_aclk),
     .ext_reset_in         (reset),
     .aux_reset_in         (1'b1),
     .mb_debug_sys_rst     (1'b0),
     .dcm_locked           (1'b1),
     .mb_reset             (),
     .bus_struct_reset     (),
     .peripheral_reset     (),
     .interconnect_aresetn (interconnect_aresetn),
     .peripheral_aresetn   (axi_aresetn)
  );

  //----------------------------------------------------------------
  // PCIe AXI bridge
  //----------------------------------------------------------------
  wire [31:0]  pcie_axi_araddr;
  wire [1:0]   pcie_axi_arburst;
  wire [3:0]   pcie_axi_arcache;
  wire [3:0]   pcie_axi_arid;
  wire [7:0]   pcie_axi_arlen;
  wire         pcie_axi_arlock;
  wire [2:0]   pcie_axi_arprot;
  wire         pcie_axi_arready;
  wire [2:0]   pcie_axi_arsize;
  wire         pcie_axi_arvalid;
  wire [31:0]  pcie_axi_awaddr;
  wire [1:0]   pcie_axi_awburst;
  wire [3:0]   pcie_axi_awcache;
  wire [3:0]   pcie_axi_awid;
  wire [7:0]   pcie_axi_awlen;
  wire         pcie_axi_awlock;
  wire [2:0]   pcie_axi_awprot;
  wire         pcie_axi_awready;
  wire [2:0]   pcie_axi_awsize;
  wire         pcie_axi_awvalid;
  wire [2:0]   pcie_axi_bid;
  wire         pcie_axi_bready;
  wire [1:0]   pcie_axi_bresp;
  wire         pcie_axi_bvalid;
  wire [255:0] pcie_axi_rdata;
  wire [2:0]   pcie_axi_rid;
  wire         pcie_axi_rlast;
  wire         pcie_axi_rready;
  wire [1:0]   pcie_axi_rresp;
  wire         pcie_axi_rvalid;
  wire [255:0] pcie_axi_wdata;
  wire         pcie_axi_wlast;
  wire         pcie_axi_wready;
  wire [31:0]  pcie_axi_wstrb;
  wire         pcie_axi_wvalid;

ntps_top_xdma_0 xdma_0 (
  // PCIe bus
  .sys_rst_n(pcie_perst),                 // input wire sys_rst_n
  .sys_clk(pcie_clk),                     // input wire sys_clk
  .sys_clk_gt(pcie_clk_gt),               // input wire sys_clk_gt
  .pci_exp_txp(pci_exp_txp),              // output wire [15 : 0] pci_exp_txp
  .pci_exp_txn(pci_exp_txn),              // output wire [15 : 0] pci_exp_txn
  .pci_exp_rxp(pci_exp_rxp),              // input wire [15 : 0] pci_exp_rxp
  .pci_exp_rxn(pci_exp_rxn),              // input wire [15 : 0] pci_exp_rxn

  // AXI resets and clock
  .axi_aclk(axi_aclk),                    // output wire axi_aclk
  .axi_aresetn(),                         // output wire axi_aresetn
  .axi_ctl_aresetn(),                     // output wire axi_ctl_aresetn

  // AXI master
  .m_axib_awid(pcie_axi_awid),            // output wire [3 : 0] m_axib_awid
  .m_axib_awaddr(pcie_axi_awaddr),        // output wire [31 : 0] m_axib_awaddr
  .m_axib_awlen(pcie_axi_awlen),          // output wire [7 : 0] m_axib_awlen
  .m_axib_awsize(pcie_axi_awsize),        // output wire [2 : 0] m_axib_awsize
  .m_axib_awburst(pcie_axi_awburst),      // output wire [1 : 0] m_axib_awburst
  .m_axib_awprot(pcie_axi_awprot),        // output wire [2 : 0] m_axib_awprot
  .m_axib_awvalid(pcie_axi_awvalid),      // output wire m_axib_awvalid
  .m_axib_awready(pcie_axi_awready),      // input wire m_axib_awready
  .m_axib_awlock(pcie_axi_awlock),        // output wire m_axib_awlock
  .m_axib_awcache(pcie_axi_awcache),      // output wire [3 : 0] m_axib_awcache
  .m_axib_wdata(pcie_axi_wdata),          // output wire [255 : 0] m_axib_wdata
  .m_axib_wstrb(pcie_axi_wstrb),          // output wire [31 : 0] m_axib_wstrb
  .m_axib_wlast(pcie_axi_wlast),          // output wire m_axib_wlast
  .m_axib_wvalid(pcie_axi_wvalid),        // output wire m_axib_wvalid
  .m_axib_wready(pcie_axi_wready),        // input wire m_axib_wready
  .m_axib_bid(pcie_axi_bid),              // input wire [3 : 0] m_axib_bid
  .m_axib_bresp(pcie_axi_bresp),          // input wire [1 : 0] m_axib_bresp
  .m_axib_bvalid(pcie_axi_bvalid),        // input wire m_axib_bvalid
  .m_axib_bready(pcie_axi_bready),        // output wire m_axib_bready
  .m_axib_arid(pcie_axi_arid),            // output wire [3 : 0] m_axib_arid
  .m_axib_araddr(pcie_axi_araddr),        // output wire [31 : 0] m_axib_araddr
  .m_axib_arlen(pcie_axi_arlen),          // output wire [7 : 0] m_axib_arlen
  .m_axib_arsize(pcie_axi_arsize),        // output wire [2 : 0] m_axib_arsize
  .m_axib_arburst(pcie_axi_arburst),      // output wire [1 : 0] m_axib_arburst
  .m_axib_arprot(pcie_axi_arprot),        // output wire [2 : 0] m_axib_arprot
  .m_axib_arvalid(pcie_axi_arvalid),      // output wire m_axib_arvalid
  .m_axib_arready(pcie_axi_arready),      // input wire m_axib_arready
  .m_axib_arlock(pcie_axi_arlock),        // output wire m_axib_arlock
  .m_axib_arcache(pcie_axi_arcache),      // output wire [3 : 0] m_axib_arcache
  .m_axib_rid(pcie_axi_rid),              // input wire [3 : 0] m_axib_rid
  .m_axib_rdata(pcie_axi_rdata),          // input wire [255 : 0] m_axib_rdata
  .m_axib_rresp(pcie_axi_rresp),          // input wire [1 : 0] m_axib_rresp
  .m_axib_rlast(pcie_axi_rlast),          // input wire m_axib_rlast
  .m_axib_rvalid(pcie_axi_rvalid),        // input wire m_axib_rvalid
  .m_axib_rready(pcie_axi_rready),        // output wire m_axib_rready

  // AXI slave
  .s_axil_awaddr(32'b0),        // input wire [31 : 0] s_axil_awaddr
  .s_axil_awprot(3'b0),        // input wire [2 : 0] s_axil_awprot
  .s_axil_awvalid(1'b0),      // input wire s_axil_awvalid
  .s_axil_awready(),      // output wire s_axil_awready
  .s_axil_wdata(32'b0),          // input wire [31 : 0] s_axil_wdata
  .s_axil_wstrb(4'b0),          // input wire [3 : 0] s_axil_wstrb
  .s_axil_wvalid(1'b0),        // input wire s_axil_wvalid
  .s_axil_wready(),        // output wire s_axil_wready
  .s_axil_bvalid(),        // output wire s_axil_bvalid
  .s_axil_bresp(),          // output wire [1 : 0] s_axil_bresp
  .s_axil_bready(1'b0),        // input wire s_axil_bready
  .s_axil_araddr(32'b0),        // input wire [31 : 0] s_axil_araddr
  .s_axil_arprot(3'b0),        // input wire [2 : 0] s_axil_arprot
  .s_axil_arvalid(1'b0),      // input wire s_axil_arvalid
  .s_axil_arready(),      // output wire s_axil_arready
  .s_axil_rdata(),          // output wire [31 : 0] s_axil_rdata
  .s_axil_rresp(),          // output wire [1 : 0] s_axil_rresp
  .s_axil_rvalid(),        // output wire s_axil_rvalid
  .s_axil_rready(1'b0),        // input wire s_axil_rready

  .cfg_ltssm_state(),                     // output wire [5 : 0] cfg_ltssm_state
  .user_lnk_up(user_link_up),             // output wire user_lnk_up

  .usr_irq_req(1'b0),                     // input wire [0 : 0] usr_irq_req
  .usr_irq_ack(),                         // output wire [0 : 0] usr_irq_ack
  .msi_enable(),                          // output wire msi_enable
  .msi_vector_width(),                    // output wire [2 : 0] msi_vector_width
  .interrupt_out()                        // output wire interrupt_out
);

  //----------------------------------------------------------------
  // axi interconnections
  //----------------------------------------------------------------
  // data width converter
  wire [31:0]  ds_axi_araddr;
  wire [1:0]   ds_axi_arburst;
  wire [3:0]   ds_axi_arcache;
  wire [7:0]   ds_axi_arlen;
  wire         ds_axi_arlock;
  wire [2:0]   ds_axi_arprot;
  wire [3:0]   ds_axi_arqos;
  wire         ds_axi_arready;
  wire [3:0]   ds_axi_arregion;
  wire [2:0]   ds_axi_arsize;
  wire         ds_axi_arvalid;
  wire [31:0]  ds_axi_awaddr;
  wire [1:0]   ds_axi_awburst;
  wire [3:0]   ds_axi_awcache;
  wire [7:0]   ds_axi_awlen;
  wire         ds_axi_awlock;
  wire [2:0]   ds_axi_awprot;
  wire [3:0]   ds_axi_awqos;
  wire         ds_axi_awready;
  wire [3:0]   ds_axi_awregion;
  wire [2:0]   ds_axi_awsize;
  wire         ds_axi_awvalid;
  wire         ds_axi_bready;
  wire [1:0]   ds_axi_bresp;
  wire         ds_axi_bvalid;
  wire [31:0]  ds_axi_rdata;
  wire         ds_axi_rlast;
  wire         ds_axi_rready;
  wire [1:0]   ds_axi_rresp;
  wire         ds_axi_rvalid;
  wire [31:0]  ds_axi_wdata;
  wire         ds_axi_wlast;
  wire         ds_axi_wready;
  wire [3:0]   ds_axi_wstrb;
  wire         ds_axi_wvalid;

  ntps_top_auto_ds_0 auto_ds (
    .s_axi_aclk     (axi_aclk),
    .s_axi_aresetn  (axi_aresetn),
    .s_axi_araddr   (pcie_axi_araddr),
    .s_axi_arburst  (pcie_axi_arburst),
    .s_axi_arcache  (pcie_axi_arcache),
    .s_axi_arid     (pcie_axi_arid),
    .s_axi_arlen    (pcie_axi_arlen),
    .s_axi_arlock   (pcie_axi_arlock),
    .s_axi_arprot   (pcie_axi_arprot),
    .s_axi_arqos    (4'b0),
    .s_axi_arready  (pcie_axi_arready),
    .s_axi_arregion (4'b0),
    .s_axi_arsize   (pcie_axi_arsize),
    .s_axi_arvalid  (pcie_axi_arvalid),
    .s_axi_awaddr   (pcie_axi_awaddr),
    .s_axi_awburst  (pcie_axi_awburst),
    .s_axi_awcache  (pcie_axi_awcache),
    .s_axi_awid     (pcie_axi_awid),
    .s_axi_awlen    (pcie_axi_awlen),
    .s_axi_awlock   (pcie_axi_awlock),
    .s_axi_awprot   (pcie_axi_awprot),
    .s_axi_awqos    (4'b0),
    .s_axi_awready  (pcie_axi_awready),
    .s_axi_awregion (4'b0),
    .s_axi_awsize   (pcie_axi_awsize),
    .s_axi_awvalid  (pcie_axi_awvalid),
    .s_axi_bid      (pcie_axi_bid),
    .s_axi_bready   (pcie_axi_bready),
    .s_axi_bresp    (pcie_axi_bresp),
    .s_axi_bvalid   (pcie_axi_bvalid),
    .s_axi_rdata    (pcie_axi_rdata),
    .s_axi_rid      (pcie_axi_rid),
    .s_axi_rlast    (pcie_axi_rlast),
    .s_axi_rready   (pcie_axi_rready),
    .s_axi_rresp    (pcie_axi_rresp),
    .s_axi_rvalid   (pcie_axi_rvalid),
    .s_axi_wdata    (pcie_axi_wdata),
    .s_axi_wlast    (pcie_axi_wlast),
    .s_axi_wready   (pcie_axi_wready),
    .s_axi_wstrb    (pcie_axi_wstrb),
    .s_axi_wvalid   (pcie_axi_wvalid),
    .m_axi_araddr   (ds_axi_araddr),
    .m_axi_arburst  (ds_axi_arburst),
    .m_axi_arcache  (ds_axi_arcache),
    .m_axi_arlen    (ds_axi_arlen),
    .m_axi_arlock   (ds_axi_arlock),
    .m_axi_arprot   (ds_axi_arprot),
    .m_axi_arqos    (ds_axi_arqos),
    .m_axi_arready  (ds_axi_arready),
    .m_axi_arregion (ds_axi_arregion),
    .m_axi_arsize   (ds_axi_arsize),
    .m_axi_arvalid  (ds_axi_arvalid),
    .m_axi_awaddr   (ds_axi_awaddr),
    .m_axi_awburst  (ds_axi_awburst),
    .m_axi_awcache  (ds_axi_awcache),
    .m_axi_awlen    (ds_axi_awlen),
    .m_axi_awlock   (ds_axi_awlock),
    .m_axi_awprot   (ds_axi_awprot),
    .m_axi_awqos    (ds_axi_awqos),
    .m_axi_awready  (ds_axi_awready),
    .m_axi_awregion (ds_axi_awregion),
    .m_axi_awsize   (ds_axi_awsize),
    .m_axi_awvalid  (ds_axi_awvalid),
    .m_axi_bready   (ds_axi_bready),
    .m_axi_bresp    (ds_axi_bresp),
    .m_axi_bvalid   (ds_axi_bvalid),
    .m_axi_rdata    (ds_axi_rdata),
    .m_axi_rlast    (ds_axi_rlast),
    .m_axi_rready   (ds_axi_rready),
    .m_axi_rresp    (ds_axi_rresp),
    .m_axi_rvalid   (ds_axi_rvalid),
    .m_axi_wdata    (ds_axi_wdata),
    .m_axi_wlast    (ds_axi_wlast),
    .m_axi_wready   (ds_axi_wready),
    .m_axi_wstrb    (ds_axi_wstrb),
    .m_axi_wvalid   (ds_axi_wvalid)
  );


  // protocol converter AXI4 to AXI4light
  wire [31:0]  pc_axi_araddr;
  wire [2:0]   pc_axi_arprot;
  wire         pc_axi_arready;
  wire         pc_axi_arvalid;
  wire [31:0]  pc_axi_awaddr;
  wire [2:0]   pc_axi_awprot;
  wire         pc_axi_awready;
  wire         pc_axi_awvalid;
  wire         pc_axi_bready;
  wire [1:0]   pc_axi_bresp;
  wire         pc_axi_bvalid;
  wire [31:0]  pc_axi_rdata;
  wire         pc_axi_rready;
  wire [1:0]   pc_axi_rresp;
  wire         pc_axi_rvalid;
  wire [31:0]  pc_axi_wdata;
  wire         pc_axi_wready;
  wire [3:0]   pc_axi_wstrb;
  wire         pc_axi_wvalid;

  ntps_top_auto_pc_0 auto_pc (
    .aclk	    (axi_aclk),
    .aresetn	    (axi_aresetn),
    .s_axi_araddr   (ds_axi_araddr),
    .s_axi_arburst  (ds_axi_arburst),
    .s_axi_arcache  (ds_axi_arcache),
    .s_axi_arlen    (ds_axi_arlen),
    .s_axi_arlock   (ds_axi_arlock),
    .s_axi_arprot   (ds_axi_arprot),
    .s_axi_arqos    (ds_axi_arqos),
    .s_axi_arready  (ds_axi_arready),
    .s_axi_arregion (ds_axi_arregion),
    .s_axi_arsize   (ds_axi_arsize),
    .s_axi_arvalid  (ds_axi_arvalid),
    .s_axi_awaddr   (ds_axi_awaddr),
    .s_axi_awburst  (ds_axi_awburst),
    .s_axi_awcache  (ds_axi_awcache),
    .s_axi_awlen    (ds_axi_awlen),
    .s_axi_awlock   (ds_axi_awlock),
    .s_axi_awprot   (ds_axi_awprot),
    .s_axi_awqos    (ds_axi_awqos),
    .s_axi_awready  (ds_axi_awready),
    .s_axi_awregion (ds_axi_awregion),
    .s_axi_awsize   (ds_axi_awsize),
    .s_axi_awvalid  (ds_axi_awvalid),
    .s_axi_bready   (ds_axi_bready),
    .s_axi_bresp    (ds_axi_bresp),
    .s_axi_bvalid   (ds_axi_bvalid),
    .s_axi_rdata    (ds_axi_rdata),
    .s_axi_rlast    (ds_axi_rlast),
    .s_axi_rready   (ds_axi_rready),
    .s_axi_rresp    (ds_axi_rresp),
    .s_axi_rvalid   (ds_axi_rvalid),
    .s_axi_wdata    (ds_axi_wdata),
    .s_axi_wlast    (ds_axi_wlast),
    .s_axi_wready   (ds_axi_wready),
    .s_axi_wstrb    (ds_axi_wstrb),
    .s_axi_wvalid   (ds_axi_wvalid),
    .m_axi_araddr   (pc_axi_araddr),
    .m_axi_arprot   (pc_axi_arprot),
    .m_axi_arready  (pc_axi_arready),
    .m_axi_arvalid  (pc_axi_arvalid),
    .m_axi_awaddr   (pc_axi_awaddr),
    .m_axi_awprot   (pc_axi_awprot),
    .m_axi_awready  (pc_axi_awready),
    .m_axi_awvalid  (pc_axi_awvalid),
    .m_axi_bready   (pc_axi_bready),
    .m_axi_bresp    (pc_axi_bresp),
    .m_axi_bvalid   (pc_axi_bvalid),
    .m_axi_rdata    (pc_axi_rdata),
    .m_axi_rready   (pc_axi_rready),
    .m_axi_rresp    (pc_axi_rresp),
    .m_axi_rvalid   (pc_axi_rvalid),
    .m_axi_wdata    (pc_axi_wdata),
    .m_axi_wready   (pc_axi_wready),
    .m_axi_wstrb    (pc_axi_wstrb),
    .m_axi_wvalid   (pc_axi_wvalid)
  );


  // Fifo
  wire [31:0]  fifo_axi_araddr;
  wire [2:0]   fifo_axi_arprot;
  wire         fifo_axi_arready;
  wire         fifo_axi_arvalid;
  wire [31:0]  fifo_axi_awaddr;
  wire [2:0]   fifo_axi_awprot;
  wire         fifo_axi_awready;
  wire         fifo_axi_awvalid;
  wire         fifo_axi_bready;
  wire [1:0]   fifo_axi_bresp;
  wire         fifo_axi_bvalid;
  wire [31:0]  fifo_axi_rdata;
  wire         fifo_axi_rready;
  wire [1:0]   fifo_axi_rresp;
  wire         fifo_axi_rvalid;
  wire [31:0]  fifo_axi_wdata;
  wire         fifo_axi_wready;
  wire [3:0]   fifo_axi_wstrb;
  wire         fifo_axi_wvalid;

  ntps_top_s00_data_fifo_0 s00_data_fifo (
    .aclk           (axi_aclk),
    .aresetn	    (interconnect_aresetn),
    .s_axi_araddr   (pc_axi_araddr),
    .s_axi_arprot   (pc_axi_arprot),
    .s_axi_arready  (pc_axi_arready),
    .s_axi_arvalid  (pc_axi_arvalid),
    .s_axi_awaddr   (pc_axi_awaddr),
    .s_axi_awprot   (pc_axi_awprot),
    .s_axi_awready  (pc_axi_awready),
    .s_axi_awvalid  (pc_axi_awvalid),
    .s_axi_bready   (pc_axi_bready),
    .s_axi_bresp    (pc_axi_bresp),
    .s_axi_bvalid   (pc_axi_bvalid),
    .s_axi_rdata    (pc_axi_rdata),
    .s_axi_rready   (pc_axi_rready),
    .s_axi_rresp    (pc_axi_rresp),
    .s_axi_rvalid   (pc_axi_rvalid),
    .s_axi_wdata    (pc_axi_wdata),
    .s_axi_wready   (pc_axi_wready),
    .s_axi_wstrb    (pc_axi_wstrb),
    .s_axi_wvalid   (pc_axi_wvalid),
    .m_axi_araddr   (fifo_axi_araddr),
    .m_axi_arprot   (fifo_axi_arprot),
    .m_axi_arready  (fifo_axi_arready),
    .m_axi_arvalid  (fifo_axi_arvalid),
    .m_axi_awaddr   (fifo_axi_awaddr),
    .m_axi_awprot   (fifo_axi_awprot),
    .m_axi_awready  (fifo_axi_awready),
    .m_axi_awvalid  (fifo_axi_awvalid),
    .m_axi_bready   (fifo_axi_bready),
    .m_axi_bresp    (fifo_axi_bresp),
    .m_axi_bvalid   (fifo_axi_bvalid),
    .m_axi_rdata    (fifo_axi_rdata),
    .m_axi_rready   (fifo_axi_rready),
    .m_axi_rresp    (fifo_axi_rresp),
    .m_axi_rvalid   (fifo_axi_rvalid),
    .m_axi_wdata    (fifo_axi_wdata),
    .m_axi_wready   (fifo_axi_wready),
    .m_axi_wstrb    (fifo_axi_wstrb),
    .m_axi_wvalid   (fifo_axi_wvalid)
  );


  // Crossbar, note the aggregated outputs
  wire [NUM_SLAVES*32-1:0]   xbar_axi_awaddr;
  wire [NUM_SLAVES*3-1:0]    xbar_axi_awprot;
  wire [NUM_SLAVES-1:0]      xbar_axi_awvalid;
  wire [NUM_SLAVES-1:0]      xbar_axi_awready;
  wire [NUM_SLAVES*32-1:0]   xbar_axi_wdata;
  wire [NUM_SLAVES*32/8-1:0] xbar_axi_wstrb;
  wire [NUM_SLAVES-1:0]      xbar_axi_wvalid;
  wire [NUM_SLAVES-1:0]      xbar_axi_wready;
  wire [NUM_SLAVES*2-1:0]    xbar_axi_bresp;
  wire [NUM_SLAVES-1:0]      xbar_axi_bvalid;
  wire [NUM_SLAVES-1:0]      xbar_axi_bready;
  wire [NUM_SLAVES*32-1:0]   xbar_axi_araddr;
  wire [NUM_SLAVES*3-1:0]    xbar_axi_arprot;
  wire [NUM_SLAVES-1:0]      xbar_axi_arvalid;
  wire [NUM_SLAVES-1:0]      xbar_axi_arready;
  wire [NUM_SLAVES*32-1:0]   xbar_axi_rdata;
  wire [NUM_SLAVES*2-1:0]    xbar_axi_rresp;
  wire [NUM_SLAVES-1:0]      xbar_axi_rvalid;
  wire [NUM_SLAVES-1:0]      xbar_axi_rready;

  ntps_top_xbar_0 xbar (
    .aclk          (axi_aclk),
    .aresetn       (interconnect_aresetn),
    .s_axi_araddr  (fifo_axi_araddr),
    .s_axi_arprot  (fifo_axi_arprot),
    .s_axi_arready (fifo_axi_arready),
    .s_axi_arvalid (fifo_axi_arvalid),
    .s_axi_awaddr  (fifo_axi_awaddr),
    .s_axi_awprot  (fifo_axi_awprot),
    .s_axi_awready (fifo_axi_awready),
    .s_axi_awvalid (fifo_axi_awvalid),
    .s_axi_bready  (fifo_axi_bready),
    .s_axi_bresp   (fifo_axi_bresp),
    .s_axi_bvalid  (fifo_axi_bvalid),
    .s_axi_rdata   (fifo_axi_rdata),
    .s_axi_rready  (fifo_axi_rready),
    .s_axi_rresp   (fifo_axi_rresp),
    .s_axi_rvalid  (fifo_axi_rvalid),
    .s_axi_wdata   (fifo_axi_wdata),
    .s_axi_wready  (fifo_axi_wready),
    .s_axi_wstrb   (fifo_axi_wstrb),
    .s_axi_wvalid  (fifo_axi_wvalid),
    .m_axi_awaddr  (m_axi_awaddr),
    .m_axi_awprot  (m_axi_awprot),
    .m_axi_awvalid (m_axi_awvalid),
    .m_axi_awready (m_axi_awready),
    .m_axi_wdata   (m_axi_wdata),
    .m_axi_wstrb   (m_axi_wstrb),
    .m_axi_wvalid  (m_axi_wvalid),
    .m_axi_wready  (m_axi_wready),
    .m_axi_bresp   (m_axi_bresp),
    .m_axi_bvalid  (m_axi_bvalid),
    .m_axi_bready  (m_axi_bready),
    .m_axi_araddr  (m_axi_araddr),
    .m_axi_arprot  (m_axi_arprot),
    .m_axi_arvalid (m_axi_arvalid),
    .m_axi_arready (m_axi_arready),
    .m_axi_rdata   (m_axi_rdata),
    .m_axi_rresp   (m_axi_rresp),
    .m_axi_rvalid  (m_axi_rvalid),
    .m_axi_rready  (m_axi_rready)
  );

endmodule // pcie_axi

//======================================================================
// EOF pcie_axi.v
//======================================================================
