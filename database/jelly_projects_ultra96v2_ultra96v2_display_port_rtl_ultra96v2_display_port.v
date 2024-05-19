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

module ultra96v2_display_port
            (
                output  wire    [1:0]   led
            );
    
    
    
    // -----------------------------
    //  ZynqMP PS
    // -----------------------------
    
    wire                                dp_video_ref_reset;
    wire                                dp_video_ref_clk;
    wire                                dp_video_out_vsync;
    wire                                dp_video_out_hsync;
    wire    [35:0]                      dp_live_video_in_pixel1;
    
    
    localparam  AXI4L_PERI_ADDR_WIDTH = 40;
    localparam  AXI4L_PERI_DATA_SIZE  = 3;     // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
    localparam  AXI4L_PERI_DATA_WIDTH = (8 << AXI4L_PERI_DATA_SIZE);
    localparam  AXI4L_PERI_STRB_WIDTH = AXI4L_PERI_DATA_WIDTH / 8;
    
    wire                                 peri_aresetn;
    wire                                 peri_aclk;
    
    wire    [AXI4L_PERI_ADDR_WIDTH-1:0]  axi4l_peri_awaddr;
    wire    [2:0]                        axi4l_peri_awprot;
    wire                                 axi4l_peri_awvalid;
    wire                                 axi4l_peri_awready;
    wire    [AXI4L_PERI_STRB_WIDTH-1:0]  axi4l_peri_wstrb;
    wire    [AXI4L_PERI_DATA_WIDTH-1:0]  axi4l_peri_wdata;
    wire                                 axi4l_peri_wvalid;
    wire                                 axi4l_peri_wready;
    wire    [1:0]                        axi4l_peri_bresp;
    wire                                 axi4l_peri_bvalid;
    wire                                 axi4l_peri_bready;
    wire    [AXI4L_PERI_ADDR_WIDTH-1:0]  axi4l_peri_araddr;
    wire    [2:0]                        axi4l_peri_arprot;
    wire                                 axi4l_peri_arvalid;
    wire                                 axi4l_peri_arready;
    wire    [AXI4L_PERI_DATA_WIDTH-1:0]  axi4l_peri_rdata;
    wire    [1:0]                        axi4l_peri_rresp;
    wire                                 axi4l_peri_rvalid;
    wire                                 axi4l_peri_rready;
    
    
    
    localparam  AXI4_MEM_ID_WIDTH   = 6;
    localparam  AXI4_MEM_ADDR_WIDTH = 49;
    localparam  AXI4_MEM_DATA_SIZE  = 4;   // 2:32bit, 3:64bit, ...
    localparam  AXI4_MEM_DATA_WIDTH = (8 << AXI4_MEM_DATA_SIZE);
    localparam  AXI4_MEM_STRB_WIDTH = AXI4_MEM_DATA_WIDTH / 8;
    
    wire                                 mem_aresetn;
    wire                                 mem_aclk;
    
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_awid;
    wire    [AXI4_MEM_ADDR_WIDTH-1:0]    axi4_mem0_awaddr;
    wire    [1:0]                        axi4_mem0_awburst;
    wire    [3:0]                        axi4_mem0_awcache;
    wire    [7:0]                        axi4_mem0_awlen;
    wire    [0:0]                        axi4_mem0_awlock;
    wire    [2:0]                        axi4_mem0_awprot;
    wire    [3:0]                        axi4_mem0_awqos;
    wire    [3:0]                        axi4_mem0_awregion;
    wire    [2:0]                        axi4_mem0_awsize;
    wire                                 axi4_mem0_awvalid;
    wire                                 axi4_mem0_awready;
    wire    [AXI4_MEM_STRB_WIDTH-1:0]    axi4_mem0_wstrb;
    wire    [AXI4_MEM_DATA_WIDTH-1:0]    axi4_mem0_wdata;
    wire                                 axi4_mem0_wlast;
    wire                                 axi4_mem0_wvalid;
    wire                                 axi4_mem0_wready;
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_bid;
    wire    [1:0]                        axi4_mem0_bresp;
    wire                                 axi4_mem0_bvalid;
    wire                                 axi4_mem0_bready;
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_arid;
    wire    [AXI4_MEM_ADDR_WIDTH-1:0]    axi4_mem0_araddr;
    wire    [1:0]                        axi4_mem0_arburst;
    wire    [3:0]                        axi4_mem0_arcache;
    wire    [7:0]                        axi4_mem0_arlen;
    wire    [0:0]                        axi4_mem0_arlock;
    wire    [2:0]                        axi4_mem0_arprot;
    wire    [3:0]                        axi4_mem0_arqos;
    wire    [3:0]                        axi4_mem0_arregion;
    wire    [2:0]                        axi4_mem0_arsize;
    wire                                 axi4_mem0_arvalid;
    wire                                 axi4_mem0_arready;
    wire    [AXI4_MEM_ID_WIDTH-1:0]      axi4_mem0_rid;
    wire    [1:0]                        axi4_mem0_rresp;
    wire    [AXI4_MEM_DATA_WIDTH-1:0]    axi4_mem0_rdata;
    wire                                 axi4_mem0_rlast;
    wire                                 axi4_mem0_rvalid;
    wire                                 axi4_mem0_rready;
    
    design_1
        i_design_1
            (
                .dp_video_ref_reset         (dp_video_ref_reset),
                .dp_video_ref_clk           (dp_video_ref_clk),
                .dp_video_out_vsync         (dp_video_out_vsync),
                .dp_video_out_hsync         (dp_video_out_hsync),
                .dp_live_video_in_pixel1    (dp_live_video_in_pixel1),
                
                .peri_aresetn               (peri_aresetn),
                .peri_aclk                  (peri_aclk),
                .m_axi4l_peri_awaddr        (axi4l_peri_awaddr),
                .m_axi4l_peri_awprot        (axi4l_peri_awprot),
                .m_axi4l_peri_awvalid       (axi4l_peri_awvalid),
                .m_axi4l_peri_awready       (axi4l_peri_awready),
                .m_axi4l_peri_wdata         (axi4l_peri_wdata),
                .m_axi4l_peri_wstrb         (axi4l_peri_wstrb),
                .m_axi4l_peri_wvalid        (axi4l_peri_wvalid),
                .m_axi4l_peri_wready        (axi4l_peri_wready),
                .m_axi4l_peri_bresp         (axi4l_peri_bresp),
                .m_axi4l_peri_bvalid        (axi4l_peri_bvalid),
                .m_axi4l_peri_bready        (axi4l_peri_bready),
                .m_axi4l_peri_araddr        (axi4l_peri_araddr),
                .m_axi4l_peri_arprot        (axi4l_peri_arprot),
                .m_axi4l_peri_arvalid       (axi4l_peri_arvalid),
                .m_axi4l_peri_arready       (axi4l_peri_arready),
                .m_axi4l_peri_rdata         (axi4l_peri_rdata),
                .m_axi4l_peri_rresp         (axi4l_peri_rresp),
                .m_axi4l_peri_rvalid        (axi4l_peri_rvalid),
                .m_axi4l_peri_rready        (axi4l_peri_rready),
                
                .mem_aresetn                (mem_aresetn),
                .mem_aclk                   (mem_aclk),
                .s_axi4_mem0_awid           (axi4_mem0_awid),
                .s_axi4_mem0_awaddr         (axi4_mem0_awaddr),
                .s_axi4_mem0_awburst        (axi4_mem0_awburst),
                .s_axi4_mem0_awcache        (axi4_mem0_awcache),
                .s_axi4_mem0_awlen          (axi4_mem0_awlen),
                .s_axi4_mem0_awlock         (axi4_mem0_awlock),
                .s_axi4_mem0_awprot         (axi4_mem0_awprot),
                .s_axi4_mem0_awqos          (axi4_mem0_awqos),
                .s_axi4_mem0_awsize         (axi4_mem0_awsize),
                .s_axi4_mem0_awvalid        (axi4_mem0_awvalid),
                .s_axi4_mem0_awready        (axi4_mem0_awready),
                .s_axi4_mem0_wdata          (axi4_mem0_wdata),
                .s_axi4_mem0_wstrb          (axi4_mem0_wstrb),
                .s_axi4_mem0_wlast          (axi4_mem0_wlast),
                .s_axi4_mem0_wvalid         (axi4_mem0_wvalid),
                .s_axi4_mem0_wready         (axi4_mem0_wready),
                .s_axi4_mem0_bid            (axi4_mem0_bid),
                .s_axi4_mem0_bready         (axi4_mem0_bready),
                .s_axi4_mem0_bresp          (axi4_mem0_bresp),
                .s_axi4_mem0_bvalid         (axi4_mem0_bvalid),
                .s_axi4_mem0_arid           (axi4_mem0_arid),
                .s_axi4_mem0_araddr         (axi4_mem0_araddr),
                .s_axi4_mem0_arburst        (axi4_mem0_arburst),
                .s_axi4_mem0_arcache        (axi4_mem0_arcache),
                .s_axi4_mem0_arlen          (axi4_mem0_arlen),
                .s_axi4_mem0_arlock         (axi4_mem0_arlock),
                .s_axi4_mem0_arprot         (axi4_mem0_arprot),
                .s_axi4_mem0_arqos          (axi4_mem0_arqos),
                .s_axi4_mem0_arsize         (axi4_mem0_arsize),
                .s_axi4_mem0_arvalid        (axi4_mem0_arvalid),
                .s_axi4_mem0_arready        (axi4_mem0_arready),
                .s_axi4_mem0_rid            (axi4_mem0_rid),
                .s_axi4_mem0_rresp          (axi4_mem0_rresp),
                .s_axi4_mem0_rdata          (axi4_mem0_rdata),
                .s_axi4_mem0_rlast          (axi4_mem0_rlast),
                .s_axi4_mem0_rvalid         (axi4_mem0_rvalid),
                .s_axi4_mem0_rready         (axi4_mem0_rready)
            );
    
    
    
    // -----------------------------
    //  Peripheral BUS (WISHBONE)
    // -----------------------------
    
    localparam  WB_DAT_SIZE  = AXI4L_PERI_DATA_SIZE;
    localparam  WB_ADR_WIDTH = AXI4L_PERI_ADDR_WIDTH - WB_DAT_SIZE;
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
                .AXI4L_ADDR_WIDTH       (AXI4L_PERI_ADDR_WIDTH),
                .AXI4L_DATA_SIZE        (AXI4L_PERI_DATA_SIZE)     // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
            )
        i_axi4l_to_wishbone
            (
                .s_axi4l_aresetn        (peri_aresetn),
                .s_axi4l_aclk           (peri_aclk),
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
    
    
    
    // -----------------------------------------
    //  Read
    // -----------------------------------------
    
    
    localparam  VOUT_X_NUM = 1920;
    localparam  VOUT_Y_NUM = 1080;
    
    wire    [23:0]                      axi4s_vout_tdata;
    wire                                axi4s_vout_tlast;
    wire    [0:0]                       axi4s_vout_tuser;
    wire                                axi4s_vout_tvalid;
    wire                                axi4s_vout_tready;
    
    
    wire    [WB_DAT_WIDTH-1:0]          wb_vdmar_dat_o;
    wire                                wb_vdmar_stb_i;
    wire                                wb_vdmar_ack_o;
    
    jelly_dma_video_read
            #(
                .WB_ASYNC               (1),
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .AXI4S_ASYNC            (1),
                .AXI4S_DATA_WIDTH       (24), // (32),
                .AXI4S_USER_WIDTH       (1),
                
                .AXI4_ID_WIDTH          (AXI4_MEM_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_MEM_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_MEM_DATA_SIZE),
                .AXI4_LEN_WIDTH         (8),
                .AXI4_QOS_WIDTH         (4),
                
                .INDEX_WIDTH            (1),
                .SIZE_OFFSET            (1'b1),
                .H_SIZE_WIDTH           (12),
                .V_SIZE_WIDTH           (12),
                .F_SIZE_WIDTH           (8),
                .LINE_STEP_WIDTH        (AXI4_MEM_ADDR_WIDTH),
                .FRAME_STEP_WIDTH       (AXI4_MEM_ADDR_WIDTH),
                
                .INIT_CTL_CONTROL       (4'b0000),
                .INIT_IRQ_ENABLE        (1'b0),
                .INIT_PARAM_ADDR        (0),
                .INIT_PARAM_AWLEN_MAX   (255),
                .INIT_PARAM_H_SIZE      (VOUT_X_NUM-1),
                .INIT_PARAM_V_SIZE      (VOUT_Y_NUM-1),
                .INIT_PARAM_LINE_STEP   (8192),
                .INIT_PARAM_F_SIZE      (0),
                .INIT_PARAM_FRAME_STEP  (VOUT_Y_NUM*8192),
                
                .BYPASS_GATE            (0),
                .BYPASS_ALIGN           (0),
                .ALLOW_UNALIGNED        (0),
                .CAPACITY_WIDTH         (32),
                .RFIFO_PTR_WIDTH        (10),
                .RFIFO_RAM_TYPE         ("block")
            )
        i_dma_video_read
            (
                .endian                 (1'b0),
                
                .s_wb_rst_i             (wb_peri_rst_i),
                .s_wb_clk_i             (wb_peri_clk_i),
                .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_dat_o             (wb_vdmar_dat_o),
                .s_wb_we_i              (wb_peri_we_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_stb_i             (wb_vdmar_stb_i),
                .s_wb_ack_o             (wb_vdmar_ack_o),
                .out_irq                (),
                
                .buffer_request         (),
                .buffer_release         (),
                .buffer_addr            (),
                
                .m_axi4s_aresetn        (~vout_reset),
                .m_axi4s_aclk           (vout_clk),
                .m_axi4s_tdata          (axi4s_vout_tdata),
                .m_axi4s_tlast          (axi4s_vout_tlast),
                .m_axi4s_tuser          (axi4s_vout_tuser),
                .m_axi4s_tvalid         (axi4s_vout_tvalid),
                .m_axi4s_tready         (axi4s_vout_tready),
                
                .m_aresetn              (mem_aresetn),
                .m_aclk                 (mem_aclk),
                .m_axi4_arid            (axi4_mem0_arid),
                .m_axi4_araddr          (axi4_mem0_araddr),
                .m_axi4_arlen           (axi4_mem0_arlen),
                .m_axi4_arsize          (axi4_mem0_arsize),
                .m_axi4_arburst         (axi4_mem0_arburst),
                .m_axi4_arlock          (axi4_mem0_arlock),
                .m_axi4_arcache         (axi4_mem0_arcache),
                .m_axi4_arprot          (axi4_mem0_arprot),
                .m_axi4_arqos           (axi4_mem0_arqos),
                .m_axi4_arregion        (axi4_mem0_arregion),
                .m_axi4_arvalid         (axi4_mem0_arvalid),
                .m_axi4_arready         (axi4_mem0_arready),
                .m_axi4_rid             (axi4_mem0_rid),
                .m_axi4_rdata           (axi4_mem0_rdata),
                .m_axi4_rresp           (axi4_mem0_rresp),
                .m_axi4_rlast           (axi4_mem0_rlast),
                .m_axi4_rvalid          (axi4_mem0_rvalid),
                .m_axi4_rready          (axi4_mem0_rready)
            );
    
    
    
    // ----------------------------------------
    //  VOUT
    // ----------------------------------------
    
    wire                        vout_reset = dp_video_ref_reset;
    wire                        vout_clk   = dp_video_ref_clk;
    
    wire                        vout_vsgen_vsync;
    wire                        vout_vsgen_hsync;
    wire                        vout_vsgen_de;
    
    wire    [WB_DAT_WIDTH-1:0]  wb_vsgen_dat_o;
    wire                        wb_vsgen_stb_i;
    wire                        wb_vsgen_ack_o;
    
    generate
    if ( 0 ) begin
        jelly_vsync_generator
                #(
                    .WB_ADR_WIDTH           (8),
                    .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                    .INIT_CTL_CONTROL       (1'b0),
                    
                    .INIT_HTOTAL            (2200),
                    .INIT_HDISP_START       (0),
                    .INIT_HDISP_END         (1920),
                    .INIT_HSYNC_START       (2008),
                    .INIT_HSYNC_END         (2052),
                    .INIT_HSYNC_POL         (1),
                    .INIT_VTOTAL            (1125),
                    .INIT_VDISP_START       (0),
                    .INIT_VDISP_END         (1080),
                    .INIT_VSYNC_START       (1084),
                    .INIT_VSYNC_END         (1089),
                    .INIT_VSYNC_POL         (1)
                )
            i_vsync_generator
                (
                    .reset                  (vout_reset),
                    .clk                    (vout_clk),
                    
                    .out_vsync              (vout_vsgen_vsync),
                    .out_hsync              (vout_vsgen_hsync),
                    .out_de                 (vout_vsgen_de),
                    
                    .s_wb_rst_i             (wb_peri_rst_i),
                    .s_wb_clk_i             (wb_peri_clk_i),
                    .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                    .s_wb_dat_o             (wb_vsgen_dat_o),
                    .s_wb_dat_i             (wb_peri_dat_i),
                    .s_wb_we_i              (wb_peri_we_i),
                    .s_wb_sel_i             (wb_peri_sel_i),
                    .s_wb_stb_i             (wb_vsgen_stb_i),
                    .s_wb_ack_o             (wb_vsgen_ack_o)
                );
    end
    else begin
        jelly_vsync_adjust_de
                #(
                   .USER_WIDTH              (0),
                   .H_COUNT_WIDTH           (14),
                   .V_COUNT_WIDTH           (14),
                   
                   .WB_ADR_WIDTH            (8),
                   .WB_DAT_WIDTH            (WB_DAT_WIDTH),
                   
                   .INIT_CTL_CONTROL        (2'b00),
                   .INIT_PARAM_HSIZE        (1920-1),
                   .INIT_PARAM_VSIZE        (1080-1),
                   .INIT_PARAM_HSTART       (131),
                   .INIT_PARAM_VSTART       (35),
                   .INIT_PARAM_HPOL         (1),
                   .INIT_PARAM_VPOL         (1)
                )
            i_vsync_adjust_de
                (
                    .reset                  (vout_reset),
                    .clk                    (vout_clk),
                    
                    .in_update_req          (1'b1),
                    
                    .s_wb_rst_i             (wb_peri_rst_i),
                    .s_wb_clk_i             (wb_peri_clk_i),
                    .s_wb_adr_i             (wb_peri_adr_i[7:0]),
                    .s_wb_dat_o             (wb_vsgen_dat_o),
                    .s_wb_dat_i             (wb_peri_dat_i),
                    .s_wb_we_i              (wb_peri_we_i),
                    .s_wb_sel_i             (wb_peri_sel_i),
                    .s_wb_stb_i             (wb_vsgen_stb_i),
                    .s_wb_ack_o             (wb_vsgen_ack_o),
                    
                    .in_vsync               (dp_video_out_vsync),
                    .in_hsync               (dp_video_out_hsync),
                    .in_user                (1'b0),
                    
                    .out_vsync              (vout_vsgen_vsync),
                    .out_hsync              (vout_vsgen_hsync),
                    .out_de                 (vout_vsgen_de),
                    .out_user               ()
                );
    end
    endgenerate
    
    
    wire                vout_vsync;
    wire                vout_hsync;
    wire                vout_de;
    wire    [23:0]      vout_data;
    wire    [3:0]       vout_ctl;
    
    jelly_vout_axi4s
            #(
                .WIDTH                  (24)
            )
        i_vout_axi4s
            (
                .reset                  (vout_reset),
                .clk                    (vout_clk),
                
                .s_axi4s_tuser          (axi4s_vout_tuser),
                .s_axi4s_tlast          (axi4s_vout_tlast),
                .s_axi4s_tdata          (axi4s_vout_tdata[23:0]),
                .s_axi4s_tvalid         (axi4s_vout_tvalid),
                .s_axi4s_tready         (axi4s_vout_tready),
                
                .in_vsync               (vout_vsgen_vsync),
                .in_hsync               (vout_vsgen_hsync),
                .in_de                  (vout_vsgen_de),
                .in_ctl                 (4'd0),
                
                .out_vsync              (vout_vsync),
                .out_hsync              (vout_hsync),
                .out_de                 (vout_de),
                .out_data               (vout_data),
                .out_ctl                (vout_ctl)
            );
    
    assign dp_live_video_in_pixel1[11:0]  = {vout_data[15: 8], vout_data[15:12]};
    assign dp_live_video_in_pixel1[23:12] = {vout_data[23:16], vout_data[23:20]};
    assign dp_live_video_in_pixel1[35:24] = {vout_data[ 7: 0], vout_data[ 7: 4]};
    
    
    
    // -----------------------------
    //  WISHBONE address decode
    // -----------------------------
    
    assign wb_vdmar_stb_i = wb_peri_stb_i & (wb_peri_adr_i[15:8] == 16'h0010);
    assign wb_vsgen_stb_i = wb_peri_stb_i & (wb_peri_adr_i[15:8] == 16'h0020);
    
    assign wb_peri_dat_o  = wb_vdmar_stb_i ? wb_vdmar_dat_o :
                            wb_vsgen_stb_i ? wb_vsgen_dat_o :
                            {WB_DAT_WIDTH{1'b0}};
    
    assign wb_peri_ack_o  = wb_vdmar_stb_i ? wb_vdmar_ack_o :
                            wb_vsgen_stb_i ? wb_vsgen_ack_o :
                            wb_peri_stb_i;
    
    
    // -----------------------------
    //  Debug
    // -----------------------------
    
    assign led = 0;
    
    
endmodule



`default_nettype wire


// end of file
