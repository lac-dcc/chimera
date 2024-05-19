// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ns / 1 ps

module design_1
        (
            output  wire    [0:0]   dp_video_ref_reset,
            output  wire            dp_video_ref_clk,
            output  wire            dp_video_out_vsync,
            output  wire            dp_video_out_hsync,
            output  wire            dp_live_video_de_out,
            
            input   wire            dp_live_video_in_de,
            input   wire            dp_live_video_in_hsync,
            input   wire    [35:0]  dp_live_video_in_pixel1,
            input   wire            dp_live_video_in_vsync,
            
            output  wire    [0:0]   peri_aresetn,
            output  wire            peri_aclk,
            output  wire    [39:0]  m_axi4l_peri_awaddr,
            output  wire    [2:0]   m_axi4l_peri_awprot,
            output  wire            m_axi4l_peri_awvalid,
            input   wire            m_axi4l_peri_awready,
            output  wire    [63:0]  m_axi4l_peri_wdata,
            output  wire    [7:0]   m_axi4l_peri_wstrb,
            output  wire            m_axi4l_peri_wvalid,
            input   wire            m_axi4l_peri_wready,
            input   wire    [1:0]   m_axi4l_peri_bresp,
            input   wire            m_axi4l_peri_bvalid,
            output  wire            m_axi4l_peri_bready,
            output  wire    [39:0]  m_axi4l_peri_araddr,
            output  wire    [2:0]   m_axi4l_peri_arprot,
            output  wire            m_axi4l_peri_arvalid,
            input   wire            m_axi4l_peri_arready,
            output  wire    [63:0]  m_axi4l_peri_rdata,
            output  wire    [1:0]   m_axi4l_peri_rresp,
            output  wire            m_axi4l_peri_rvalid,
            input   wire            m_axi4l_peri_rready,
            
            output  wire    [0:0]   mem_aresetn,
            output  wire            mem_aclk,
            input   wire    [5:0]   s_axi4_mem0_awid,
            input   wire            s_axi4_mem0_awuser,
            input   wire    [48:0]  s_axi4_mem0_awaddr,
            input   wire    [1:0]   s_axi4_mem0_awburst,
            input   wire    [3:0]   s_axi4_mem0_awcache,
            input   wire    [7:0]   s_axi4_mem0_awlen,
            input   wire    [0:0]   s_axi4_mem0_awlock,
            input   wire    [2:0]   s_axi4_mem0_awprot,
            input   wire    [3:0]   s_axi4_mem0_awqos,
            input   wire    [2:0]   s_axi4_mem0_awsize,
            input   wire            s_axi4_mem0_awvalid,
            output  wire            s_axi4_mem0_awready,
            input   wire    [127:0] s_axi4_mem0_wdata,
            input   wire    [15:0]  s_axi4_mem0_wstrb,
            input   wire            s_axi4_mem0_wlast,
            input   wire            s_axi4_mem0_wvalid,
            output  wire            s_axi4_mem0_wready,
            output  wire    [5:0]   s_axi4_mem0_bid,
            output  wire    [1:0]   s_axi4_mem0_bresp,
            output  wire            s_axi4_mem0_bvalid,
            input   wire            s_axi4_mem0_bready,
            input   wire    [5:0]   s_axi4_mem0_arid,
            input   wire            s_axi4_mem0_aruser,
            input   wire    [48:0]  s_axi4_mem0_araddr,
            input   wire    [1:0]   s_axi4_mem0_arburst,
            input   wire    [3:0]   s_axi4_mem0_arcache,
            input   wire    [7:0]   s_axi4_mem0_arlen,
            input   wire    [0:0]   s_axi4_mem0_arlock,
            input   wire    [2:0]   s_axi4_mem0_arprot,
            input   wire    [3:0]   s_axi4_mem0_arqos,
            input   wire    [2:0]   s_axi4_mem0_arsize,
            input   wire            s_axi4_mem0_arvalid,
            output  wire            s_axi4_mem0_arready,
            output  wire    [5:0]   s_axi4_mem0_rid,
            output  wire    [1:0]   s_axi4_mem0_rresp,
            output  wire    [127:0] s_axi4_mem0_rdata,
            output  wire            s_axi4_mem0_rlast,
            output  wire            s_axi4_mem0_rvalid,
            input   wire            s_axi4_mem0_rready
        );
    
    localparam RATE100 = 1000.0/100.00;
    localparam RATE150 = 1000.0/150.00;
    localparam RATE148 = 1000.0/148.00;
    
    reg         reset = 1;
    initial #100 reset = 0;
    
    reg         clk100 = 1'b1;
    always #(RATE100/2.0) clk100 <= ~clk100;
    
    reg         clk150 = 1'b1;
    always #(RATE150/2.0) clk150 <= ~clk150;
    
    reg         clk148 = 1'b1;
    always #(RATE148/2.0) clk148 <= ~clk148;
    
    
    
    assign dp_video_ref_reset = reset;
    assign dp_video_ref_clk   = clk148;
    
    assign peri_aresetn       = ~reset;
    assign peri_aclk          = clk100;
    
    assign mem_aresetn        = ~reset;
    assign mem_aclk           = clk150;
    
    
    jelly_vsync_generator_core
            #(
                .V_COUNTER_WIDTH    (16),
                .H_COUNTER_WIDTH    (16)
            )
        i_vsync_generator_core
            (
                .reset              (reset),
                .clk                (dp_video_ref_clk),
                
                .ctl_enable         (1'b1),
                .ctl_busy           (),
                
                .param_htotal       (2200),
                .param_hdisp_start  (0),
                .param_hdisp_end    (1920),
                .param_hsync_start  (2008),
                .param_hsync_end    (2052),
                .param_hsync_pol    (1),
                /*
                .param_vtotal       (1125),
                .param_vdisp_start  (0),
                .param_vdisp_end    (1080),
                .param_vsync_start  (1084),
                .param_vsync_end    (1089),
                .param_vsync_pol    (1),
                */
                .param_vtotal       (32),
                .param_vdisp_start  (0),
                .param_vdisp_end    (16),
                .param_vsync_start  (16+4),
                .param_vsync_end    (16+8),
                .param_vsync_pol    (1),
                
                .out_vsync          (dp_video_out_vsync),
                .out_hsync          (dp_video_out_hsync),
                .out_de             (dp_live_video_de_out)
            );
    
    
    
    jelly_axi4_slave_model
            #(
                .AXI_ID_WIDTH           (6),
                .AXI_ADDR_WIDTH         (49),
                .AXI_DATA_SIZE          (4),
                .MEM_WIDTH              (17),
                
                .WRITE_LOG_FILE         ("axi4_mem0_write.txt"),
                .READ_LOG_FILE          ("axi4_mem0_read.txt"),
                
                .READ_DATA_ADDR         (1),
                
                .AW_DELAY               (20),
                .AR_DELAY               (20),
                
                .AW_FIFO_PTR_WIDTH      (4),
                .W_FIFO_PTR_WIDTH       (4),
                .B_FIFO_PTR_WIDTH       (4),
                .AR_FIFO_PTR_WIDTH      (4),
                .R_FIFO_PTR_WIDTH       (4),
                
                .AW_BUSY_RATE           (0),
                .W_BUSY_RATE            (0),
                .B_BUSY_RATE            (0),
                .AR_BUSY_RATE           (0),
                .R_BUSY_RATE            (0)
            )
        i_axi4_slave_model_0
            (
                .aresetn                (mem_aresetn),
                .aclk                   (mem_aclk),
                
                .s_axi4_awid            (s_axi4_mem0_awid),
                .s_axi4_awaddr          (s_axi4_mem0_awaddr),
                .s_axi4_awlen           (s_axi4_mem0_awlen),
                .s_axi4_awsize          (s_axi4_mem0_awsize),
                .s_axi4_awburst         (s_axi4_mem0_awburst),
                .s_axi4_awlock          (s_axi4_mem0_awlock),
                .s_axi4_awcache         (s_axi4_mem0_awcache),
                .s_axi4_awprot          (s_axi4_mem0_awprot),
                .s_axi4_awqos           (s_axi4_mem0_awqos),
                .s_axi4_awvalid         (s_axi4_mem0_awvalid),
                .s_axi4_awready         (s_axi4_mem0_awready),
                .s_axi4_wdata           (s_axi4_mem0_wdata),
                .s_axi4_wstrb           (s_axi4_mem0_wstrb),
                .s_axi4_wlast           (s_axi4_mem0_wlast),
                .s_axi4_wvalid          (s_axi4_mem0_wvalid),
                .s_axi4_wready          (s_axi4_mem0_wready),
                .s_axi4_bid             (s_axi4_mem0_bid),
                .s_axi4_bresp           (s_axi4_mem0_bresp),
                .s_axi4_bvalid          (s_axi4_mem0_bvalid),
                .s_axi4_bready          (s_axi4_mem0_bready),
                .s_axi4_arid            (s_axi4_mem0_arid),
                .s_axi4_araddr          (s_axi4_mem0_araddr),
                .s_axi4_arlen           (s_axi4_mem0_arlen),
                .s_axi4_arsize          (s_axi4_mem0_arsize),
                .s_axi4_arburst         (s_axi4_mem0_arburst),
                .s_axi4_arlock          (s_axi4_mem0_arlock),
                .s_axi4_arcache         (s_axi4_mem0_arcache),
                .s_axi4_arprot          (s_axi4_mem0_arprot),
                .s_axi4_arqos           (s_axi4_mem0_arqos),
                .s_axi4_arvalid         (s_axi4_mem0_arvalid),
                .s_axi4_arready         (s_axi4_mem0_arready),
                .s_axi4_rid             (s_axi4_mem0_rid),
                .s_axi4_rdata           (s_axi4_mem0_rdata),
                .s_axi4_rresp           (s_axi4_mem0_rresp),
                .s_axi4_rlast           (s_axi4_mem0_rlast),
                .s_axi4_rvalid          (s_axi4_mem0_rvalid),
                .s_axi4_rready          (s_axi4_mem0_rready)
            );
    
    
endmodule

