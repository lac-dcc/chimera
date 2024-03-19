// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// 画像処理
module image_processing
        #(
            parameter WB_ADR_WIDTH    = 8,
            parameter WB_DAT_WIDTH    = 32,
            parameter WB_SEL_WIDTH    = (WB_DAT_WIDTH / 8),
            
            parameter AXI4_ID_WIDTH   = 6,
            parameter AXI4_ADDR_WIDTH = 32,
            parameter AXI4_DATA_SIZE  = 3,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter AXI4_DATA_WIDTH = (8 << AXI4_DATA_SIZE),
            parameter AXI4_STRB_WIDTH = AXI4_DATA_WIDTH / 8,
            parameter AXI4_LEN_WIDTH  = 8,
            parameter AXI4_QOS_WIDTH  = 4,
            
            parameter S_DATA_WIDTH    = 10,
            parameter M_DATA_WIDTH    = 8,
            
            parameter MAX_X_NUM       = 4096,
            parameter IMG_Y_NUM       = 480,
            parameter IMG_Y_WIDTH     = 14,
            
            parameter TUSER_WIDTH     = 1,
            parameter S_TDATA_WIDTH   = 1*S_DATA_WIDTH,
            parameter M_TDATA_WIDTH   = 4*M_DATA_WIDTH
        )
        (
            input   wire                                aresetn,
            input   wire                                aclk,
            
            input   wire                                in_update_req,
            
            input   wire                                s_wb_rst_i,
            input   wire                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o,
            input   wire                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            
            input   wire    [TUSER_WIDTH-1:0]           s_axi4s_tuser,
            input   wire                                s_axi4s_tlast,
            input   wire    [S_TDATA_WIDTH-1:0]         s_axi4s_tdata,
            input   wire                                s_axi4s_tvalid,
            output  wire                                s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]           m_axi4s_tuser,
            output  wire                                m_axi4s_tlast,
            output  wire    [M_TDATA_WIDTH-1:0]         m_axi4s_tdata,
            output  wire                                m_axi4s_tvalid,
            input   wire                                m_axi4s_tready,
            
            input   wire                                m_axi4_aresetn,
            input   wire                                m_axi4_aclk,
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_awlen,
            output  wire    [2:0]                       m_axi4_awsize,
            output  wire    [1:0]                       m_axi4_awburst,
            output  wire    [0:0]                       m_axi4_awlock,
            output  wire    [3:0]                       m_axi4_awcache,
            output  wire    [2:0]                       m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_awqos,
            output  wire    [3:0]                       m_axi4_awregion,
            (* mark_debug="true" *)output  wire                                m_axi4_awvalid,
            (* mark_debug="true" *)input   wire                                m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]       m_axi4_wstrb,
            output  wire                                m_axi4_wlast,
            (* mark_debug="true" *)output  wire                                m_axi4_wvalid,
            (* mark_debug="true" *)input   wire                                m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_bid,
            input   wire    [1:0]                       m_axi4_bresp,
            input   wire                                m_axi4_bvalid,
            output  wire                                m_axi4_bready,
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_arlen,
            output  wire    [2:0]                       m_axi4_arsize,
            output  wire    [1:0]                       m_axi4_arburst,
            output  wire    [0:0]                       m_axi4_arlock,
            output  wire    [3:0]                       m_axi4_arcache,
            output  wire    [2:0]                       m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_arqos,
            output  wire    [3:0]                       m_axi4_arregion,
            (* mark_debug="true" *)output  wire                                m_axi4_arvalid,
            (* mark_debug="true" *)input   wire                                m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata,
            input   wire    [1:0]                       m_axi4_rresp,
            input   wire                                m_axi4_rlast,
            (* mark_debug="true" *)input   wire                                m_axi4_rvalid,
            (* mark_debug="true" *)output  wire                                m_axi4_rready
        );
    
    localparam  USE_VALID  = 0;
    localparam  USER_WIDTH = (TUSER_WIDTH - 1) >= 0 ? (TUSER_WIDTH - 1) : 0;
    localparam  USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    wire                                reset = ~aresetn;
    wire                                clk   = aclk;
    wire                                cke;
    
    wire                                img_src_line_first;
    wire                                img_src_line_last;
    wire                                img_src_pixel_first;
    wire                                img_src_pixel_last;
    wire                                img_src_de;
    wire    [USER_BITS-1:0]             img_src_user;
    wire    [S_TDATA_WIDTH-1:0]         img_src_data;
    wire                                img_src_valid;
    
    wire                                img_sink_line_first;
    wire                                img_sink_line_last;
    wire                                img_sink_pixel_first;
    wire                                img_sink_pixel_last;
    wire                                img_sink_de;
    wire    [USER_BITS-1:0]             img_sink_user;
    wire    [M_TDATA_WIDTH-1:0]         img_sink_data;
    wire                                img_sink_valid;
    
    // axi4s<->img
    jelly_axi4s_img
            #(
                .TUSER_WIDTH            (TUSER_WIDTH),
                .S_TDATA_WIDTH          (S_TDATA_WIDTH),
                .M_TDATA_WIDTH          (M_TDATA_WIDTH),
                .IMG_Y_NUM              (IMG_Y_NUM),
                .IMG_Y_WIDTH            (IMG_Y_WIDTH),
                .BLANK_Y_WIDTH          (8),
                .IMG_CKE_BUFG           (0)
            )
        i_axi4s_img
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .param_blank_num        (8'h00),
                
                .s_axi4s_tdata          (s_axi4s_tdata),
                .s_axi4s_tlast          (s_axi4s_tlast),
                .s_axi4s_tuser          (s_axi4s_tuser),
                .s_axi4s_tvalid         (s_axi4s_tvalid),
                .s_axi4s_tready         (s_axi4s_tready),
                
                .m_axi4s_tdata          (m_axi4s_tdata),
                .m_axi4s_tlast          (m_axi4s_tlast),
                .m_axi4s_tuser          (m_axi4s_tuser),
                .m_axi4s_tvalid         (m_axi4s_tvalid),
                .m_axi4s_tready         (m_axi4s_tready),
                
                
                .img_cke                (cke),
                
                .src_img_line_first     (img_src_line_first),
                .src_img_line_last      (img_src_line_last),
                .src_img_pixel_first    (img_src_pixel_first),
                .src_img_pixel_last     (img_src_pixel_last),
                .src_img_de             (img_src_de),
                .src_img_user           (img_src_user),
                .src_img_data           (img_src_data),
                .src_img_valid          (img_src_valid),
                
                .sink_img_line_first    (img_sink_line_first),
                .sink_img_line_last     (img_sink_line_last),
                .sink_img_pixel_first   (img_sink_pixel_first),
                .sink_img_pixel_last    (img_sink_pixel_last),
                .sink_img_user          (img_sink_user),
                .sink_img_de            (img_sink_de),
                .sink_img_data          (img_sink_data),
                .sink_img_valid         (img_sink_valid)
            );
    
    
    // frame buffer
    (* mark_debug="true" *)wire                                img_prvfrm_line_first;
    (* mark_debug="true" *)wire                                img_prvfrm_line_last;
    (* mark_debug="true" *)wire                                img_prvfrm_pixel_first;
    (* mark_debug="true" *)wire                                img_prvfrm_pixel_last;
    (* mark_debug="true" *)wire                                img_prvfrm_de;
    (* mark_debug="true" *)wire    [USER_BITS-1:0]             img_prvfrm_user;
    (* mark_debug="true" *)wire    [S_DATA_WIDTH-1:0]          img_prvfrm_data0;
    (* mark_debug="true" *)wire    [S_DATA_WIDTH-1:0]          img_prvfrm_data1;
    (* mark_debug="true" *)wire                                img_prvfrm_valid;
    
    (* mark_debug="true" *)wire                                img_store_line_first;
    (* mark_debug="true" *)wire                                img_store_line_last;
    (* mark_debug="true" *)wire                                img_store_pixel_first;
    (* mark_debug="true" *)wire                                img_store_pixel_last;
    (* mark_debug="true" *)wire                                img_store_de;
    (* mark_debug="true" *)wire    [S_DATA_WIDTH-1:0]          img_store_data;
    (* mark_debug="true" *)wire                                img_store_valid;
    
    wire    [WB_DAT_WIDTH-1:0]          wb_prvfrm_dat_o;
    wire                                wb_prvfrm_stb_i;
    wire                                wb_prvfrm_ack_o;
    
    jelly_img_previous_frame
            #(
                .UNIT_WIDTH             (2),
                .DATA_WIDTH             (S_DATA_WIDTH),
                .USER_WIDTH             (USER_WIDTH),
                
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_STRB_WIDTH        (AXI4_STRB_WIDTH),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH),
                
                .PARAM_ADDR_WIDTH       (AXI4_ADDR_WIDTH),
                .PARAM_SIZE_WIDTH       (32),
                .PARAM_AWLEN_WIDTH      (8),
                .PARAM_WTIMEOUT_WIDTH   (8),
                .PARAM_ARLEN_WIDTH      (8),
                .PARAM_RTIMEOUT_WIDTH   (8),
                
                .WDATA_FIFO_PTR_WIDTH   (9),
                .WDATA_FIFO_RAM_TYPE    ("block"),
                .RDATA_FIFO_PTR_WIDTH   (9),
                .RDATA_FIFO_RAM_TYPE    ("block"),
                
                .INIT_CTL_CONTROL       (2'b00),
                .INIT_PARAM_ADDR        (32'h00000000),
                .INIT_PARAM_SIZE        (32'h00000000),
                .INIT_PARAM_AWLEN       (8'h0f),
                .INIT_PARAM_WSTRB       ({AXI4_STRB_WIDTH{1'b1}}),
                .INIT_PARAM_WTIMEOUT    (16),
                .INIT_PARAM_ARLEN       (8'h0f),
                .INIT_PARAM_RTIMEOUT    (16),
                .INIT_PARAM_INITDATA    (0)
            )
        i_img_previous_frame
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_img_line_first       (img_src_line_first),
                .s_img_line_last        (img_src_line_last),
                .s_img_pixel_first      (img_src_pixel_first),
                .s_img_pixel_last       (img_src_pixel_last),
                .s_img_de               (img_src_de),
                .s_img_user             (img_src_user),
                .s_img_data             (img_src_data),
                .s_img_valid            (img_src_valid),
                
                .m_img_line_first       (img_prvfrm_line_first),
                .m_img_line_last        (img_prvfrm_line_last),
                .m_img_pixel_first      (img_prvfrm_pixel_first),
                .m_img_pixel_last       (img_prvfrm_pixel_last),
                .m_img_de               (img_prvfrm_de),
                .m_img_user             (img_prvfrm_user),
                .m_img_data             (img_prvfrm_data0),
                .m_img_prev_de          (),
                .m_img_prev_data        (img_prvfrm_data1),
                .m_img_valid            (img_prvfrm_valid),
                
                .s_img_store_line_first (img_store_line_first),
                .s_img_store_line_last  (img_store_line_last),
                .s_img_store_pixel_first(img_store_pixel_first),
                .s_img_store_pixel_last (img_store_pixel_last),
                .s_img_store_de         (img_store_de),
                .s_img_store_data       (img_store_data),
                .s_img_store_valid      (img_store_valid),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i[7:0]),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (wb_prvfrm_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (wb_prvfrm_stb_i),
                .s_wb_ack_o             (wb_prvfrm_ack_o),
                
                .m_axi4_aresetn         (m_axi4_aresetn),
                .m_axi4_aclk            (m_axi4_aclk),
                .m_axi4_awid            (m_axi4_awid),
                .m_axi4_awaddr          (m_axi4_awaddr),
                .m_axi4_awlen           (m_axi4_awlen),
                .m_axi4_awsize          (m_axi4_awsize),
                .m_axi4_awburst         (m_axi4_awburst),
                .m_axi4_awlock          (m_axi4_awlock),
                .m_axi4_awcache         (m_axi4_awcache),
                .m_axi4_awprot          (m_axi4_awprot),
                .m_axi4_awqos           (m_axi4_awqos),
                .m_axi4_awregion        (m_axi4_awregion),
                .m_axi4_awvalid         (m_axi4_awvalid),
                .m_axi4_awready         (m_axi4_awready),
                .m_axi4_wdata           (m_axi4_wdata),
                .m_axi4_wstrb           (m_axi4_wstrb),
                .m_axi4_wlast           (m_axi4_wlast),
                .m_axi4_wvalid          (m_axi4_wvalid),
                .m_axi4_wready          (m_axi4_wready),
                .m_axi4_bid             (m_axi4_bid),
                .m_axi4_bresp           (m_axi4_bresp),
                .m_axi4_bvalid          (m_axi4_bvalid),
                .m_axi4_bready          (m_axi4_bready),
                .m_axi4_arid            (m_axi4_arid),
                .m_axi4_araddr          (m_axi4_araddr),
                .m_axi4_arlen           (m_axi4_arlen),
                .m_axi4_arsize          (m_axi4_arsize),
                .m_axi4_arburst         (m_axi4_arburst),
                .m_axi4_arlock          (m_axi4_arlock),
                .m_axi4_arcache         (m_axi4_arcache),
                .m_axi4_arprot          (m_axi4_arprot),
                .m_axi4_arqos           (m_axi4_arqos),
                .m_axi4_arregion        (m_axi4_arregion),
                .m_axi4_arvalid         (m_axi4_arvalid),
                .m_axi4_arready         (m_axi4_arready),
                .m_axi4_rid             (m_axi4_rid),
                .m_axi4_rdata           (m_axi4_rdata),
                .m_axi4_rresp           (m_axi4_rresp),
                .m_axi4_rlast           (m_axi4_rlast),
                .m_axi4_rvalid          (m_axi4_rvalid),
                .m_axi4_rready          (m_axi4_rready)
            );
    
    
    
    // alpha_belnd with previus frame(LPF)
    wire                                img_blend_line_first;
    wire                                img_blend_line_last;
    wire                                img_blend_pixel_first;
    wire                                img_blend_pixel_last;
    wire                                img_blend_de;
    wire    [USER_BITS-1:0]             img_blend_user;
    wire    [S_DATA_WIDTH-1:0]          img_blend_data;
    wire                                img_blend_valid;
    
    wire    [WB_DAT_WIDTH-1:0]          wb_blend_dat_o;
    wire                                wb_blend_stb_i;
    wire                                wb_blend_ack_o;
    
    jelly_img_alpha_belnd
            #(
                .COMPONENTS             (1),
                .DATA_WIDTH             (S_DATA_WIDTH),
                .ALPHA_WIDTH            (S_DATA_WIDTH),
                .USER_WIDTH             (USER_WIDTH),
                .USE_VALID              (USE_VALID),
                
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .INIT_CTL_CONTROL       (2'b00),
                .INIT_PARAM_ALPHA       ({S_DATA_WIDTH{1'b1}})
            )
        i_img_alpha_belnd
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .in_update_req          (in_update_req),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i[7:0]),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (wb_blend_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (wb_blend_stb_i),
                .s_wb_ack_o             (wb_blend_ack_o),
                
                .s_img_line_first       (img_prvfrm_line_first),
                .s_img_line_last        (img_prvfrm_line_last),
                .s_img_pixel_first      (img_prvfrm_pixel_first),
                .s_img_pixel_last       (img_prvfrm_pixel_last),
                .s_img_de               (img_prvfrm_de),
                .s_img_user             (img_prvfrm_user),
                .s_img_data0            (img_prvfrm_data0),
                .s_img_data1            (img_prvfrm_data1),
                .s_img_valid            (img_prvfrm_valid),
                
                .m_img_line_first       (img_blend_line_first),
                .m_img_line_last        (img_blend_line_last),
                .m_img_pixel_first      (img_blend_pixel_first),
                .m_img_pixel_last       (img_blend_pixel_last ),
                .m_img_de               (img_blend_de),
                .m_img_user             (img_blend_user),
                .m_img_data             (img_blend_data),
                .m_img_valid            (img_blend_valid)
            );
    
    assign img_store_line_first  = img_blend_line_first;
    assign img_store_line_last   = img_blend_line_last;
    assign img_store_pixel_first = img_blend_pixel_first;
    assign img_store_pixel_last  = img_blend_pixel_last;
    assign img_store_de          = img_blend_de;
    assign img_store_data        = img_blend_data;
    assign img_store_valid       = img_blend_valid;
    
    
    
    // demosaic
    wire                                img_demos_line_first;
    wire                                img_demos_line_last;
    wire                                img_demos_pixel_first;
    wire                                img_demos_pixel_last;
    wire                                img_demos_de;
    wire    [USER_BITS-1:0]             img_demos_user;
    wire    [S_DATA_WIDTH-1:0]          img_demos_raw;
    wire    [S_DATA_WIDTH-1:0]          img_demos_r;
    wire    [S_DATA_WIDTH-1:0]          img_demos_g;
    wire    [S_DATA_WIDTH-1:0]          img_demos_b;
    wire                                img_demos_valid;
    
    wire    [WB_DAT_WIDTH-1:0]          wb_demos_dat_o;
    wire                                wb_demos_stb_i;
    wire                                wb_demos_ack_o;
    
    jelly_img_demosaic_acpi
            #(
                .USER_WIDTH             (USER_BITS),
                .DATA_WIDTH             (S_DATA_WIDTH),
                .MAX_X_NUM              (4096),
                .RAM_TYPE               ("block"),
                .USE_VALID              (USE_VALID),
                
                .WB_ADR_WIDTH           (6),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .INIT_PARAM_PHASE       (2'b11)
            )
        i_img_demosaic_acpi
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .in_update_req          (in_update_req),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i[5:0]),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (wb_demos_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (wb_demos_stb_i),
                .s_wb_ack_o             (wb_demos_ack_o),
                
                .s_img_line_first       (img_blend_line_first),
                .s_img_line_last        (img_blend_line_last),
                .s_img_pixel_first      (img_blend_pixel_first),
                .s_img_pixel_last       (img_blend_pixel_last),
                .s_img_de               (img_blend_de),
                .s_img_user             (img_blend_user),
                .s_img_raw              (img_blend_data),
                .s_img_valid            (img_blend_valid),
                
                .m_img_line_first       (img_demos_line_first),
                .m_img_line_last        (img_demos_line_last),
                .m_img_pixel_first      (img_demos_pixel_first),
                .m_img_pixel_last       (img_demos_pixel_last),
                .m_img_de               (img_demos_de),
                .m_img_user             (img_demos_user),
                .m_img_raw              (img_demos_raw),
                .m_img_r                (img_demos_r),
                .m_img_g                (img_demos_g),
                .m_img_b                (img_demos_b),
                .m_img_valid            (img_demos_valid)
            );
    
    
    // color matrix
    wire                                img_colmat_line_first;
    wire                                img_colmat_line_last;
    wire                                img_colmat_pixel_first;
    wire                                img_colmat_pixel_last;
    wire                                img_colmat_de;
    wire    [USER_BITS-1:0]             img_colmat_user;
    wire    [S_DATA_WIDTH-1:0]          img_colmat_raw;
    wire    [S_DATA_WIDTH-1:0]          img_colmat_r;
    wire    [S_DATA_WIDTH-1:0]          img_colmat_g;
    wire    [S_DATA_WIDTH-1:0]          img_colmat_b;
    wire                                img_colmat_valid;
    
    wire    [WB_DAT_WIDTH-1:0]          wb_colmat_dat_o;
    wire                                wb_colmat_stb_i;
    wire                                wb_colmat_ack_o;
    
    jelly_img_color_matrix
            #(
                .USER_WIDTH             (USER_BITS + S_DATA_WIDTH),
                .DATA_WIDTH             (S_DATA_WIDTH),
                .INTERNAL_WIDTH         (S_DATA_WIDTH+2),
                
                .COEFF_INT_WIDTH        (9),
                .COEFF_FRAC_WIDTH       (16),
                .COEFF3_INT_WIDTH       (9),
                .COEFF3_FRAC_WIDTH      (16),
                .STATIC_COEFF           (1),
                .DEVICE                 ("7SERIES"),
                
                .WB_ADR_WIDTH           (6),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .INIT_PARAM_MATRIX00    (1 << 16),
                .INIT_PARAM_MATRIX01    (0),
                .INIT_PARAM_MATRIX02    (0),
                .INIT_PARAM_MATRIX03    (0),
                .INIT_PARAM_MATRIX10    (0),
                .INIT_PARAM_MATRIX11    (1 << 16),
                .INIT_PARAM_MATRIX12    (0),
                .INIT_PARAM_MATRIX13    (0),
                .INIT_PARAM_MATRIX20    (0),
                .INIT_PARAM_MATRIX21    (0),
                .INIT_PARAM_MATRIX22    (1 << 16),
                .INIT_PARAM_MATRIX23    (0),
                .INIT_PARAM_CLIP_MIN0   ({S_DATA_WIDTH{1'b0}}),
                .INIT_PARAM_CLIP_MAX0   ({S_DATA_WIDTH{1'b1}}),
                .INIT_PARAM_CLIP_MIN1   ({S_DATA_WIDTH{1'b0}}),
                .INIT_PARAM_CLIP_MAX1   ({S_DATA_WIDTH{1'b1}}),
                .INIT_PARAM_CLIP_MIN2   ({S_DATA_WIDTH{1'b0}}),
                .INIT_PARAM_CLIP_MAX2   ({S_DATA_WIDTH{1'b1}})
            )
        i_img_color_matrix
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .in_update_req          (in_update_req),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i[5:0]),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (wb_colmat_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (wb_colmat_stb_i),
                .s_wb_ack_o             (wb_colmat_ack_o),
                
                .s_img_line_first       (img_demos_line_first),
                .s_img_line_last        (img_demos_line_last),
                .s_img_pixel_first      (img_demos_pixel_first),
                .s_img_pixel_last       (img_demos_pixel_last),
                .s_img_de               (img_demos_de),
                .s_img_user             ({img_demos_user, img_demos_raw}),
                .s_img_color0           (img_demos_r),
                .s_img_color1           (img_demos_g),
                .s_img_color2           (img_demos_b),
                .s_img_valid            (img_demos_valid),
                
                .m_img_line_first       (img_colmat_line_first),
                .m_img_line_last        (img_colmat_line_last),
                .m_img_pixel_first      (img_colmat_pixel_first),
                .m_img_pixel_last       (img_colmat_pixel_last),
                .m_img_de               (img_colmat_de),
                .m_img_user             ({img_colmat_user, img_colmat_raw}),
                .m_img_color0           (img_colmat_r),
                .m_img_color1           (img_colmat_g),
                .m_img_color2           (img_colmat_b),
                .m_img_valid            (img_colmat_valid)
            );
    
    // gamma correction
    wire                                img_gamma_line_first;
    wire                                img_gamma_line_last;
    wire                                img_gamma_pixel_first;
    wire                                img_gamma_pixel_last;
    wire                                img_gamma_de;
    wire    [USER_BITS-1:0]             img_gamma_user;
    wire    [S_DATA_WIDTH-1:0]          img_gamma_raw;
    wire    [3*M_DATA_WIDTH-1:0]        img_gamma_data;
    wire                                img_gamma_valid;
    
    wire    [WB_DAT_WIDTH-1:0]          wb_gamma_dat_o;
    wire                                wb_gamma_stb_i;
    wire                                wb_gamma_ack_o;
    
    jelly_img_gamma_correction
            #(
                .COMPONENTS             (3),
                .USER_WIDTH             (USER_BITS+S_DATA_WIDTH),
                .S_DATA_WIDTH           (S_DATA_WIDTH),
                .M_DATA_WIDTH           (M_DATA_WIDTH),
                .USE_VALID              (USE_VALID),
                .RAM_TYPE               ("block"),
                
                .WB_ADR_WIDTH           (12),
                .WB_DAT_WIDTH           (32),
                
                .INIT_CTL_CONTROL       (2'b00),
                .INIT_PARAM_ENABLE      (3'b000)
            )
        i_img_gamma_correction
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .in_update_req          (in_update_req),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i[11:0]),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (wb_gamma_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (wb_gamma_stb_i),
                .s_wb_ack_o             (wb_gamma_ack_o),
                
                .s_img_line_first       (img_colmat_line_first),
                .s_img_line_last        (img_colmat_line_last),
                .s_img_pixel_first      (img_colmat_pixel_first),
                .s_img_pixel_last       (img_colmat_pixel_last),
                .s_img_de               (img_colmat_de),
                .s_img_user             ({img_colmat_user, img_colmat_raw}),
                .s_img_data             ({img_colmat_r, img_colmat_g, img_colmat_b}),
                .s_img_valid            (img_colmat_valid),
                
                .m_img_line_first       (img_gamma_line_first),
                .m_img_line_last        (img_gamma_line_last),
                .m_img_pixel_first      (img_gamma_pixel_first),
                .m_img_pixel_last       (img_gamma_pixel_last),
                .m_img_de               (img_gamma_de),
                .m_img_user             ({img_gamma_user, img_gamma_raw}),
                .m_img_data             (img_gamma_data),
                .m_img_valid            (img_gamma_valid)
            );
    
    
    // gaussian
    wire                                img_gauss_line_first;
    wire                                img_gauss_line_last;
    wire                                img_gauss_pixel_first;
    wire                                img_gauss_pixel_last;
    wire                                img_gauss_de;
    wire    [USER_BITS-1:0]             img_gauss_user;
    wire    [S_DATA_WIDTH-1:0]          img_gauss_raw;
    wire    [3*M_DATA_WIDTH-1:0]        img_gauss_data;
    wire                                img_gauss_valid;
    
    wire    [WB_DAT_WIDTH-1:0]          wb_gauss_dat_o;
    wire                                wb_gauss_stb_i;
    wire                                wb_gauss_ack_o;
    
    jelly_img_gaussian_3x3
            #(
                .NUM                    (3),
                .USER_WIDTH             (USER_BITS+S_DATA_WIDTH),
                .COMPONENTS             (3),
                .DATA_WIDTH             (M_DATA_WIDTH),
                .MAX_X_NUM              (MAX_X_NUM),
                .RAM_TYPE               ("block"),
                .USE_VALID              (USE_VALID),
                
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                
                .INIT_CTL_CONTROL       (3'b000),
                .INIT_PARAM_ENABLE      (3'b000)
            )
        i_img_gaussian_3x3
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .in_update_req          (in_update_req),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i[7:0]),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (wb_gauss_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (wb_gauss_stb_i),
                .s_wb_ack_o             (wb_gauss_ack_o),
                
                .s_img_line_first       (img_gamma_line_first),
                .s_img_line_last        (img_gamma_line_last),
                .s_img_pixel_first      (img_gamma_pixel_first),
                .s_img_pixel_last       (img_gamma_pixel_last),
                .s_img_de               (img_gamma_de),
                .s_img_user             ({img_gamma_user, img_gamma_raw}),
                .s_img_data             (img_gamma_data),
                .s_img_valid            (img_gamma_valid),
                
                .m_img_line_first       (img_gauss_line_first),
                .m_img_line_last        (img_gauss_line_last),
                .m_img_pixel_first      (img_gauss_pixel_first),
                .m_img_pixel_last       (img_gauss_pixel_last),
                .m_img_de               (img_gauss_de),
                .m_img_user             ({img_gauss_user, img_gauss_raw}),
                .m_img_data             (img_gauss_data),
                .m_img_valid            (img_gauss_valid)
            );
    
    assign img_sink_line_first  = img_gauss_line_first;
    assign img_sink_line_last   = img_gauss_line_last;
    assign img_sink_pixel_first = img_gauss_pixel_first;
    assign img_sink_pixel_last  = img_gauss_pixel_last;
    assign img_sink_de          = img_gauss_de;
    assign img_sink_user        = img_gauss_user;
    assign img_sink_data        = {img_gauss_raw[S_DATA_WIDTH-1 -: M_DATA_WIDTH], img_gauss_data};
    assign img_sink_valid       = img_gauss_valid;
    
    
    
    // WISHBONE
    assign wb_demos_stb_i   = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:14] == 0);
    assign wb_colmat_stb_i  = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:14] == 1);
    assign wb_gamma_stb_i   = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:14] == 2);
    assign wb_gauss_stb_i   = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:14] == 4);
    assign wb_blend_stb_i   = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:14] == 5);
    assign wb_prvfrm_stb_i  = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:14] == 6);
    
    assign s_wb_dat_o      = wb_demos_stb_i   ? wb_demos_dat_o   :
                             wb_colmat_stb_i  ? wb_colmat_dat_o  :
                             wb_gamma_stb_i   ? wb_gamma_dat_o   :
                             wb_gauss_stb_i   ? wb_gauss_dat_o   :
                             wb_blend_stb_i   ? wb_blend_dat_o   :
                             wb_prvfrm_stb_i  ? wb_prvfrm_dat_o  :
                             {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o      = wb_demos_stb_i   ? wb_demos_ack_o   :
                             wb_colmat_stb_i  ? wb_colmat_ack_o  :
                             wb_gamma_stb_i   ? wb_gamma_ack_o   :
                             wb_gauss_stb_i   ? wb_gauss_ack_o   :
                             wb_blend_stb_i   ? wb_blend_ack_o   :
                             wb_prvfrm_stb_i  ? wb_prvfrm_ack_o  :
                             s_wb_stb_i;
    
    
endmodule



`default_nettype wire



// end of file
