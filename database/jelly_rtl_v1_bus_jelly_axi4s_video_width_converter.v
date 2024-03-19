// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4s_video_width_converter
        #(
            parameter   UNIT_WIDTH    = 8,
            parameter   S_TDATA_SIZE  = 0,   // log2 (0:1byte, 1:2byte, 2:4byte, 3:81byte...)
            parameter   M_TDATA_SIZE  = 0,   // log2 (0:1byte, 1:2byte, 2:4byte, 3:81byte...)
                                                
            parameter   S_TDATA_WIDTH = (UNIT_WIDTH << S_TDATA_SIZE),
            parameter   M_TDATA_WIDTH = (UNIT_WIDTH << M_TDATA_SIZE)
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        endian,
            
            input   wire    [0:0]               s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [S_TDATA_WIDTH-1:0] s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [0:0]               m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [M_TDATA_WIDTH-1:0] m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    jelly_data_width_converter
            #(
                .UNIT_WIDTH     (UNIT_WIDTH),
                .S_DATA_SIZE    (S_TDATA_SIZE),
                .M_DATA_SIZE    (M_TDATA_SIZE),
                .INIT_DATA      ({M_TDATA_WIDTH{1'bx}})
            )
        i_data_width_converter_tdata
            (
                .reset          (~aresetn),
                .clk            (aclk),
                .cke            (aclken),
                
                .endian         (endian),
                
                .s_data         (s_axi4s_tdata),
                .s_first        (s_axi4s_tuser),
                .s_last         (s_axi4s_tlast),
                .s_valid        (s_axi4s_tvalid),
                .s_ready        (s_axi4s_tready),
                
                .m_data         (m_axi4s_tdata),
                .m_first        (m_axi4s_tuser),
                .m_last         (m_axi4s_tlast),
                .m_valid        (m_axi4s_tvalid),
                .m_ready        (m_axi4s_tready)
            );
    
    
endmodule


`default_nettype wire


// end of file
