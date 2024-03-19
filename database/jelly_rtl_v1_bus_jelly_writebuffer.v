// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// write buffer
module jelly_writebuffer
        #(
            parameter   BUFFER_NUM   = 4,
            parameter   ADDR_WIDTH   = 32,
            
            parameter   S_DATA_SIZE  = 2,
            parameter   S_DATA_WIDTH = (8 << S_DATA_SIZE),
            parameter   S_STRB_WIDTH = (1 << S_DATA_SIZE),
            parameter   M_DATA_SIZE  = 3,                   // S_DATA_SIZE以上とすること
            parameter   M_DATA_WIDTH = (8 << M_DATA_SIZE),
            parameter   M_STRB_WIDTH = (1 << M_DATA_SIZE),
            
            parameter   S_REGS       = 1,
            parameter   M_REGS       = 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        endian,
            
            // slave port
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire    [S_DATA_WIDTH-1:0]  s_data,
            input   wire    [S_STRB_WIDTH-1:0]  s_strb,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            // master port
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [M_DATA_WIDTH-1:0]  m_data,
            output  wire    [M_STRB_WIDTH-1:0]  m_strb,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    genvar                          i;
    
    
    // address mask
    localparam  [ADDR_WIDTH-1:0]    S_ADDR_MASK = ~((1 << S_DATA_SIZE) - 1);
    localparam  [ADDR_WIDTH-1:0]    M_ADDR_MASK = ~((1 << M_DATA_SIZE) - 1);
    localparam                      SEL_WIDTH   = M_DATA_SIZE - S_DATA_SIZE;
    
    
    // ----------------------------------------
    //  Insert FF
    // ----------------------------------------
    
    wire    [ADDR_WIDTH-1:0]    s_ff_addr;
    wire    [S_DATA_WIDTH-1:0]  s_ff_data;
    wire    [S_STRB_WIDTH-1:0]  s_ff_strb;
    wire                        s_ff_valid;
    wire                        s_ff_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (ADDR_WIDTH+S_DATA_WIDTH+S_STRB_WIDTH),
                .SLAVE_REGS         (S_REGS),
                .MASTER_REGS        (S_REGS)
            )
        i_pipeline_insert_ff_s
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({(s_addr & S_ADDR_MASK), s_data, s_strb}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_data             ({s_ff_addr, s_ff_data, s_ff_strb}),
                .m_valid            (s_ff_valid),
                .m_ready            (s_ff_ready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    wire    [ADDR_WIDTH-1:0]    m_ff_addr;
    wire    [M_DATA_WIDTH-1:0]  m_ff_data;
    wire    [M_STRB_WIDTH-1:0]  m_ff_strb;
    wire                        m_ff_valid;
    wire                        m_ff_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (ADDR_WIDTH+M_DATA_WIDTH+M_STRB_WIDTH),
                .SLAVE_REGS         (M_REGS),
                .MASTER_REGS        (M_REGS)
            )
        i_pipeline_insert_ff_m
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_data             ({(m_ff_addr & S_ADDR_MASK), m_ff_data, m_ff_strb}),
                .s_valid            (m_ff_valid),
                .s_ready            (m_ff_ready),
                
                .m_data             ({m_addr, m_data, m_strb}),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // ----------------------------------------
    //  Width Convert
    // ----------------------------------------
    
    wire    [ADDR_WIDTH-1:0]    s_wide_addr;
    wire    [M_DATA_WIDTH-1:0]  s_wide_data;
    wire    [M_STRB_WIDTH-1:0]  s_wide_strb;
    wire                        s_wide_valid;
    wire                        s_wide_ready;
    
    generate
    if ( S_DATA_SIZE == M_DATA_SIZE ) begin
        assign s_wide_addr  = s_ff_addr;
        assign s_wide_data  = s_ff_data;
        assign s_wide_strb  = s_ff_strb;
        assign s_wide_valid = s_ff_valid;
        assign s_ff_ready   = s_wide_ready;
    end
    else begin
        wire    [SEL_WIDTH-1:0] sel = s_ff_addr[S_DATA_SIZE +: SEL_WIDTH];
        
        assign s_wide_addr  = (s_ff_addr & M_ADDR_MASK);
        assign s_wide_data  = {(1 << SEL_WIDTH){s_ff_data}};
        assign s_wide_valid = s_ff_valid;
        assign s_ff_ready   = s_wide_ready;
        
        jelly_demultiplexer
                #(
                    .SEL_WIDTH  (SEL_WIDTH),
                    .IN_WIDTH   (S_DATA_WIDTH)
                )
            i_demultiplexer_strb
                (
                    .endian     (endian),
                    .sel        (sel),
                    .din        (s_ff_strb),
                    .dout       (s_wide_strb)
                );
    end
    endgenerate
    
    
    
    // ----------------------------------------
    //  Core
    // ----------------------------------------
    
    wire    [(BUFFER_NUM+1)*  ADDR_WIDTH-1:0]   buf_addr;
    wire    [(BUFFER_NUM+1)*M_DATA_WIDTH-1:0]   buf_data;
    wire    [(BUFFER_NUM+1)*M_STRB_WIDTH-1:0]   buf_strb;
    wire    [(BUFFER_NUM+1)*           1-1:0]   buf_valid;
    wire    [(BUFFER_NUM+1)*           1-1:0]   buf_ready;
    
    wire    [BUFFER_NUM-1:0]                    forward_ready;
    
    generate
    for ( i = 0; i < BUFFER_NUM; i = i+1 ) begin : buf_loop
        jelly_writebuffer_core
                #(
                    .ADDR_WIDTH     (ADDR_WIDTH),
                    .DATA_SIZE      (M_DATA_SIZE)
                )
            i_writebuffer_core
                (
                    .reset          (reset),
                    .clk            (clk),
                    .cke            (cke),
                    
                    .s_addr         (buf_addr [(i+0)*  ADDR_WIDTH +:   ADDR_WIDTH]),
                    .s_data         (buf_data [(i+0)*M_DATA_WIDTH +: M_DATA_WIDTH]),
                    .s_strb         (buf_strb [(i+0)*M_STRB_WIDTH +: M_STRB_WIDTH]),
                    .s_valid        (buf_valid[(i+0)*           1 +:            1]),
                    .s_ready        (buf_ready[(i+0)*           1 +:            1]),
                    
                    .m_addr         (buf_addr [(i+1)*  ADDR_WIDTH +:   ADDR_WIDTH]),
                    .m_data         (buf_data [(i+1)*M_DATA_WIDTH +: M_DATA_WIDTH]),
                    .m_strb         (buf_strb [(i+1)*M_STRB_WIDTH +: M_STRB_WIDTH]),
                    .m_valid        (buf_valid[(i+1)*           1 +:            1]),
                    .m_ready        (buf_ready[(i+1)*           1 +:            1]),
                    
                    .forward_addr   ((i == 0) ? {ADDR_WIDTH{1'bx}}   : s_wide_addr),
                    .forward_data   ((i == 0) ? {M_DATA_WIDTH{1'bx}} : s_wide_data),
                    .forward_strb   ((i == 0) ? {M_STRB_WIDTH{1'b0}} : s_wide_strb),
                    .forward_valid  ((i == 0) ?                 1'b0 : s_wide_valid),
                    .forward_ready  (forward_ready[i])
                );
    end
    endgenerate

    wire    forward_ack;
    generate
    if ( BUFFER_NUM == 1 ) begin
        assign forward_ack = 1'b0;
    end
    else begin
        assign forward_ack = |forward_ready[BUFFER_NUM-1:1];
    end
    endgenerate
    
    assign buf_addr [0 +:   ADDR_WIDTH] = s_wide_addr;
    assign buf_data [0 +: M_DATA_WIDTH] = s_wide_data;
    assign buf_strb [0 +: M_STRB_WIDTH] = s_wide_strb;
    assign buf_valid[0 +:            1] = s_wide_valid && !forward_ack;
    
    assign s_wide_ready = buf_ready[0] || forward_ack;
    
    
    assign m_ff_addr  = buf_addr [BUFFER_NUM*  ADDR_WIDTH +:   ADDR_WIDTH];
    assign m_ff_data  = buf_data [BUFFER_NUM*M_DATA_WIDTH +: M_DATA_WIDTH];
    assign m_ff_strb  = buf_strb [BUFFER_NUM*M_STRB_WIDTH +: M_STRB_WIDTH];
    assign m_ff_valid = buf_valid[BUFFER_NUM*           1 +:            1];
    
    assign buf_ready[BUFFER_NUM] = m_ff_ready;
    
endmodule


`default_nettype wire


// end of file
