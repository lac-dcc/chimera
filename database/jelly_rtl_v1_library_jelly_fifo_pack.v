// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// generic FIFO (First-Word Fall-Through mode)
module jelly_fifo_pack
        #(
            parameter   ASYNC       = 0,
            parameter   DATA0_WIDTH = 0,
            parameter   DATA1_WIDTH = 0,
            parameter   DATA2_WIDTH = 0,
            parameter   DATA3_WIDTH = 0,
            parameter   DATA4_WIDTH = 0,
            parameter   DATA5_WIDTH = 0,
            parameter   DATA6_WIDTH = 0,
            parameter   DATA7_WIDTH = 0,
            parameter   DATA8_WIDTH = 0,
            parameter   DATA9_WIDTH = 0,
            parameter   PTR_WIDTH   = 4,
            parameter   DOUT_REGS   = 0,
            parameter   RAM_TYPE    = "distributed",
            parameter   LOW_DEALY   = 0,
            parameter   S_REGS      = 0,
            parameter   M_REGS      = 0,
            
            // local
            parameter   DATA0_BITS  = DATA0_WIDTH > 0 ? DATA0_WIDTH : 1,
            parameter   DATA1_BITS  = DATA1_WIDTH > 0 ? DATA1_WIDTH : 1,
            parameter   DATA2_BITS  = DATA2_WIDTH > 0 ? DATA2_WIDTH : 1,
            parameter   DATA3_BITS  = DATA3_WIDTH > 0 ? DATA3_WIDTH : 1,
            parameter   DATA4_BITS  = DATA4_WIDTH > 0 ? DATA4_WIDTH : 1,
            parameter   DATA5_BITS  = DATA5_WIDTH > 0 ? DATA5_WIDTH : 1,
            parameter   DATA6_BITS  = DATA6_WIDTH > 0 ? DATA6_WIDTH : 1,
            parameter   DATA7_BITS  = DATA7_WIDTH > 0 ? DATA7_WIDTH : 1,
            parameter   DATA8_BITS  = DATA8_WIDTH > 0 ? DATA8_WIDTH : 1,
            parameter   DATA9_BITS  = DATA9_WIDTH > 0 ? DATA9_WIDTH : 1
        )
        (
            // slave port
            input   wire                        s_reset,
            input   wire                        s_clk,
            input   wire    [DATA0_BITS-1:0]    s_data0,
            input   wire    [DATA1_BITS-1:0]    s_data1,
            input   wire    [DATA2_BITS-1:0]    s_data2,
            input   wire    [DATA3_BITS-1:0]    s_data3,
            input   wire    [DATA4_BITS-1:0]    s_data4,
            input   wire    [DATA5_BITS-1:0]    s_data5,
            input   wire    [DATA6_BITS-1:0]    s_data6,
            input   wire    [DATA7_BITS-1:0]    s_data7,
            input   wire    [DATA8_BITS-1:0]    s_data8,
            input   wire    [DATA9_BITS-1:0]    s_data9,
            input   wire                        s_valid,
            output  wire                        s_ready,
            output  wire    [PTR_WIDTH:0]       s_free_count,
            
            // master port
            input   wire                        m_reset,
            input   wire                        m_clk,
            output  wire    [DATA0_BITS-1:0]    m_data0,
            output  wire    [DATA1_BITS-1:0]    m_data1,
            output  wire    [DATA2_BITS-1:0]    m_data2,
            output  wire    [DATA3_BITS-1:0]    m_data3,
            output  wire    [DATA4_BITS-1:0]    m_data4,
            output  wire    [DATA5_BITS-1:0]    m_data5,
            output  wire    [DATA6_BITS-1:0]    m_data6,
            output  wire    [DATA7_BITS-1:0]    m_data7,
            output  wire    [DATA8_BITS-1:0]    m_data8,
            output  wire    [DATA9_BITS-1:0]    m_data9,
            output  wire                        m_valid,
            input   wire                        m_ready,
            output  wire    [PTR_WIDTH:0]       m_data_count
        );
    
    localparam PACK_WIDTH = DATA0_WIDTH
                          + DATA1_WIDTH
                          + DATA2_WIDTH
                          + DATA3_WIDTH
                          + DATA4_WIDTH
                          + DATA5_WIDTH
                          + DATA6_WIDTH
                          + DATA7_WIDTH
                          + DATA8_WIDTH
                          + DATA9_WIDTH;
    
    localparam PACK_BITS  = PACK_WIDTH > 0 ? PACK_WIDTH : 1;
    
    
    wire    [PACK_BITS-1:0]     s_pack;
    wire    [PACK_BITS-1:0]     m_pack;
    
    jelly_func_pack
            #(
                .N              (1),
                .W0             (DATA0_WIDTH),
                .W1             (DATA1_WIDTH),
                .W2             (DATA2_WIDTH),
                .W3             (DATA3_WIDTH),
                .W4             (DATA4_WIDTH),
                .W5             (DATA5_WIDTH),
                .W6             (DATA6_WIDTH),
                .W7             (DATA7_WIDTH),
                .W8             (DATA8_WIDTH),
                .W9             (DATA9_WIDTH)
            )
        i_func_pack
            (
                .in0            (s_data0),
                .in1            (s_data1),
                .in2            (s_data2),
                .in3            (s_data3),
                .in4            (s_data4),
                .in5            (s_data5),
                .in6            (s_data6),
                .in7            (s_data7),
                .in8            (s_data8),
                .in9            (s_data9),
                
                .out            (s_pack)
            );
    
    jelly_func_unpack
            #(
                .N              (1),
                .W0             (DATA0_WIDTH),
                .W1             (DATA1_WIDTH),
                .W2             (DATA2_WIDTH),
                .W3             (DATA3_WIDTH),
                .W4             (DATA4_WIDTH),
                .W5             (DATA5_WIDTH),
                .W6             (DATA6_WIDTH),
                .W7             (DATA7_WIDTH),
                .W8             (DATA8_WIDTH),
                .W9             (DATA9_WIDTH)
            )
        i_func_unpack
            (
                .in             (m_pack),
                
                .out0           (m_data0),
                .out1           (m_data1),
                .out2           (m_data2),
                .out3           (m_data3),
                .out4           (m_data4),
                .out5           (m_data5),
                .out6           (m_data6),
                .out7           (m_data7),
                .out8           (m_data8),
                .out9           (m_data9)
            );
    
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (PACK_WIDTH),
                .PTR_WIDTH      (PTR_WIDTH),
                .DOUT_REGS      (DOUT_REGS),
                .RAM_TYPE       (RAM_TYPE),
                .LOW_DEALY      (LOW_DEALY),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (M_REGS)
            )
        i_fifo_generic_fwtf
            (
                .s_reset        (s_reset),
                .s_clk          (s_clk),
                .s_data         (s_pack),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                .s_free_count   (s_free_count),
                
                .m_reset        (m_reset),
                .m_clk          (m_clk),
                .m_data         (m_pack),
                .m_valid        (m_valid),
                .m_ready        (m_ready),
                .m_data_count   (m_data_count)
            );
    
endmodule


`default_nettype wire


// end of file
