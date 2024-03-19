// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns/1ps
`default_nettype none



module jelly_vdma_axi4_to_axi4s
        #(
            parameter   CORE_ID             = 32'h527a_1020,
            parameter   CORE_VERSION        = 32'h0000_0000,
            
            parameter   ASYNC               = 0,
            parameter   FIFO_PTR_WIDTH      = 9,
            
            parameter   PIXEL_SIZE          = 2,    // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            
            parameter   AXI4_ID_WIDTH       = 6,
            parameter   AXI4_ADDR_WIDTH     = 32,
            parameter   AXI4_DATA_SIZE      = 2,    // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            parameter   AXI4_DATA_WIDTH     = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH      = 8,
            parameter   AXI4_QOS_WIDTH      = 4,
            parameter   AXI4_ARID           = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE         = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST        = 2'b01,
            parameter   AXI4_ARLOCK         = 1'b0,
            parameter   AXI4_ARCACHE        = 4'b0001,
            parameter   AXI4_ARPROT         = 3'b000,
            parameter   AXI4_ARQOS          = 0,
            parameter   AXI4_ARREGION       = 4'b0000,
            
            parameter   AXI4S_DATA_SIZE     = 2,    // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            parameter   AXI4S_DATA_WIDTH    = (8 << AXI4S_DATA_SIZE),
            parameter   AXI4S_USER_WIDTH    = 1,
            
            parameter   AXI4_AR_REGS        = 1,
            parameter   AXI4_R_REGS         = 1,
            parameter   AXI4S_REGS          = 1,
            
            parameter   INDEX_WIDTH         = 8,
            parameter   STRIDE_WIDTH        = 16,
            parameter   H_WIDTH             = 12,
            parameter   V_WIDTH             = 12,
            parameter   SIZE_WIDTH          = H_WIDTH + V_WIDTH,
            
            parameter   LIMITTER_ENABLE     = (FIFO_PTR_WIDTH > AXI4_LEN_WIDTH),
            parameter   LIMITTER_MARGINE    = 4,
            parameter   ISSUE_COUNTER_WIDTH = 10,
            
            parameter   WB_ADR_WIDTH        = 8,
            parameter   WB_DAT_WIDTH        = 32,
            parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8),
            
            parameter   TRIG_ASYNC          = 1,    // WISHBONEと非同期の場合
            parameter   TRIG_START_ENABLE   = 0,
            
            parameter   INIT_CTL_CONTROL    = 4'b0000,
            parameter   INIT_PARAM_ADDR     = 32'h0000_0000,
            parameter   INIT_PARAM_STRIDE   = 4096,
            parameter   INIT_PARAM_WIDTH    = 640,
            parameter   INIT_PARAM_HEIGHT   = 480,
            parameter   INIT_PARAM_SIZE     = INIT_PARAM_WIDTH * INIT_PARAM_HEIGHT,
            parameter   INIT_PARAM_ARLEN    = 8'h0f
        )
        (
            // master AXI4 (read)
            input   wire                            m_axi4_aresetn,
            input   wire                            m_axi4_aclk,
            output  wire    [AXI4_ID_WIDTH-1:0]     m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_arlen,
            output  wire    [2:0]                   m_axi4_arsize,
            output  wire    [1:0]                   m_axi4_arburst,
            output  wire    [0:0]                   m_axi4_arlock,
            output  wire    [3:0]                   m_axi4_arcache,
            output  wire    [2:0]                   m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_arqos,
            output  wire    [3:0]                   m_axi4_arregion,
            output  wire                            m_axi4_arvalid,
            input   wire                            m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]     m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_rdata,
            input   wire    [1:0]                   m_axi4_rresp,
            input   wire                            m_axi4_rlast,
            input   wire                            m_axi4_rvalid,
            output  wire                            m_axi4_rready,
            
            // master AXI4-Stream (output)
            input   wire                            m_axi4s_aresetn,
            input   wire                            m_axi4s_aclk,
            output  wire    [AXI4S_DATA_WIDTH-1:0]  m_axi4s_tdata,
            output  wire                            m_axi4s_tlast,
            output  wire    [AXI4S_USER_WIDTH-1:0]  m_axi4s_tuser,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready,
            
            // WISHBONE (register access)
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            output  wire                            out_irq,
            
            // external trigger
            input   wire                            trig_reset,
            input   wire                            trig_clk,
            input   wire                            trig_start
        );
    
    localparam  [AXI4_ADDR_WIDTH-1:0]   ADDR_MASK = ~((64'd1 << AXI4_DATA_SIZE) - 1);
    
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID        = 8'h00;
    localparam  ADR_CORE_VERSION   = 8'h01;
    localparam  ADR_CTL_CONTROL    = 8'h04;
    localparam  ADR_CTL_STATUS     = 8'h05;
    localparam  ADR_CTL_INDEX      = 8'h06;
    localparam  ADR_PARAM_ADDR     = 8'h08;
    localparam  ADR_PARAM_STRIDE   = 8'h09;
    localparam  ADR_PARAM_WIDTH    = 8'h0a;
    localparam  ADR_PARAM_HEIGHT   = 8'h0b;
    localparam  ADR_PARAM_SIZE     = 8'h0c;
    localparam  ADR_PARAM_ARLEN    = 8'h0f;
    localparam  ADR_MONITOR_ADDR   = 8'h10;
    localparam  ADR_MONITOR_STRIDE = 8'h11;
    localparam  ADR_MONITOR_WIDTH  = 8'h12;
    localparam  ADR_MONITOR_HEIGHT = 8'h13;
    localparam  ADR_MONITOR_SIZE   = 8'h14;
    localparam  ADR_MONITOR_ARLEN  = 8'h17;
    
    localparam  CONTROL_WIDTH            = TRIG_START_ENABLE ? 4 : 3;
    localparam  STATUS_WIDTH             = 1;
    
    // registers
    reg     [CONTROL_WIDTH-1:0]     reg_ctl_control;
    wire    [STATUS_WIDTH-1:0]      sig_ctl_status;
    wire    [INDEX_WIDTH-1:0]       sig_ctl_index;
    
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_param_addr;
    reg     [STRIDE_WIDTH-1:0]      reg_param_stride;
    reg     [H_WIDTH-1:0]           reg_param_width;
    reg     [V_WIDTH-1:0]           reg_param_height;
    reg     [SIZE_WIDTH-1:0]        reg_param_size;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_param_arlen;
    
    wire    [AXI4_ADDR_WIDTH-1:0]   sig_monitor_addr;
    wire    [STRIDE_WIDTH-1:0]      sig_monitor_stride;
    wire    [H_WIDTH-1:0]           sig_monitor_width;
    wire    [V_WIDTH-1:0]           sig_monitor_height;
    wire    [SIZE_WIDTH-1:0]        sig_monitor_size;
    wire    [AXI4_LEN_WIDTH-1:0]    sig_monitor_arlen;
    
    (* ASYNC_REG = "true" *)
    reg     [2:0]                   reg_prev_index;
    
    reg                             reg_irq;
    
    
    function [WB_DAT_WIDTH-1:0] reg_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] wdat,
                                        input [WB_SEL_WIDTH-1:0] msk
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            reg_mask[i] = msk[i/8] ? wdat[i] : org[i];
        end
    end
    endfunction
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control  <= INIT_CTL_CONTROL;
            reg_param_addr   <= INIT_PARAM_ADDR   & ADDR_MASK;
            reg_param_stride <= INIT_PARAM_STRIDE & ADDR_MASK;
            reg_param_width  <= INIT_PARAM_WIDTH;
            reg_param_height <= INIT_PARAM_HEIGHT;
            reg_param_size   <= INIT_PARAM_SIZE;
            reg_param_arlen  <= INIT_PARAM_ARLEN;
            reg_prev_index   <= 3'b000;
            reg_irq          <= 1'b0;
        end
        else begin
            // register write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:  reg_ctl_control  <= reg_mask(reg_ctl_control,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_ADDR:   reg_param_addr   <= reg_mask(reg_param_addr,   s_wb_dat_i, s_wb_sel_i) & ADDR_MASK;
                ADR_PARAM_STRIDE: reg_param_stride <= reg_mask(reg_param_stride, s_wb_dat_i, s_wb_sel_i) & ADDR_MASK;
                ADR_PARAM_WIDTH:  reg_param_width  <= reg_mask(reg_param_width,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_HEIGHT: reg_param_height <= reg_mask(reg_param_height, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_SIZE:   reg_param_size   <= reg_mask(reg_param_size,   s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_ARLEN:  reg_param_arlen  <= reg_mask(reg_param_arlen,  s_wb_dat_i, s_wb_sel_i);
                endcase
            end
            
            // update
            reg_irq           <= 1'b0;
            reg_prev_index[0] <= sig_ctl_index[0];
            reg_prev_index[1] <= reg_prev_index[0];
            reg_prev_index[2] <= reg_prev_index[1];
            if ( reg_prev_index[2] != reg_prev_index[1] ) begin
                // IRQ puls
                reg_irq <= 1'b1;
                
                // update flag auto clear
                reg_ctl_control[1] <= 1'b0;
                
                // auto stop
                if ( reg_ctl_control[2] ) begin
                    reg_ctl_control[0] <= 1'b0;
                    reg_ctl_control[2] <= 1'b0;
                end
            end
        end
    end
    
    // register read
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)        ? CORE_ID            :
                        (s_wb_adr_i == ADR_CORE_VERSION)   ? CORE_VERSION       :
                        (s_wb_adr_i == ADR_CTL_CONTROL)    ? reg_ctl_control    :
                        (s_wb_adr_i == ADR_CTL_STATUS)     ? sig_ctl_status     :
                        (s_wb_adr_i == ADR_CTL_INDEX)      ? sig_ctl_index      :
                        (s_wb_adr_i == ADR_PARAM_ADDR)     ? reg_param_addr     :
                        (s_wb_adr_i == ADR_PARAM_STRIDE)   ? reg_param_stride   :
                        (s_wb_adr_i == ADR_PARAM_WIDTH)    ? reg_param_width    :
                        (s_wb_adr_i == ADR_PARAM_HEIGHT)   ? reg_param_height   :
                        (s_wb_adr_i == ADR_PARAM_SIZE)     ? reg_param_size     :
                        (s_wb_adr_i == ADR_PARAM_ARLEN)    ? reg_param_arlen    :
                        (s_wb_adr_i == ADR_MONITOR_ADDR)   ? sig_monitor_addr   :
                        (s_wb_adr_i == ADR_MONITOR_STRIDE) ? sig_monitor_stride :
                        (s_wb_adr_i == ADR_MONITOR_WIDTH)  ? sig_monitor_width  :
                        (s_wb_adr_i == ADR_MONITOR_HEIGHT) ? sig_monitor_height :
                        (s_wb_adr_i == ADR_MONITOR_SIZE)   ? sig_monitor_size   :
                        (s_wb_adr_i == ADR_MONITOR_ARLEN)  ? sig_monitor_arlen  :
                        32'h0000_0000;
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    assign out_irq    = reg_irq;
    
    
    
    // ---------------------------------
    //  external start trigger
    // ---------------------------------
    
    wire                core_start;
    generate
    if ( TRIG_START_ENABLE ) begin : blk_trig_start
        wire    pulse_start;
        jelly_pulse_async
                #(
                    .ASYNC      (TRIG_ASYNC)
                )
            i_pulse_async
                (
                    .s_reset    (trig_reset),
                    .s_clk      (trig_clk),
                    .s_pulse    (trig_start),
                    
                    .m_reset    (s_wb_rst_i),
                    .m_clk      (s_wb_clk_i),
                    .m_pulse    (pulse_start)
                );
        
        assign core_start = pulse_start | ~reg_ctl_control[3];
    end
    else begin
        assign core_start = 1'b1;
    end
    endgenerate
    
    
    // ---------------------------------
    //  Core
    // ---------------------------------
    
    jelly_vdma_axi4_to_axi4s_core
            #(
                .ASYNC                  (ASYNC),
                .FIFO_PTR_WIDTH         (FIFO_PTR_WIDTH),
                .PIXEL_SIZE             (PIXEL_SIZE),
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
                .AXI4S_DATA_SIZE        (AXI4S_DATA_SIZE),
                .AXI4S_DATA_WIDTH       (AXI4S_DATA_WIDTH),
                .AXI4S_USER_WIDTH       (AXI4S_USER_WIDTH),
                .AXI4_AR_REGS           (AXI4_AR_REGS),
                .AXI4_R_REGS            (AXI4_R_REGS),
                .AXI4S_REGS             (AXI4S_REGS),
                .STRIDE_WIDTH           (STRIDE_WIDTH),
                .INDEX_WIDTH            (INDEX_WIDTH),
                .H_WIDTH                (H_WIDTH),
                .V_WIDTH                (V_WIDTH),
                .SIZE_WIDTH             (SIZE_WIDTH),
                .LIMITTER_ENABLE        (LIMITTER_ENABLE),
                .LIMITTER_MARGINE       (LIMITTER_MARGINE),
                .ISSUE_COUNTER_WIDTH    (ISSUE_COUNTER_WIDTH)
            )
        i_vdma_axi4_to_axi4s_core
            (
                .ctl_enable             (reg_ctl_control[0] & core_start),
                .ctl_update             (reg_ctl_control[1]),
                .ctl_busy               (sig_ctl_status[0]),
                .ctl_index              (sig_ctl_index),
                
                .param_addr             (reg_param_addr),
                .param_stride           (reg_param_stride),
                .param_width            (reg_param_width),
                .param_height           (reg_param_height),
                .param_size             (reg_param_size),
                .param_arlen            (reg_param_arlen),
                
                .monitor_addr           (sig_monitor_addr),
                .monitor_stride         (sig_monitor_stride),
                .monitor_width          (sig_monitor_width),
                .monitor_height         (sig_monitor_height),
                .monitor_size           (sig_monitor_size),
                .monitor_arlen          (sig_monitor_arlen),
                
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
