// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  Ultra96V2 udmabuf test
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none

module zybo_udmabuf_sample
            (
                inout   wire    [14:0]  DDR_addr,
                inout   wire    [2:0]   DDR_ba,
                inout   wire            DDR_cas_n,
                inout   wire            DDR_ck_n,
                inout   wire            DDR_ck_p,
                inout   wire            DDR_cke,
                inout   wire            DDR_cs_n,
                inout   wire    [3:0]   DDR_dm,
                inout   wire    [31:0]  DDR_dq,
                inout   wire    [3:0]   DDR_dqs_n,
                inout   wire    [3:0]   DDR_dqs_p,
                inout   wire            DDR_odt,
                inout   wire            DDR_ras_n,
                inout   wire            DDR_reset_n,
                inout   wire            DDR_we_n,
                inout   wire            FIXED_IO_ddr_vrn,
                inout   wire            FIXED_IO_ddr_vrp,
                inout   wire    [53:0]  FIXED_IO_mio,
                inout   wire            FIXED_IO_ps_clk,
                inout   wire            FIXED_IO_ps_porb,
                inout   wire            FIXED_IO_ps_srstb,
                
                output  wire    [3:0]   led
            );
    
    
    // -----------------------------
    //  ZynqMP PS
    // -----------------------------
    
    wire            resetn;
    wire            clk;
    
    wire    [31:0]  axi4l_peri_awaddr;
    wire    [2:0]   axi4l_peri_awprot;
    wire            axi4l_peri_awvalid;
    wire            axi4l_peri_awready;
    wire    [31:0]  axi4l_peri_wdata;
    wire    [3:0]   axi4l_peri_wstrb;
    wire            axi4l_peri_wvalid;
    wire            axi4l_peri_wready;
    wire    [1:0]   axi4l_peri_bresp;
    wire            axi4l_peri_bvalid;
    wire            axi4l_peri_bready;
    wire    [31:0]  axi4l_peri_araddr;
    wire    [2:0]   axi4l_peri_arprot;
    wire            axi4l_peri_arvalid;
    wire            axi4l_peri_arready;
    wire    [31:0]  axi4l_peri_rdata;
    wire    [1:0]   axi4l_peri_rresp;
    wire            axi4l_peri_rvalid;
    wire            axi4l_peri_rready;
    
    wire    [5:0]   axi4_mem0_awid;
    wire    [31:0]  axi4_mem0_awaddr;
    wire    [1:0]   axi4_mem0_awburst;
    wire    [3:0]   axi4_mem0_awcache;
    wire    [7:0]   axi4_mem0_awlen;
    wire    [0:0]   axi4_mem0_awlock;
    wire    [2:0]   axi4_mem0_awprot;
    wire    [3:0]   axi4_mem0_awqos;
    wire    [2:0]   axi4_mem0_awsize;
    wire            axi4_mem0_awvalid;
    wire            axi4_mem0_awready;
    wire    [63:0]  axi4_mem0_wdata;
    wire    [7:0]   axi4_mem0_wstrb;
    wire            axi4_mem0_wlast;
    wire            axi4_mem0_wvalid;
    wire            axi4_mem0_wready;
    wire    [5:0]   axi4_mem0_bid;
    wire    [1:0]   axi4_mem0_bresp;
    wire            axi4_mem0_bvalid;
    wire            axi4_mem0_bready;
    wire    [5:0]   axi4_mem0_arid;
    wire    [31:0]  axi4_mem0_araddr;
    wire    [1:0]   axi4_mem0_arburst;
    wire    [3:0]   axi4_mem0_arcache;
    wire    [7:0]   axi4_mem0_arlen;
    wire    [0:0]   axi4_mem0_arlock;
    wire    [2:0]   axi4_mem0_arprot;
    wire    [3:0]   axi4_mem0_arqos;
    wire    [2:0]   axi4_mem0_arsize;
    wire            axi4_mem0_arvalid;
    wire            axi4_mem0_arready;
    wire    [5:0]   axi4_mem0_rid;
    wire    [1:0]   axi4_mem0_rresp;
    wire    [63:0]  axi4_mem0_rdata;
    wire            axi4_mem0_rlast;
    wire            axi4_mem0_rvalid;
    wire            axi4_mem0_rready;
    
    wire    [5:0]   axi4_mem1_awid;
    wire    [31:0]  axi4_mem1_awaddr;
    wire    [1:0]   axi4_mem1_awburst;
    wire    [3:0]   axi4_mem1_awcache;
    wire    [7:0]   axi4_mem1_awlen;
    wire    [0:0]   axi4_mem1_awlock;
    wire    [2:0]   axi4_mem1_awprot;
    wire    [3:0]   axi4_mem1_awqos;
    wire    [2:0]   axi4_mem1_awsize;
    wire            axi4_mem1_awvalid;
    wire            axi4_mem1_awready;
    wire    [63:0]  axi4_mem1_wdata;
    wire    [7:0]   axi4_mem1_wstrb;
    wire            axi4_mem1_wlast;
    wire            axi4_mem1_wvalid;
    wire            axi4_mem1_wready;
    wire    [5:0]   axi4_mem1_bid;
    wire    [1:0]   axi4_mem1_bresp;
    wire            axi4_mem1_bvalid;
    wire            axi4_mem1_bready;
    wire    [5:0]   axi4_mem1_arid;
    wire    [31:0]  axi4_mem1_araddr;
    wire    [1:0]   axi4_mem1_arburst;
    wire    [3:0]   axi4_mem1_arcache;
    wire    [7:0]   axi4_mem1_arlen;
    wire    [0:0]   axi4_mem1_arlock;
    wire    [2:0]   axi4_mem1_arprot;
    wire    [3:0]   axi4_mem1_arqos;
    wire    [2:0]   axi4_mem1_arsize;
    wire            axi4_mem1_arvalid;
    wire            axi4_mem1_arready;
    wire    [5:0]   axi4_mem1_rid;
    wire    [1:0]   axi4_mem1_rresp;
    wire    [63:0]  axi4_mem1_rdata;
    wire            axi4_mem1_rlast;
    wire            axi4_mem1_rvalid;
    wire            axi4_mem1_rready;
    
    design_1
        i_design_1
            (
                .DDR_addr               (DDR_addr),
                .DDR_ba                 (DDR_ba),
                .DDR_cas_n              (DDR_cas_n),
                .DDR_ck_n               (DDR_ck_n),
                .DDR_ck_p               (DDR_ck_p),
                .DDR_cke                (DDR_cke),
                .DDR_cs_n               (DDR_cs_n),
                .DDR_dm                 (DDR_dm),
                .DDR_dq                 (DDR_dq),
                .DDR_dqs_n              (DDR_dqs_n),
                .DDR_dqs_p              (DDR_dqs_p),
                .DDR_odt                (DDR_odt),
                .DDR_ras_n              (DDR_ras_n),
                .DDR_reset_n            (DDR_reset_n),
                .DDR_we_n               (DDR_we_n),
                .FIXED_IO_ddr_vrn       (FIXED_IO_ddr_vrn),
                .FIXED_IO_ddr_vrp       (FIXED_IO_ddr_vrp),
                .FIXED_IO_mio           (FIXED_IO_mio),
                .FIXED_IO_ps_clk        (FIXED_IO_ps_clk),
                .FIXED_IO_ps_porb       (FIXED_IO_ps_porb),
                .FIXED_IO_ps_srstb      (FIXED_IO_ps_srstb),
                
                
                .out_resetn             (resetn),
                .out_clk                (clk),
                
                .m_axi4l_peri_awaddr    (axi4l_peri_awaddr),
                .m_axi4l_peri_awprot    (axi4l_peri_awprot),
                .m_axi4l_peri_awvalid   (axi4l_peri_awvalid),
                .m_axi4l_peri_awready   (axi4l_peri_awready),
                .m_axi4l_peri_wdata     (axi4l_peri_wdata),
                .m_axi4l_peri_wstrb     (axi4l_peri_wstrb),
                .m_axi4l_peri_wvalid    (axi4l_peri_wvalid),
                .m_axi4l_peri_wready    (axi4l_peri_wready),
                .m_axi4l_peri_bresp     (axi4l_peri_bresp),
                .m_axi4l_peri_bvalid    (axi4l_peri_bvalid),
                .m_axi4l_peri_bready    (axi4l_peri_bready),
                .m_axi4l_peri_araddr    (axi4l_peri_araddr),
                .m_axi4l_peri_arprot    (axi4l_peri_arprot),
                .m_axi4l_peri_arvalid   (axi4l_peri_arvalid),
                .m_axi4l_peri_arready   (axi4l_peri_arready),
                .m_axi4l_peri_rdata     (axi4l_peri_rdata),
                .m_axi4l_peri_rresp     (axi4l_peri_rresp),
                .m_axi4l_peri_rvalid    (axi4l_peri_rvalid),
                .m_axi4l_peri_rready    (axi4l_peri_rready),
                
                .s_axi4_mem0_awid       (axi4_mem0_awid),
                .s_axi4_mem0_awaddr     (axi4_mem0_awaddr),
                .s_axi4_mem0_awburst    (axi4_mem0_awburst),
                .s_axi4_mem0_awcache    (axi4_mem0_awcache),
                .s_axi4_mem0_awlen      (axi4_mem0_awlen),
                .s_axi4_mem0_awlock     (axi4_mem0_awlock),
                .s_axi4_mem0_awprot     (axi4_mem0_awprot),
                .s_axi4_mem0_awqos      (axi4_mem0_awqos),
                .s_axi4_mem0_awsize     (axi4_mem0_awsize),
                .s_axi4_mem0_awvalid    (axi4_mem0_awvalid),
                .s_axi4_mem0_awready    (axi4_mem0_awready),
                .s_axi4_mem0_wdata      (axi4_mem0_wdata),
                .s_axi4_mem0_wstrb      (axi4_mem0_wstrb),
                .s_axi4_mem0_wlast      (axi4_mem0_wlast),
                .s_axi4_mem0_wvalid     (axi4_mem0_wvalid),
                .s_axi4_mem0_wready     (axi4_mem0_wready),
                .s_axi4_mem0_bid        (axi4_mem0_bid),
                .s_axi4_mem0_bready     (axi4_mem0_bready),
                .s_axi4_mem0_bresp      (axi4_mem0_bresp),
                .s_axi4_mem0_bvalid     (axi4_mem0_bvalid),
                .s_axi4_mem0_arid       (axi4_mem0_arid),
                .s_axi4_mem0_araddr     (axi4_mem0_araddr),
                .s_axi4_mem0_arburst    (axi4_mem0_arburst),
                .s_axi4_mem0_arcache    (axi4_mem0_arcache),
                .s_axi4_mem0_arlen      (axi4_mem0_arlen),
                .s_axi4_mem0_arlock     (axi4_mem0_arlock),
                .s_axi4_mem0_arprot     (axi4_mem0_arprot),
                .s_axi4_mem0_arqos      (axi4_mem0_arqos),
                .s_axi4_mem0_arsize     (axi4_mem0_arsize),
                .s_axi4_mem0_arvalid    (axi4_mem0_arvalid),
                .s_axi4_mem0_arready    (axi4_mem0_arready),
                .s_axi4_mem0_rid        (axi4_mem0_rid),
                .s_axi4_mem0_rresp      (axi4_mem0_rresp),
                .s_axi4_mem0_rdata      (axi4_mem0_rdata),
                .s_axi4_mem0_rlast      (axi4_mem0_rlast),
                .s_axi4_mem0_rvalid     (axi4_mem0_rvalid),
                .s_axi4_mem0_rready     (axi4_mem0_rready),
                
                .s_axi4_mem1_awid       (axi4_mem1_awid),
                .s_axi4_mem1_awaddr     (axi4_mem1_awaddr),
                .s_axi4_mem1_awburst    (axi4_mem1_awburst),
                .s_axi4_mem1_awcache    (axi4_mem1_awcache),
                .s_axi4_mem1_awlen      (axi4_mem1_awlen),
                .s_axi4_mem1_awlock     (axi4_mem1_awlock),
                .s_axi4_mem1_awprot     (axi4_mem1_awprot),
                .s_axi4_mem1_awqos      (axi4_mem1_awqos),
                .s_axi4_mem1_awsize     (axi4_mem1_awsize),
                .s_axi4_mem1_awvalid    (axi4_mem1_awvalid),
                .s_axi4_mem1_awready    (axi4_mem1_awready),
                .s_axi4_mem1_wdata      (axi4_mem1_wdata),
                .s_axi4_mem1_wstrb      (axi4_mem1_wstrb),
                .s_axi4_mem1_wlast      (axi4_mem1_wlast),
                .s_axi4_mem1_wvalid     (axi4_mem1_wvalid),
                .s_axi4_mem1_wready     (axi4_mem1_wready),
                .s_axi4_mem1_bid        (axi4_mem1_bid),
                .s_axi4_mem1_bready     (axi4_mem1_bready),
                .s_axi4_mem1_bresp      (axi4_mem1_bresp),
                .s_axi4_mem1_bvalid     (axi4_mem1_bvalid),
                .s_axi4_mem1_arid       (axi4_mem1_arid),
                .s_axi4_mem1_araddr     (axi4_mem1_araddr),
                .s_axi4_mem1_arburst    (axi4_mem1_arburst),
                .s_axi4_mem1_arcache    (axi4_mem1_arcache),
                .s_axi4_mem1_arlen      (axi4_mem1_arlen),
                .s_axi4_mem1_arlock     (axi4_mem1_arlock),
                .s_axi4_mem1_arprot     (axi4_mem1_arprot),
                .s_axi4_mem1_arqos      (axi4_mem1_arqos),
                .s_axi4_mem1_arsize     (axi4_mem1_arsize),
                .s_axi4_mem1_arvalid    (axi4_mem1_arvalid),
                .s_axi4_mem1_arready    (axi4_mem1_arready),
                .s_axi4_mem1_rid        (axi4_mem1_rid),
                .s_axi4_mem1_rresp      (axi4_mem1_rresp),
                .s_axi4_mem1_rdata      (axi4_mem1_rdata),
                .s_axi4_mem1_rlast      (axi4_mem1_rlast),
                .s_axi4_mem1_rvalid     (axi4_mem1_rvalid),
                .s_axi4_mem1_rready     (axi4_mem1_rready)
            );
    
    
    
    // -----------------------------
    //  Peripheral BUS (WISHBONE)
    // -----------------------------
    
    localparam  WB_DAT_SIZE  = 2;
    localparam  WB_ADR_WIDTH = 32 - WB_DAT_SIZE;
    localparam  WB_DAT_WIDTH = (8 << WB_DAT_SIZE);
    localparam  WB_SEL_WIDTH = (1 << WB_DAT_SIZE);
    
    wire                            wb_peri_rst_i;
    wire                            wb_peri_clk_i;
    wire    [WB_ADR_WIDTH-1:0]      wb_peri_adr_i;
    wire    [WB_DAT_WIDTH-1:0]      wb_peri_dat_i;
    wire    [WB_DAT_WIDTH-1:0]      wb_peri_dat_o;
    wire                            wb_peri_we_i;
    wire    [WB_SEL_WIDTH-1:0]      wb_peri_sel_i;
    wire                            wb_peri_stb_i;
    wire                            wb_peri_ack_o;
    
    jelly_axi4l_to_wishbone
            #(
                .AXI4L_ADDR_WIDTH       (32),
                .AXI4L_DATA_SIZE        (2)     // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn        (resetn),
                .s_axi4l_aclk           (clk),
                .s_axi4l_awaddr         (axi4l_peri_awaddr),
                .s_axi4l_awprot         (axi4l_peri_awprot),
                .s_axi4l_awvalid        (axi4l_peri_awvalid),
                .s_axi4l_awready        (axi4l_peri_awready),
                .s_axi4l_wstrb          (axi4l_peri_wstrb),
                .s_axi4l_wdata          (axi4l_peri_wdata),
                .s_axi4l_wvalid         (axi4l_peri_wvalid),
                .s_axi4l_wready         (axi4l_peri_wready),
                .s_axi4l_bresp          (axi4l_peri_bresp),
                .s_axi4l_bvalid         (axi4l_peri_bvalid),
                .s_axi4l_bready         (axi4l_peri_bready),
                .s_axi4l_araddr         (axi4l_peri_araddr),
                .s_axi4l_arprot         (axi4l_peri_arprot),
                .s_axi4l_arvalid        (axi4l_peri_arvalid),
                .s_axi4l_arready        (axi4l_peri_arready),
                .s_axi4l_rdata          (axi4l_peri_rdata),
                .s_axi4l_rresp          (axi4l_peri_rresp),
                .s_axi4l_rvalid         (axi4l_peri_rvalid),
                .s_axi4l_rready         (axi4l_peri_rready),
                
                .m_wb_rst_o             (wb_peri_rst_i),
                .m_wb_clk_o             (wb_peri_clk_i),
                .m_wb_adr_o             (wb_peri_adr_i),
                .m_wb_dat_o             (wb_peri_dat_i),
                .m_wb_dat_i             (wb_peri_dat_o),
                .m_wb_we_o              (wb_peri_we_i),
                .m_wb_sel_o             (wb_peri_sel_i),
                .m_wb_stb_o             (wb_peri_stb_i),
                .m_wb_ack_i             (wb_peri_ack_o)
            );
    
    
    // -----------------------------
    //  Test DMA0
    // -----------------------------
    
    wire    [WB_DAT_WIDTH-1:0]      wb_dma0_dat_o;
    wire                            wb_dma0_stb_i;
    wire                            wb_dma0_ack_o;
    
    test_dma
            #(
                .CORE_ID            (64'h0101),
                
                .WB_ADR_WIDTH       (8),
                .WB_DAT_SIZE        (WB_DAT_SIZE),
                
                .AXI4_ID_WIDTH      (6),
                .AXI4_ADDR_WIDTH    (32),
                .AXI4_DATA_SIZE     (3)   // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_test_dma0
            (
                .reset              (~resetn),
                .clk                (clk),
                
                .s_wb_adr_i         (wb_peri_adr_i[7:0]),
                .s_wb_dat_i         (wb_peri_dat_i),
                .s_wb_dat_o         (wb_dma0_dat_o),
                .s_wb_we_i          (wb_peri_we_i),
                .s_wb_sel_i         (wb_peri_sel_i),
                .s_wb_stb_i         (wb_dma0_stb_i),
                .s_wb_ack_o         (wb_dma0_ack_o),
                
                .m_axi4_awid        (axi4_mem0_awid     ),
                .m_axi4_awaddr      (axi4_mem0_awaddr   ),
                .m_axi4_awlen       (axi4_mem0_awlen    ),
                .m_axi4_awsize      (axi4_mem0_awsize   ),
                .m_axi4_awburst     (axi4_mem0_awburst  ),
                .m_axi4_awlock      (axi4_mem0_awlock   ),
                .m_axi4_awcache     (axi4_mem0_awcache  ),
                .m_axi4_awprot      (axi4_mem0_awprot   ),
                .m_axi4_awqos       (axi4_mem0_awqos    ),
                .m_axi4_awregion    (), // (axi4_mem0_awregion ),
                .m_axi4_awvalid     (axi4_mem0_awvalid  ),
                .m_axi4_awready     (axi4_mem0_awready  ),
                .m_axi4_wdata       (axi4_mem0_wdata    ),
                .m_axi4_wstrb       (axi4_mem0_wstrb    ),
                .m_axi4_wlast       (axi4_mem0_wlast    ),
                .m_axi4_wvalid      (axi4_mem0_wvalid   ),
                .m_axi4_wready      (axi4_mem0_wready   ),
                .m_axi4_bid         (axi4_mem0_bid      ),
                .m_axi4_bresp       (axi4_mem0_bresp    ),
                .m_axi4_bvalid      (axi4_mem0_bvalid   ),
                .m_axi4_bready      (axi4_mem0_bready   ),
                .m_axi4_arid        (axi4_mem0_arid     ),
                .m_axi4_araddr      (axi4_mem0_araddr   ),
                .m_axi4_arlen       (axi4_mem0_arlen    ),
                .m_axi4_arsize      (axi4_mem0_arsize   ),
                .m_axi4_arburst     (axi4_mem0_arburst  ),
                .m_axi4_arlock      (axi4_mem0_arlock   ),
                .m_axi4_arcache     (axi4_mem0_arcache  ),
                .m_axi4_arprot      (axi4_mem0_arprot   ),
                .m_axi4_arqos       (axi4_mem0_arqos    ),
                .m_axi4_arregion    (), // (axi4_mem0_arregion ),
                .m_axi4_arvalid     (axi4_mem0_arvalid  ),
                .m_axi4_arready     (axi4_mem0_arready  ),
                .m_axi4_rid         (axi4_mem0_rid      ),
                .m_axi4_rdata       (axi4_mem0_rdata    ),
                .m_axi4_rresp       (axi4_mem0_rresp    ),
                .m_axi4_rlast       (axi4_mem0_rlast    ),
                .m_axi4_rvalid      (axi4_mem0_rvalid   ),
                .m_axi4_rready      (axi4_mem0_rready   )
            );
    
    
    
    // -----------------------------
    //  Test DMA1
    // -----------------------------
    
    wire    [WB_DAT_WIDTH-1:0]      wb_dma1_dat_o;
    wire                            wb_dma1_stb_i;
    wire                            wb_dma1_ack_o;
    
    test_dma
            #(
                .CORE_ID            (64'h0102),
                
                .WB_ADR_WIDTH       (8),
                .WB_DAT_SIZE        (WB_DAT_SIZE),
                
                .AXI4_ID_WIDTH      (6),
                .AXI4_ADDR_WIDTH    (32),
                .AXI4_DATA_SIZE     (3)   // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_test_dma1
            (
                .reset              (~resetn),
                .clk                (clk),
                
                .s_wb_adr_i         (wb_peri_adr_i[7:0]),
                .s_wb_dat_i         (wb_peri_dat_i),
                .s_wb_dat_o         (wb_dma1_dat_o),
                .s_wb_we_i          (wb_peri_we_i),
                .s_wb_sel_i         (wb_peri_sel_i),
                .s_wb_stb_i         (wb_dma1_stb_i),
                .s_wb_ack_o         (wb_dma1_ack_o),
                
                .m_axi4_awid        (axi4_mem1_awid     ),
                .m_axi4_awaddr      (axi4_mem1_awaddr   ),
                .m_axi4_awlen       (axi4_mem1_awlen    ),
                .m_axi4_awsize      (axi4_mem1_awsize   ),
                .m_axi4_awburst     (axi4_mem1_awburst  ),
                .m_axi4_awlock      (axi4_mem1_awlock   ),
                .m_axi4_awcache     (axi4_mem1_awcache  ),
                .m_axi4_awprot      (axi4_mem1_awprot   ),
                .m_axi4_awqos       (axi4_mem1_awqos    ),
                .m_axi4_awregion    (), // (axi4_mem1_awregion ),
                .m_axi4_awvalid     (axi4_mem1_awvalid  ),
                .m_axi4_awready     (axi4_mem1_awready  ),
                .m_axi4_wdata       (axi4_mem1_wdata    ),
                .m_axi4_wstrb       (axi4_mem1_wstrb    ),
                .m_axi4_wlast       (axi4_mem1_wlast    ),
                .m_axi4_wvalid      (axi4_mem1_wvalid   ),
                .m_axi4_wready      (axi4_mem1_wready   ),
                .m_axi4_bid         (axi4_mem1_bid      ),
                .m_axi4_bresp       (axi4_mem1_bresp    ),
                .m_axi4_bvalid      (axi4_mem1_bvalid   ),
                .m_axi4_bready      (axi4_mem1_bready   ),
                .m_axi4_arid        (axi4_mem1_arid     ),
                .m_axi4_araddr      (axi4_mem1_araddr   ),
                .m_axi4_arlen       (axi4_mem1_arlen    ),
                .m_axi4_arsize      (axi4_mem1_arsize   ),
                .m_axi4_arburst     (axi4_mem1_arburst  ),
                .m_axi4_arlock      (axi4_mem1_arlock   ),
                .m_axi4_arcache     (axi4_mem1_arcache  ),
                .m_axi4_arprot      (axi4_mem1_arprot   ),
                .m_axi4_arqos       (axi4_mem1_arqos    ),
                .m_axi4_arregion    (), // (axi4_mem_arregion ),
                .m_axi4_arvalid     (axi4_mem1_arvalid  ),
                .m_axi4_arready     (axi4_mem1_arready  ),
                .m_axi4_rid         (axi4_mem1_rid      ),
                .m_axi4_rdata       (axi4_mem1_rdata    ),
                .m_axi4_rresp       (axi4_mem1_rresp    ),
                .m_axi4_rlast       (axi4_mem1_rlast    ),
                .m_axi4_rvalid      (axi4_mem1_rvalid   ),
                .m_axi4_rready      (axi4_mem1_rready   )
            );
    
    
    
    // -----------------------------
    //  Test LED
    // -----------------------------
    
    wire    [WB_DAT_WIDTH-1:0]      wb_led_dat_o;
    wire                            wb_led_stb_i;
    wire                            wb_led_ack_o;
    
    reg     [2:0]                   reg_led;
    always @(posedge clk) begin
        if ( ~resetn ) begin
            reg_led <= 0;
        end
        else begin
            if (wb_led_stb_i && wb_peri_we_i && wb_peri_sel_i[0]) begin
                reg_led <= wb_peri_dat_i[2:0];
            end
        end
    end
    
    assign wb_led_dat_o = reg_led;
    assign wb_led_ack_o = wb_led_stb_i;
    
    
    reg     [25:0]  reg_clk_count;
    always @(posedge clk) begin
        if ( ~resetn ) begin
            reg_clk_count <= 0;
        end
        else begin
            reg_clk_count <= reg_clk_count + 1;
        end
    end
    
    assign led[2:0] = reg_led;
    assign led[3]   = reg_clk_count[25];
    
    
    
    // -----------------------------
    //  WISHBONE address decode
    // -----------------------------
    
    assign wb_dma0_stb_i = wb_peri_stb_i & (wb_peri_adr_i[15:8] == 16'h0000);
    assign wb_dma1_stb_i = wb_peri_stb_i & (wb_peri_adr_i[15:8] == 16'h0001);
    assign wb_led_stb_i  = wb_peri_stb_i & (wb_peri_adr_i[15:8] == 16'h0010);
    
    assign wb_peri_dat_o  = wb_dma0_stb_i ? wb_dma0_dat_o :
                            wb_dma1_stb_i ? wb_dma1_dat_o :
                            wb_led_stb_i  ? wb_led_dat_o  :
                            {WB_DAT_WIDTH{1'b0}};
    
    assign wb_peri_ack_o  = wb_dma0_stb_i ? wb_dma0_ack_o :
                            wb_dma1_stb_i ? wb_dma1_ack_o :
                            wb_led_stb_i  ? wb_led_ack_o  :
                            wb_peri_stb_i;
    
    
endmodule



`default_nettype wire


// end of file
