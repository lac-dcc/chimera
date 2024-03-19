// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// AXI4 N次元データ読出しコア
module jelly_axi4_read_nd
        #(
            parameter N                   = 2,
            
            parameter ARASYNC             = 1,
            parameter RASYNC              = 1,
            parameter CASYNC              = 1,
            
            parameter BYTE_WIDTH          = 8,
            parameter BYPASS_GATE         = 1,
            parameter BYPASS_ALIGN        = 0,
            parameter ALLOW_UNALIGNED     = 0,
            
            parameter HAS_RFIRST          = 0,
            parameter HAS_RLAST           = 1,
            
            parameter AXI4_ID_WIDTH       = 6,
            parameter AXI4_ADDR_WIDTH     = 32,
            parameter AXI4_DATA_SIZE      = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter AXI4_DATA_WIDTH     = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter AXI4_LEN_WIDTH      = 8,
            parameter AXI4_QOS_WIDTH      = 4,
            parameter AXI4_ARID           = {AXI4_ID_WIDTH{1'b0}},
            parameter AXI4_ARSIZE         = AXI4_DATA_SIZE,
            parameter AXI4_ARBURST        = 2'b01,
            parameter AXI4_ARLOCK         = 1'b0,
            parameter AXI4_ARCACHE        = 4'b0001,
            parameter AXI4_ARPROT         = 3'b000,
            parameter AXI4_ARQOS          = 0,
            parameter AXI4_ARREGION       = 4'b0000,
            parameter AXI4_ALIGN          = 12,  // 2^12 = 4k が境界
            
            parameter S_RDATA_WIDTH       = 32,
            parameter S_ARSTEP_WIDTH      = AXI4_ADDR_WIDTH,
            parameter S_ARLEN_WIDTH       = 12,
            parameter S_ARLEN_OFFSET      = 1'b1,
            
            parameter CAPACITY_WIDTH      = S_RDATA_WIDTH,   // 内部キューイング用
            
            parameter CONVERT_S_REGS      = 0,
            
            parameter RFIFO_PTR_WIDTH     = 9,
            parameter RFIFO_RAM_TYPE      = "block",
            parameter RFIFO_LOW_DEALY     = 0,
            parameter RFIFO_DOUT_REGS     = 1,
            parameter RFIFO_S_REGS        = 0,
            parameter RFIFO_M_REGS        = 1,
            
            parameter ARFIFO_PTR_WIDTH    = 4,
            parameter ARFIFO_RAM_TYPE     = "distributed",
            parameter ARFIFO_LOW_DEALY    = 1,
            parameter ARFIFO_DOUT_REGS    = 0,
            parameter ARFIFO_S_REGS       = 0,
            parameter ARFIFO_M_REGS       = 0,
            
            parameter SRFIFO_PTR_WIDTH    = 4,
            parameter SRFIFO_RAM_TYPE     = "distributed",
            parameter SRFIFO_LOW_DEALY    = 0,
            parameter SRFIFO_DOUT_REGS    = 0,
            parameter SRFIFO_S_REGS       = 0,
            parameter SRFIFO_M_REGS       = 0,
            
            parameter MRFIFO_PTR_WIDTH    = 4,
            parameter MRFIFO_RAM_TYPE     = "distributed",
            parameter MRFIFO_LOW_DEALY    = 1,
            parameter MRFIFO_DOUT_REGS    = 0,
            parameter MRFIFO_S_REGS       = 0,
            parameter MRFIFO_M_REGS       = 0,
            
            parameter RACKFIFO_PTR_WIDTH  = 4,
            parameter RACKFIFO_DOUT_REGS  = 0,
            parameter RACKFIFO_RAM_TYPE   = "distributed",
            parameter RACKFIFO_LOW_DEALY  = 1,
            parameter RACKFIFO_S_REGS     = 0,
            parameter RACKFIFO_M_REGS     = 0,
            parameter RACK_S_REGS         = 0,
            parameter RACK_M_REGS         = 1,
            
            parameter CACKFIFO_PTR_WIDTH  = 4,
            parameter CACKFIFO_DOUT_REGS  = 0,
            parameter CACKFIFO_RAM_TYPE   = "distributed",
            parameter CACKFIFO_LOW_DEALY  = 1,
            parameter CACKFIFO_S_REGS     = 0,
            parameter CACKFIFO_M_REGS     = 0,
            parameter CACK_S_REGS         = 0,
            parameter CACK_M_REGS         = 0
        )
        (
            input   wire                            endian,
            
            input   wire                            s_arresetn,
            input   wire                            s_arclk,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_araddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]    s_arlen_max,
            input   wire    [N*S_ARSTEP_WIDTH-1:0]  s_arstep,       // step0は無視(1固定、つまり連続アクセスのみ)
            input   wire    [N*S_ARLEN_WIDTH-1:0]   s_arlen,
            input   wire                            s_arvalid,
            output  wire                            s_arready,
            
            input   wire                            s_rresetn,
            input   wire                            s_rclk,
            output  wire    [S_RDATA_WIDTH-1:0]     s_rdata,
            output  wire    [N-1:0]                 s_rfirst,
            output  wire    [N-1:0]                 s_rlast,
            output  wire                            s_rvalid,
            input   wire                            s_rready,
            
            input   wire                            s_cresetn,
            input   wire                            s_cclk,
            output  wire    [N-1:0]                 s_cfirst,
            output  wire    [N-1:0]                 s_clast,
            output  wire                            s_cvalid,
            input   wire                            s_cready,
            
            input   wire                            m_aresetn,
            input   wire                            m_aclk,
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
            output  wire                            m_axi4_rready
        );
    
    
    
    // ---------------------------------------------
    //  N-Dimension addressing
    // ---------------------------------------------
    
    // m_ar 側にクロック載せ替え
    wire    [AXI4_ADDR_WIDTH-1:0]   arfifo_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]    arfifo_arlen_max;
    wire    [N*S_ARSTEP_WIDTH-1:0]  arfifo_arstep;
    wire    [N*S_ARLEN_WIDTH-1:0]   arfifo_arlen;
    wire                            arfifo_arvalid;
    wire                            arfifo_arready;
    
    jelly_fifo_pack
            #(
                .ASYNC              (ARASYNC),
                .DATA0_WIDTH        (AXI4_ADDR_WIDTH),
                .DATA1_WIDTH        (AXI4_LEN_WIDTH),
                .DATA2_WIDTH        (N*S_ARSTEP_WIDTH),
                .DATA3_WIDTH        (N*S_ARLEN_WIDTH),
                
                .PTR_WIDTH          (ARFIFO_PTR_WIDTH),
                .DOUT_REGS          (ARFIFO_DOUT_REGS),
                .RAM_TYPE           (ARFIFO_RAM_TYPE),
                .LOW_DEALY          (ARFIFO_LOW_DEALY),
                .S_REGS             (ARFIFO_S_REGS),
                .M_REGS             (ARFIFO_M_REGS)
            )
        i_fifo_pack_cmd_ar
            (
                .s_reset            (~s_arresetn),
                .s_clk              (s_arclk),
                .s_data0            (s_araddr),
                .s_data1            (s_arlen_max),
                .s_data2            (s_arstep),
                .s_data3            (s_arlen),
                .s_valid            (s_arvalid),
                .s_ready            (s_arready),
                
                .m_reset            (~m_aresetn),
                .m_clk              (m_aclk),
                .m_data0            (arfifo_araddr),
                .m_data1            (arfifo_arlen_max),
                .m_data2            (arfifo_arstep),
                .m_data3            (arfifo_arlen),
                .m_valid            (arfifo_arvalid),
                .m_ready            (arfifo_arready)
            );
    
    
    // address generate
    wire    [AXI4_ADDR_WIDTH-1:0]   adrgen_araddr;
    wire    [S_ARLEN_WIDTH-1:0]     adrgen_arlen;
    wire    [AXI4_LEN_WIDTH-1:0]    adrgen_arlen_max;
    wire    [N-1:0]                 adrgen_arfirst;
    wire    [N-1:0]                 adrgen_arlast;
    wire                            adrgen_arvalid;
    wire                            adrgen_arready;
    
    generate
    if ( N >= 2 ) begin : blk_adrgen_nd
        // 2D以上のアドレッシング
        jelly_address_generator_nd
                #(
                    .N                      (N-1),
                    .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                    .STEP_WIDTH             (S_ARSTEP_WIDTH),
                    .LEN_WIDTH              (S_ARLEN_WIDTH),
                    .LEN_OFFSET             (S_ARLEN_OFFSET),
                    .USER_WIDTH             (S_ARLEN_WIDTH + AXI4_LEN_WIDTH)
                )
            i_address_generator_nd
                (
                    .reset                  (~m_aresetn),
                    .clk                    (m_aclk),
                    .cke                    (1'b1),
                    
                    .s_addr                 (arfifo_araddr),
                    .s_step                 (arfifo_arstep[N*S_ARSTEP_WIDTH-1:S_ARSTEP_WIDTH]),
                    .s_len                  (arfifo_arlen [N*S_ARLEN_WIDTH-1:S_ARLEN_WIDTH]),
                    .s_user                 ({arfifo_arlen[S_ARLEN_WIDTH-1:0], arfifo_arlen_max}),
                    .s_valid                (arfifo_arvalid),
                    .s_ready                (arfifo_arready),
                    
                    .m_addr                 (adrgen_araddr),
                    .m_first                (adrgen_arfirst[N-1:1]),
                    .m_last                 (adrgen_arlast[N-1:1]),
                    .m_user                 ({adrgen_arlen, adrgen_arlen_max}),
                    .m_valid                (adrgen_arvalid),
                    .m_ready                (adrgen_arready)
                );
        assign adrgen_arfirst[0] = 1'b1;
        assign adrgen_arlast[0]  = 1'b1;
    end
    else begin : blk_1d
        assign adrgen_araddr    = arfifo_araddr;
        assign adrgen_arlen     = arfifo_arlen;
        assign adrgen_arlen_max = arfifo_arlen_max;
        assign adrgen_arfirst   = 1'b1;
        assign adrgen_arlast    = 1'b1;
        assign adrgen_arvalid   = arfifo_arvalid;
        assign arfifo_arready   = adrgen_arready;
    end
    endgenerate
    
    
    
    // コマンド分岐
    wire    [AXI4_ADDR_WIDTH-1:0]   cmd_araddr;
    wire    [S_ARLEN_WIDTH-1:0]     cmd_arlen;
    wire    [AXI4_LEN_WIDTH-1:0]    cmd_arlen_max;
    wire                            cmd_arvalid;
    wire                            cmd_arready;
    
    wire    [N-1:0]                 dat_arfirst;
    wire    [N-1:0]                 dat_arlast;
    wire    [S_ARLEN_WIDTH-1:0]     dat_arlen;
    wire                            dat_arvalid;
    wire                            dat_arready;
    
    wire    [N-1:0]                 ack_arfirst;
    wire    [N-1:0]                 ack_arlast;
    wire                            ack_arvalid;
    wire                            ack_arready;
    
    jelly_data_split_pack2
            #(
                .NUM                    (3),
                .DATA0_0_WIDTH          (AXI4_ADDR_WIDTH),
                .DATA0_1_WIDTH          (S_ARLEN_WIDTH),
                .DATA0_2_WIDTH          (AXI4_LEN_WIDTH),
                .DATA1_0_WIDTH          (N),
                .DATA1_1_WIDTH          (N),
                .DATA1_2_WIDTH          (S_ARLEN_WIDTH),
                .DATA2_0_WIDTH          (N),
                .DATA2_1_WIDTH          (N),
                .S_REGS                 (1)
            )
        i_data_split_pack2
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .s_data0_0              (adrgen_araddr),
                .s_data0_1              (adrgen_arlen),
                .s_data0_2              (adrgen_arlen_max),
                .s_data1_0              (adrgen_arfirst),
                .s_data1_1              (adrgen_arlast),
                .s_data1_2              (adrgen_arlen),
                .s_data2_0              (adrgen_arfirst),
                .s_data2_1              (adrgen_arlast),
                .s_valid                (adrgen_arvalid),
                .s_ready                (adrgen_arready),
                
                .m0_data0               (cmd_araddr),
                .m0_data1               (cmd_arlen),
                .m0_data2               (cmd_arlen_max),
                .m0_valid               (cmd_arvalid),
                .m0_ready               (cmd_arready),
                
                .m1_data0               (dat_arfirst),
                .m1_data1               (dat_arlast),
                .m1_data2               (dat_arlen),
                .m1_valid               (dat_arvalid),
                .m1_ready               (dat_arready),
                
                .m2_data0               (ack_arfirst),
                .m2_data1               (ack_arlast),
                .m2_valid               (ack_arvalid),
                .m2_ready               (ack_arready)
            );
    
    
    // ---------------------------------------------
    //  1D read core
    // ---------------------------------------------
    
    wire    [S_RDATA_WIDTH-1:0]     read_rdata;
    wire                            read_rfirst;
    wire                            read_rlast;
    wire                            read_rvalid;
    wire                            read_rready;
    
    wire                            read_cvalid;
    wire                            read_cready;
    
    jelly_axi4_read
            #(
                .ARASYNC                (0),
                .RASYNC                 (RASYNC),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .BYPASS_GATE            (0),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                .HAS_RFIRST             (0),
                .HAS_RLAST              (ALLOW_UNALIGNED || HAS_RFIRST || HAS_RLAST),
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
                .S_RDATA_WIDTH          (S_RDATA_WIDTH),
                .S_ARLEN_WIDTH          (AXI4_ADDR_WIDTH),
                .S_ARLEN_OFFSET         (S_ARLEN_OFFSET),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .CONVERT_S_REGS         (CONVERT_S_REGS),
                .RFIFO_PTR_WIDTH        (RFIFO_PTR_WIDTH),
                .RFIFO_RAM_TYPE         (RFIFO_RAM_TYPE),
                .RFIFO_LOW_DEALY        (RFIFO_LOW_DEALY),
                .RFIFO_DOUT_REGS        (RFIFO_DOUT_REGS),
                .RFIFO_S_REGS           (RFIFO_S_REGS),
                .RFIFO_M_REGS           (RFIFO_M_REGS),
                .ARFIFO_PTR_WIDTH       (0),
                .ARFIFO_RAM_TYPE        (ARFIFO_RAM_TYPE),
                .ARFIFO_LOW_DEALY       (ARFIFO_LOW_DEALY),
                .ARFIFO_DOUT_REGS       (ARFIFO_DOUT_REGS),
                .ARFIFO_S_REGS          (ARFIFO_S_REGS),
                .ARFIFO_M_REGS          (ARFIFO_M_REGS),
                .SRFIFO_PTR_WIDTH       (SRFIFO_PTR_WIDTH),
                .SRFIFO_RAM_TYPE        (SRFIFO_RAM_TYPE),
                .SRFIFO_LOW_DEALY       (SRFIFO_LOW_DEALY),
                .SRFIFO_DOUT_REGS       (SRFIFO_DOUT_REGS),
                .SRFIFO_S_REGS          (SRFIFO_S_REGS),
                .SRFIFO_M_REGS          (SRFIFO_M_REGS),
                .MRFIFO_PTR_WIDTH       (MRFIFO_PTR_WIDTH),
                .MRFIFO_RAM_TYPE        (MRFIFO_RAM_TYPE),
                .MRFIFO_LOW_DEALY       (MRFIFO_LOW_DEALY),
                .MRFIFO_DOUT_REGS       (MRFIFO_DOUT_REGS),
                .MRFIFO_S_REGS          (MRFIFO_S_REGS),
                .MRFIFO_M_REGS          (MRFIFO_M_REGS)
            )
        i_axi4_read
            (
                .endian                 (endian),
                
                .s_arresetn             (m_aresetn),
                .s_arclk                (m_aclk),
                .s_araddr               (cmd_araddr),
                .s_arlen                (cmd_arlen),
                .s_arlen_max            (cmd_arlen_max),
                .s_arvalid              (cmd_arvalid),
                .s_arready              (cmd_arready),
                
                .s_rresetn              (s_rresetn),
                .s_rclk                 (s_rclk),
                .s_rdata                (read_rdata),
                .s_rfirst               (read_rfirst),
                .s_rlast                (read_rlast),
                .s_rvalid               (read_rvalid),
                .s_rready               (read_rready),
                
                .s_cresetn              (s_cresetn),
                .s_cclk                 (s_cclk),
                .s_cvalid               (read_cvalid),
                .s_cready               (read_cready),
                
                .m_aresetn              (m_aresetn),
                .m_aclk                 (m_aclk),
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
    
    
    
    // ---------------------------------------------
    //  read data
    // ---------------------------------------------
    
    // r ポートの成形＆フラグ付与 (read_rlast のみ信用できる前提で残りを作る)
    wire                            gate_flag_f;
    wire                            gate_flag_l;
    wire    [S_RDATA_WIDTH-1:0]     gate_rdata;
    wire    [N-1:0]                 gate_rfirst;
    wire    [N-1:0]                 gate_rlast;
    wire                            gate_rvalid;
    wire                            gate_rready;
    jelly_stream_gate
            #(
                .N                      (1),
                .BYPASS                 ((!ALLOW_UNALIGNED && !HAS_RFIRST) || BYPASS_GATE),
                .BYPASS_COMBINE         (HAS_RFIRST || HAS_RLAST),
                .DETECTOR_ENABLE        (ALLOW_UNALIGNED),
                
                .DATA_WIDTH             (S_RDATA_WIDTH),
                .LEN_WIDTH              (S_ARLEN_WIDTH),
                .LEN_OFFSET             (S_ARLEN_OFFSET),
                .USER_WIDTH             (N + N),
                
                .S_REGS                 (0),
                .M_REGS                 (0),
                
                .ASYNC                  (ARASYNC || RASYNC),
                .FIFO_PTR_WIDTH         (CACKFIFO_PTR_WIDTH),
                .FIFO_DOUT_REGS         (CACKFIFO_DOUT_REGS),
                .FIFO_RAM_TYPE          (CACKFIFO_RAM_TYPE),
                .FIFO_LOW_DEALY         (CACKFIFO_LOW_DEALY),
                .FIFO_S_REGS            (CACKFIFO_S_REGS),
                .FIFO_M_REGS            (CACKFIFO_M_REGS)
            )
        i_stream_gate
            (
                .reset                  (~s_rresetn),
                .clk                    (s_rclk),
                .cke                    (1'b1),
                
                .skip                   (1'b0),
                .detect_first           (1'b0),
                .detect_last            (1'b1),
                .padding_en             (1'b0),
                .padding_data           ({S_RDATA_WIDTH{1'bx}}),
                
                .s_first                (1'b0),
                .s_last                 (read_rlast),
                .s_data                 (read_rdata),
                .s_valid                (read_rvalid),
                .s_ready                (read_rready),
                
                .m_first                (gate_flag_f),
                .m_last                 (gate_flag_l),
                .m_data                 (gate_rdata),
                .m_user                 ({gate_rfirst, gate_rlast}),
                .m_valid                (gate_rvalid),
                .m_ready                (gate_rready),
                
                .s_permit_reset         (~m_aresetn),
                .s_permit_clk           (m_aclk),
                .s_permit_first         (1'b1),
                .s_permit_last          (1'b1),
                .s_permit_len           (dat_arlen),
                .s_permit_user          ({dat_arfirst, dat_arlast}),
                .s_permit_valid         (dat_arvalid),
                .s_permit_ready         (dat_arready)
            );
    
    assign s_rfirst    = (HAS_RFIRST && gate_flag_f) ? gate_rfirst : {N{1'b0}};
    assign s_rlast     = (HAS_RLAST  && gate_flag_l) ? gate_rlast  : {N{1'b0}};
    assign s_rdata     = gate_rdata;
    assign s_rvalid    = gate_rvalid;
    assign gate_rready = s_rready;
    
    
    /*
    jelly_stream_add_syncflag
            #(
                .FIRST_WIDTH            (N),
                .LAST_WIDTH             (N),
                .USER_WIDTH             (S_RDATA_WIDTH),
                .HAS_FIRST              (HAS_S_RFIRST),
                .HAS_LAST               (HAS_S_RLAST),
                .ASYNC                  (ARASYNC || RASYNC),
                .FIFO_PTR_WIDTH         (RACKFIFO_PTR_WIDTH),
                .FIFO_DOUT_REGS         (RACKFIFO_DOUT_REGS),
                .FIFO_RAM_TYPE          (RACKFIFO_RAM_TYPE),
                .FIFO_LOW_DEALY         (RACKFIFO_LOW_DEALY),
                .FIFO_S_REGS            (RACKFIFO_S_REGS),
                .FIFO_M_REGS            (RACKFIFO_M_REGS),
                
                .S_REGS                 (RACK_S_REGS),
                .M_REGS                 (RACK_M_REGS)
            )
        i_stream_add_syncflag_r
            (
                .reset                  (~s_rresetn),
                .clk                    (s_rclk),
                .cke                    (1'b1),
                
                .s_first                (read_rfirst),
                .s_last                 (read_rlast),
                .s_user                 (read_rdata),
                .s_valid                (read_rvalid),
                .s_ready                (read_rready),
                
                .m_first                (),
                .m_last                 (),
                .m_added_first          (s_rfirst),
                .m_added_last           (s_rlast),
                .m_user                 (s_rdata),
                .m_valid                (s_rvalid),
                .m_ready                (s_rready),
                
                .s_add_reset            (~s_arresetn),
                .s_add_clk              (s_arclk),
                .s_add_first            (dat_arfirst),
                .s_add_last             (dat_arlast),
                .s_add_valid            (dat_arvalid),
                .s_add_ready            (dat_arready)
            );
    */
    
    // ---------------------------------------------
    //  read ack
    // ---------------------------------------------
    
    // c ポートにフラグ付与
    jelly_stream_add_syncflag
            #(
                .FIRST_WIDTH            (N),
                .LAST_WIDTH             (N),
                .USER_WIDTH             (0),
                .HAS_FIRST              (1),
                .HAS_LAST               (1),
                .ASYNC                  (ARASYNC || RASYNC),
                .FIFO_PTR_WIDTH         (CACKFIFO_PTR_WIDTH),
                .FIFO_DOUT_REGS         (CACKFIFO_DOUT_REGS),
                .FIFO_RAM_TYPE          (CACKFIFO_RAM_TYPE),
                .FIFO_LOW_DEALY         (CACKFIFO_LOW_DEALY),
                .FIFO_S_REGS            (CACKFIFO_S_REGS),
                .FIFO_M_REGS            (CACKFIFO_M_REGS),
                .S_REGS                 (CACK_S_REGS),
                .M_REGS                 (CACK_M_REGS)
            )
        i_stream_add_syncflag_rb
            (
                .reset                  (~s_cresetn),
                .clk                    (s_cclk),
                .cke                    (1'b1),
                
                .s_first                (1'b1),
                .s_last                 (1'b1),
                .s_user                 (1'b0),
                .s_valid                (read_cvalid),
                .s_ready                (read_cready),
                
                .m_first                (),
                .m_last                 (),
                .m_added_first          (s_cfirst),
                .m_added_last           (s_clast),
                .m_user                 (),
                .m_valid                (s_cvalid),
                .m_ready                (s_cready),
                
                
                .s_add_reset            (~m_aresetn),
                .s_add_clk              (m_aclk),
                .s_add_first            (ack_arfirst),
                .s_add_last             (ack_arlast),
                .s_add_valid            (ack_arvalid),
                .s_add_ready            (ack_arready)
            );
    
    
endmodule


`default_nettype wire


// end of file
