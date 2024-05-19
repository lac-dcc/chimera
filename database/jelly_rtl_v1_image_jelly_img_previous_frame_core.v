// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_previous_frame_core
        #(
            parameter   UNIT_WIDTH           = 8,
            parameter   BYTE_WIDTH           = 8,
            parameter   DATA_WIDTH           = 32,
            parameter   USER_WIDTH           = 0,
            
            parameter   ASYNC                = 1,
            parameter   AXI4_ID_WIDTH        = 6,
            parameter   AXI4_ADDR_WIDTH      = 49,
            parameter   AXI4_DATA_SIZE       = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH      = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH      = AXI4_DATA_WIDTH / 8,
            parameter   AXI4_LEN_WIDTH       = 8,
            parameter   AXI4_QOS_WIDTH       = 4,
            parameter   AXI4_AWID            = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE          = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST         = 2'b01,
            parameter   AXI4_AWLOCK          = 1'b0,
            parameter   AXI4_AWCACHE         = 4'b0001,
            parameter   AXI4_AWPROT          = 3'b000,
            parameter   AXI4_AWQOS           = 0,
            parameter   AXI4_AWREGION        = 4'b0000,
            parameter   AXI4_ARID            = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE          = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST         = 2'b01,
            parameter   AXI4_ARLOCK          = 1'b0,
            parameter   AXI4_ARCACHE         = 4'b0001,
            parameter   AXI4_ARPROT          = 3'b000,
            parameter   AXI4_ARQOS           = 0,
            parameter   AXI4_ARREGION        = 4'b0000,
            
            parameter   BYPASS_ADDR_OFFSET   = 0,   // 0番地からしか使わない場合バイパス可
            parameter   BYPASS_ALIGN         = 0,   // アライメント跨ぎを処理不要の場合バイパス可
            parameter   AXI4_ALIGN           = 12,
            
            parameter   INDEX_WIDTH          = 1,
            
            parameter   PARAM_ADDR_WIDTH     = AXI4_ADDR_WIDTH,
            parameter   PARAM_SIZE_WIDTH     = 32,
            parameter   PARAM_SIZE_OFFSET    = 1'b0,
            parameter   PARAM_AWLEN_WIDTH    = AXI4_LEN_WIDTH,
            parameter   PARAM_WSTRB_WIDTH    = AXI4_STRB_WIDTH,
            parameter   PARAM_WTIMEOUT_WIDTH = 8,
            parameter   PARAM_ARLEN_WIDTH    = AXI4_LEN_WIDTH,
            parameter   PARAM_RTIMEOUT_WIDTH = 8,
            
            parameter   INIT_CTL_CONTROL     = 2'b00,
            parameter   INIT_PARAM_ADDR      = 0,
            parameter   INIT_PARAM_SIZE      = 0,
            parameter   INIT_PARAM_AWLEN     = 8'h0f,
            parameter   INIT_PARAM_WSTRB     = {AXI4_STRB_WIDTH{1'b1}},
            parameter   INIT_PARAM_WTIMEOUT  = 16,
            parameter   INIT_PARAM_ARLEN     = 8'h0f,
            parameter   INIT_PARAM_RTIMEOUT  = 16,
            
            parameter   WDATA_FIFO_PTR_WIDTH = 9,
            parameter   WDATA_FIFO_RAM_TYPE  = "block",
            parameter   WDATA_FIFO_LOW_DEALY = 0,
            parameter   WDATA_FIFO_DOUT_REGS = 1,
            parameter   WDATA_FIFO_S_REGS    = 1,
            parameter   WDATA_FIFO_M_REGS    = 1,
            
            parameter   AWLEN_FIFO_PTR_WIDTH = 5,
            parameter   AWLEN_FIFO_RAM_TYPE  = "distributed",
            parameter   AWLEN_FIFO_LOW_DEALY = 0,
            parameter   AWLEN_FIFO_DOUT_REGS = 1,
            parameter   AWLEN_FIFO_S_REGS    = 0,
            parameter   AWLEN_FIFO_M_REGS    = 1,
            
            parameter   BLEN_FIFO_PTR_WIDTH  = 5,
            parameter   BLEN_FIFO_RAM_TYPE   = "distributed",
            parameter   BLEN_FIFO_LOW_DEALY  = 0,
            parameter   BLEN_FIFO_DOUT_REGS  = 1,
            parameter   BLEN_FIFO_S_REGS     = 0,
            parameter   BLEN_FIFO_M_REGS     = 1,
            
            parameter   RDATA_FIFO_PTR_WIDTH = 9,
            parameter   RDATA_FIFO_RAM_TYPE  = "block",
            parameter   RDATA_FIFO_LOW_DEALY = 0,
            parameter   RDATA_FIFO_DOUT_REGS = 1,
            parameter   RDATA_FIFO_S_REGS    = 1,
            parameter   RDATA_FIFO_M_REGS    = 1,
            
            
            // local
            parameter   USER_BITS            = USER_WIDTH > 1 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire    [USER_BITS-1:0]             s_img_user,
            input   wire    [DATA_WIDTH-1:0]            s_img_data,
            input   wire                                s_img_valid,
            
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire    [USER_BITS-1:0]             m_img_user,
            output  wire    [DATA_WIDTH-1:0]            m_img_data,
            output  wire                                m_img_prev_de,
            output  wire    [DATA_WIDTH-1:0]            m_img_prev_data,
            output  wire                                m_img_valid,
            
            input   wire                                s_img_store_line_first,
            input   wire                                s_img_store_line_last,
            input   wire                                s_img_store_pixel_first,
            input   wire                                s_img_store_pixel_last,
            input   wire                                s_img_store_de,
            input   wire    [DATA_WIDTH-1:0]            s_img_store_data,
            input   wire                                s_img_store_valid,
            
            
            input   wire                                aresetn,
            input   wire                                aclk,
            
            input   wire                                enable,
            output  wire                                busy,
            
            input   wire    [PARAM_ADDR_WIDTH-1:0]      param_addr,
            input   wire    [PARAM_SIZE_WIDTH-1:0]      param_size,
            input   wire    [PARAM_AWLEN_WIDTH-1:0]     param_awlen,
            input   wire    [PARAM_WSTRB_WIDTH-1:0]     param_wstrb,
            input   wire    [PARAM_WTIMEOUT_WIDTH-1:0]  param_wtimeout,
            input   wire    [PARAM_ARLEN_WIDTH-1:0]     param_arlen,
            input   wire    [PARAM_RTIMEOUT_WIDTH-1:0]  param_rtimeout,
            input   wire    [DATA_WIDTH-1:0]            param_initdata,
            
            output  wire                                status_overflow,
            output  wire                                status_underflow,
            
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
            output  wire                                m_axi4_awvalid,
            input   wire                                m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]       m_axi4_wstrb,
            output  wire                                m_axi4_wlast,
            output  wire                                m_axi4_wvalid,
            input   wire                                m_axi4_wready,
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
            output  wire                                m_axi4_arvalid,
            input   wire                                m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata,
            input   wire    [1:0]                       m_axi4_rresp,
            input   wire                                m_axi4_rlast,
            input   wire                                m_axi4_rvalid,
            output  wire                                m_axi4_rready
        );
    
    
    // --------------------------------
    //  DAM
    // --------------------------------
    
    wire    [DATA_WIDTH-1:0]            s_data;
    wire                                s_valid;
    wire                                s_ready;
    
    wire    [DATA_WIDTH-1:0]            m_data;
    wire                                m_valid;
    wire                                m_ready;
    
    jelly_dma_fifo_core
            #(
                .S_ASYNC                (ASYNC),
                .M_ASYNC                (ASYNC),
                .UNIT_WIDTH             (UNIT_WIDTH),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .S_DATA_WIDTH           (DATA_WIDTH),
                .M_DATA_WIDTH           (DATA_WIDTH),
                
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_STRB_WIDTH        (AXI4_STRB_WIDTH),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH),
                .AXI4_AWID              (AXI4_AWID),
                .AXI4_AWSIZE            (AXI4_AWSIZE),
                .AXI4_AWBURST           (AXI4_AWBURST),
                .AXI4_AWLOCK            (AXI4_AWLOCK),
                .AXI4_AWCACHE           (AXI4_AWCACHE),
                .AXI4_AWPROT            (AXI4_AWPROT),
                .AXI4_AWQOS             (AXI4_AWQOS),
                .AXI4_AWREGION          (AXI4_AWREGION),
                .AXI4_ARID              (AXI4_ARID),
                .AXI4_ARSIZE            (AXI4_ARSIZE),
                .AXI4_ARBURST           (AXI4_ARBURST),
                .AXI4_ARLOCK            (AXI4_ARLOCK),
                .AXI4_ARCACHE           (AXI4_ARCACHE),
                .AXI4_ARPROT            (AXI4_ARPROT),
                .AXI4_ARQOS             (AXI4_ARQOS),
                .AXI4_ARREGION          (AXI4_ARREGION),
                
                .BYPASS_ADDR_OFFSET     (BYPASS_ADDR_OFFSET),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                
                .PARAM_ADDR_WIDTH       (PARAM_ADDR_WIDTH),
                .PARAM_SIZE_WIDTH       (PARAM_SIZE_WIDTH),
                .PARAM_SIZE_OFFSET      (PARAM_SIZE_OFFSET),
                .PARAM_AWLEN_WIDTH      (PARAM_AWLEN_WIDTH),
                .PARAM_WSTRB_WIDTH      (PARAM_WSTRB_WIDTH),
                .PARAM_WTIMEOUT_WIDTH   (PARAM_WTIMEOUT_WIDTH),
                .PARAM_ARLEN_WIDTH      (PARAM_ARLEN_WIDTH),
                .PARAM_RTIMEOUT_WIDTH   (PARAM_RTIMEOUT_WIDTH),
                
                .WDATA_FIFO_PTR_WIDTH   (WDATA_FIFO_PTR_WIDTH),
                .WDATA_FIFO_RAM_TYPE    (WDATA_FIFO_RAM_TYPE),
                .WDATA_FIFO_LOW_DEALY   (WDATA_FIFO_LOW_DEALY),
                .WDATA_FIFO_DOUT_REGS   (WDATA_FIFO_DOUT_REGS),
                .WDATA_FIFO_S_REGS      (WDATA_FIFO_S_REGS),
                .WDATA_FIFO_M_REGS      (WDATA_FIFO_M_REGS),
                
                .AWLEN_FIFO_PTR_WIDTH   (AWLEN_FIFO_PTR_WIDTH),
                .AWLEN_FIFO_RAM_TYPE    (AWLEN_FIFO_RAM_TYPE),
                .AWLEN_FIFO_LOW_DEALY   (AWLEN_FIFO_LOW_DEALY),
                .AWLEN_FIFO_DOUT_REGS   (AWLEN_FIFO_DOUT_REGS),
                .AWLEN_FIFO_S_REGS      (AWLEN_FIFO_S_REGS),
                .AWLEN_FIFO_M_REGS      (AWLEN_FIFO_M_REGS),
                
                .BLEN_FIFO_PTR_WIDTH    (BLEN_FIFO_PTR_WIDTH),
                .BLEN_FIFO_RAM_TYPE     (BLEN_FIFO_RAM_TYPE),
                .BLEN_FIFO_LOW_DEALY    (BLEN_FIFO_LOW_DEALY),
                .BLEN_FIFO_DOUT_REGS    (BLEN_FIFO_DOUT_REGS),
                .BLEN_FIFO_S_REGS       (BLEN_FIFO_S_REGS),
                .BLEN_FIFO_M_REGS       (BLEN_FIFO_M_REGS),
                                         
                .RDATA_FIFO_PTR_WIDTH   (RDATA_FIFO_PTR_WIDTH),
                .RDATA_FIFO_RAM_TYPE    (RDATA_FIFO_RAM_TYPE),
                .RDATA_FIFO_LOW_DEALY   (RDATA_FIFO_LOW_DEALY),
                .RDATA_FIFO_DOUT_REGS   (RDATA_FIFO_DOUT_REGS),
                .RDATA_FIFO_S_REGS      (RDATA_FIFO_S_REGS),
                .RDATA_FIFO_M_REGS      (RDATA_FIFO_M_REGS)
            )
        i_axi4_dma_fifo_core
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .enable                 (enable),
                .busy                   (busy),
                
                .param_addr             (param_addr),
                .param_size             (param_size),
                .param_awlen            (param_awlen),
                .param_wstrb            (param_wstrb),
                .param_wtimeout         (param_wtimeout),
                .param_arlen            (param_arlen),
                .param_rtimeout         (param_rtimeout),
                
                .s_reset                (reset),
                .s_clk                  (clk),
                .s_data                 (s_data ),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_reset                (reset),
                .m_clk                  (clk),
                .m_data                 (m_data),
                .m_valid                (m_valid),
                .m_ready                (m_ready),
                
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
    
    
    
    // --------------------------------
    //  control
    // --------------------------------
    
    (* ASYNC_REG = "true" *)   reg     ff0_enable, ff1_enable;
    (* ASYNC_REG = "true" *)   reg     ff0_busy,   ff1_busy;
    
    always @(posedge clk) begin
        ff0_enable <= enable;
        ff1_enable <= ff0_enable;
        
        ff0_busy   <= busy;
        ff1_busy   <= ff0_busy;
    end
    
    
    wire   overflow  = s_valid & !s_ready;
    wire   underflow = m_ready & !m_valid;
    
    reg     reg_overflow;
    reg     reg_underflow;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_overflow  <= 1'b0;
            reg_underflow <= 1'b0;
        end
        else begin
            if ( !ff1_enable && !ff1_busy ) begin
                reg_overflow  <= 1'b0;
                reg_underflow <= 1'b0;
            end
            else begin
                if ( overflow ) begin
                    reg_overflow  <= 1'b1;
                end
                
                if ( underflow ) begin
                    reg_underflow  <= 1'b1;
                end
            end
        end
    end
    
    assign status_overflow  = reg_overflow;
    assign status_underflow = reg_underflow;
    
    
    reg                             st0_line_first;
    reg                             st0_line_last;
    reg                             st0_pixel_first;
    reg                             st0_pixel_last;
    reg                             st0_de;
    reg     [USER_BITS-1:0]         st0_user;
    reg     [DATA_WIDTH-1:0]        st0_data;
    reg                             st0_read_enable;
    reg                             st0_valid;
    
    reg                             st1_line_first;
    reg                             st1_line_last;
    reg                             st1_pixel_first;
    reg                             st1_pixel_last;
    reg                             st1_de;
    reg     [USER_BITS-1:0]         st1_user;
    reg     [DATA_WIDTH-1:0]        st1_data;
    reg                             st1_read_ready;
    reg                             st1_valid;
    
    reg                             st2_line_first;
    reg                             st2_line_last;
    reg                             st2_pixel_first;
    reg                             st2_pixel_last;
    reg                             st2_de;
    reg     [USER_BITS-1:0]         st2_user;
    reg     [DATA_WIDTH-1:0]        st2_data;
    reg                             st2_prev_de;
    reg     [DATA_WIDTH-1:0]        st2_prev_data;
    reg                             st2_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_line_first  <= 1'bx;
            st0_line_last   <= 1'bx;
            st0_pixel_first <= 1'bx;
            st0_pixel_last  <= 1'bx;
            st0_de          <= 1'bx;
            st0_user        <= 1'bx;
            st0_data        <= {DATA_WIDTH{1'bx}};
            st0_read_enable <= 1'b0;
            st0_valid       <= 1'b0;
            
            st1_line_first  <= 1'bx;
            st1_line_last   <= 1'bx;
            st1_pixel_first <= 1'bx;
            st1_pixel_last  <= 1'bx;
            st1_de          <= 1'bx;
            st1_user        <= 1'bx;
            st1_data        <= {DATA_WIDTH{1'bx}};
            st1_read_ready  <= 1'b0;
            st1_valid       <= 1'b0;
            
            st2_line_first  <= 1'bx;
            st2_line_last   <= 1'bx;
            st2_pixel_first <= 1'bx;
            st2_pixel_last  <= 1'bx;
            st2_de          <= 1'bx;
            st2_user        <= 1'bx;
            st2_data        <= {DATA_WIDTH{1'bx}};
            st2_prev_de     <= 1'bx;
            st2_prev_data   <= {DATA_WIDTH{1'bx}};
            st2_valid       <= 1'b0;
        end
        else if ( cke ) begin
            st0_line_first  <= s_img_line_first;
            st0_line_last   <= s_img_line_last;
            st0_pixel_first <= s_img_pixel_first;
            st0_pixel_last  <= s_img_pixel_last;
            st0_de          <= s_img_de;
            st0_user        <= s_img_user;
            st0_data        <= s_img_data;
            st0_valid       <= s_img_valid;
            if ( s_img_valid & s_img_line_first & s_img_pixel_first ) begin
                st0_read_enable <= m_valid;
            end
            
            st1_line_first  <= st0_line_first;
            st1_line_last   <= st0_line_last;
            st1_pixel_first <= st0_pixel_first;
            st1_pixel_last  <= st0_pixel_last;
            st1_de          <= st0_de;
            st1_user        <= st0_user;
            st1_data        <= st0_data;
            st1_valid       <= st0_valid;
            st1_read_ready  <= st0_valid & st0_read_enable & st0_de;
            
            st2_line_first  <= st1_line_first;
            st2_line_last   <= st1_line_last;
            st2_pixel_first <= st1_pixel_first;
            st2_pixel_last  <= st1_pixel_last;
            st2_de          <= st1_de;
            st2_user        <= st1_user;
            st2_data        <= st1_data;
            st2_prev_de     <= (m_valid & m_ready);
            st2_prev_data   <= (m_valid & m_ready) ? m_data : param_initdata;
            st2_valid       <= st1_valid;
        end
    end
    
    assign m_ready = (cke & st1_read_ready) | ~ff1_enable;
    
    assign m_img_line_first  = st2_line_first;
    assign m_img_line_last   = st2_line_last;
    assign m_img_pixel_first = st2_pixel_first;
    assign m_img_pixel_last  = st2_pixel_last;
    assign m_img_de          = st2_de;
    assign m_img_user        = st2_user;
    assign m_img_data        = st2_data;
    assign m_img_prev_de     = st2_prev_de;
    assign m_img_prev_data   = st2_prev_data;
    assign m_img_valid       = st2_valid;
    
    
    // write
    reg                         reg_write_enable;
    reg                         reg_write_de;
    reg     [DATA_WIDTH-1:0]    reg_write_data;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_write_enable <= 1'b0;
            reg_write_de   <= 1'bx;
            reg_write_data <= {DATA_WIDTH{1'bx}};
        end
        if ( cke ) begin
            if ( s_img_store_valid & s_img_store_line_first & s_img_store_pixel_first ) begin
                reg_write_enable <= ff1_busy;
            end
            reg_write_de   <= s_img_store_valid & s_img_store_de;
            reg_write_data <= s_img_store_data;
        end
    end
    
    assign s_data  = reg_write_data;
    assign s_valid = reg_write_enable & reg_write_de & cke;
    
    
endmodule


`default_nettype wire


// end of file
