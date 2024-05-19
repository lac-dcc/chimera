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


module jelly_img_previous_frame
        #(
            parameter   CORE_ID              = 32'h527a_2010,
            parameter   CORE_VERSION         = 32'h0000_0000,
            
            parameter   UNIT_WIDTH           = 8,
            parameter   BYTE_WIDTH           = 8,
            parameter   DATA_WIDTH           = 32,
            parameter   USER_WIDTH           = 0,
            
            parameter   WB_ADR_WIDTH         = 8,
            parameter   WB_DAT_SIZE          = 3,     // 0:8bit, 1:16bit, 2:32bit ...
            parameter   WB_DAT_WIDTH         = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8),
            
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
            parameter   INIT_PARAM_INITDATA  = 0,
            
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
            
            input   wire                                s_wb_rst_i,
            input   wire                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o,
            input   wire                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            
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
            output  wire                                m_axi4_rready
        );
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    wire  [AXI4_ADDR_WIDTH-1:0]   ADDR_MASK = ~((1 << AXI4_DATA_SIZE) - 1);
    
    
    // register address offset
    localparam  ADR_CORE_ID          = 8'h00;
    localparam  ADR_CORE_VERSION     = 8'h01;
    localparam  ADR_CTL_CONTROL      = 8'h04;
    localparam  ADR_CTL_STATUS       = 8'h05;
    localparam  ADR_CTL_INDEX        = 8'h06;
    localparam  ADR_PARAM_ADDR       = 8'h08;
    localparam  ADR_PARAM_SIZE       = 8'h09;
    localparam  ADR_PARAM_AWLEN      = 8'h10;
    localparam  ADR_PARAM_WSTRB      = 8'h11;
    localparam  ADR_PARAM_WTIMEOUT   = 8'h13;
    localparam  ADR_PARAM_ARLEN      = 8'h14;
    localparam  ADR_PARAM_RTIMEOUT   = 8'h17;
    localparam  ADR_PARAM_INITDATA   = 8'h18;
    
    localparam  ADR_CURRENT_ADDR     = 8'h28;
    localparam  ADR_CURRENT_SIZE     = 8'h29;
    localparam  ADR_CURRENT_AWLEN    = 8'h30;
    localparam  ADR_CURRENT_WSTRB    = 8'h31;
    localparam  ADR_CURRENT_WTIMEOUT = 8'h33;
    localparam  ADR_CURRENT_ARLEN    = 8'h34;
    localparam  ADR_CURRENT_RTIMEOUT = 8'h37;
    localparam  ADR_CURRENT_INITDATA = 8'h38;
    
    
    // registers
    reg     [1:0]                       reg_ctl_control;
    reg     [PARAM_ADDR_WIDTH-1:0]      reg_param_addr;
    reg     [PARAM_SIZE_WIDTH-1:0]      reg_param_size;
    reg     [PARAM_AWLEN_WIDTH-1:0]     reg_param_awlen;
    reg     [PARAM_WSTRB_WIDTH-1:0]     reg_param_wstrb;
    reg     [PARAM_WTIMEOUT_WIDTH-1:0]  reg_param_wtimeout;
    reg     [PARAM_ARLEN_WIDTH-1:0]     reg_param_arlen;
    reg     [PARAM_RTIMEOUT_WIDTH-1:0]  reg_param_rtimeout;
    reg     [DATA_WIDTH-1:0]            reg_param_initdata;
    
    wire                                busy;
    wire                                overflow;
    wire                                underflow;
    reg     [INDEX_WIDTH-1:0]           reg_core_index;
    reg     [PARAM_ADDR_WIDTH-1:0]      reg_core_addr;
    reg     [PARAM_SIZE_WIDTH-1:0]      reg_core_size;
    reg     [PARAM_AWLEN_WIDTH-1:0]     reg_core_awlen;
    reg     [PARAM_WSTRB_WIDTH-1:0]     reg_core_wstrb;
    reg     [PARAM_WTIMEOUT_WIDTH-1:0]  reg_core_wtimeout;
    reg     [PARAM_ARLEN_WIDTH-1:0]     reg_core_arlen;
    reg     [PARAM_RTIMEOUT_WIDTH-1:0]  reg_core_rtimeout;
    reg     [DATA_WIDTH-1:0]            reg_core_initdata;
    
    
    // async
    (* ASYNC_REG = "true" *)    reg     ff0_busy,      ff1_busy;
    (* ASYNC_REG = "true" *)    reg     ff0_overflow,  ff1_overflow;
    (* ASYNC_REG = "true" *)    reg     ff0_underflow, ff1_underflow;
    (* ASYNC_REG = "true" *)    reg     ff0_index, ff1_index, ff2_index;
    always @(posedge s_wb_clk_i ) begin
        ff0_busy      <= busy;
        ff1_busy      <= ff0_busy;
        
        ff0_overflow  <= overflow;
        ff1_overflow  <= ff0_overflow;
        
        ff0_underflow <= underflow;
        ff1_underflow <= ff0_underflow;
        
        ff0_index     <= reg_core_index;
        ff1_index     <= ff0_index;
        ff2_index     <= ff1_index;
    end
    
    
    function [WB_DAT_WIDTH-1:0] reg_write(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            reg_write[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control    <= INIT_CTL_CONTROL;
            reg_param_addr     <= INIT_PARAM_ADDR;
            reg_param_size     <= INIT_PARAM_SIZE;
            reg_param_awlen    <= INIT_PARAM_AWLEN;
            reg_param_wstrb    <= INIT_PARAM_WSTRB;
            reg_param_wtimeout <= INIT_PARAM_WTIMEOUT;
            reg_param_arlen    <= INIT_PARAM_ARLEN;
            reg_param_rtimeout <= INIT_PARAM_RTIMEOUT;
            reg_param_initdata <= INIT_PARAM_INITDATA;
        end
        else begin
            // register write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:    reg_ctl_control    <= reg_write(reg_ctl_control,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_ADDR:     reg_param_addr     <= reg_write(reg_param_addr,     s_wb_dat_i, s_wb_sel_i) & ADDR_MASK;
                ADR_PARAM_SIZE:     reg_param_size     <= reg_write(reg_param_size,     s_wb_dat_i, s_wb_sel_i) & ADDR_MASK;
                ADR_PARAM_AWLEN:    reg_param_awlen    <= reg_write(reg_param_awlen,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_WSTRB:    reg_param_wstrb    <= reg_write(reg_param_wstrb,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_WTIMEOUT: reg_param_wtimeout <= reg_write(reg_param_wtimeout, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_ARLEN:    reg_param_arlen    <= reg_write(reg_param_arlen,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_RTIMEOUT: reg_param_rtimeout <= reg_write(reg_param_rtimeout, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_INITDATA: reg_param_initdata <= reg_write(reg_param_initdata, s_wb_dat_i, s_wb_sel_i);
                endcase
            end
            
            // update
            if ( ff1_index != ff2_index ) begin
                // update flag auto clear
                reg_ctl_control[1] <= 1'b0;
                
                // auto stop
       //       if ( reg_ctl_control[2] ) begin
       //           reg_ctl_control[0] <= 1'b0;
       //           reg_ctl_control[2] <= 1'b0;
       //       end
            end
        end
    end
    
    // register read
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)          ? CORE_ID                                 :
                        (s_wb_adr_i == ADR_CORE_VERSION)     ? CORE_VERSION                            :
                        (s_wb_adr_i == ADR_CTL_CONTROL)      ? reg_ctl_control                         :
                        (s_wb_adr_i == ADR_CTL_STATUS)       ? {ff1_underflow, ff1_overflow, ff1_busy} :
                        (s_wb_adr_i == ADR_CTL_INDEX)        ? ff2_index                               :
                        (s_wb_adr_i == ADR_PARAM_ADDR)       ? reg_param_addr                          :
                        (s_wb_adr_i == ADR_PARAM_SIZE)       ? reg_param_size                          :
                        (s_wb_adr_i == ADR_PARAM_AWLEN)      ? reg_param_awlen                         :
                        (s_wb_adr_i == ADR_PARAM_WSTRB)      ? reg_param_wstrb                         :
                        (s_wb_adr_i == ADR_PARAM_WTIMEOUT)   ? reg_param_wtimeout                      :
                        (s_wb_adr_i == ADR_PARAM_ARLEN)      ? reg_param_arlen                         :
                        (s_wb_adr_i == ADR_PARAM_RTIMEOUT)   ? reg_param_rtimeout                      :
                        (s_wb_adr_i == ADR_CURRENT_ADDR)     ? reg_param_addr                          :
                        (s_wb_adr_i == ADR_CURRENT_SIZE)     ? reg_core_size                           :
                        (s_wb_adr_i == ADR_CURRENT_AWLEN)    ? reg_core_awlen                          :
                        (s_wb_adr_i == ADR_CURRENT_WSTRB)    ? reg_core_wstrb                          :
                        (s_wb_adr_i == ADR_CURRENT_WTIMEOUT) ? reg_core_wtimeout                       :
                        (s_wb_adr_i == ADR_CURRENT_ARLEN)    ? reg_core_arlen                          :
                        (s_wb_adr_i == ADR_CURRENT_RTIMEOUT) ? reg_core_rtimeout                       :
                        {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    
    // ---------------------------------
    //  core domain
    // ---------------------------------
    
    
    (* ASYNC_REG = "true" *)    reg     [1:0]   ff0_ctl_control, ff1_ctl_control;
    always @(posedge m_axi4_aclk) begin
        if ( ~m_axi4_aresetn ) begin
            ff0_ctl_control <= 2'b00;
            ff1_ctl_control <= 2'b00;
        end
        else begin
            ff0_ctl_control <= reg_ctl_control;
            ff1_ctl_control <= ff0_ctl_control;
        end
    end
    
    reg                 reg_enable;
    
    always @(posedge m_axi4_aclk) begin
        if ( ~m_axi4_aresetn ) begin
            reg_enable        <= 1'b0;
            
            reg_core_addr     <= INIT_PARAM_ADDR;
            reg_core_size     <= INIT_PARAM_SIZE;
            reg_core_awlen    <= INIT_PARAM_AWLEN;
            reg_core_wstrb    <= INIT_PARAM_WSTRB;
            reg_core_wtimeout <= INIT_PARAM_WTIMEOUT;
            reg_core_arlen    <= INIT_PARAM_ARLEN;
            reg_core_rtimeout <= INIT_PARAM_WTIMEOUT;
            reg_core_initdata <= INIT_PARAM_INITDATA;
        end
        else begin
            reg_enable <= ff1_ctl_control[0];
            
            if ( !busy && ff1_ctl_control[1] ) begin
                reg_core_index    <= reg_core_index + 1'b1;
                
                reg_core_addr     <= reg_param_addr;
                reg_core_size     <= reg_param_size;
                reg_core_awlen    <= reg_param_awlen;
                reg_core_wstrb    <= reg_param_wstrb;
                reg_core_wtimeout <= reg_param_wtimeout;
                reg_core_arlen    <= reg_param_arlen;
                reg_core_rtimeout <= reg_param_rtimeout;
                reg_core_initdata <= reg_param_initdata;
            end
        end
    end
    
    
    jelly_img_previous_frame_core
            #(
                .UNIT_WIDTH                 (UNIT_WIDTH),
                .BYTE_WIDTH                 (BYTE_WIDTH),
                .DATA_WIDTH                 (DATA_WIDTH),
                .USER_WIDTH                 (USER_WIDTH),
                
                .ASYNC                      (ASYNC),
                .AXI4_ID_WIDTH              (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH            (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE             (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH            (AXI4_DATA_WIDTH),
                .AXI4_STRB_WIDTH            (AXI4_STRB_WIDTH),
                .AXI4_LEN_WIDTH             (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH             (AXI4_QOS_WIDTH),
                .AXI4_AWID                  (AXI4_AWID),
                .AXI4_AWSIZE                (AXI4_AWSIZE),
                .AXI4_AWBURST               (AXI4_AWBURST),
                .AXI4_AWLOCK                (AXI4_AWLOCK),
                .AXI4_AWCACHE               (AXI4_AWCACHE),
                .AXI4_AWPROT                (AXI4_AWPROT),
                .AXI4_AWQOS                 (AXI4_AWQOS),
                .AXI4_AWREGION              (AXI4_AWREGION),
                .AXI4_ARID                  (AXI4_ARID),
                .AXI4_ARSIZE                (AXI4_ARSIZE),
                .AXI4_ARBURST               (AXI4_ARBURST),
                .AXI4_ARLOCK                (AXI4_ARLOCK),
                .AXI4_ARCACHE               (AXI4_ARCACHE),
                .AXI4_ARPROT                (AXI4_ARPROT),
                .AXI4_ARQOS                 (AXI4_ARQOS),
                .AXI4_ARREGION              (AXI4_ARREGION),
                
                .BYPASS_ADDR_OFFSET         (BYPASS_ADDR_OFFSET),
                .BYPASS_ALIGN               (BYPASS_ALIGN),
                .AXI4_ALIGN                 (AXI4_ALIGN),
                
                .PARAM_ADDR_WIDTH           (PARAM_ADDR_WIDTH),
                .PARAM_SIZE_WIDTH           (PARAM_SIZE_WIDTH),
                .PARAM_SIZE_OFFSET          (PARAM_SIZE_OFFSET),
                .PARAM_AWLEN_WIDTH          (PARAM_AWLEN_WIDTH),
                .PARAM_WSTRB_WIDTH          (PARAM_WSTRB_WIDTH),
                .PARAM_WTIMEOUT_WIDTH       (PARAM_WTIMEOUT_WIDTH),
                .PARAM_ARLEN_WIDTH          (PARAM_ARLEN_WIDTH),
                .PARAM_RTIMEOUT_WIDTH       (PARAM_RTIMEOUT_WIDTH),
                
                .WDATA_FIFO_PTR_WIDTH       (WDATA_FIFO_PTR_WIDTH),
                .WDATA_FIFO_RAM_TYPE        (WDATA_FIFO_RAM_TYPE),
                .WDATA_FIFO_LOW_DEALY       (WDATA_FIFO_LOW_DEALY),
                .WDATA_FIFO_DOUT_REGS       (WDATA_FIFO_DOUT_REGS),
                .WDATA_FIFO_S_REGS          (WDATA_FIFO_S_REGS),
                .WDATA_FIFO_M_REGS          (WDATA_FIFO_M_REGS),
                
                .AWLEN_FIFO_PTR_WIDTH       (AWLEN_FIFO_PTR_WIDTH),
                .AWLEN_FIFO_RAM_TYPE        (AWLEN_FIFO_RAM_TYPE),
                .AWLEN_FIFO_LOW_DEALY       (AWLEN_FIFO_LOW_DEALY),
                .AWLEN_FIFO_DOUT_REGS       (AWLEN_FIFO_DOUT_REGS),
                .AWLEN_FIFO_S_REGS          (AWLEN_FIFO_S_REGS),
                .AWLEN_FIFO_M_REGS          (AWLEN_FIFO_M_REGS),
                
                .BLEN_FIFO_PTR_WIDTH        (BLEN_FIFO_PTR_WIDTH),
                .BLEN_FIFO_RAM_TYPE         (BLEN_FIFO_RAM_TYPE),
                .BLEN_FIFO_LOW_DEALY        (BLEN_FIFO_LOW_DEALY),
                .BLEN_FIFO_DOUT_REGS        (BLEN_FIFO_DOUT_REGS),
                .BLEN_FIFO_S_REGS           (BLEN_FIFO_S_REGS),
                .BLEN_FIFO_M_REGS           (BLEN_FIFO_M_REGS),
                
                .RDATA_FIFO_PTR_WIDTH       (RDATA_FIFO_PTR_WIDTH),
                .RDATA_FIFO_RAM_TYPE        (RDATA_FIFO_RAM_TYPE),
                .RDATA_FIFO_LOW_DEALY       (RDATA_FIFO_LOW_DEALY),
                .RDATA_FIFO_DOUT_REGS       (RDATA_FIFO_DOUT_REGS),
                .RDATA_FIFO_S_REGS          (RDATA_FIFO_S_REGS),
                .RDATA_FIFO_M_REGS          (RDATA_FIFO_M_REGS)
            )
        i_img_previous_frame_core
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .s_img_line_first           (s_img_line_first),
                .s_img_line_last            (s_img_line_last),
                .s_img_pixel_first          (s_img_pixel_first),
                .s_img_pixel_last           (s_img_pixel_last),
                .s_img_de                   (s_img_de),
                .s_img_user                 (s_img_user),
                .s_img_data                 (s_img_data),
                .s_img_valid                (s_img_valid),
                
                .m_img_line_first           (m_img_line_first),
                .m_img_line_last            (m_img_line_last),
                .m_img_pixel_first          (m_img_pixel_first),
                .m_img_pixel_last           (m_img_pixel_last),
                .m_img_de                   (m_img_de),
                .m_img_user                 (m_img_user),
                .m_img_data                 (m_img_data),
                .m_img_prev_de              (m_img_prev_de),
                .m_img_prev_data            (m_img_prev_data),
                .m_img_valid                (m_img_valid),
                
                .s_img_store_line_first     (s_img_store_line_first),
                .s_img_store_line_last      (s_img_store_line_last),
                .s_img_store_pixel_first    (s_img_store_pixel_first),
                .s_img_store_pixel_last     (s_img_store_pixel_last),
                .s_img_store_de             (s_img_store_de),
                .s_img_store_data           (s_img_store_data),
                .s_img_store_valid          (s_img_store_valid),
                
                
                .aresetn                    (m_axi4_aresetn),
                .aclk                       (m_axi4_aclk),
                
                .enable                     (reg_enable),
                .busy                       (busy),
                
                .param_addr                 (reg_core_addr),
                .param_size                 (reg_core_size),
                .param_awlen                (reg_core_awlen),
                .param_wstrb                (reg_core_wstrb),
                .param_wtimeout             (reg_core_wtimeout),
                .param_arlen                (reg_core_arlen),
                .param_rtimeout             (reg_core_rtimeout),
                .param_initdata             (reg_core_initdata),
                
                .status_overflow            (overflow),
                .status_underflow           (underflow),
                
                .m_axi4_awid                (m_axi4_awid),
                .m_axi4_awaddr              (m_axi4_awaddr),
                .m_axi4_awlen               (m_axi4_awlen),
                .m_axi4_awsize              (m_axi4_awsize),
                .m_axi4_awburst             (m_axi4_awburst),
                .m_axi4_awlock              (m_axi4_awlock),
                .m_axi4_awcache             (m_axi4_awcache),
                .m_axi4_awprot              (m_axi4_awprot),
                .m_axi4_awqos               (m_axi4_awqos),
                .m_axi4_awregion            (m_axi4_awregion),
                .m_axi4_awvalid             (m_axi4_awvalid),
                .m_axi4_awready             (m_axi4_awready),
                .m_axi4_wdata               (m_axi4_wdata),
                .m_axi4_wstrb               (m_axi4_wstrb),
                .m_axi4_wlast               (m_axi4_wlast),
                .m_axi4_wvalid              (m_axi4_wvalid),
                .m_axi4_wready              (m_axi4_wready),
                .m_axi4_bid                 (m_axi4_bid),
                .m_axi4_bresp               (m_axi4_bresp),
                .m_axi4_bvalid              (m_axi4_bvalid),
                .m_axi4_bready              (m_axi4_bready),
                .m_axi4_arid                (m_axi4_arid),
                .m_axi4_araddr              (m_axi4_araddr),
                .m_axi4_arlen               (m_axi4_arlen),
                .m_axi4_arsize              (m_axi4_arsize),
                .m_axi4_arburst             (m_axi4_arburst),
                .m_axi4_arlock              (m_axi4_arlock),
                .m_axi4_arcache             (m_axi4_arcache),
                .m_axi4_arprot              (m_axi4_arprot),
                .m_axi4_arqos               (m_axi4_arqos),
                .m_axi4_arregion            (m_axi4_arregion),
                .m_axi4_arvalid             (m_axi4_arvalid),
                .m_axi4_arready             (m_axi4_arready),
                .m_axi4_rid                 (m_axi4_rid),
                .m_axi4_rdata               (m_axi4_rdata),
                .m_axi4_rresp               (m_axi4_rresp),
                .m_axi4_rlast               (m_axi4_rlast),
                .m_axi4_rvalid              (m_axi4_rvalid),
                .m_axi4_rready              (m_axi4_rready)
            );
    
endmodule


`default_nettype wire


// end of file
