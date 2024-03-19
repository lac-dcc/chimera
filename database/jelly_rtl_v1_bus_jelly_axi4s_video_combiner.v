// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4s_video_combiner
        #(
            parameter   NUM         = 2,
            parameter   TUSER_WIDTH = 1,
            parameter   TDATA_WIDTH = 32,
            parameter   S_REGS      = 1,
            parameter   M_REGS      = 1
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            input   wire    [NUM*TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire    [NUM-1:0]               s_axi4s_tlast,
            input   wire    [NUM*TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire    [NUM-1:0]               s_axi4s_tvalid,
            output  wire    [NUM-1:0]               s_axi4s_tready,
            
            output  wire    [NUM*TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire    [NUM-1:0]               m_axi4s_tlast,
            output  wire    [NUM*TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready
        );
    
    localparam DATA_WIDTH = (TUSER_WIDTH-1) + 1 + TDATA_WIDTH;
    
    genvar  i;
    
    // パケット化
    wire    [NUM-1:0]               s_frame_start;
    wire    [NUM*DATA_WIDTH-1:0]    s_data;
    
    wire                            m_frame_start;
    wire    [NUM*DATA_WIDTH-1:0]    m_data;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_packet
        assign s_frame_start[i]                   = s_axi4s_tuser[i*TUSER_WIDTH];
        assign s_data[i*DATA_WIDTH +: DATA_WIDTH] = {(s_axi4s_tuser >> 1), s_axi4s_tlast[i], s_axi4s_tdata[i*TDATA_WIDTH +: TDATA_WIDTH]};
        
        assign m_axi4s_tuser[i*TUSER_WIDTH +: TUSER_WIDTH] = {(m_data[i*DATA_WIDTH +: DATA_WIDTH] >> (1+TDATA_WIDTH)), m_frame_start};
        assign m_axi4s_tlast[i]                            = (m_data[i*DATA_WIDTH +: DATA_WIDTH] >> TDATA_WIDTH);
        assign m_axi4s_tdata[i*TDATA_WIDTH +: TDATA_WIDTH] = m_data[i*DATA_WIDTH +: DATA_WIDTH];
    end
    endgenerate
    
    
    jelly_data_frame_combiner
            #(
                .NUM            (NUM),
                .DATA_WIDTH     (DATA_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (M_REGS)
            )
        i_data_frame_combiner
            (
                .reset          (~aresetn),
                .clk            (aclk),
                .cke            (aclken),
                
                .s_frame_start  (s_frame_start),
                .s_data         (s_data),
                .s_valid        (s_axi4s_tvalid),
                .s_ready        (s_axi4s_tready),
                
                .m_frame_start  (m_frame_start),
                .m_data         (m_data),
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready)
            );
    
endmodule


`default_nettype wire


// end of file
