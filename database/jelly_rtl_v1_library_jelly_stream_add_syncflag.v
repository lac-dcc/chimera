// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ストリームの first や last などの同期コードに追加情報を付与する
module jelly_stream_add_syncflag
        #(
            parameter FIRST_WIDTH      = 0,
            parameter LAST_WIDTH       = 1,
            parameter USER_WIDTH       = 0,
            
            parameter HAS_FIRST        = 1,
            parameter HAS_LAST         = 1,
            
            parameter S_REGS           = 0,
            parameter M_REGS           = 0,
            
            parameter ASYNC            = 0,
            parameter FIFO_PTR_WIDTH   = 4,
            parameter FIFO_DOUT_REGS   = 0,
            parameter FIFO_RAM_TYPE    = "distributed",
            parameter FIFO_LOW_DEALY   = 1,
            parameter FIFO_S_REGS      = 0,
            parameter FIFO_M_REGS      = 0,
            
            
            // loacal
            parameter FIRST_BITS       = FIRST_WIDTH > 0 ? FIRST_WIDTH : 1,
            parameter LAST_BITS        = LAST_WIDTH  > 0 ? LAST_WIDTH  : 1,
            parameter USER_BITS        = USER_WIDTH  > 0 ? USER_WIDTH  : 1,
            parameter DEFAULT_FIRST    = {FIRST_BITS{1'b0}},
            parameter DEFAULT_LAST     = {LAST_BITS{1'b0}}
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        s_first,
            input   wire                        s_last,
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire                        m_first,
            output  wire                        m_last,
            output  wire    [FIRST_BITS-1:0]    m_added_first,
            output  wire    [LAST_BITS-1:0]     m_added_last,
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire                        m_valid,
            input   wire                        m_ready,
            
            input   wire                        s_add_reset,
            input   wire                        s_add_clk,
            input   wire    [FIRST_BITS-1:0]    s_add_first,
            input   wire    [LAST_BITS-1:0]     s_add_last,
            input   wire                        s_add_valid,
            output  wire                        s_add_ready
        );
    
    
    // insert FF
    wire                        ff_s_first;
    wire                        ff_s_last;
    wire    [USER_BITS-1:0]     ff_s_user;
    wire                        ff_s_valid;
    wire                        ff_s_ready;
    jelly_data_ff_pack
            #(
                .DATA0_WIDTH    (HAS_FIRST ? 1 : 0),
                .DATA1_WIDTH    (HAS_LAST  ? 1 : 0),
                .DATA2_WIDTH    (USER_WIDTH),
                
                .S_REGS         (S_REGS),
                .M_REGS         (0)
            )
        jelly_data_ff_pack_s
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_first),
                .s_data1        (s_last),
                .s_data2        (s_user),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data0        (ff_s_first),
                .m_data1        (ff_s_last),
                .m_data2        (ff_s_user),
                .m_valid        (ff_s_valid),
                .m_ready        (ff_s_ready)
            );
    
    
    // insert FF
    wire                        ff_m_first;
    wire                        ff_m_last;
    wire    [FIRST_BITS-1:0]    ff_m_added_first;
    wire    [LAST_BITS-1:0]     ff_m_added_last;
    wire    [USER_BITS-1:0]     ff_m_user;
    wire                        ff_m_valid;
    wire                        ff_m_ready;
    jelly_data_ff_pack
            #(
                .DATA0_WIDTH    (HAS_FIRST ? 1 : 0),
                .DATA1_WIDTH    (HAS_LAST  ? 1 : 0),
                .DATA2_WIDTH    (FIRST_WIDTH),
                .DATA3_WIDTH    (LAST_WIDTH),
                .DATA4_WIDTH    (USER_WIDTH),
                .S_REGS         (0),
                .M_REGS         (M_REGS)
            )
        jelly_data_ff_pack_m
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (ff_m_first),
                .s_data1        (ff_m_last),
                .s_data2        (ff_m_added_first),
                .s_data3        (ff_m_added_last),
                .s_data4        (ff_m_user),
                .s_valid        (ff_m_valid),
                .s_ready        (ff_m_ready),
                
                .m_data0        (m_first),
                .m_data1        (m_last),
                .m_data2        (m_added_first),
                .m_data3        (m_added_last),
                .m_data4        (m_user),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
    // FIFO
    wire    [FIRST_BITS-1:0]    fifo_first;
    wire    [LAST_BITS-1:0]     fifo_last;
    wire                        fifo_valid;
    wire                        fifo_ready;
    
    jelly_fifo_pack
            #(
                .ASYNC          (ASYNC),
                .DATA0_WIDTH    (FIRST_WIDTH),
                .DATA1_WIDTH    (LAST_WIDTH),
                .PTR_WIDTH      (FIFO_PTR_WIDTH),
                .DOUT_REGS      (FIFO_DOUT_REGS),
                .RAM_TYPE       (FIFO_RAM_TYPE ),
                .LOW_DEALY      (FIFO_LOW_DEALY),
                .S_REGS         (FIFO_S_REGS),
                .M_REGS         (FIFO_M_REGS)
            )
        i_fifo_pack
            (
                .s_reset        (s_add_reset),
                .s_clk          (s_add_clk),
                .s_data0        (s_add_first),
                .s_data1        (s_add_last),
                .s_valid        (s_add_valid),
                .s_ready        (s_add_ready),
                
                .m_reset        (reset),
                .m_clk          (clk),
                .m_data0        (fifo_first),
                .m_data1        (fifo_last),
                .m_valid        (fifo_valid),
                .m_ready        (fifo_ready & cke)
            );
    
    
    // connection
    assign fifo_ready       = (ff_m_ready & ff_s_valid & ff_s_last);
    
    assign ff_m_first       = HAS_FIRST  ? ff_s_first : 1'b0;
    assign ff_m_last        = HAS_LAST   ? ff_s_last  : 1'b0;
    assign ff_m_added_first = ff_m_first ? fifo_first : DEFAULT_FIRST;
    assign ff_m_added_last  = ff_m_last  ? fifo_last  : DEFAULT_LAST;
    assign ff_m_user        = ff_s_user;
    assign ff_m_valid       = ff_s_valid && fifo_valid;
    
    assign ff_s_ready       = ff_m_ready && fifo_valid;
    
    
endmodule


`default_nettype wire


// end of file
