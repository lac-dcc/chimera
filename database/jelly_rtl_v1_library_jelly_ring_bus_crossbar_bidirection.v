// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_ring_bus_crossbar_bidirection
        #(
            parameter   S_NUM           = 8,
            parameter   S_ID_WIDTH      = 3,
            parameter   M_NUM           = 4,
            parameter   M_ID_WIDTH      = 2,
            parameter   DOWN_DATA_WIDTH = 32,
            parameter   UP_DATA_WIDTH   = 16
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            // slave ports
            input   wire    [S_NUM*M_ID_WIDTH-1:0]      s_down_id_to,
            input   wire    [S_NUM*DOWN_DATA_WIDTH-1:0] s_down_data,
            input   wire    [S_NUM-1:0]                 s_down_valid,
            output  wire    [S_NUM-1:0]                 s_down_ready,
            
            output  wire    [S_NUM*M_ID_WIDTH-1:0]      s_up_id_from,
            output  wire    [S_NUM*UP_DATA_WIDTH-1:0]   s_up_data,
            output  wire    [S_NUM-1:0]                 s_up_valid,
            input   wire    [S_NUM-1:0]                 s_up_ready,
            
            
            // master ports
            output  wire    [M_NUM*S_ID_WIDTH-1:0]      m_down_id_from,
            output  wire    [M_NUM*DOWN_DATA_WIDTH-1:0] m_down_data,
            output  wire    [M_NUM-1:0]                 m_down_valid,
            input   wire    [M_NUM-1:0]                 m_down_ready,
            
            input   wire    [M_NUM*S_ID_WIDTH-1:0]      m_up_id_to,
            input   wire    [M_NUM*UP_DATA_WIDTH-1:0]   m_up_data,
            input   wire    [M_NUM-1:0]                 m_up_valid,
            output  wire    [M_NUM-1:0]                 m_up_ready
        );
    
    // down stream
    jelly_ring_bus_crossbar
            #(
                .S_NUM              (S_NUM),
                .S_ID_WIDTH         (S_ID_WIDTH),
                .M_NUM              (M_NUM),
                .M_ID_WIDTH         (M_ID_WIDTH),
                .DATA_WIDTH         (DOWN_DATA_WIDTH)
            )
        i_ring_bus_crossbar_down
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_id_to            (s_down_id_to),
                .s_data             (s_down_data),
                .s_valid            (s_down_valid),
                .s_ready            (s_down_ready),
                
                .m_id_from          (m_down_id_from),
                .m_data             (m_down_data),
                .m_valid            (m_down_valid),
                .m_ready            (m_down_ready)
            );
    
    // up stream
    jelly_ring_bus_crossbar
            #(
                .S_NUM              (M_NUM),
                .S_ID_WIDTH         (M_ID_WIDTH),
                .M_NUM              (S_NUM),
                .M_ID_WIDTH         (S_ID_WIDTH),
                .DATA_WIDTH         (UP_DATA_WIDTH)
            )
        i_ring_bus_crossbar_up
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_id_to            (m_up_id_to),
                .s_data             (m_up_data),
                .s_valid            (m_up_valid),
                .s_ready            (m_up_ready),
                
                .m_id_from          (s_up_id_from),
                .m_data             (s_up_data),
                .m_valid            (s_up_valid),
                .m_ready            (s_up_ready)
            );
    
    
endmodule



`default_nettype wire


// end of file
