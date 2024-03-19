// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// RAW10受信
module jelly_mipi_csi2_rx_raw10
        #(
            parameter S_AXI4S_REGS = 0,
            parameter M_AXI4S_REGS = 0
        )
        (
            input   wire            aresetn,
            input   wire            aclk,
            
            input   wire    [0:0]   s_axi4s_tuser,
            input   wire            s_axi4s_tlast,
            input   wire    [7:0]   s_axi4s_tdata,
            input   wire            s_axi4s_tvalid,
            output  wire            s_axi4s_tready,
            
            output  wire    [0:0]   m_axi4s_tuser,
            output  wire            m_axi4s_tlast,
            output  wire    [9:0]   m_axi4s_tdata,
            output  wire            m_axi4s_tvalid,
            input   wire            m_axi4s_tready
        );
    
    
    wire    [0:0]       conv_tuser;
    wire                conv_tlast;
    wire    [8*5-1:0]   conv_tdata8;
    wire    [10*4-1:0]  conv_tdata10;
    wire                conv_tvalid;
    wire                conv_tready;
    
    jelly_stream_width_convert
            #(
                .UNIT_WIDTH         (8),
                .S_NUM              (1),
                .M_NUM              (5),
                .HAS_FIRST          (1),
                .HAS_LAST           (1),
                .HAS_ALIGN_S        (0),
                .HAS_ALIGN_M        (0),
                .AUTO_FIRST         (0),
                .FIRST_OVERWRITE    (1),
                .FIRST_FORCE_LAST   (0),
                .ALIGN_S_WIDTH      (1),
                .ALIGN_M_WIDTH      (1),
                .S_REGS             (1),
                .M_REGS             (1)
            )
        i_data_stream_convert_s
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (1'b1),
                
                .endian             (1'b0),
                .padding            ({8{1'bx}}),
                
                .s_align_s          (1'b0),
                .s_align_m          (1'b0),
                .s_first            (s_axi4s_tuser),
                .s_last             (s_axi4s_tlast),
                .s_data             (s_axi4s_tdata),
                .s_valid            (s_axi4s_tvalid),
                .s_ready            (s_axi4s_tready),
                
                .m_first            (conv_tuser),
                .m_last             (conv_tlast),
                .m_data             (conv_tdata8),
                .m_valid            (conv_tvalid),
                .m_ready            (conv_tready)
            );
    
    wire    [7:0]   lsb_data = conv_tdata8[4*8 +: 8];
    
    assign conv_tdata10[0*10 +: 10] = {conv_tdata8[0*8 +: 8], lsb_data[0*2 +: 2]};
    assign conv_tdata10[1*10 +: 10] = {conv_tdata8[1*8 +: 8], lsb_data[1*2 +: 2]};
    assign conv_tdata10[2*10 +: 10] = {conv_tdata8[2*8 +: 8], lsb_data[2*2 +: 2]};
    assign conv_tdata10[3*10 +: 10] = {conv_tdata8[3*8 +: 8], lsb_data[3*2 +: 2]};
    
    jelly_stream_width_convert
            #(
                .UNIT_WIDTH         (10),
                .S_NUM              (4),
                .M_NUM              (1),
                .HAS_FIRST          (1),
                .HAS_LAST           (1),
                .HAS_ALIGN_S        (0),
                .HAS_ALIGN_M        (0),
                .AUTO_FIRST         (0),
                .FIRST_OVERWRITE    (1),
                .FIRST_FORCE_LAST   (0),
                .ALIGN_S_WIDTH      (1),
                .ALIGN_M_WIDTH      (1),
                .S_REGS             (1),
                .M_REGS             (1)
            )
        i_stream_width_convert_m
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (1'b1),
                
                .endian             (1'b0),
                .padding            ({10{1'bx}}),
                
                .s_align_s          (1'b0),
                .s_align_m          (1'b0),
                .s_first            (conv_tuser),
                .s_last             (conv_tlast),
                .s_data             (conv_tdata10),
                .s_valid            (conv_tvalid),
                .s_ready            (conv_tready),
                
                .m_first            (m_axi4s_tuser),
                .m_last             (m_axi4s_tlast),
                .m_data             (m_axi4s_tdata),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready)
            );
    
endmodule


`default_nettype wire


// end of file
