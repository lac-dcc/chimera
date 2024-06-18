// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI4Stream を AXI4に Write するコア
module jelly_vdma_axi4s_to_axi4_control
        #(
            parameter   PIXEL_SIZE          = 2,    // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            
            parameter   AXI4_ID_WIDTH       = 6,
            parameter   AXI4_ADDR_WIDTH     = 32,
            parameter   AXI4_DATA_SIZE      = 2,    // 0:8bit, 1:16bit, 2:32bit ...
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
            parameter   AXI4S_USER_WIDTH    = 1,
            parameter   AXI4S_DATA_WIDTH    = AXI4_DATA_WIDTH,
            
            parameter   STRIDE_WIDTH        = 14,
            parameter   INDEX_WIDTH         = 8,
            parameter   H_WIDTH             = 12,
            parameter   V_WIDTH             = 12,
            parameter   SIZE_WIDTH          = H_WIDTH + V_WIDTH,
            
            parameter   IDLE_SKIP           = 1,
            
            parameter   PACKET_ENABLE       = 0,
            parameter   QUEUE_COUNTER_WIDTH = 8,
            parameter   ISSUE_COUNTER_WIDTH = 8,
            
            parameter   AXI4_AW_REGS        = 1,
            parameter   AXI4_W_REGS         = 1,
            parameter   AXI4S_REGS          = 1
            
        )
        (
            input   wire                                aresetn,
            input   wire                                aclk,
            
            // control
            input   wire                                ctl_enable,
            input   wire                                ctl_update,
            output  wire                                ctl_busy,
            output  wire    [INDEX_WIDTH-1:0]           ctl_index,
            output  wire                                ctl_start,
            
            input   wire    [QUEUE_COUNTER_WIDTH-1:0]   queue_counter,
            
            // parameter
            input   wire    [AXI4_ADDR_WIDTH-1:0]       param_addr,
            input   wire    [STRIDE_WIDTH-1:0]          param_stride,
            input   wire    [H_WIDTH-1:0]               param_width,
            input   wire    [V_WIDTH-1:0]               param_height,
            input   wire    [SIZE_WIDTH-1:0]            param_size,
            input   wire    [AXI4_LEN_WIDTH-1:0]        param_awlen,
            
            // status
            output  wire    [AXI4_ADDR_WIDTH-1:0]       monitor_addr,
            output  wire    [STRIDE_WIDTH-1:0]          monitor_stride,
            output  wire    [H_WIDTH-1:0]               monitor_width,
            output  wire    [V_WIDTH-1:0]               monitor_height,
            output  wire    [SIZE_WIDTH-1:0]            monitor_size,
            output  wire    [AXI4_LEN_WIDTH-1:0]        monitor_awlen,
            
            // master AXI4 (write)
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
            
            // slave AXI4-Stream (output)
            input   wire    [AXI4S_DATA_WIDTH-1:0]      s_axi4s_tdata,
            input   wire                                s_axi4s_tlast,
            input   wire    [AXI4S_USER_WIDTH-1:0]      s_axi4s_tuser,
            input   wire                                s_axi4s_tvalid,
            output  wire                                s_axi4s_tready
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
                .SLAVE_REGS         (AXI4S_REGS && !PACKET_ENABLE),
                .MASTER_REGS        (AXI4S_REGS && !PACKET_ENABLE)
            )
        i_pipeline_insert_ff_t
            (
                .reset              (~aresetn),
                .clk                (aclk),
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
    
    
    
    // -----------------------------
    //  Control
    // -----------------------------
    
    // double latch
    (* ASYNC_REG = "true" *)    reg     reg_enable_ff0, reg_enable_ff1, reg_enable;
    (* ASYNC_REG = "true" *)    reg     reg_update_ff0, reg_update;
    always @(posedge aclk) begin
        if ( !aresetn ) begin
            reg_enable_ff0 <= 1'b0;
            reg_enable_ff1 <= 1'b0;
            reg_enable     <= 1'b0;
            
            reg_update_ff0 <= 1'b0;
            reg_update     <= 1'b0;
        end
        else begin
            reg_enable_ff0 <= ctl_enable;
            reg_enable_ff1 <= reg_enable_ff0;
            reg_enable     <= reg_enable_ff1;
            
            reg_update_ff0 <= ctl_update;
            reg_update     <= reg_update_ff0;
        end
    end
    
    
    // ピクセル数を転送数に変換
    function    [SIZE_WIDTH-1:0]    pixels_to_count(input [SIZE_WIDTH-1:0] pixels);
    begin
        if ( AXI4_DATA_SIZE >= PIXEL_SIZE ) begin
            pixels_to_count = (pixels >> (AXI4_DATA_SIZE - PIXEL_SIZE));
        end
        else begin
            pixels_to_count = (pixels << (PIXEL_SIZE - AXI4_DATA_SIZE));
        end
    end
    endfunction
    
    
    // ピクセル数をバイト数に変換
    function    [AXI4_ADDR_WIDTH-1:0]   pixels_to_byte(input [SIZE_WIDTH-1:0] pixels);
    begin
        pixels_to_byte = pixels << PIXEL_SIZE;
    end
    endfunction
    
    
    // 状態管理
    reg                             reg_busy;
    reg                             reg_skip;
    reg                             reg_wait_fs;
    
    wire                            sig_awbusy;
    reg                             reg_awenable;
    reg     [SIZE_WIDTH-1:0]        reg_awhcount;
    reg     [V_WIDTH-1:0]           reg_awvcount;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_awaddr;
    
    // シャドーレジスタ
    reg     [INDEX_WIDTH-1:0]       reg_index;          // この変化でホストは受付確認
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_param_addr;
    reg     [STRIDE_WIDTH-1:0]      reg_param_stride;
    reg     [H_WIDTH-1:0]           reg_param_width;
    reg     [V_WIDTH-1:0]           reg_param_height;
    reg     [SIZE_WIDTH-1:0]        reg_param_size;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_param_awlen;
    
    always @(posedge aclk) begin
        if ( !aresetn ) begin
            reg_busy         <= 1'b0;
            reg_skip         <= IDLE_SKIP;
            reg_wait_fs      <= 1'b0;
            reg_index        <= {INDEX_WIDTH{1'b0}};
            
            reg_param_addr   <= {AXI4_ADDR_WIDTH{1'bx}};
            reg_param_stride <= {STRIDE_WIDTH{1'bx}};
            reg_param_width  <= {H_WIDTH{1'bx}};
            reg_param_height <= {V_WIDTH{1'bx}};
            reg_param_size   <= {SIZE_WIDTH{1'bx}};
            reg_param_awlen  <= {AXI4_LEN_WIDTH{1'bx}};
            
            reg_awenable     <= 1'b0;
            reg_awhcount     <= {SIZE_WIDTH{1'bx}};
            reg_awvcount     <= {V_WIDTH{1'bx}};
            reg_awaddr       <= {AXI4_ADDR_WIDTH{1'bx}};
        end
        else begin
            reg_awenable <= 1'b0;
            
            if ( !reg_busy ) begin
                if ( reg_enable ) begin
                    // start
                    reg_busy     <= 1'b1;
                    reg_skip     <= 1'b0;
                    reg_wait_fs  <= 1'b1;
                    reg_index    <= reg_index + 1'b1;
                    reg_awenable <= 1'b1;
                    if ( reg_update ) begin
                        reg_param_addr   <= param_addr;
                        reg_param_stride <= param_stride;
                        reg_param_width  <= param_width;
                        reg_param_height <= param_height;
                        reg_param_size   <= param_size;
                        reg_param_awlen  <= param_awlen;
                        
                        reg_awhcount <= pixels_to_count(param_width);
                        reg_awvcount <= param_height;
                        if ( (param_size != 0) && pixels_to_byte(param_width) == param_stride ) begin
                            reg_awhcount <= pixels_to_count(param_size);
                            reg_awvcount <= 1;
                        end
                        reg_awaddr <= param_addr;
                    end
                    else begin
                        reg_awhcount <= pixels_to_count(reg_param_width);
                        reg_awvcount <= reg_param_height;
                        if ( (reg_param_size != 0) && (reg_param_width << AXI4_DATA_SIZE) == reg_param_stride ) begin
                            reg_awhcount <= pixels_to_count(reg_param_size);
                            reg_awvcount <= 1;
                        end
                        reg_awaddr <= reg_param_addr;
                    end                 
                end
                else begin
                    // idle
                    reg_busy    <= 1'b0;
                    reg_wait_fs <= 1'b0;
                    reg_skip    <= IDLE_SKIP;
                end
            end
            else begin
                if ( !reg_awenable && !sig_awbusy ) begin
                    if ( (reg_awvcount - 1'b1) == 0 ) begin
                        // end
                        reg_busy     <= 1'b0;
                        reg_awaddr   <= {AXI4_ADDR_WIDTH{1'bx}};
                        reg_awvcount <= {V_WIDTH{1'bx}};
                    end
                    else begin
                        // next line
                        reg_awenable <= 1'b1;
                        reg_awaddr   <= reg_awaddr + reg_param_stride;
                        reg_awvcount <= reg_awvcount - 1'b1;
                    end
                end
            end
            
            // wait frame start
            if ( reg_busy ) begin
                if ( axi4s_tvalid && axi4s_tuser ) begin 
                    // frame start
                    reg_wait_fs <= 1'b0;
                end
            end
        end
    end
    
    assign ctl_busy       = reg_busy;
    assign ctl_index      = reg_index;
    assign ctl_start      = (!reg_busy && reg_enable);
    
    assign monitor_addr   = reg_param_addr;
    assign monitor_stride = reg_param_stride;
    assign monitor_width  = reg_param_width;
    assign monitor_height = reg_param_height;
    assign monitor_size   = reg_param_size;
    assign monitor_awlen  = reg_param_awlen;
    
    
    // DAM writer   
    wire    [AXI4S_DATA_WIDTH-1:0]  axi4s_dma_tdata;
    wire                            axi4s_dma_tvalid;
    wire                            axi4s_dma_tready;
    
    jelly_axi4_dma_writer
            #(
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
                .AXI4S_DATA_WIDTH       (AXI4S_DATA_WIDTH),
                .COUNT_WIDTH            (SIZE_WIDTH),
                .PACKET_ENABLE          (PACKET_ENABLE),
                .QUEUE_COUNTER_WIDTH    (QUEUE_COUNTER_WIDTH),
                .ISSUE_COUNTER_WIDTH    (ISSUE_COUNTER_WIDTH),
                
                .AXI4_AW_REGS           (AXI4_AW_REGS),
                .AXI4_W_REGS            (AXI4_W_REGS),
                .AXI4S_REGS             (0)
            )
        i_axi4_dma_writer
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .enable                 (reg_awenable),
                .busy                   (sig_awbusy),
                
                .queue_counter          (queue_counter),
                
                .param_addr             (reg_awaddr),
                .param_count            (reg_awhcount),
                .param_maxlen           (reg_param_awlen),
                .param_wstrb            ({AXI4_STRB_WIDTH{1'b1}}),
                
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
                
                .s_axi4s_tdata          (axi4s_dma_tdata),
                .s_axi4s_tvalid         (axi4s_dma_tvalid),
                .s_axi4s_tready         (axi4s_dma_tready)
            );
    
    assign axi4s_dma_tvalid = axi4s_tvalid && reg_busy && (!reg_wait_fs || axi4s_tuser);
    assign axi4s_dma_tdata  = axi4s_tdata;  
    assign axi4s_tready     = reg_skip || (sig_awbusy && axi4s_dma_tready);
    
endmodule


`default_nettype wire


// end of file
