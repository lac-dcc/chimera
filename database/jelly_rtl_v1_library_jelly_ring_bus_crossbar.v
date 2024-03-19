// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_ring_bus_crossbar
        #(
            parameter   S_NUM         = 8,
            parameter   S_ID_WIDTH    = 3,
            parameter   M_NUM         = 4,
            parameter   M_ID_WIDTH    = 2,
            parameter   DATA_WIDTH    = 32,
            parameter   S_REGS        = 0
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [S_NUM*M_ID_WIDTH-1:0]  s_id_to,
            input   wire    [S_NUM*DATA_WIDTH-1:0]  s_data,
            input   wire    [S_NUM-1:0]             s_valid,
            output  wire    [S_NUM-1:0]             s_ready,
            
            output  wire    [M_NUM*S_ID_WIDTH-1:0]  m_id_from,
            output  wire    [M_NUM*DATA_WIDTH-1:0]  m_data,
            output  wire    [M_NUM-1:0]             m_valid,
            input   wire    [M_NUM-1:0]             m_ready
        );
    
    genvar      i, j;
    
    
    wire    [S_NUM*M_NUM*DATA_WIDTH-1:0]    array_s_data;
    wire    [S_NUM*M_NUM-1:0]               array_s_valid;
    wire    [S_NUM*M_NUM-1:0]               array_s_ready;
    
    generate
    for ( i = 0; i < S_NUM; i = i+1 ) begin : loop_slave
        jelly_data_switch
                    #(
                        .NUM                    (M_NUM),
                        .ID_WIDTH               (M_ID_WIDTH),
                        .DATA_WIDTH             (DATA_WIDTH),
                        .S_REGS                 (S_REGS),
                        .M_REGS                 (1)
                    )
                i_data_switch
                    (
                        .reset                  (reset),
                        .clk                    (clk),
                        .cke                    (1'b1),
                        
                        .s_id                   (s_id_to[i*M_ID_WIDTH +: M_ID_WIDTH]),
                        .s_data                 (s_data [i*DATA_WIDTH +: DATA_WIDTH]),
                        .s_valid                (s_valid[i]),
                        .s_ready                (s_ready[i]),
                        
                        .m_data                 (array_s_data [i*M_NUM*DATA_WIDTH +: M_NUM*DATA_WIDTH]),
                        .m_valid                (array_s_valid[i*M_NUM            +: M_NUM]),
                        .m_ready                (array_s_ready[i*M_NUM            +: M_NUM])
                    );
    end
    
    
    for ( i = 0; i < M_NUM; i = i+1 ) begin : loop_master
        
        wire    [S_NUM*DATA_WIDTH-1:0]      array_m_data;
        wire    [S_NUM-1:0]                 array_m_valid;
        wire    [S_NUM-1:0]                 array_m_ready;
        
        for ( j = 0; j < S_NUM; j = j+1 ) begin : loop_m_ar
            assign array_m_data [j*DATA_WIDTH +: DATA_WIDTH] = array_s_data [(j*M_NUM+i)*DATA_WIDTH +: DATA_WIDTH];
            assign array_m_valid[j]                          = array_s_valid[j*M_NUM+i];
            assign array_s_ready[j*M_NUM+i]                  = array_m_ready[j];
        end
        
        jelly_ring_bus_arbiter
                #(
                    .S_NUM              (S_NUM),
                    .S_ID_WIDTH         (S_ID_WIDTH),
                    .M_NUM              (1),
                    .M_ID_WIDTH         (1),
                    .DATA_WIDTH         (DATA_WIDTH)
                )
            i_ring_bus_arbiter_ar
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .s_id_to            (1'b0),
                    .s_data             (array_m_data),
                    .s_valid            (array_m_valid),
                    .s_ready            (array_m_ready),
                    
                    .m_id_from          (m_id_from[i*S_ID_WIDTH +: S_ID_WIDTH]),
                    .m_data             (m_data   [i*DATA_WIDTH +: DATA_WIDTH]),
                    .m_valid            (m_valid  [i]),
                    .m_ready            (m_ready  [i])
                );
    end
    endgenerate
    
    
endmodule



`default_nettype wire


// end of file
