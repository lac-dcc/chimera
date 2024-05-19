// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "iob_lib.vh"
`include "axi.vh"

module iob2axi
  #(
    parameter AXI_ADDR_W = ADDR_W,
    parameter AXI_DATA_W = DATA_W
    )
   (
`include "s_axi_s_port.vh"
`include "m_axi_m_port.vh"
`include "iob_gen_if.vh"
    );

   `IOB_WIRE2WIRE(s_axi_awid, m_axi_awid, 1) //Address write channel ID
   `IOB_WIRE2WIRE(s_axi_awaddr, m_axi_awaddr, AXI_ADDR_W) //Address write channel address
   `IOB_WIRE2WIRE(s_axi_awlen, m_axi_awlen, 8) //Address write channel burst length
   `IOB_WIRE2WIRE(s_axi_awsize, m_axi_awsize, 3) //Address write channel burst size. This signal indicates the size of each transfer in the burst
   `IOB_WIRE2WIRE(s_axi_awburst, m_axi_awburst, 2) //Address write channel burst type
   `IOB_WIRE2WIRE(s_axi_awlock, m_axi_awlock, 1) //Address write channel lock type
   `IOB_WIRE2WIRE(s_axi_awcache, m_axi_awcache, 4) //Address write channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
   `IOB_WIRE2WIRE(s_axi_awprot, m_axi_awprot, 3) //Address write channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
   `IOB_WIRE2WIRE(s_axi_awqos, m_axi_awqos, 4) //Address write channel quality of service
   `IOB_WIRE2WIRE(s_axi_awvalid, m_axi_awvalid, 1) //Address write channel valid
   `IOB_WIRE2WIRE(m_axi_awready, s_axi_awready, 1) //Address write channel ready
   `IOB_WIRE2WIRE(s_axi_wid, m_axi_wid, 1) //Write channel ID
   `IOB_WIRE2WIRE(s_axi_wdata, m_axi_wdata, AXI_DATA_W) //Write channel data
   `IOB_WIRE2WIRE(s_axi_wstrb, m_axi_wstrb, (AXI_DATA_W/8)) //Write channel write strobe
   `IOB_WIRE2WIRE(s_axi_wlast, m_axi_wlast, 1) //Write channel last word flag
   `IOB_WIRE2WIRE(s_axi_wvalid, m_axi_wvalid, 1) //Write channel valid
   `IOB_WIRE2WIRE(m_axi_wready, s_axi_wready, 1) //Write channel ready
   `IOB_WIRE2WIRE(m_axi_bid, s_axi_bid, 1) //Write response channel ID
   `IOB_WIRE2WIRE(m_axi_bresp, s_axi_bresp, 2) //Write response channel response
   `IOB_WIRE2WIRE(m_axi_bvalid, s_axi_bvalid, 1) //Write response channel valid
   `IOB_WIRE2WIRE(s_axi_bready, m_axi_bready, 1) //Write response channel ready
   `IOB_WIRE2WIRE(s_axi_arid, m_axi_arid, 1) //Address read channel ID
   `IOB_WIRE2WIRE(s_axi_araddr, m_axi_araddr, AXI_ADDR_W) //Address read channel address
   `IOB_WIRE2WIRE(s_axi_arlen, m_axi_arlen, 8) //Address read channel burst length
   `IOB_WIRE2WIRE(s_axi_arsize, m_axi_arsize, 3) //Address read channel burst size. This signal indicates the size of each transfer in the burst
   `IOB_WIRE2WIRE(s_axi_arburst, m_axi_arburst, 2) //Address read channel burst type
   `IOB_WIRE2WIRE(s_axi_arlock, m_axi_arlock, 1) //Address read channel lock type
   `IOB_WIRE2WIRE(s_axi_arcache, m_axi_arcache, 4) //Address read channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
   `IOB_WIRE2WIRE(s_axi_arprot, m_axi_arprot, 3) //Address read channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
   `IOB_WIRE2WIRE(s_axi_arqos, m_axi_arqos, 4) //Address read channel quality of service
   `IOB_WIRE2WIRE(s_axi_arvalid, m_axi_arvalid, 1) //Address read channel valid
   `IOB_WIRE2WIRE(m_axi_arready, s_axi_arready, 1) //Address read channel ready
   `IOB_WIRE2WIRE(m_axi_rid, s_axi_rid, 1) //Read channel ID
   `IOB_WIRE2WIRE(m_axi_rdata, s_axi_rdata, AXI_DATA_W) //Read channel data
   `IOB_WIRE2WIRE(m_axi_rresp, s_axi_rresp, 2) //Read channel response
   `IOB_WIRE2WIRE(m_axi_rlast, s_axi_rlast, 1) //Read channel last word
   `IOB_WIRE2WIRE(m_axi_rvalid, s_axi_rvalid, 1) //Read channel valid
   `IOB_WIRE2WIRE(s_axi_rready, m_axi_rready, 1) //Read channel ready

endmodule
