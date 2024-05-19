// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI4 から Read して AXI4Streamにするコア
module jelly_vdma_axi4_to_axi4s_core
        #(
            parameter   ASYNC               = 0,
            parameter   FIFO_PTR_WIDTH      = 0,
            
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
                        
            parameter   STRIDE_WIDTH        = 14,
            parameter   INDEX_WIDTH         = 8,
            parameter   H_WIDTH             = 12,
            parameter   V_WIDTH             = 12,
            parameter   SIZE_WIDTH          = 24,
            
            parameter   LIMITTER_ENABLE     = 0,
            parameter   LIMITTER_MARGINE    = 4,
            parameter   ISSUE_COUNTER_WIDTH = 12
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
            input   wire    [AXI4_LEN_WIDTH-1:0]    param_arlen,
            
            // status
            output  wire    [AXI4_ADDR_WIDTH-1:0]   monitor_addr,
            output  wire    [STRIDE_WIDTH-1:0]      monitor_stride,
            output  wire    [H_WIDTH-1:0]           monitor_width,
            output  wire    [V_WIDTH-1:0]           monitor_height,
            output  wire    [SIZE_WIDTH-1:0]        monitor_size,
            output  wire    [AXI4_LEN_WIDTH-1:0]    monitor_arlen,
            
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
            input   wire                            m_axi4s_tready
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
                .reset              (~m_axi4s_aresetn),
                .clk                (m_axi4s_aclk),
                .cke                (1'b1),
                
                .s_data             ({axi4s_tdata, axi4s_tlast, axi4s_tuser}),
                .s_valid            (axi4s_tvalid),
                .s_ready            (axi4s_tready),
                
                .m_data             ({m_axi4s_tdata, m_axi4s_tlast, m_axi4s_tuser}),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // ---------------------------------
    //  Width convert & FIFO
    // ---------------------------------
    
    localparam  ACCEPTABLE_COUNTER_WIDTH = (AXI4_DATA_SIZE >= AXI4S_DATA_SIZE) ? FIFO_PTR_WIDTH + 1 : FIFO_PTR_WIDTH + 1 + (AXI4S_DATA_SIZE - AXI4_DATA_SIZE);
    localparam  CNV_WIDTH                = AXI4S_DATA_SIZE - AXI4_DATA_SIZE;
    
    wire    [ACCEPTABLE_COUNTER_WIDTH-1:0]  acceptable_counter;
    
    wire                                    axi4s_control_tuser;
    wire                                    axi4s_control_tlast;
    wire    [AXI4_DATA_WIDTH-1:0]           axi4s_control_tdata;
    wire                                    axi4s_control_tvalid;
    wire                                    axi4s_control_tready;
    
    generate
    if ( AXI4_DATA_SIZE >= AXI4S_DATA_SIZE ) begin : blk_cnv_wide
        wire                            axi4s_fifo_tuser;
        wire                            axi4s_fifo_tlast;
        wire    [AXI4_DATA_WIDTH-1:0]   axi4s_fifo_tdata;
        wire                            axi4s_fifo_tvalid;
        wire                            axi4s_fifo_tready;
        
        // FIFO
        jelly_fifo_generic_fwtf
                #(
                    .ASYNC              (ASYNC),
                    .DATA_WIDTH         (2+AXI4_DATA_WIDTH),
                    .PTR_WIDTH          (FIFO_PTR_WIDTH),
                    .MASTER_REGS        (1)
                )
            i_fifo_generic_fwtf
                (
                    .s_reset            (~m_axi4_aresetn),
                    .s_clk              (m_axi4_aclk),
                    .s_data             ({axi4s_control_tuser, axi4s_control_tlast, axi4s_control_tdata}),
                    .s_valid            (axi4s_control_tvalid),
                    .s_ready            (axi4s_control_tready),
                    .s_free_count       (acceptable_counter),
                    
                    .m_reset            (~m_axi4s_aresetn),
                    .m_clk              (m_axi4s_aclk),
                    .m_data             ({axi4s_fifo_tuser, axi4s_fifo_tlast, axi4s_fifo_tdata}),
                    .m_valid            (axi4s_fifo_tvalid),
                    .m_ready            (axi4s_fifo_tready),
                    .m_data_count       ()
                );
        
        // width convert
        jelly_data_width_converter
                #(
                    .UNIT_WIDTH         (8),
                    .S_DATA_SIZE        (AXI4_DATA_SIZE),
                    .M_DATA_SIZE        (AXI4S_DATA_SIZE)
                )
            i_data_width_converter
                (
                    .reset              (~m_axi4s_aresetn),
                    .clk                (m_axi4s_aclk),
                    .cke                (1'b1),
                    
                    .endian             (1'b0),     // little endian
                    
                    .s_data             (axi4s_fifo_tdata),
                    .s_first            (axi4s_fifo_tuser),
                    .s_last             (axi4s_fifo_tlast),
                    .s_valid            (axi4s_fifo_tvalid),
                    .s_ready            (axi4s_fifo_tready),
                    
                    .m_data             (axi4s_tdata),
                    .m_first            (axi4s_tuser),
                    .m_last             (axi4s_tlast),
                    .m_valid            (axi4s_tvalid),
                    .m_ready            (axi4s_tready)
                );
    end
    else begin : blk_cnv_narrow
        wire                            axi4s_wide_tuser;
        wire                            axi4s_wide_tlast;
        wire    [AXI4S_DATA_WIDTH-1:0]  axi4s_wide_tdata;
        wire                            axi4s_wide_tvalid;
        wire                            axi4s_wide_tready;
        
        // width convert
        jelly_data_width_converter
                #(
                    .UNIT_WIDTH         (8),
                    .S_DATA_SIZE        (AXI4_DATA_SIZE),
                    .M_DATA_SIZE        (AXI4S_DATA_SIZE)
                )
            i_data_width_converter
                (
                    .reset              (~m_axi4_aresetn),
                    .clk                (m_axi4_aclk),
                    .cke                (1'b1),
                    
                    .endian             (1'b0),     // little endian
                    
                    .s_data             (axi4s_control_tdata),
                    .s_first            (axi4s_control_tuser),
                    .s_last             (axi4s_control_tlast),
                    .s_valid            (axi4s_control_tvalid),
                    .s_ready            (axi4s_control_tready),
                    
                    .m_data             (axi4s_wide_tdata),
                    .m_first            (axi4s_wide_tuser),
                    .m_last             (axi4s_wide_tlast),
                    .m_valid            (axi4s_wide_tvalid),
                    .m_ready            (axi4s_wide_tready)
                );
        
        // FIFO
        wire    [FIFO_PTR_WIDTH:0]      fifo_free_count;
        jelly_fifo_generic_fwtf
                #(
                    .ASYNC              (ASYNC),
                    .DATA_WIDTH         (2+AXI4S_DATA_WIDTH),
                    .PTR_WIDTH          (FIFO_PTR_WIDTH),
                    .MASTER_REGS        (1)
                )
            i_fifo_generic_fwtf
                (
                    .s_reset            (~m_axi4_aresetn),
                    .s_clk              (m_axi4_aclk),
                    .s_data             ({axi4s_wide_tuser, axi4s_wide_tlast, axi4s_wide_tdata}),
                    .s_valid            (axi4s_wide_tvalid),
                    .s_ready            (axi4s_wide_tready),
                    .s_free_count       (fifo_free_count),
                    
                    .m_reset            (~m_axi4s_aresetn),
                    .m_clk              (m_axi4s_aclk),
                    .m_data             ({axi4s_tuser, axi4s_tlast, axi4s_tdata}),
                    .m_valid            (axi4s_tvalid),
                    .m_ready            (axi4s_tready),
                    .m_data_count       ()
                );
        assign acceptable_counter = (fifo_free_count << (AXI4S_DATA_SIZE-AXI4_DATA_SIZE));
    end
    endgenerate
    
    
    
    // ---------------------------------
    //  Control
    // ---------------------------------
        
    jelly_vdma_axi4_to_axi4s_control
            #(
                .PIXEL_SIZE                 (PIXEL_SIZE),
                .AXI4_ID_WIDTH              (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH            (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE             (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH            (AXI4_DATA_WIDTH),
                .AXI4_LEN_WIDTH             (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH             (AXI4_QOS_WIDTH),
                .AXI4_ARID                  (AXI4_ARID),
                .AXI4_ARSIZE                (AXI4_ARSIZE),
                .AXI4_ARBURST               (AXI4_ARBURST),
                .AXI4_ARLOCK                (AXI4_ARLOCK),
                .AXI4_ARCACHE               (AXI4_ARCACHE),
                .AXI4_ARPROT                (AXI4_ARPROT),
                .AXI4_ARQOS                 (AXI4_ARQOS),
                .AXI4_ARREGION              (AXI4_ARREGION),
                .AXI4S_USER_WIDTH           (AXI4S_USER_WIDTH),
                .AXI4_AR_REGS               (AXI4_AR_REGS),
                .AXI4_R_REGS                (AXI4_R_REGS),
                .AXI4S_REGS                 (AXI4S_REGS),
                .STRIDE_WIDTH               (STRIDE_WIDTH),
                .INDEX_WIDTH                (INDEX_WIDTH),
                .H_WIDTH                    (H_WIDTH),
                .V_WIDTH                    (V_WIDTH),
                .SIZE_WIDTH                 (SIZE_WIDTH),
                .LIMITTER_ENABLE            (LIMITTER_ENABLE),
                .LIMITTER_MARGINE           (LIMITTER_MARGINE),
                .ACCEPTABLE_COUNTER_WIDTH   (ACCEPTABLE_COUNTER_WIDTH),
                .ISSUE_COUNTER_WIDTH        (ISSUE_COUNTER_WIDTH)
            )
        i_vdma_axi4_to_axi4s_control
            (
                .aresetn                    (m_axi4_aresetn),
                .aclk                       (m_axi4_aclk),
                
                .ctl_enable                 (ctl_enable),
                .ctl_update                 (ctl_update),
                .ctl_busy                   (ctl_busy),
                .ctl_index                  (ctl_index),
                .ctl_start                  (ctl_start),
                
                .acceptable_counter         (acceptable_counter),
                
                .param_addr                 (param_addr),
                .param_stride               (param_stride),
                .param_width                (param_width),
                .param_height               (param_height),
                .param_size                 (param_size),
                .param_arlen                (param_arlen),
                
                .monitor_addr               (monitor_addr),
                .monitor_stride             (monitor_stride),
                .monitor_width              (monitor_width),
                .monitor_height             (monitor_height),
                .monitor_size               (monitor_size),
                .monitor_arlen              (monitor_arlen),
                
                .m_axi4_arid                (m_axi4_arid),
                .m_axi4_araddr              (m_axi4_araddr),
                .m_axi4_arburst             (m_axi4_arburst),
                .m_axi4_arcache             (m_axi4_arcache),
                .m_axi4_arlen               (m_axi4_arlen),
                .m_axi4_arlock              (m_axi4_arlock),
                .m_axi4_arprot              (m_axi4_arprot),
                .m_axi4_arqos               (m_axi4_arqos),
                .m_axi4_arregion            (m_axi4_arregion),
                .m_axi4_arsize              (m_axi4_arsize),
                .m_axi4_arvalid             (m_axi4_arvalid),
                .m_axi4_arready             (m_axi4_arready),
                .m_axi4_rid                 (m_axi4_rid),
                .m_axi4_rresp               (m_axi4_rresp),
                .m_axi4_rdata               (m_axi4_rdata),
                .m_axi4_rlast               (m_axi4_rlast),
                .m_axi4_rvalid              (m_axi4_rvalid),
                .m_axi4_rready              (m_axi4_rready),
                
                .m_axi4s_tuser              (axi4s_control_tuser),
                .m_axi4s_tlast              (axi4s_control_tlast),
                .m_axi4s_tdata              (axi4s_control_tdata),
                .m_axi4s_tvalid             (axi4s_control_tvalid),
                .m_axi4s_tready             (axi4s_control_tready)
        );
    
    
endmodule


`default_nettype wire


// end of file
