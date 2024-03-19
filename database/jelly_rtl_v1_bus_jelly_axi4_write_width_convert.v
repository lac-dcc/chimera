// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


// AXI4 メモリ書き込みコア データ幅変換部
module jelly_axi4_write_width_convert
        #(
            parameter   AWASYNC           = 1,
            parameter   WASYNC            = 1,
            parameter   AW_W_ASYNC        = (AWASYNC || WASYNC),
            parameter   BYTE_WIDTH        = 8,
            parameter   BYPASS_GATE       = 1,
            
            parameter   ALLOW_UNALIGNED   = 0,
            
            parameter   HAS_S_WSTRB       = 0,
            parameter   HAS_S_WFIRST      = 0,
            parameter   HAS_S_WLAST       = 0,
            parameter   HAS_M_WSTRB       = 0,
            parameter   HAS_M_WFIRST      = 0,
            parameter   HAS_M_WLAST       = 0,
            
            parameter   AWADDR_WIDTH      = 32,
            parameter   AWUSER_WIDTH      = 0,
            
            parameter   S_WDATA_WIDTH     = 32,  // 8の倍数であること
            parameter   S_WSTRB_WIDTH     = S_WDATA_WIDTH / BYTE_WIDTH,
            parameter   S_WUSER_WIDTH     = 0,
            parameter   S_AWLEN_WIDTH     = 32,
            parameter   S_AWLEN_OFFSET    = 1'b1,
            parameter   S_AWUSER_WIDTH    = 0,
            
            parameter   M_WDATA_SIZE      = 3,   // log2 (0:8bit, 1:16bit, 2:32bit ...)
            parameter   M_WDATA_WIDTH     = (BYTE_WIDTH << M_WDATA_SIZE),
            parameter   M_WSTRB_WIDTH     = M_WDATA_WIDTH / BYTE_WIDTH,
            parameter   M_WUSER_WIDTH     = S_WUSER_WIDTH * M_WDATA_WIDTH / S_WDATA_WIDTH,
            parameter   M_AWLEN_WIDTH     = 32,
            parameter   M_AWLEN_OFFSET    = 1'b1,
            parameter   M_AWUSER_WIDTH    = 0,
            
            parameter   WFIFO_PTR_WIDTH   = 9,
            parameter   WFIFO_RAM_TYPE    = "block",
            parameter   WFIFO_LOW_DEALY   = 0,
            parameter   WFIFO_DOUT_REGS   = 1,
            parameter   WFIFO_S_REGS      = 0,
            parameter   WFIFO_M_REGS      = 1,
            
            parameter   AWFIFO_PTR_WIDTH  = 4,
            parameter   AWFIFO_RAM_TYPE   = "distributed",
            parameter   AWFIFO_LOW_DEALY  = 1,
            parameter   AWFIFO_DOUT_REGS  = 0,
            parameter   AWFIFO_S_REGS     = 0,
            parameter   AWFIFO_M_REGS     = 0,
            
            parameter   SWFIFOPTR_WIDTH   = 4,
            parameter   SWFIFORAM_TYPE    = "distributed",
            parameter   SWFIFOLOW_DEALY   = 1,
            parameter   SWFIFODOUT_REGS   = 0,
            parameter   SWFIFOS_REGS      = 0,
            parameter   SWFIFOM_REGS      = 0,
            
            parameter   CONVERT_S_REGS    = 0,
            parameter   POST_CONVERT      = (M_WDATA_WIDTH < S_WDATA_WIDTH),
            
            // local
            parameter   AWUSER_BITS       = AWUSER_WIDTH  > 0 ? AWUSER_WIDTH  : 1,
            parameter   S_WUSER_BITS      = S_WUSER_WIDTH > 0 ? S_WUSER_WIDTH : 1,
            parameter   M_WUSER_BITS      = M_WUSER_WIDTH > 0 ? M_WUSER_WIDTH : 1
        )
        (
            input   wire                            endian,
            
            input   wire                            s_awresetn,
            input   wire                            s_awclk,
            input   wire    [AWADDR_WIDTH-1:0]      s_awaddr,
            input   wire    [S_AWLEN_WIDTH-1:0]     s_awlen,
            input   wire    [AWUSER_BITS-1:0]       s_awuser,
            input   wire                            s_awvalid,
            output  wire                            s_awready,
            
            input   wire                            s_wresetn,
            input   wire                            s_wclk,
            input   wire                            s_wfirst,
            input   wire                            s_wlast,
            input   wire    [S_WDATA_WIDTH-1:0]     s_wdata,
            input   wire    [S_WSTRB_WIDTH-1:0]     s_wstrb,
            input   wire    [S_WUSER_BITS-1:0]      s_wuser,
            input   wire                            s_wvalid,
            output  wire                            s_wready,
            output  wire    [WFIFO_PTR_WIDTH:0]     wfifo_free_count,
            output  wire                            wfifo_wr_signal,
            
            input   wire                            m_awresetn,
            input   wire                            m_awclk,
            output  wire    [AWADDR_WIDTH-1:0]      m_awaddr,
            output  wire    [M_AWLEN_WIDTH-1:0]     m_awlen,
            output  wire    [AWUSER_BITS-1:0]       m_awuser,
            output  wire                            m_awvalid,
            input   wire                            m_awready,
            
            input   wire                            m_wresetn,
            input   wire                            m_wclk,
            output  wire    [M_WDATA_WIDTH-1:0]     m_wdata,
            output  wire    [M_WSTRB_WIDTH-1:0]     m_wstrb,
            output  wire                            m_wfirst,
            output  wire                            m_wlast,
            output  wire    [M_WUSER_BITS-1:0]      m_wuser,
            output  wire                            m_wvalid,
            input   wire                            m_wready,
            output  wire    [WFIFO_PTR_WIDTH:0]     wfifo_data_count,
            output  wire                            wfifo_rd_signal
        );
    
    
    // ---------------------------------
    //  localparam
    // ---------------------------------
    
    localparam ALIGN_WIDTH = M_WDATA_SIZE;
    localparam ALIGN_BITS  = ALIGN_WIDTH > 0 ? ALIGN_WIDTH : 1;
    
    
    
    // ---------------------------------
    //  s_aw
    // ---------------------------------
    
    // master 側にクロック載せ替え
    wire    [AWADDR_WIDTH-1:0]      awfifo_awaddr;
    wire    [S_AWLEN_WIDTH-1:0]     awfifo_awlen;
    wire    [AWUSER_BITS-1:0]       awfifo_awuser;
    wire                            awfifo_awvalid;
    wire                            awfifo_awready;
    jelly_fifo_pack
            #(
                .ASYNC              (AWASYNC),
                .DATA0_WIDTH        (AWADDR_WIDTH),
                .DATA1_WIDTH        (S_AWLEN_WIDTH),
                .DATA2_WIDTH        (AWUSER_WIDTH),
                
                .PTR_WIDTH          (AWFIFO_PTR_WIDTH),
                .DOUT_REGS          (AWFIFO_DOUT_REGS),
                .RAM_TYPE           (AWFIFO_RAM_TYPE),
                .LOW_DEALY          (AWFIFO_LOW_DEALY),
                .S_REGS             (AWFIFO_S_REGS),
                .M_REGS             (AWFIFO_M_REGS)
            )
        i_fifo_pack_cmd_aw
            (
                .s_reset            (~s_awresetn),
                .s_clk              (s_awclk),
                .s_data0            (s_awaddr),
                .s_data1            (s_awlen),
                .s_data2            (s_awuser),
                .s_valid            (s_awvalid),
                .s_ready            (s_awready),
                
                .m_reset            (~m_awresetn),
                .m_clk              (m_awclk),
                .m_data0            (awfifo_awaddr),
                .m_data1            (awfifo_awlen),
                .m_data2            (awfifo_awuser),
                .m_valid            (awfifo_awvalid),
                .m_ready            (awfifo_awready)
            );
    
    // address convert
    wire    [AWADDR_WIDTH-1:0]      adrcnv_awaddr;
    wire    [ALIGN_BITS-1:0]        adrcnv_align;
    wire    [S_AWLEN_WIDTH-1:0]     adrcnv_awlen_s;
    wire    [M_AWLEN_WIDTH-1:0]     adrcnv_awlen_m;
    wire    [AWUSER_BITS-1:0]       adrcnv_awuser;
    wire                            adrcnv_awvalid;
    wire                            adrcnv_awready;
    
    jelly_address_width_convert
            #(
                .ALLOW_UNALIGNED    (ALLOW_UNALIGNED),
                .ADDR_WIDTH         (AWADDR_WIDTH),
                .USER_WIDTH         (AWUSER_BITS + S_AWLEN_WIDTH),
                .S_UNIT             (S_WDATA_WIDTH / BYTE_WIDTH),
                .M_UNIT_SIZE        (M_WDATA_SIZE),
                .S_LEN_WIDTH        (S_AWLEN_WIDTH),
                .S_LEN_OFFSET       (S_AWLEN_OFFSET),
                .M_LEN_WIDTH        (M_AWLEN_WIDTH),
                .M_LEN_OFFSET       (M_AWLEN_OFFSET)
            )
        i_address_width_convert
            (
                .reset              (~m_awresetn),
                .clk                (m_awclk),
                .cke                (1'b1),
                
                .s_addr             (awfifo_awaddr),
                .s_len              (awfifo_awlen),
                .s_user             ({awfifo_awuser, awfifo_awlen}),
                .s_valid            (awfifo_awvalid),
                .s_ready            (awfifo_awready),
                
                .m_addr             (adrcnv_awaddr),
                .m_align            (adrcnv_align),
                .m_len              (adrcnv_awlen_m),
                .m_user             ({adrcnv_awuser, adrcnv_awlen_s}),
                .m_valid            (adrcnv_awvalid),
                .m_ready            (adrcnv_awready)
            );
    
    
    // アドレスコマンドと、データ制御用に分岐
    wire    [AWADDR_WIDTH-1:0]      cmd_awaddr;
    wire    [M_AWLEN_WIDTH-1:0]     cmd_awlen;
    wire    [AWUSER_BITS-1:0]       cmd_awuser;
    wire                            cmd_awvalid;
    wire                            cmd_awready;
    
    wire    [S_AWLEN_WIDTH-1:0]     dat_awlen;
    wire    [ALIGN_BITS-1:0]        dat_align;
    wire                            dat_awvalid;
    wire                            dat_awready;
    
    jelly_data_split_pack2
            #(
                .NUM                (2),
                
                .DATA0_0_WIDTH      (AWADDR_WIDTH),
                .DATA0_1_WIDTH      (M_AWLEN_WIDTH),
                .DATA0_2_WIDTH      (AWUSER_WIDTH),
                
                .DATA1_0_WIDTH      (S_AWLEN_WIDTH),
                .DATA1_1_WIDTH      (ALIGN_WIDTH),
                .S_REGS             (0)
            )
        i_data_split_pack2_aw
            (
                .reset              (~m_awresetn),
                .clk                (m_awclk),
                .cke                (1'b1),
                
                .s_data0_0          (adrcnv_awaddr),
                .s_data0_1          (adrcnv_awlen_m),
                .s_data0_2          (adrcnv_awuser),
                .s_data1_0          (adrcnv_awlen_s),
                .s_data1_1          (adrcnv_align),
                .s_valid            (adrcnv_awvalid),
                .s_ready            (adrcnv_awready),
                
                .m0_data0           (cmd_awaddr),
                .m0_data1           (cmd_awlen),
                .m0_data2           (cmd_awuser),
                .m0_valid           (cmd_awvalid),
                .m0_ready           (cmd_awready),
                
                .m1_data0           (dat_awlen),
                .m1_data1           (dat_align),
                .m1_valid           (dat_awvalid),
                .m1_ready           (dat_awready)
            );
    
    assign m_awaddr    = cmd_awaddr;
    assign m_awlen     = cmd_awlen;
    assign m_awuser    = cmd_awuser;
    assign m_awvalid   = cmd_awvalid;
    assign cmd_awready = m_awready;
    
    
    
    // ---------------------------------
    //  wdata
    // ---------------------------------
    
    // s_w 側のクロックに載せ替え
    wire    [S_AWLEN_WIDTH-1:0]     datfifo_awlen;
    wire    [ALIGN_BITS-1:0]        datfifo_align;
    wire                            datfifo_awvalid;
    wire                            datfifo_awready;
    
    jelly_fifo_pack
            #(
                .ASYNC              (WASYNC),
                .DATA0_WIDTH        (S_AWLEN_WIDTH),
                .DATA1_WIDTH        (ALIGN_WIDTH),
                
                .PTR_WIDTH          (SWFIFOPTR_WIDTH),
                .DOUT_REGS          (SWFIFODOUT_REGS),
                .RAM_TYPE           (SWFIFORAM_TYPE),
                .LOW_DEALY          (SWFIFOLOW_DEALY),
                .S_REGS             (SWFIFOS_REGS),
                .M_REGS             (SWFIFOM_REGS)
            )
        i_fifo_pack_dat
            (
                .s_reset            (~m_awresetn),
                .s_clk              (m_awclk),
                .s_data0            (dat_awlen),
                .s_data1            (dat_align),
                .s_valid            (dat_awvalid),
                .s_ready            (dat_awready),
                
                .m_reset            (~s_wresetn),
                .m_clk              (s_wclk),
                .m_data0            (datfifo_awlen),
                .m_data1            (datfifo_align),
                .m_valid            (datfifo_awvalid),
                .m_ready            (datfifo_awready)
            );
    
    
    // gate
    wire    [ALIGN_BITS-1:0]        gate_align;
    wire    [S_WDATA_WIDTH-1:0]     gate_wdata;
    wire    [S_WSTRB_WIDTH-1:0]     gate_wstrb;
    wire    [S_WUSER_BITS-1:0]      gate_wuser;
    wire                            gate_wfirst;
    wire                            gate_wlast;
    wire                            gate_wvalid;
    wire                            gate_wready;
    
    jelly_stream_gate
            #(
                .BYPASS             (BYPASS_GATE && !HAS_S_WLAST),
                .DETECTOR_ENABLE    (0),
                .DATA_WIDTH         (S_WUSER_BITS + S_WSTRB_WIDTH + S_WDATA_WIDTH),
                .LEN_WIDTH          (S_AWLEN_WIDTH),
                .LEN_OFFSET         (S_AWLEN_OFFSET),
                .USER_WIDTH         (ALIGN_WIDTH),
                .S_REGS             (0),
                .M_REGS             (1)
            )
        i_stream_gate
            (
                .reset              (~s_wresetn),
                .clk                (s_wclk),
                .cke                (1'b1),
                
                .skip               (1'b0),
                .detect_first       (1'b0),
                .detect_last        (1'b0),
                .padding_en         (1'b0),
                .padding_data       ({{S_WUSER_BITS{1'bx}}, {S_WSTRB_WIDTH{1'b0}}, {S_WDATA_WIDTH{1'b0}}}),
                
                .s_permit_reset     (~s_wresetn),
                .s_permit_clk       (s_wclk),
                .s_permit_first     (1'b1),
                .s_permit_last      (1'b1),
                .s_permit_len       (datfifo_awlen),
                .s_permit_user      (datfifo_align),
                .s_permit_valid     (datfifo_awvalid),
                .s_permit_ready     (datfifo_awready),
                
                .s_first            (HAS_S_WFIRST ? s_wfirst : 1'b0),
                .s_last             (HAS_S_WLAST  ? s_wlast  : 1'b0),
                .s_data             ({s_wuser, s_wstrb, s_wdata}),
                .s_valid            (s_wvalid),
                .s_ready            (s_wready),
                
                .m_first            (gate_wfirst),
                .m_last             (gate_wlast),
                .m_data             ({gate_wuser, gate_wstrb, gate_wdata}),
                .m_user             (gate_align),
                .m_valid            (gate_wvalid),
                .m_ready            (gate_wready)
            );
    
    
    // fifo with width convert
    wire    [M_WDATA_WIDTH-1:0]     conv_wdata;
    wire    [M_WSTRB_WIDTH-1:0]     conv_wstrb;
    wire                            conv_wfirst;
    wire                            conv_wlast;
    wire    [M_WUSER_BITS-1:0]      conv_wuser;
    wire                            conv_wvalid;
    wire                            conv_wready;
    jelly_axi4s_fifo_width_convert
            #(
                .ASYNC              (WASYNC),
                .FIFO_PTR_WIDTH     (WFIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE      (WFIFO_RAM_TYPE),
                .FIFO_LOW_DEALY     (WFIFO_LOW_DEALY),
                .FIFO_DOUT_REGS     (WFIFO_DOUT_REGS),
                .FIFO_S_REGS        (WFIFO_S_REGS),
                .FIFO_M_REGS        (WFIFO_M_REGS),
                
                .HAS_STRB           (ALLOW_UNALIGNED),
                .HAS_KEEP           (0),
                .HAS_FIRST          (0),
                .HAS_LAST           (ALLOW_UNALIGNED),
                .HAS_ALIGN_S        (0),
                .HAS_ALIGN_M        (ALLOW_UNALIGNED),
                
                .S_TDATA_WIDTH      (S_WDATA_WIDTH),
                .M_TDATA_WIDTH      (M_WDATA_WIDTH),
                .S_TUSER_WIDTH      (S_WUSER_WIDTH),
                .FIRST_FORCE_LAST   (0),
                .FIRST_OVERWRITE    (0),
                .ALIGN_S_WIDTH      (1),
                .ALIGN_M_WIDTH      (ALIGN_BITS),
                
                .CONVERT_S_REGS     (CONVERT_S_REGS),
                .POST_CONVERT       (POST_CONVERT)
            )
        i_axi4s_fifo_width_convert
            (
                .endian             (endian),
                
                .s_aresetn          (s_wresetn),
                .s_aclk             (s_wclk),
                .s_align_s          (1'b0),
                .s_align_m          (gate_align),
                .s_axi4s_tdata      (gate_wdata),
                .s_axi4s_tstrb      (HAS_S_WSTRB ? gate_wstrb : {S_WSTRB_WIDTH{1'b1}}),
                .s_axi4s_tkeep      ({S_WSTRB_WIDTH{1'b1}}),
                .s_axi4s_tfirst     (gate_wfirst),
                .s_axi4s_tlast      (gate_wlast),
                .s_axi4s_tuser      (gate_wuser),
                .s_axi4s_tvalid     (gate_wvalid),
                .s_axi4s_tready     (gate_wready),
                .fifo_free_count    (wfifo_free_count),
                .fifo_wr_signal     (wfifo_wr_signal),
                
                .m_aresetn          (m_wresetn),
                .m_aclk             (m_wclk),
                .m_axi4s_tdata      (conv_wdata),
                .m_axi4s_tstrb      (conv_wstrb),
                .m_axi4s_tkeep      (),
                .m_axi4s_tfirst     (conv_wfirst),
                .m_axi4s_tlast      (conv_wlast),
                .m_axi4s_tuser      (conv_wuser),
                .m_axi4s_tvalid     (conv_wvalid),
                .m_axi4s_tready     (conv_wready),
                .fifo_data_count    (wfifo_data_count),
                .fifo_rd_signal     (wfifo_rd_signal)
            );
    
    assign m_wdata     = conv_wdata;
    assign m_wstrb     = HAS_M_WSTRB  ? conv_wstrb  : {M_WSTRB_WIDTH{1'b1}};
    assign m_wfirst    = HAS_M_WFIRST ? conv_wfirst : 1'b0;
    assign m_wlast     = HAS_M_WLAST  ? conv_wlast  : 1'b0;
    assign m_wuser     = conv_wuser;
    assign m_wvalid    = conv_wvalid;
    assign conv_wready = m_wready;
    
endmodule


`default_nettype wire


// end of file
