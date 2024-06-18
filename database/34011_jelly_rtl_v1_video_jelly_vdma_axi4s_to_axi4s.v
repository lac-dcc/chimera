// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns/1ps
`default_nettype none



module jelly_vdma_axi4s_to_axi4s
        #(
            parameter   CORE_ID              = 32'h527a_1040,
            parameter   CORE_VERSION         = 32'h0000_0000,
            
            parameter   WASYNC               = 0,
            parameter   WFIFO_PTR_WIDTH      = 9,
            parameter   WPIXEL_SIZE          = 2,   // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            
            parameter   RASYNC               = 0,
            parameter   RFIFO_PTR_WIDTH      = 9,
            parameter   RPIXEL_SIZE          = 2,   // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            
            parameter   AXI4_ID_WIDTH        = 6,
            parameter   AXI4_ADDR_WIDTH      = 32,
            parameter   AXI4_DATA_SIZE       = 2,   // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH      = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH      = (1 << AXI4_DATA_SIZE),
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
            
            parameter   AXI4S_S_DATA_SIZE    = 2,   // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            parameter   AXI4S_S_DATA_WIDTH   = (8 << AXI4S_S_DATA_SIZE),
            parameter   AXI4S_S_USER_WIDTH   = 1,
            
            parameter   AXI4S_M_DATA_SIZE    = 2,   // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            parameter   AXI4S_M_DATA_WIDTH   = (8 << AXI4S_M_DATA_SIZE),
            parameter   AXI4S_M_USER_WIDTH   = 1,
            
            parameter   AXI4_AW_REGS         = 1,
            parameter   AXI4_W_REGS          = 1,
            parameter   AXI4S_S_REGS         = 1,
            
            parameter   AXI4_AR_REGS         = 1,
            parameter   AXI4_R_REGS          = 1,
            parameter   AXI4S_M_REGS         = 1,
            
            parameter   INDEX_WIDTH          = 8,
            parameter   STRIDE_WIDTH         = 14,
            parameter   H_WIDTH              = 10,
            parameter   V_WIDTH              = 10,
            parameter   SIZE_WIDTH           = H_WIDTH + V_WIDTH,
            
            parameter   WIDLE_SKIP           = 1,
            
            parameter   WPACKET_ENABLE       = (WFIFO_PTR_WIDTH >= AXI4_LEN_WIDTH),
            parameter   WISSUE_COUNTER_WIDTH = 10,
            
            parameter   RLIMITTER_ENABLE     = 0,
            parameter   RLIMITTER_MARGINE    = 4,
            parameter   RISSUE_COUNTER_WIDTH = 10,
            
            parameter   WB_ADR_WIDTH         = 8,
            parameter   WB_DAT_WIDTH         = 32,
            parameter   WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8),
            
            parameter   TRIG_ASYNC           = 1,   // WISHBONEと非同期の場合
            parameter   TRIG_WSTART_ENABLE   = 0,
            parameter   TRIG_RSTART_ENABLE   = 0,
            
            parameter   BUF_INIT_NEW         = 2'b11,
            parameter   BUF_INIT_WRITE       = 2'b11,
            parameter   BUF_INIT_READ        = 2'b11,
            
            parameter   INIT_CTL_AUTOFLIP    = 2'b11,
            parameter   INIT_PARAM_ADDR0     = 32'h0000_0000,
            parameter   INIT_PARAM_ADDR1     = 32'h0010_0000,
            parameter   INIT_PARAM_ADDR2     = 32'h0020_0000,
            
            parameter   INIT_WCTL_CONTROL    = 3'b000,
            parameter   INIT_WPARAM_ADDR     = 32'h0000_0000,
            parameter   INIT_WPARAM_STRIDE   = 4096,
            parameter   INIT_WPARAM_WIDTH    = 640,
            parameter   INIT_WPARAM_HEIGHT   = 480,
            parameter   INIT_WPARAM_SIZE     = INIT_WPARAM_WIDTH * INIT_WPARAM_HEIGHT,
            parameter   INIT_WPARAM_AWLEN    = 7,
            
            parameter   INIT_RCTL_CONTROL    = 3'b000,
            parameter   INIT_RPARAM_ADDR     = 32'h0000_0000,
            parameter   INIT_RPARAM_STRIDE   = 4096,
            parameter   INIT_RPARAM_WIDTH    = 640,
            parameter   INIT_RPARAM_HEIGHT   = 480,
            parameter   INIT_RPARAM_SIZE     = INIT_RPARAM_WIDTH * INIT_RPARAM_HEIGHT,
            parameter   INIT_RPARAM_ARLEN    = 7
        )
        (
            // master AXI4
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
            output  wire                                m_axi4_rready,
            
            // slave AXI4-Stream (input)
            input   wire                                s_axi4s_aresetn,
            input   wire                                s_axi4s_aclk,
            input   wire    [AXI4S_S_DATA_WIDTH-1:0]    s_axi4s_tdata,
            input   wire                                s_axi4s_tlast,
            input   wire    [AXI4S_S_USER_WIDTH-1:0]    s_axi4s_tuser,
            input   wire                                s_axi4s_tvalid,
            output  wire                                s_axi4s_tready,
            
            // master AXI4-Stream (output)
            input   wire                                m_axi4s_aresetn,
            input   wire                                m_axi4s_aclk,
            output  wire    [AXI4S_M_DATA_WIDTH-1:0]    m_axi4s_tdata,
            output  wire                                m_axi4s_tlast,
            output  wire    [AXI4S_M_USER_WIDTH-1:0]    m_axi4s_tuser,
            output  wire                                m_axi4s_tvalid,
            input   wire                                m_axi4s_tready,
            
            // WISHBONE (register access)
            input   wire                                s_wb_rst_i,
            input   wire                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o,
            input   wire                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            output  wire                                out_wirq,
            output  wire                                out_rirq,
            
            // external trigger
            input   wire                                trig_reset,
            input   wire                                trig_clk,
            input   wire                                trig_wstart,
            input   wire                                trig_rstart
        );
    
    // address mask
    localparam  [AXI4_ADDR_WIDTH-1:0]   ADDR_MASK = ~((1 << AXI4_DATA_SIZE) - 1);
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  REGOFFSET_ID                = 32'h0000_0000 >> 2;
    localparam  REGOFFSET_VERSION           = 32'h0000_0004 >> 2;
    
    localparam  REGOFFSET_CTL_AUTOFLIP      = 32'h0000_0010 >> 2;
    localparam  REGOFFSET_PARAM_ADDR0       = 32'h0000_0020 >> 2;
    localparam  REGOFFSET_PARAM_ADDR1       = 32'h0000_0024 >> 2;
    localparam  REGOFFSET_PARAM_ADDR2       = 32'h0000_0028 >> 2;
    localparam  REGOFFSET_MONITOR_BUF_NEW   = 32'h0000_0030 >> 2;
    localparam  REGOFFSET_MONITOR_BUF_WRITE = 32'h0000_0034 >> 2;
    localparam  REGOFFSET_MONITOR_BUF_READ  = 32'h0000_0038 >> 2;
    
    localparam  REGOFFSET_WCTL_CONTROL      = 32'h0000_0110 >> 2;
    localparam  REGOFFSET_WCTL_STATUS       = 32'h0000_0114 >> 2;
    localparam  REGOFFSET_WCTL_INDEX        = 32'h0000_011c >> 2;
    
    localparam  REGOFFSET_WPARAM_ADDR       = 32'h0000_0120 >> 2;
    localparam  REGOFFSET_WPARAM_STRIDE     = 32'h0000_0124 >> 2;
    localparam  REGOFFSET_WPARAM_WIDTH      = 32'h0000_0128 >> 2;
    localparam  REGOFFSET_WPARAM_HEIGHT     = 32'h0000_012c >> 2;
    localparam  REGOFFSET_WPARAM_SIZE       = 32'h0000_0130 >> 2;
    localparam  REGOFFSET_WPARAM_AWLEN      = 32'h0000_013c >> 2;
    
    localparam  REGOFFSET_WMONITOR_ADDR     = 32'h0000_0140 >> 2;
    localparam  REGOFFSET_WMONITOR_STRIDE   = 32'h0000_0144 >> 2;
    localparam  REGOFFSET_WMONITOR_WIDTH    = 32'h0000_0148 >> 2;
    localparam  REGOFFSET_WMONITOR_HEIGHT   = 32'h0000_014c >> 2;
    localparam  REGOFFSET_WMONITOR_SIZE     = 32'h0000_0150 >> 2;
    localparam  REGOFFSET_WMONITOR_AWLEN    = 32'h0000_015c >> 2;
    
    localparam  REGOFFSET_RCTL_CONTROL      = 32'h0000_0210 >> 2;
    localparam  REGOFFSET_RCTL_STATUS       = 32'h0000_0214 >> 2;
    localparam  REGOFFSET_RCTL_INDEX        = 32'h0000_021c >> 2;
    
    localparam  REGOFFSET_RPARAM_ADDR       = 32'h0000_0220 >> 2;
    localparam  REGOFFSET_RPARAM_STRIDE     = 32'h0000_0224 >> 2;
    localparam  REGOFFSET_RPARAM_WIDTH      = 32'h0000_0228 >> 2;
    localparam  REGOFFSET_RPARAM_HEIGHT     = 32'h0000_022c >> 2;
    localparam  REGOFFSET_RPARAM_SIZE       = 32'h0000_0230 >> 2;
    localparam  REGOFFSET_RPARAM_ARLEN      = 32'h0000_023c >> 2;
    
    localparam  REGOFFSET_RMONITOR_ADDR     = 32'h0000_0240 >> 2;
    localparam  REGOFFSET_RMONITOR_STRIDE   = 32'h0000_0244 >> 2;
    localparam  REGOFFSET_RMONITOR_WIDTH    = 32'h0000_0248 >> 2;
    localparam  REGOFFSET_RMONITOR_HEIGHT   = 32'h0000_024c >> 2;
    localparam  REGOFFSET_RMONITOR_SIZE     = 32'h0000_0250 >> 2;
    localparam  REGOFFSET_RMONITOR_ARLEN    = 32'h0000_025c >> 2;
    
    
    localparam  WCONTROL_WIDTH              = TRIG_WSTART_ENABLE ? 4 : 3;
    localparam  WSTATUS_WIDTH               = 1;
    
    localparam  RCONTROL_WIDTH              = TRIG_RSTART_ENABLE ? 4 : 3;
    localparam  RSTATUS_WIDTH               = 1;
    
    // registers
    reg     [1:0]                   reg_ctl_autoflip;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_param_addr0;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_param_addr1;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_param_addr2;
    wire    [1:0]                   sig_monitor_buf_new;
    wire    [1:0]                   sig_monitor_buf_write;
    wire    [1:0]                   sig_monitor_buf_read;
    
    reg     [WCONTROL_WIDTH-1:0]    reg_wctl_control;
    wire    [WSTATUS_WIDTH-1:0]     sig_wctl_status;
    wire    [INDEX_WIDTH-1:0]       sig_wctl_index;
    
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_wparam_addr;
    reg     [STRIDE_WIDTH-1:0]      reg_wparam_stride;
    reg     [H_WIDTH-1:0]           reg_wparam_width;
    reg     [V_WIDTH-1:0]           reg_wparam_height;
    reg     [SIZE_WIDTH-1:0]        reg_wparam_size;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_wparam_awlen;
    
    wire    [AXI4_ADDR_WIDTH-1:0]   sig_wmonitor_addr;
    wire    [STRIDE_WIDTH-1:0]      sig_wmonitor_stride;
    wire    [H_WIDTH-1:0]           sig_wmonitor_width;
    wire    [V_WIDTH-1:0]           sig_wmonitor_height;
    wire    [SIZE_WIDTH-1:0]        sig_wmonitor_size;
    wire    [AXI4_LEN_WIDTH-1:0]    sig_wmonitor_awlen;
    
    reg     [2:0]                   reg_wprev_index;
    
    reg                             reg_wirq;
    
    reg     [RCONTROL_WIDTH-1:0]    reg_rctl_control;
    wire    [RSTATUS_WIDTH-1:0]     sig_rctl_status;
    wire    [INDEX_WIDTH-1:0]       sig_rctl_index;
    
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_rparam_addr;
    reg     [STRIDE_WIDTH-1:0]      reg_rparam_stride;
    reg     [H_WIDTH-1:0]           reg_rparam_width;
    reg     [V_WIDTH-1:0]           reg_rparam_height;
    reg     [SIZE_WIDTH-1:0]        reg_rparam_size;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_rparam_arlen;
    
    wire    [AXI4_ADDR_WIDTH-1:0]   sig_rmonitor_addr;
    wire    [STRIDE_WIDTH-1:0]      sig_rmonitor_stride;
    wire    [H_WIDTH-1:0]           sig_rmonitor_width;
    wire    [V_WIDTH-1:0]           sig_rmonitor_height;
    wire    [SIZE_WIDTH-1:0]        sig_rmonitor_size;
    wire    [AXI4_LEN_WIDTH-1:0]    sig_rmonitor_arlen;
    
    reg     [2:0]                   reg_rprev_index;
    
    reg                             reg_rirq;
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_autoflip  <= INIT_CTL_AUTOFLIP;
            reg_param_addr0   <= INIT_PARAM_ADDR0;
            reg_param_addr1   <= INIT_PARAM_ADDR1;
            reg_param_addr2   <= INIT_PARAM_ADDR2;
            
            reg_wctl_control  <= INIT_WCTL_CONTROL;
            reg_wparam_addr   <= INIT_WPARAM_ADDR   & ADDR_MASK;
            reg_wparam_stride <= INIT_WPARAM_STRIDE & ADDR_MASK;
            reg_wparam_width  <= INIT_WPARAM_WIDTH;
            reg_wparam_height <= INIT_WPARAM_HEIGHT;
            reg_wparam_size   <= INIT_WPARAM_SIZE;
            reg_wparam_awlen  <= INIT_WPARAM_AWLEN;
            reg_wprev_index   <= 3'b000;
            reg_wirq          <= 1'b0;
            
            reg_rctl_control  <= INIT_RCTL_CONTROL;
            reg_rparam_addr   <= INIT_RPARAM_ADDR   & ADDR_MASK;
            reg_rparam_stride <= INIT_RPARAM_STRIDE & ADDR_MASK;
            reg_rparam_width  <= INIT_RPARAM_WIDTH;
            reg_rparam_height <= INIT_RPARAM_HEIGHT;
            reg_rparam_size   <= INIT_RPARAM_SIZE;
            reg_rparam_arlen  <= INIT_RPARAM_ARLEN;
            reg_rprev_index   <= 3'b000;
            reg_rirq          <= 1'b0;
        end
        else begin
            // register write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                REGOFFSET_CTL_AUTOFLIP:     reg_ctl_autoflip  <= s_wb_dat_i[1:0];
                REGOFFSET_PARAM_ADDR0:      reg_param_addr0   <= s_wb_dat_i[AXI4_ADDR_WIDTH-1:0] & ADDR_MASK;
                REGOFFSET_PARAM_ADDR1:      reg_param_addr1   <= s_wb_dat_i[AXI4_ADDR_WIDTH-1:0] & ADDR_MASK;
                REGOFFSET_PARAM_ADDR2:      reg_param_addr2   <= s_wb_dat_i[AXI4_ADDR_WIDTH-1:0] & ADDR_MASK;
                
                REGOFFSET_WCTL_CONTROL:     reg_wctl_control  <= s_wb_dat_i[WCONTROL_WIDTH-1:0];
                REGOFFSET_WPARAM_ADDR:      reg_wparam_addr   <= s_wb_dat_i[AXI4_ADDR_WIDTH-1:0] & ADDR_MASK;
                REGOFFSET_WPARAM_STRIDE:    reg_wparam_stride <= s_wb_dat_i[STRIDE_WIDTH-1:0]    & ADDR_MASK;
                REGOFFSET_WPARAM_WIDTH:     reg_wparam_width  <= s_wb_dat_i[H_WIDTH-1:0];
                REGOFFSET_WPARAM_HEIGHT:    reg_wparam_height <= s_wb_dat_i[V_WIDTH-1:0];
                REGOFFSET_WPARAM_SIZE:      reg_wparam_size   <= s_wb_dat_i[SIZE_WIDTH-1:0];
                REGOFFSET_WPARAM_AWLEN:     reg_wparam_awlen  <= s_wb_dat_i[AXI4_LEN_WIDTH-1:0];
                
                REGOFFSET_RCTL_CONTROL:     reg_rctl_control  <= s_wb_dat_i[RCONTROL_WIDTH-1:0];
                REGOFFSET_RPARAM_ADDR:      reg_rparam_addr   <= s_wb_dat_i[AXI4_ADDR_WIDTH-1:0] & ADDR_MASK;
                REGOFFSET_RPARAM_STRIDE:    reg_rparam_stride <= s_wb_dat_i[STRIDE_WIDTH-1:0]    & ADDR_MASK;
                REGOFFSET_RPARAM_WIDTH:     reg_rparam_width  <= s_wb_dat_i[H_WIDTH-1:0];
                REGOFFSET_RPARAM_HEIGHT:    reg_rparam_height <= s_wb_dat_i[V_WIDTH-1:0];
                REGOFFSET_RPARAM_SIZE:      reg_rparam_size   <= s_wb_dat_i[SIZE_WIDTH-1:0];
                REGOFFSET_RPARAM_ARLEN:     reg_rparam_arlen  <= s_wb_dat_i[AXI4_LEN_WIDTH-1:0];
                endcase
            end
            
            // write
            reg_wirq           <= 1'b0;
            reg_wprev_index[0] <= sig_wctl_index[0];
            reg_wprev_index[1] <= reg_wprev_index[0];
            reg_wprev_index[2] <= reg_wprev_index[1];
            if ( reg_wprev_index[2] != reg_wprev_index[1] ) begin
                // IRQ puls
                reg_wirq <= 1'b1;
                
                // update flag auto clear
                if ( !reg_ctl_autoflip[0] ) begin
                    reg_wctl_control[1] <= 1'b0;
                end
                
                // auto stop
                if ( reg_wctl_control[2] ) begin
                    reg_wctl_control[0] <= 1'b0;
                    reg_wctl_control[2] <= 1'b0;
                end
            end
            
            // read
            reg_rirq           <= 1'b0;
            reg_rprev_index[0] <= sig_rctl_index[0];
            reg_rprev_index[1] <= reg_rprev_index[0];
            reg_rprev_index[2] <= reg_rprev_index[1];
            if ( reg_rprev_index[2] != reg_rprev_index[1] ) begin
                // IRQ puls
                reg_rirq <= 1'b1;
                
                // update flag auto clear
                if ( !reg_ctl_autoflip[1] ) begin
                    reg_rctl_control[1] <= 1'b0;
                end
                
                // auto stop
                if ( reg_rctl_control[2] ) begin
                    reg_rctl_control[0] <= 1'b0;
                    reg_rctl_control[2] <= 1'b0;
                end
            end
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == REGOFFSET_ID)                ? CORE_ID               :
                        (s_wb_adr_i == REGOFFSET_VERSION)           ? CORE_VERSION          :
                        (s_wb_adr_i == REGOFFSET_CTL_AUTOFLIP)      ? reg_ctl_autoflip      :
                        (s_wb_adr_i == REGOFFSET_PARAM_ADDR0)       ? reg_param_addr0       :
                        (s_wb_adr_i == REGOFFSET_PARAM_ADDR1)       ? reg_param_addr1       :
                        (s_wb_adr_i == REGOFFSET_PARAM_ADDR2)       ? reg_param_addr2       :
                        (s_wb_adr_i == REGOFFSET_MONITOR_BUF_NEW)   ? sig_monitor_buf_new   :
                        (s_wb_adr_i == REGOFFSET_MONITOR_BUF_WRITE) ? sig_monitor_buf_write :
                        (s_wb_adr_i == REGOFFSET_MONITOR_BUF_READ)  ? sig_monitor_buf_read  :
                        (s_wb_adr_i == REGOFFSET_WCTL_CONTROL)      ? reg_wctl_control      :
                        (s_wb_adr_i == REGOFFSET_WCTL_STATUS)       ? sig_wctl_status       :
                        (s_wb_adr_i == REGOFFSET_WCTL_INDEX)        ? sig_wctl_index        :
                        (s_wb_adr_i == REGOFFSET_WPARAM_ADDR)       ? reg_wparam_addr       :
                        (s_wb_adr_i == REGOFFSET_WPARAM_STRIDE)     ? reg_wparam_stride     :
                        (s_wb_adr_i == REGOFFSET_WPARAM_WIDTH)      ? reg_wparam_width      :
                        (s_wb_adr_i == REGOFFSET_WPARAM_HEIGHT)     ? reg_wparam_height     :
                        (s_wb_adr_i == REGOFFSET_WPARAM_SIZE)       ? reg_wparam_size       :
                        (s_wb_adr_i == REGOFFSET_WPARAM_AWLEN)      ? reg_wparam_awlen      :
                        (s_wb_adr_i == REGOFFSET_WMONITOR_ADDR)     ? sig_wmonitor_addr     :
                        (s_wb_adr_i == REGOFFSET_WMONITOR_STRIDE)   ? sig_wmonitor_stride   :
                        (s_wb_adr_i == REGOFFSET_WMONITOR_WIDTH)    ? sig_wmonitor_width    :
                        (s_wb_adr_i == REGOFFSET_WMONITOR_HEIGHT)   ? sig_wmonitor_height   :
                        (s_wb_adr_i == REGOFFSET_WMONITOR_SIZE)     ? sig_wmonitor_size     :
                        (s_wb_adr_i == REGOFFSET_WMONITOR_AWLEN)    ? sig_wmonitor_awlen    :
                        (s_wb_adr_i == REGOFFSET_RCTL_CONTROL)      ? reg_rctl_control      :
                        (s_wb_adr_i == REGOFFSET_RCTL_STATUS)       ? sig_rctl_status       :
                        (s_wb_adr_i == REGOFFSET_RCTL_INDEX)        ? sig_rctl_index        :
                        (s_wb_adr_i == REGOFFSET_RPARAM_ADDR)       ? reg_rparam_addr       :
                        (s_wb_adr_i == REGOFFSET_RPARAM_STRIDE)     ? reg_rparam_stride     :
                        (s_wb_adr_i == REGOFFSET_RPARAM_WIDTH)      ? reg_rparam_width      :
                        (s_wb_adr_i == REGOFFSET_RPARAM_HEIGHT)     ? reg_rparam_height     :
                        (s_wb_adr_i == REGOFFSET_RPARAM_SIZE)       ? reg_rparam_size       :
                        (s_wb_adr_i == REGOFFSET_RPARAM_ARLEN)      ? reg_rparam_arlen      :
                        (s_wb_adr_i == REGOFFSET_RMONITOR_ADDR)     ? sig_rmonitor_addr     :
                        (s_wb_adr_i == REGOFFSET_RMONITOR_STRIDE)   ? sig_rmonitor_stride   :
                        (s_wb_adr_i == REGOFFSET_RMONITOR_WIDTH)    ? sig_rmonitor_width    :
                        (s_wb_adr_i == REGOFFSET_RMONITOR_HEIGHT)   ? sig_rmonitor_height   :
                        (s_wb_adr_i == REGOFFSET_RMONITOR_SIZE)     ? sig_rmonitor_size     :
                        (s_wb_adr_i == REGOFFSET_RMONITOR_ARLEN)    ? sig_rmonitor_arlen    :
                        32'h0000_0000;
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    assign out_wirq   = reg_wirq;
    assign out_rirq   = reg_rirq;
    
    
    
    // ---------------------------------
    //  Flip Control
    // ---------------------------------
    
    integer                         i;

    wire                            sig_wctl_start;
    wire                            sig_rctl_start;
    
    reg     [AXI4_ADDR_WIDTH-1:0]   sig_wparam_addr;
    reg     [AXI4_ADDR_WIDTH-1:0]   sig_rparam_addr;
    
    reg     [1:0]                   reg_buf_new,   next_buf_new;    // 最新画像
    reg     [1:0]                   reg_buf_write, next_buf_write;  // 書き込み中
    reg     [1:0]                   reg_buf_read,  next_buf_read;   // 読み出し中
    
    always @* begin
        next_buf_new     = reg_buf_new;
        next_buf_write   = reg_buf_write;
        next_buf_read    = reg_buf_read;
        sig_wparam_addr  = reg_wparam_addr;
        sig_rparam_addr  = reg_rparam_addr;
        
        // 書き込み更新なら最新バッファ更新
        if ( sig_wctl_start ) begin
            next_buf_new = reg_buf_write;
        end
        
        // 読み出し開始なら最新バッファを割り当て
        if ( sig_rctl_start ) begin
            next_buf_read = next_buf_new;
        end
        
        // 書き込み開始なら空いているバッファを割り当て
        if ( sig_wctl_start ) begin
            for ( i = 2; i >= 0; i = i-1 ) begin
                if ( next_buf_read != i &&  reg_buf_write != i ) begin
                    next_buf_write = i;
                end
            end
        end
        
        if ( reg_ctl_autoflip[0] ) begin
            case ( next_buf_write )
            0 : sig_wparam_addr = reg_param_addr0;
            1 : sig_wparam_addr = reg_param_addr1;
            2 : sig_wparam_addr = reg_param_addr2;
            endcase
        end
        
        if ( reg_ctl_autoflip[1] ) begin
            case ( next_buf_read )
            0 : sig_rparam_addr = reg_param_addr0;
            1 : sig_rparam_addr = reg_param_addr1;
            2 : sig_rparam_addr = reg_param_addr2;
            endcase
        end 
    end
    
    
    always @(posedge m_axi4_aclk) begin
        if ( !m_axi4_aresetn ) begin
            reg_buf_new    <= BUF_INIT_NEW;
            reg_buf_write  <= BUF_INIT_WRITE;
            reg_buf_read   <= BUF_INIT_READ;
        end
        else begin
            reg_buf_new    <= next_buf_new;
            reg_buf_write  <= next_buf_write;
            reg_buf_read   <= next_buf_read;
        end
    end
    
    assign sig_monitor_buf_new   = reg_buf_new;
    assign sig_monitor_buf_write = reg_buf_write;
    assign sig_monitor_buf_read  = reg_buf_read;
    
    
    
    // ---------------------------------
    //  external start trigger
    // ---------------------------------
    
    wire                core_wstart;
    wire                core_rstart;
    
    generate
    if ( TRIG_WSTART_ENABLE ) begin : blk_trig_wstart
        wire        pulse_wstart;
        jelly_pulse_async
                #(
                    .ASYNC      (TRIG_ASYNC)
                )
            i_pulse_async
                (
                    .s_reset    (trig_reset),
                    .s_clk      (trig_clk),
                    .s_pulse    (trig_wstart),
                    
                    .m_reset    (s_wb_rst_i),
                    .m_clk      (s_wb_clk_i),
                    .m_pulse    (pulse_wstart)
                );
        
        assign core_wstart = pulse_wstart | ~reg_wctl_control[3];
    end
    else begin
        assign core_wstart = 1'b1;
    end
    
    if ( TRIG_RSTART_ENABLE ) begin : blk_trig_rstart
        wire        pulse_rstart;
        jelly_pulse_async
                #(
                    .ASYNC      (TRIG_ASYNC)
                )
            i_pulse_async
                (
                    .s_reset    (trig_reset),
                    .s_clk      (trig_clk),
                    .s_pulse    (trig_rstart),
                    
                    .m_reset    (s_wb_rst_i),
                    .m_clk      (s_wb_clk_i),
                    .m_pulse    (pulse_rstart)
                );
        assign core_rstart = pulse_rstart | ~reg_rctl_control[3];
    end
    else begin
        assign core_rstart = 1'b1;
    end
    endgenerate
    
    
    
    // ---------------------------------
    //  Core
    // ---------------------------------
    
    // write
    jelly_vdma_axi4s_to_axi4_core
            #(
                .ASYNC                  (WASYNC),
                .FIFO_PTR_WIDTH         (WFIFO_PTR_WIDTH),
                .PIXEL_SIZE             (WPIXEL_SIZE),
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
                .AXI4S_DATA_SIZE        (AXI4S_S_DATA_SIZE),
                .AXI4S_DATA_WIDTH       (AXI4S_S_DATA_WIDTH),
                .AXI4S_USER_WIDTH       (AXI4S_S_USER_WIDTH),
                .AXI4_AW_REGS           (AXI4_AW_REGS),
                .AXI4_W_REGS            (AXI4_W_REGS),
                .AXI4S_REGS             (AXI4S_S_REGS),
                .STRIDE_WIDTH           (STRIDE_WIDTH),
                .INDEX_WIDTH            (INDEX_WIDTH),
                .H_WIDTH                (H_WIDTH),
                .V_WIDTH                (V_WIDTH),
                .SIZE_WIDTH             (SIZE_WIDTH),
                .IDLE_SKIP              (WIDLE_SKIP),
                .PACKET_ENABLE          (WPACKET_ENABLE),
                .ISSUE_COUNTER_WIDTH    (WISSUE_COUNTER_WIDTH)
            )
        i_vdma_axi4s_to_axi4_core
            (
                .ctl_enable             (reg_wctl_control[0] & core_wstart),
                .ctl_update             (reg_wctl_control[1]),
                .ctl_busy               (sig_wctl_status[0]),
                .ctl_index              (sig_wctl_index),
                .ctl_start              (sig_wctl_start),
                
                .param_addr             (sig_wparam_addr),
                .param_stride           (reg_wparam_stride),
                .param_width            (reg_wparam_width),
                .param_height           (reg_wparam_height),
                .param_size             (reg_wparam_size),
                .param_awlen            (reg_wparam_awlen),
                
                .monitor_addr           (sig_wmonitor_addr),
                .monitor_stride         (sig_wmonitor_stride),
                .monitor_width          (sig_wmonitor_width),
                .monitor_height         (sig_wmonitor_height),
                .monitor_size           (sig_wmonitor_size),
                .monitor_awlen          (sig_wmonitor_awlen),
                
                .m_axi4_aresetn         (m_axi4_aresetn),
                .m_axi4_aclk            (m_axi4_aclk),
                .m_axi4_awid            (m_axi4_awid),
                .m_axi4_awaddr          (m_axi4_awaddr),
                .m_axi4_awburst         (m_axi4_awburst),
                .m_axi4_awcache         (m_axi4_awcache),
                .m_axi4_awlen           (m_axi4_awlen),
                .m_axi4_awlock          (m_axi4_awlock),
                .m_axi4_awprot          (m_axi4_awprot),
                .m_axi4_awqos           (m_axi4_awqos),
                .m_axi4_awregion        (m_axi4_awregion),
                .m_axi4_awsize          (m_axi4_awsize),
                .m_axi4_awvalid         (m_axi4_awvalid),
                .m_axi4_awready         (m_axi4_awready),
                .m_axi4_wstrb           (m_axi4_wstrb),
                .m_axi4_wdata           (m_axi4_wdata),
                .m_axi4_wlast           (m_axi4_wlast),
                .m_axi4_wvalid          (m_axi4_wvalid),
                .m_axi4_wready          (m_axi4_wready),
                .m_axi4_bid             (m_axi4_bid),
                .m_axi4_bresp           (m_axi4_bresp),
                .m_axi4_bvalid          (m_axi4_bvalid),
                .m_axi4_bready          (m_axi4_bready),
                
                .s_axi4s_aresetn        (s_axi4s_aresetn),
                .s_axi4s_aclk           (s_axi4s_aclk),
                .s_axi4s_tuser          (s_axi4s_tuser),
                .s_axi4s_tlast          (s_axi4s_tlast),
                .s_axi4s_tdata          (s_axi4s_tdata),
                .s_axi4s_tvalid         (s_axi4s_tvalid),
                .s_axi4s_tready         (s_axi4s_tready)
            );
    
    // read
    jelly_vdma_axi4_to_axi4s_core
            #(
                .ASYNC                  (RASYNC),
                .FIFO_PTR_WIDTH         (RFIFO_PTR_WIDTH),
                .PIXEL_SIZE             (RPIXEL_SIZE),
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH),
                .AXI4_ARID              (AXI4_ARID),
                .AXI4_ARSIZE            (AXI4_ARSIZE),
                .AXI4_ARBURST           (AXI4_ARBURST),
                .AXI4_ARLOCK            (AXI4_ARLOCK),
                .AXI4_ARCACHE           (AXI4_ARCACHE),
                .AXI4_ARPROT            (AXI4_ARPROT),
                .AXI4_ARQOS             (AXI4_ARQOS),
                .AXI4_ARREGION          (AXI4_ARREGION),
                .AXI4S_DATA_SIZE        (AXI4S_M_DATA_SIZE),
                .AXI4S_DATA_WIDTH       (AXI4S_M_DATA_WIDTH),
                .AXI4S_USER_WIDTH       (AXI4S_M_USER_WIDTH),
                .AXI4_AR_REGS           (AXI4_AR_REGS),
                .AXI4_R_REGS            (AXI4_R_REGS),
                .AXI4S_REGS             (AXI4S_M_REGS),
                .STRIDE_WIDTH           (STRIDE_WIDTH),
                .INDEX_WIDTH            (INDEX_WIDTH),
                .H_WIDTH                (H_WIDTH),
                .V_WIDTH                (V_WIDTH),  
                .SIZE_WIDTH             (SIZE_WIDTH),
                .LIMITTER_ENABLE        (RLIMITTER_ENABLE),
                .LIMITTER_MARGINE       (RLIMITTER_MARGINE),
                .ISSUE_COUNTER_WIDTH    (RISSUE_COUNTER_WIDTH)
            )
        i_vdma_axi4_to_axi4s_core
            (
                .ctl_enable             (reg_rctl_control[0] & core_rstart),
                .ctl_update             (reg_rctl_control[1]),
                .ctl_busy               (sig_rctl_status[0]),
                .ctl_index              (sig_rctl_index),
                .ctl_start              (sig_rctl_start),
                
                .param_addr             (sig_rparam_addr),
                .param_stride           (reg_rparam_stride),
                .param_width            (reg_rparam_width),
                .param_height           (reg_rparam_height),
                .param_size             (reg_rparam_size),
                .param_arlen            (reg_rparam_arlen),
                
                .monitor_addr           (sig_rmonitor_addr),
                .monitor_stride         (sig_rmonitor_stride),
                .monitor_width          (sig_rmonitor_width),
                .monitor_height         (sig_rmonitor_height),
                .monitor_size           (sig_rmonitor_size),
                .monitor_arlen          (sig_rmonitor_arlen),
                
                .m_axi4_aresetn         (m_axi4_aresetn),
                .m_axi4_aclk            (m_axi4_aclk),
                .m_axi4_arid            (m_axi4_arid),
                .m_axi4_araddr          (m_axi4_araddr),
                .m_axi4_arburst         (m_axi4_arburst),
                .m_axi4_arcache         (m_axi4_arcache),
                .m_axi4_arlen           (m_axi4_arlen),
                .m_axi4_arlock          (m_axi4_arlock),
                .m_axi4_arprot          (m_axi4_arprot),
                .m_axi4_arqos           (m_axi4_arqos),
                .m_axi4_arregion        (m_axi4_arregion),
                .m_axi4_arsize          (m_axi4_arsize),
                .m_axi4_arvalid         (m_axi4_arvalid),
                .m_axi4_arready         (m_axi4_arready),
                .m_axi4_rid             (m_axi4_rid),
                .m_axi4_rresp           (m_axi4_rresp),
                .m_axi4_rdata           (m_axi4_rdata),
                .m_axi4_rlast           (m_axi4_rlast),
                .m_axi4_rvalid          (m_axi4_rvalid),
                .m_axi4_rready          (m_axi4_rready),
                
                .m_axi4s_aresetn        (m_axi4s_aresetn),
                .m_axi4s_aclk           (m_axi4s_aclk),
                .m_axi4s_tuser          (m_axi4s_tuser),
                .m_axi4s_tlast          (m_axi4s_tlast),
                .m_axi4s_tdata          (m_axi4s_tdata),
                .m_axi4s_tvalid         (m_axi4s_tvalid),
                .m_axi4s_tready         (m_axi4s_tready)
        );
    
endmodule


`default_nettype wire


// end of file
