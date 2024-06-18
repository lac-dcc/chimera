// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module axi2axi
  #(
    parameter AXI_ADDR_W = 30,
    parameter AXI_DATA_W = 32,
    parameter AXI_ID_W = 4,
    parameter AXI_LEN_W = 4
    )
   (
    //START_IO_TABLE s_axi_s_port
    input [AXI_ID_W-1:0] s_axi_awid, //Address write channel ID
    input [AXI_ADDR_W-1:0] s_axi_awaddr, //Address write channel address
    input [AXI_LEN_W-1:0] s_axi_awlen, //Address write channel burst length
    input [3-1:0] s_axi_awsize, //Address write channel burst size. This signal indicates the size of each transfer in the burst
    input [2-1:0] s_axi_awburst, //Address write channel burst type
    input [2-1:0] s_axi_awlock, //Address write channel lock type
    input [4-1:0] s_axi_awcache, //Address write channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
    input [3-1:0] s_axi_awprot, //Address write channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
    input [1-1:0] s_axi_awvalid, //Address write channel valid
    output [1-1:0] s_axi_awready, //Address write channel ready
    input [AXI_ID_W-1:0] s_axi_wid, //Write channel ID
    input [AXI_DATA_W-1:0] s_axi_wdata, //Write channel data
    input [(AXI_DATA_W/8)-1:0] s_axi_wstrb, //Write channel write strobe
    input [1-1:0] s_axi_wlast, //Write channel last word flag
    input [1-1:0] s_axi_wvalid, //Write channel valid
    output [1-1:0] s_axi_wready, //Write channel ready
    output [AXI_ID_W-1:0] s_axi_bid, //Write response channel ID
    output [2-1:0] s_axi_bresp, //Write response channel response
    output [1-1:0] s_axi_bvalid, //Write response channel valid
    input [1-1:0] s_axi_bready, //Write response channel ready
    input [AXI_ID_W-1:0] s_axi_arid, //Address read channel ID
    input [AXI_ADDR_W-1:0] s_axi_araddr, //Address read channel address
    input [AXI_LEN_W-1:0] s_axi_arlen, //Address read channel burst length
    input [3-1:0] s_axi_arsize, //Address read channel burst size. This signal indicates the size of each transfer in the burst
    input [2-1:0] s_axi_arburst, //Address read channel burst type
    input [2-1:0] s_axi_arlock, //Address read channel lock type
    input [4-1:0] s_axi_arcache, //Address read channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
    input [3-1:0] s_axi_arprot, //Address read channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
    input [1-1:0] s_axi_arvalid, //Address read channel valid
    output [1-1:0] s_axi_arready, //Address read channel ready
    output [AXI_ID_W-1:0] s_axi_rid, //Read channel ID
    output [AXI_DATA_W-1:0] s_axi_rdata, //Read channel data
    output [2-1:0] s_axi_rresp, //Read channel response
    output [1-1:0] s_axi_rlast, //Read channel last word
    output [1-1:0] s_axi_rvalid, //Read channel valid
    input [1-1:0] s_axi_rready, //Read channel ready

    //START_IO_TABLE m_axi_m_port
    output [AXI_ID_W-1:0] m_axi_awid, //Address write channel ID
    output [AXI_ADDR_W-1:0] m_axi_awaddr, //Address write channel address
    output [AXI_LEN_W-1:0] m_axi_awlen, //Address write channel burst length
    output [3-1:0] m_axi_awsize, //Address write channel burst size. This signal indicates the size of each transfer in the burst
    output [2-1:0] m_axi_awburst, //Address write channel burst type
    output [2-1:0] m_axi_awlock, //Address write channel lock type
    output [4-1:0] m_axi_awcache, //Address write channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
    output [3-1:0] m_axi_awprot, //Address write channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
    output [1-1:0] m_axi_awvalid, //Address write channel valid
    input [1-1:0] m_axi_awready, //Address write channel ready
    output [AXI_ID_W-1:0] m_axi_wid, //Write channel ID
    output [AXI_DATA_W-1:0] m_axi_wdata, //Write channel data
    output [(AXI_DATA_W/8)-1:0] m_axi_wstrb, //Write channel write strobe
    output [1-1:0] m_axi_wlast, //Write channel last word flag
    output [1-1:0] m_axi_wvalid, //Write channel valid
    input [1-1:0] m_axi_wready, //Write channel ready
    input [AXI_ID_W-1:0] m_axi_bid, //Write response channel ID
    input [2-1:0] m_axi_bresp, //Write response channel response
    input [1-1:0] m_axi_bvalid, //Write response channel valid
    output [1-1:0] m_axi_bready, //Write response channel ready
    output [AXI_ID_W-1:0] m_axi_arid, //Address read channel ID
    output [AXI_ADDR_W-1:0] m_axi_araddr, //Address read channel address
    output [AXI_LEN_W-1:0] m_axi_arlen, //Address read channel burst length
    output [3-1:0] m_axi_arsize, //Address read channel burst size. This signal indicates the size of each transfer in the burst
    output [2-1:0] m_axi_arburst, //Address read channel burst type
    output [2-1:0] m_axi_arlock, //Address read channel lock type
    output [4-1:0] m_axi_arcache, //Address read channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
    output [3-1:0] m_axi_arprot, //Address read channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
    output [1-1:0] m_axi_arvalid, //Address read channel valid
    input [1-1:0] m_axi_arready, //Address read channel ready
    input [AXI_ID_W-1:0] m_axi_rid, //Read channel ID
    input [AXI_DATA_W-1:0] m_axi_rdata, //Read channel data
    input [2-1:0] m_axi_rresp, //Read channel response
    input [1-1:0] m_axi_rlast, //Read channel last word
    input [1-1:0] m_axi_rvalid, //Read channel valid
    output [1-1:0] m_axi_rready, //Read channel ready

    //General Interface Signals (do not remove indentation)
    //START_IO_TABLE gen
    input [1-1:0] clk, //System clock input
    input [1-1:0] rst  //System reset, asynchronous and active high
    );

   assign m_axi_awid = s_axi_awid; //Address write channel ID
   assign m_axi_awaddr = s_axi_awaddr; //Address write channel address
   assign m_axi_awlen = s_axi_awlen; //Address write channel burst length
   assign m_axi_awsize = s_axi_awsize; //Address write channel burst size. This signal indicates the size of each transfer in the burst
   assign m_axi_awburst = s_axi_awburst; //Address write channel burst type
   assign m_axi_awlock = s_axi_awlock; //Address write channel lock type
   assign m_axi_awcache = s_axi_awcache; //Address write channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
   assign m_axi_awprot = s_axi_awprot; //Address write channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
   assign m_axi_awvalid = s_axi_awvalid; //Address write channel valid
   assign s_axi_awready = m_axi_awready; //Address write channel ready
   assign m_axi_wid = s_axi_wid; //Write channel ID
   assign m_axi_wdata = s_axi_wdata; //Write channel data
   assign m_axi_wstrb = s_axi_wstrb; //Write channel write strobe
   assign m_axi_wlast = s_axi_wlast; //Write channel last word flag
   assign m_axi_wvalid = s_axi_wvalid; //Write channel valid
   assign s_axi_wready = m_axi_wready; //Write channel ready
   assign s_axi_bid = m_axi_bid; //Write response channel ID
   assign s_axi_bresp = m_axi_bresp; //Write response channel response
   assign s_axi_bvalid = m_axi_bvalid; //Write response channel valid
   assign m_axi_bready = s_axi_bready; //Write response channel ready
   assign m_axi_arid = s_axi_arid; //Address read channel ID
   assign m_axi_araddr = s_axi_araddr; //Address read channel address
   assign m_axi_arlen = s_axi_arlen; //Address read channel burst length
   assign m_axi_arsize = s_axi_arsize; //Address read channel burst size. This signal indicates the size of each transfer in the burst
   assign m_axi_arburst = s_axi_arburst; //Address read channel burst type
   assign m_axi_arlock = s_axi_arlock; //Address read channel lock type
   assign m_axi_arcache = s_axi_arcache; //Address read channel memory type. Transactions set with Normal Non-cacheable Modifiable and Bufferable (0011).
   assign m_axi_arprot = s_axi_arprot; //Address read channel protection type. Transactions set with Normal, Secure, and Data attributes (000).
   assign m_axi_arvalid = s_axi_arvalid; //Address read channel valid
   assign s_axi_arready = m_axi_arready; //Address read channel ready
   assign s_axi_rid = m_axi_rid; //Read channel ID
   assign s_axi_rdata = m_axi_rdata; //Read channel data
   assign s_axi_rresp = m_axi_rresp; //Read channel response
   assign s_axi_rlast = m_axi_rlast; //Read channel last word
   assign s_axi_rvalid = m_axi_rvalid; //Read channel valid
   assign m_axi_rready = s_axi_rready; //Read channel ready

endmodule
