// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI4Stream を AXI4に Write するコア
module jelly_vdma_axi4s_to_axi4_core
        #(
            parameter   ASYNC               = 0,
            parameter   FIFO_PTR_WIDTH      = 9,

            parameter   PIXEL_SIZE          = 2,    // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            
            parameter   AXI4_ID_WIDTH       = 6,
            parameter   AXI4_ADDR_WIDTH     = 32,
            parameter   AXI4_DATA_SIZE      = 3,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH     = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH     = (1 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH      = 8,
            parameter   AXI4_QOS_WIDTH      = 4,
            parameter   AXI4_AWID           = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE         = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST        = 2'b01,
            parameter   AXI4_AWLOCK         = 1'b0,
            parameter   AXI4_AWCACHE        = 4'b0001,
            parameter   AXI4_AWPROT         = 3'b000,
            parameter   AXI4_AWQOS          = 0,
            parameter   AXI4_AWREGION       = 4'b0000,
            
            parameter   AXI4S_DATA_SIZE     = 2,    // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            parameter   AXI4S_DATA_WIDTH    = (8 << AXI4S_DATA_SIZE),
            parameter   AXI4S_USER_WIDTH    = 1,
            
            parameter   AXI4_AW_REGS        = 1,
            parameter   AXI4_W_REGS         = 1,
            parameter   AXI4S_REGS          = 1,
            
            parameter   STRIDE_WIDTH        = 14,
            parameter   INDEX_WIDTH         = 8,
            parameter   H_WIDTH             = 10,
            parameter   V_WIDTH             = 10,
            parameter   SIZE_WIDTH          = H_WIDTH + V_WIDTH,
            
            parameter   IDLE_SKIP           = 1,
            
            parameter   PACKET_ENABLE       = (FIFO_PTR_WIDTH >= AXI4_LEN_WIDTH),
            parameter   ISSUE_COUNTER_WIDTH = 8
        )
        (
            // control
            input   wire                            ctl_enable,
            input   wire                            ctl_update,
            output  wire                            ctl_busy,
            output  wire    [INDEX_WIDTH-1:0]       ctl_index,
            output  wire                            ctl_start,
            
            // parameter
            input   wire    [AXI4_ADDR_WIDTH-1:0]   param_addr,
            input   wire    [STRIDE_WIDTH-1:0]      param_stride,
            input   wire    [H_WIDTH-1:0]           param_width,
            input   wire    [V_WIDTH-1:0]           param_height,
            input   wire    [SIZE_WIDTH-1:0]        param_size,
            input   wire    [AXI4_LEN_WIDTH-1:0]    param_awlen,
            
            // status
            output  wire    [AXI4_ADDR_WIDTH-1:0]   monitor_addr,
            output  wire    [STRIDE_WIDTH-1:0]      monitor_stride,
            output  wire    [H_WIDTH-1:0]           monitor_width,
            output  wire    [V_WIDTH-1:0]           monitor_height,
            output  wire    [SIZE_WIDTH-1:0]        monitor_size,
            output  wire    [AXI4_LEN_WIDTH-1:0]    monitor_awlen,
            
            // master AXI4 (write)
            input   wire                            m_axi4_aresetn,
            input   wire                            m_axi4_aclk,
            output  wire    [AXI4_ID_WIDTH-1:0]     m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_awlen,
            output  wire    [2:0]                   m_axi4_awsize,
            output  wire    [1:0]                   m_axi4_awburst,
            output  wire    [0:0]                   m_axi4_awlock,
            output  wire    [3:0]                   m_axi4_awcache,
            output  wire    [2:0]                   m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_awqos,
            output  wire    [3:0]                   m_axi4_awregion,
            output  wire                            m_axi4_awvalid,
            input   wire                            m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]   m_axi4_wstrb,
            output  wire                            m_axi4_wlast,
            output  wire                            m_axi4_wvalid,
            input   wire                            m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]     m_axi4_bid,
            input   wire    [1:0]                   m_axi4_bresp,
            input   wire                            m_axi4_bvalid,
            output  wire                            m_axi4_bready,
            
            // slave AXI4-Stream (output)
            input   wire                            s_axi4s_aresetn,
            input   wire                            s_axi4s_aclk,
            input   wire    [AXI4S_DATA_WIDTH-1:0]  s_axi4s_tdata,
            input   wire                            s_axi4s_tlast,
            input   wire    [AXI4S_USER_WIDTH-1:0]  s_axi4s_tuser,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready
        );
    
    
    // -----------------------------
    //  insert FF
    // -----------------------------
    
    wire    [AXI4S_DATA_WIDTH-1:0]  axi4s_tdata;
    wire                            axi4s_tlast;
    wire    [AXI4S_USER_WIDTH-1:0]  axi4s_tuser;
    wire                            axi4s_tvalid;
    wire                            axi4s_tready;
    
    // AXI4Stream
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (AXI4S_DATA_WIDTH+1+AXI4S_USER_WIDTH),
                .SLAVE_REGS         (AXI4S_REGS),
                .MASTER_REGS        (AXI4S_REGS)
            )
        i_pipeline_insert_ff_t
            (
                .reset              (~s_axi4s_aresetn),
                .clk                (s_axi4s_aclk),
                .cke                (1'b1),
                
                .s_data             ({s_axi4s_tdata, s_axi4s_tlast, s_axi4s_tuser}),
                .s_valid            (s_axi4s_tvalid),
                .s_ready            (s_axi4s_tready),
                
                .m_data             ({axi4s_tdata, axi4s_tlast, axi4s_tuser}),
                .m_valid            (axi4s_tvalid),
                .m_ready            (axi4s_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // ---------------------------------
    //  Width convert & FIFO
    // ---------------------------------
    
    localparam  QUEUE_COUNTER_WIDTH = (AXI4_DATA_SIZE >= AXI4S_DATA_SIZE) ? FIFO_PTR_WIDTH + 1 : FIFO_PTR_WIDTH + 1 + (AXI4S_DATA_SIZE - AXI4_DATA_SIZE);
    localparam  CNV_WIDTH           = AXI4S_DATA_SIZE - AXI4_DATA_SIZE;

    wire    [QUEUE_COUNTER_WIDTH-1:0]   queue_counter;
    
    wire                                axi4s_core_tuser;
    wire                                axi4s_core_tlast;
    wire    [AXI4_DATA_WIDTH-1:0]       axi4s_core_tdata;
    wire                                axi4s_core_tvalid;
    wire                                axi4s_core_tready;
    
    generate
    if ( AXI4_DATA_SIZE >= AXI4S_DATA_SIZE ) begin
        wire                            axi4s_wide_tuser;
        wire                            axi4s_wide_tlast;
        wire    [AXI4_DATA_WIDTH-1:0]   axi4s_wide_tdata;
        wire                            axi4s_wide_tvalid;
        wire                            axi4s_wide_tready;
        
        // width convert
        jelly_data_width_converter
                #(
                    .UNIT_WIDTH         (8),
                    .S_DATA_SIZE        (AXI4S_DATA_SIZE),
                    .M_DATA_SIZE        (AXI4_DATA_SIZE)
                )
            i_data_width_converter
                (
                    .reset              (~s_axi4s_aresetn),
                    .clk                (s_axi4s_aclk),
                    .cke                (1'b1),
                    
                    .endian             (1'b0),     // little endian
                    
                    .s_data             (axi4s_tdata),
                    .s_first            (axi4s_tuser[0]),
                    .s_last             (axi4s_tlast),
                    .s_valid            (axi4s_tvalid),
                    .s_ready            (axi4s_tready),
                    
                    .m_data             (axi4s_wide_tdata),
                    .m_first            (axi4s_wide_tuser),
                    .m_last             (axi4s_wide_tlast),
                    .m_valid            (axi4s_wide_tvalid),
                    .m_ready            (axi4s_wide_tready)
                );
        
        // FIFO
        jelly_fifo_generic_fwtf
                #(
                    .ASYNC              (ASYNC),
                    .DATA_WIDTH         (2+AXI4_DATA_WIDTH),
                    .PTR_WIDTH          (FIFO_PTR_WIDTH)
                )
            i_fifo_async_fwtf
                (
                    .s_reset            (~s_axi4s_aresetn),
                    .s_clk              (s_axi4s_aclk),
                    .s_data             ({axi4s_wide_tuser, axi4s_wide_tlast, axi4s_wide_tdata}),
                    .s_valid            (axi4s_wide_tvalid),
                    .s_ready            (axi4s_wide_tready),
                    .s_free_count       (),
                    
                    .m_reset            (~m_axi4_aresetn),
                    .m_clk              (m_axi4_aclk),
                    .m_data             ({axi4s_core_tuser, axi4s_core_tlast, axi4s_core_tdata}),
                    .m_valid            (axi4s_core_tvalid),
                    .m_ready            (axi4s_core_tready),
                    .m_data_count       (queue_counter)
                );
    end
    else begin
        wire    [FIFO_PTR_WIDTH:0]      fifo_data_count;
        
        wire                            axi4s_fifo_tuser;
        wire                            axi4s_fifo_tlast;
        wire    [AXI4S_DATA_WIDTH-1:0]  axi4s_fifo_tdata;
        wire                            axi4s_fifo_tvalid;
        wire                            axi4s_fifo_tready;
        
        // FIFO
        jelly_fifo_generic_fwtf
                #(
                    .ASYNC              (ASYNC),
                    .DATA_WIDTH         (2+AXI4S_DATA_WIDTH),
                    .PTR_WIDTH          (FIFO_PTR_WIDTH)
                )
            i_fifo_async_fwtf
                (
                    .s_reset            (~s_axi4s_aresetn),
                    .s_clk              (s_axi4s_aclk),
                    .s_data             ({axi4s_tuser, axi4s_tlast, axi4s_tdata}),
                    .s_valid            (axi4s_tvalid),
                    .s_ready            (axi4s_tready),
                    .s_free_count       (),
                    
                    .m_reset            (~m_axi4_aresetn),
                    .m_clk              (m_axi4_aclk),
                    .m_data             ({axi4s_fifo_tuser, axi4s_fifo_tlast, axi4s_fifo_tdata}),
                    .m_valid            (axi4s_fifo_tvalid),
                    .m_ready            (axi4s_fifo_tready),
                    .m_data_count       (fifo_data_count)
                );
        
        // width convert
        jelly_data_width_converter
                #(
                    .UNIT_WIDTH         (8),
                    .S_DATA_SIZE        (AXI4S_DATA_SIZE),
                    .M_DATA_SIZE        (AXI4_DATA_SIZE)
                )
            i_data_width_converter
                (
                    .reset              (~m_axi4_aresetn),
                    .clk                (m_axi4_aclk),
                    .cke                (1'b1),
                    
                    .endian             (1'b0),     // little endian
                    
                    .s_data             (axi4s_fifo_tdata),
                    .s_first            (axi4s_fifo_tuser),
                    .s_last             (axi4s_fifo_tlast),
                    .s_valid            (axi4s_fifo_tvalid),
                    .s_ready            (axi4s_fifo_tready),
                    
                    .m_data             (axi4s_core_tdata),
                    .m_first            (axi4s_core_tuser),
                    .m_last             (axi4s_core_tlast),
                    .m_valid            (axi4s_core_tvalid),
                    .m_ready            (axi4s_core_tready)
                );
        
        reg     [CNV_WIDTH-1:0]             reg_cnv_counter, next_cnv_counter;
        reg     [QUEUE_COUNTER_WIDTH-1:0]   reg_queue_counter;
        always @(posedge m_axi4_aclk) begin
            if ( ~m_axi4_aresetn ) begin
                reg_cnv_counter   <= {CNV_WIDTH{1'b0}};
                reg_queue_counter <= {QUEUE_COUNTER_WIDTH{1'b0}};
            end
            else begin
                next_cnv_counter = reg_cnv_counter;
                if ( axi4s_fifo_tvalid && axi4s_fifo_tready ) begin
                    next_cnv_counter = next_cnv_counter + (1 << CNV_WIDTH);
                end
                if ( axi4s_core_tvalid && axi4s_core_tready ) begin
                    next_cnv_counter = next_cnv_counter - 1;
                end
                reg_cnv_counter   <= next_cnv_counter;
                
                reg_queue_counter <= (fifo_data_count << CNV_WIDTH) + next_cnv_counter;
            end
        end
        
        assign queue_counter = reg_queue_counter;
    end
    endgenerate
    
    
    
    // -----------------------------
    //  Control
    // -----------------------------
    
    jelly_vdma_axi4s_to_axi4_control
            #(
                .PIXEL_SIZE             (PIXEL_SIZE),
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
                .AXI4S_USER_WIDTH       (AXI4S_USER_WIDTH),
                .AXI4_AW_REGS           (AXI4_AW_REGS),
                .AXI4_W_REGS            (AXI4_W_REGS),
                .AXI4S_REGS             (0),
                .STRIDE_WIDTH           (STRIDE_WIDTH),
                .INDEX_WIDTH            (INDEX_WIDTH),
                .H_WIDTH                (H_WIDTH),
                .V_WIDTH                (V_WIDTH),
                .SIZE_WIDTH             (SIZE_WIDTH),
                .IDLE_SKIP              (IDLE_SKIP),
                
                .PACKET_ENABLE          (PACKET_ENABLE),
                .QUEUE_COUNTER_WIDTH    (QUEUE_COUNTER_WIDTH),
                .ISSUE_COUNTER_WIDTH    (ISSUE_COUNTER_WIDTH)
            )
        i_vdma_axi4s_to_axi4_control
            (
                .aresetn                (m_axi4_aresetn),
                .aclk                   (m_axi4_aclk),
                
                .ctl_enable             (ctl_enable),
                .ctl_update             (ctl_update),
                .ctl_busy               (ctl_busy),
                .ctl_index              (ctl_index),
                .ctl_start              (ctl_start),
                
                .queue_counter          (queue_counter),
                
                .param_addr             (param_addr),
                .param_stride           (param_stride),
                .param_width            (param_width),
                .param_height           (param_height),
                .param_size             (param_size),
                .param_awlen            (param_awlen),
                
                .monitor_addr           (monitor_addr),
                .monitor_stride         (monitor_stride),
                .monitor_width          (monitor_width),
                .monitor_height         (monitor_height),
                .monitor_size           (monitor_size),
                .monitor_awlen          (monitor_awlen),
                
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
                
                .s_axi4s_tuser          (axi4s_core_tuser),
                .s_axi4s_tlast          (axi4s_core_tlast),
                .s_axi4s_tdata          (axi4s_core_tdata),
                .s_axi4s_tvalid         (axi4s_core_tvalid),
                .s_axi4s_tready         (axi4s_core_tready)
            );
    
endmodule


`default_nettype wire


// end of file
