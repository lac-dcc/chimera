// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_stream_arbiter_crossbar
        #(
            parameter   S_NUM                 = 8,
            parameter   S_ID_WIDTH            = 3,
            parameter   M_NUM                 = 4,
            parameter   M_ID_WIDTH            = 2,
            parameter   DATA_WIDTH            = 32,
            parameter   LEN_WIDTH             = 8,
            parameter   S_REGS                = 0,
            parameter   ALGORITHM             = "RINGBUS",
            parameter   USE_ID_FILTER         = 0,
            parameter   FILTER_FIFO_PTR_WIDTH = 6,
            parameter   FILTER_FIFO_RAM_TYPE  = "distributed"
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [S_NUM*M_ID_BITS-1:0]   s_id_to,
            input   wire    [S_NUM-1:0]             s_last,
            input   wire    [S_NUM*DATA_WIDTH-1:0]  s_data,
            input   wire    [S_NUM-1:0]             s_valid,
            output  wire    [S_NUM-1:0]             s_ready,
            
            output  wire    [M_NUM*S_ID_BITS-1:0]   m_id_from,
            output  wire    [M_NUM-1:0]             m_last,
            output  wire    [M_NUM*DATA_WIDTH-1:0]  m_data,
            output  wire    [M_NUM-1:0]             m_valid,
            input   wire    [M_NUM-1:0]             m_ready
        );
    
    genvar      i, j;
    
    localparam  S_ID_BITS = S_ID_WIDTH > 0 ? S_ID_WIDTH : 1;
    localparam  M_ID_BITS = M_ID_WIDTH > 0 ? M_ID_WIDTH : 1;
    
    
    wire    [S_NUM*M_NUM-1:0]               array_s_last;
    wire    [S_NUM*M_NUM*DATA_WIDTH-1:0]    array_s_data;
    wire    [S_NUM*M_NUM-1:0]               array_s_valid;
    wire    [S_NUM*M_NUM-1:0]               array_s_ready;
    
    generate
    for ( i = 0; i < S_NUM; i = i+1 ) begin : loop_slave
        jelly_stream_switch
                    #(
                        .NUM            (M_NUM),
                        .ID_WIDTH       (M_ID_WIDTH),
                        .DATA_WIDTH     (DATA_WIDTH),
                        .S_REGS         (S_REGS),
                        .M_REGS         (1)
                    )
                i_stream_switch
                    (
                        .reset          (reset),
                        .clk            (clk),
                        .cke            (1'b1),
                        
                        .s_id           (s_id_to[i*M_ID_BITS  +: M_ID_BITS]),
                        .s_last         (s_last [i]),
                        .s_data         (s_data [i*DATA_WIDTH +: DATA_WIDTH]),
                        .s_valid        (s_valid[i]),
                        .s_ready        (s_ready[i]),
                        
                        .m_last         (array_s_last [i*M_NUM            +: M_NUM]),
                        .m_data         (array_s_data [i*M_NUM*DATA_WIDTH +: M_NUM*DATA_WIDTH]),
                        .m_valid        (array_s_valid[i*M_NUM            +: M_NUM]),
                        .m_ready        (array_s_ready[i*M_NUM            +: M_NUM])
                    );
    end
    
    
    for ( i = 0; i < M_NUM; i = i+1 ) begin : loop_master
        
        wire    [S_NUM-1:0]                 array_m_last;
        wire    [S_NUM*DATA_WIDTH-1:0]      array_m_data;
        wire    [S_NUM-1:0]                 array_m_valid;
        wire    [S_NUM-1:0]                 array_m_ready;
        
        for ( j = 0; j < S_NUM; j = j+1 ) begin : loop_m_s
            assign array_m_last [j]                          = array_s_last [j*M_NUM+i];
            assign array_m_data [j*DATA_WIDTH +: DATA_WIDTH] = array_s_data [(j*M_NUM+i)*DATA_WIDTH +: DATA_WIDTH];
            assign array_m_valid[j]                          = array_s_valid[j*M_NUM+i];
            assign array_s_ready[j*M_NUM+i]                  = array_m_ready[j];
        end
        
        jelly_stream_joint
                #(
                    .NUM                (S_NUM),
                    .ID_WIDTH           (S_ID_WIDTH),
                    .LEN_WIDTH          (LEN_WIDTH),
                    .DATA_WIDTH         (DATA_WIDTH),
                    .ALGORITHM          (ALGORITHM)
                )
            i_stream_joint
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .s_last             (array_m_last),
                    .s_data             (array_m_data),
                    .s_valid            (array_m_valid),
                    .s_ready            (array_m_ready),
                    
                    .m_id               (m_id_from[i*S_ID_BITS  +: S_ID_BITS]),
                    .m_last             (m_last   [i]),
                    .m_data             (m_data   [i*DATA_WIDTH +: DATA_WIDTH]),
                    .m_valid            (m_valid  [i]),
                    .m_ready            (m_ready  [i])
                );
    end
    endgenerate
    
    
endmodule



`default_nettype wire


// end of file
