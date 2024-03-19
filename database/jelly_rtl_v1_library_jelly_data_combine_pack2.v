// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_data_combine_pack2
        #(
            parameter NUM           = 1,
            parameter DATA0_0_WIDTH = 0,
            parameter DATA0_1_WIDTH = 0,
            parameter DATA0_2_WIDTH = 0,
            parameter DATA0_3_WIDTH = 0,
            parameter DATA0_4_WIDTH = 0,
            parameter DATA0_5_WIDTH = 0,
            parameter DATA0_6_WIDTH = 0,
            parameter DATA0_7_WIDTH = 0,
            parameter DATA0_8_WIDTH = 0,
            parameter DATA0_9_WIDTH = 0,
            parameter DATA1_0_WIDTH = 0,
            parameter DATA1_1_WIDTH = 0,
            parameter DATA1_2_WIDTH = 0,
            parameter DATA1_3_WIDTH = 0,
            parameter DATA1_4_WIDTH = 0,
            parameter DATA1_5_WIDTH = 0,
            parameter DATA1_6_WIDTH = 0,
            parameter DATA1_7_WIDTH = 0,
            parameter DATA1_8_WIDTH = 0,
            parameter DATA1_9_WIDTH = 0,
            parameter DATA2_0_WIDTH = 0,
            parameter DATA2_1_WIDTH = 0,
            parameter DATA2_2_WIDTH = 0,
            parameter DATA2_3_WIDTH = 0,
            parameter DATA2_4_WIDTH = 0,
            parameter DATA2_5_WIDTH = 0,
            parameter DATA2_6_WIDTH = 0,
            parameter DATA2_7_WIDTH = 0,
            parameter DATA2_8_WIDTH = 0,
            parameter DATA2_9_WIDTH = 0,
            parameter DATA3_0_WIDTH = 0,
            parameter DATA3_1_WIDTH = 0,
            parameter DATA3_2_WIDTH = 0,
            parameter DATA3_3_WIDTH = 0,
            parameter DATA3_4_WIDTH = 0,
            parameter DATA3_5_WIDTH = 0,
            parameter DATA3_6_WIDTH = 0,
            parameter DATA3_7_WIDTH = 0,
            parameter DATA3_8_WIDTH = 0,
            parameter DATA3_9_WIDTH = 0,
            parameter DATA4_0_WIDTH = 0,
            parameter DATA4_1_WIDTH = 0,
            parameter DATA4_2_WIDTH = 0,
            parameter DATA4_3_WIDTH = 0,
            parameter DATA4_4_WIDTH = 0,
            parameter DATA4_5_WIDTH = 0,
            parameter DATA4_6_WIDTH = 0,
            parameter DATA4_7_WIDTH = 0,
            parameter DATA4_8_WIDTH = 0,
            parameter DATA4_9_WIDTH = 0,
            parameter DATA5_0_WIDTH = 0,
            parameter DATA5_1_WIDTH = 0,
            parameter DATA5_2_WIDTH = 0,
            parameter DATA5_3_WIDTH = 0,
            parameter DATA5_4_WIDTH = 0,
            parameter DATA5_5_WIDTH = 0,
            parameter DATA5_6_WIDTH = 0,
            parameter DATA5_7_WIDTH = 0,
            parameter DATA5_8_WIDTH = 0,
            parameter DATA5_9_WIDTH = 0,
            parameter DATA6_0_WIDTH = 0,
            parameter DATA6_1_WIDTH = 0,
            parameter DATA6_2_WIDTH = 0,
            parameter DATA6_3_WIDTH = 0,
            parameter DATA6_4_WIDTH = 0,
            parameter DATA6_5_WIDTH = 0,
            parameter DATA6_6_WIDTH = 0,
            parameter DATA6_7_WIDTH = 0,
            parameter DATA6_8_WIDTH = 0,
            parameter DATA6_9_WIDTH = 0,
            parameter DATA7_0_WIDTH = 0,
            parameter DATA7_1_WIDTH = 0,
            parameter DATA7_2_WIDTH = 0,
            parameter DATA7_3_WIDTH = 0,
            parameter DATA7_4_WIDTH = 0,
            parameter DATA7_5_WIDTH = 0,
            parameter DATA7_6_WIDTH = 0,
            parameter DATA7_7_WIDTH = 0,
            parameter DATA7_8_WIDTH = 0,
            parameter DATA7_9_WIDTH = 0,
            parameter DATA8_0_WIDTH = 0,
            parameter DATA8_1_WIDTH = 0,
            parameter DATA8_2_WIDTH = 0,
            parameter DATA8_3_WIDTH = 0,
            parameter DATA8_4_WIDTH = 0,
            parameter DATA8_5_WIDTH = 0,
            parameter DATA8_6_WIDTH = 0,
            parameter DATA8_7_WIDTH = 0,
            parameter DATA8_8_WIDTH = 0,
            parameter DATA8_9_WIDTH = 0,
            parameter DATA9_0_WIDTH = 0,
            parameter DATA9_1_WIDTH = 0,
            parameter DATA9_2_WIDTH = 0,
            parameter DATA9_3_WIDTH = 0,
            parameter DATA9_4_WIDTH = 0,
            parameter DATA9_5_WIDTH = 0,
            parameter DATA9_6_WIDTH = 0,
            parameter DATA9_7_WIDTH = 0,
            parameter DATA9_8_WIDTH = 0,
            parameter DATA9_9_WIDTH = 0,
            parameter S_REGS        = 1,
            parameter M_REGS        = 1,
            
            // local
            parameter DATA0_0_BITS  = DATA0_0_WIDTH > 0 ? DATA0_0_WIDTH : 1,
            parameter DATA0_1_BITS  = DATA0_1_WIDTH > 0 ? DATA0_1_WIDTH : 1,
            parameter DATA0_2_BITS  = DATA0_2_WIDTH > 0 ? DATA0_2_WIDTH : 1,
            parameter DATA0_3_BITS  = DATA0_3_WIDTH > 0 ? DATA0_3_WIDTH : 1,
            parameter DATA0_4_BITS  = DATA0_4_WIDTH > 0 ? DATA0_4_WIDTH : 1,
            parameter DATA0_5_BITS  = DATA0_5_WIDTH > 0 ? DATA0_5_WIDTH : 1,
            parameter DATA0_6_BITS  = DATA0_6_WIDTH > 0 ? DATA0_6_WIDTH : 1,
            parameter DATA0_7_BITS  = DATA0_7_WIDTH > 0 ? DATA0_7_WIDTH : 1,
            parameter DATA0_8_BITS  = DATA0_8_WIDTH > 0 ? DATA0_8_WIDTH : 1,
            parameter DATA0_9_BITS  = DATA0_9_WIDTH > 0 ? DATA0_9_WIDTH : 1,
            parameter DATA1_0_BITS  = DATA1_0_WIDTH > 0 ? DATA1_0_WIDTH : 1,
            parameter DATA1_1_BITS  = DATA1_1_WIDTH > 0 ? DATA1_1_WIDTH : 1,
            parameter DATA1_2_BITS  = DATA1_2_WIDTH > 0 ? DATA1_2_WIDTH : 1,
            parameter DATA1_3_BITS  = DATA1_3_WIDTH > 0 ? DATA1_3_WIDTH : 1,
            parameter DATA1_4_BITS  = DATA1_4_WIDTH > 0 ? DATA1_4_WIDTH : 1,
            parameter DATA1_5_BITS  = DATA1_5_WIDTH > 0 ? DATA1_5_WIDTH : 1,
            parameter DATA1_6_BITS  = DATA1_6_WIDTH > 0 ? DATA1_6_WIDTH : 1,
            parameter DATA1_7_BITS  = DATA1_7_WIDTH > 0 ? DATA1_7_WIDTH : 1,
            parameter DATA1_8_BITS  = DATA1_8_WIDTH > 0 ? DATA1_8_WIDTH : 1,
            parameter DATA1_9_BITS  = DATA1_9_WIDTH > 0 ? DATA1_9_WIDTH : 1,
            parameter DATA2_0_BITS  = DATA2_0_WIDTH > 0 ? DATA2_0_WIDTH : 1,
            parameter DATA2_1_BITS  = DATA2_1_WIDTH > 0 ? DATA2_1_WIDTH : 1,
            parameter DATA2_2_BITS  = DATA2_2_WIDTH > 0 ? DATA2_2_WIDTH : 1,
            parameter DATA2_3_BITS  = DATA2_3_WIDTH > 0 ? DATA2_3_WIDTH : 1,
            parameter DATA2_4_BITS  = DATA2_4_WIDTH > 0 ? DATA2_4_WIDTH : 1,
            parameter DATA2_5_BITS  = DATA2_5_WIDTH > 0 ? DATA2_5_WIDTH : 1,
            parameter DATA2_6_BITS  = DATA2_6_WIDTH > 0 ? DATA2_6_WIDTH : 1,
            parameter DATA2_7_BITS  = DATA2_7_WIDTH > 0 ? DATA2_7_WIDTH : 1,
            parameter DATA2_8_BITS  = DATA2_8_WIDTH > 0 ? DATA2_8_WIDTH : 1,
            parameter DATA2_9_BITS  = DATA2_9_WIDTH > 0 ? DATA2_9_WIDTH : 1,
            parameter DATA3_0_BITS  = DATA3_0_WIDTH > 0 ? DATA3_0_WIDTH : 1,
            parameter DATA3_1_BITS  = DATA3_1_WIDTH > 0 ? DATA3_1_WIDTH : 1,
            parameter DATA3_2_BITS  = DATA3_2_WIDTH > 0 ? DATA3_2_WIDTH : 1,
            parameter DATA3_3_BITS  = DATA3_3_WIDTH > 0 ? DATA3_3_WIDTH : 1,
            parameter DATA3_4_BITS  = DATA3_4_WIDTH > 0 ? DATA3_4_WIDTH : 1,
            parameter DATA3_5_BITS  = DATA3_5_WIDTH > 0 ? DATA3_5_WIDTH : 1,
            parameter DATA3_6_BITS  = DATA3_6_WIDTH > 0 ? DATA3_6_WIDTH : 1,
            parameter DATA3_7_BITS  = DATA3_7_WIDTH > 0 ? DATA3_7_WIDTH : 1,
            parameter DATA3_8_BITS  = DATA3_8_WIDTH > 0 ? DATA3_8_WIDTH : 1,
            parameter DATA3_9_BITS  = DATA3_9_WIDTH > 0 ? DATA3_9_WIDTH : 1,
            parameter DATA4_0_BITS  = DATA4_0_WIDTH > 0 ? DATA4_0_WIDTH : 1,
            parameter DATA4_1_BITS  = DATA4_1_WIDTH > 0 ? DATA4_1_WIDTH : 1,
            parameter DATA4_2_BITS  = DATA4_2_WIDTH > 0 ? DATA4_2_WIDTH : 1,
            parameter DATA4_3_BITS  = DATA4_3_WIDTH > 0 ? DATA4_3_WIDTH : 1,
            parameter DATA4_4_BITS  = DATA4_4_WIDTH > 0 ? DATA4_4_WIDTH : 1,
            parameter DATA4_5_BITS  = DATA4_5_WIDTH > 0 ? DATA4_5_WIDTH : 1,
            parameter DATA4_6_BITS  = DATA4_6_WIDTH > 0 ? DATA4_6_WIDTH : 1,
            parameter DATA4_7_BITS  = DATA4_7_WIDTH > 0 ? DATA4_7_WIDTH : 1,
            parameter DATA4_8_BITS  = DATA4_8_WIDTH > 0 ? DATA4_8_WIDTH : 1,
            parameter DATA4_9_BITS  = DATA4_9_WIDTH > 0 ? DATA4_9_WIDTH : 1,
            parameter DATA5_0_BITS  = DATA5_0_WIDTH > 0 ? DATA5_0_WIDTH : 1,
            parameter DATA5_1_BITS  = DATA5_1_WIDTH > 0 ? DATA5_1_WIDTH : 1,
            parameter DATA5_2_BITS  = DATA5_2_WIDTH > 0 ? DATA5_2_WIDTH : 1,
            parameter DATA5_3_BITS  = DATA5_3_WIDTH > 0 ? DATA5_3_WIDTH : 1,
            parameter DATA5_4_BITS  = DATA5_4_WIDTH > 0 ? DATA5_4_WIDTH : 1,
            parameter DATA5_5_BITS  = DATA5_5_WIDTH > 0 ? DATA5_5_WIDTH : 1,
            parameter DATA5_6_BITS  = DATA5_6_WIDTH > 0 ? DATA5_6_WIDTH : 1,
            parameter DATA5_7_BITS  = DATA5_7_WIDTH > 0 ? DATA5_7_WIDTH : 1,
            parameter DATA5_8_BITS  = DATA5_8_WIDTH > 0 ? DATA5_8_WIDTH : 1,
            parameter DATA5_9_BITS  = DATA5_9_WIDTH > 0 ? DATA5_9_WIDTH : 1,
            parameter DATA6_0_BITS  = DATA6_0_WIDTH > 0 ? DATA6_0_WIDTH : 1,
            parameter DATA6_1_BITS  = DATA6_1_WIDTH > 0 ? DATA6_1_WIDTH : 1,
            parameter DATA6_2_BITS  = DATA6_2_WIDTH > 0 ? DATA6_2_WIDTH : 1,
            parameter DATA6_3_BITS  = DATA6_3_WIDTH > 0 ? DATA6_3_WIDTH : 1,
            parameter DATA6_4_BITS  = DATA6_4_WIDTH > 0 ? DATA6_4_WIDTH : 1,
            parameter DATA6_5_BITS  = DATA6_5_WIDTH > 0 ? DATA6_5_WIDTH : 1,
            parameter DATA6_6_BITS  = DATA6_6_WIDTH > 0 ? DATA6_6_WIDTH : 1,
            parameter DATA6_7_BITS  = DATA6_7_WIDTH > 0 ? DATA6_7_WIDTH : 1,
            parameter DATA6_8_BITS  = DATA6_8_WIDTH > 0 ? DATA6_8_WIDTH : 1,
            parameter DATA6_9_BITS  = DATA6_9_WIDTH > 0 ? DATA6_9_WIDTH : 1,
            parameter DATA7_0_BITS  = DATA7_0_WIDTH > 0 ? DATA7_0_WIDTH : 1,
            parameter DATA7_1_BITS  = DATA7_1_WIDTH > 0 ? DATA7_1_WIDTH : 1,
            parameter DATA7_2_BITS  = DATA7_2_WIDTH > 0 ? DATA7_2_WIDTH : 1,
            parameter DATA7_3_BITS  = DATA7_3_WIDTH > 0 ? DATA7_3_WIDTH : 1,
            parameter DATA7_4_BITS  = DATA7_4_WIDTH > 0 ? DATA7_4_WIDTH : 1,
            parameter DATA7_5_BITS  = DATA7_5_WIDTH > 0 ? DATA7_5_WIDTH : 1,
            parameter DATA7_6_BITS  = DATA7_6_WIDTH > 0 ? DATA7_6_WIDTH : 1,
            parameter DATA7_7_BITS  = DATA7_7_WIDTH > 0 ? DATA7_7_WIDTH : 1,
            parameter DATA7_8_BITS  = DATA7_8_WIDTH > 0 ? DATA7_8_WIDTH : 1,
            parameter DATA7_9_BITS  = DATA7_9_WIDTH > 0 ? DATA7_9_WIDTH : 1,
            parameter DATA8_0_BITS  = DATA8_0_WIDTH > 0 ? DATA8_0_WIDTH : 1,
            parameter DATA8_1_BITS  = DATA8_1_WIDTH > 0 ? DATA8_1_WIDTH : 1,
            parameter DATA8_2_BITS  = DATA8_2_WIDTH > 0 ? DATA8_2_WIDTH : 1,
            parameter DATA8_3_BITS  = DATA8_3_WIDTH > 0 ? DATA8_3_WIDTH : 1,
            parameter DATA8_4_BITS  = DATA8_4_WIDTH > 0 ? DATA8_4_WIDTH : 1,
            parameter DATA8_5_BITS  = DATA8_5_WIDTH > 0 ? DATA8_5_WIDTH : 1,
            parameter DATA8_6_BITS  = DATA8_6_WIDTH > 0 ? DATA8_6_WIDTH : 1,
            parameter DATA8_7_BITS  = DATA8_7_WIDTH > 0 ? DATA8_7_WIDTH : 1,
            parameter DATA8_8_BITS  = DATA8_8_WIDTH > 0 ? DATA8_8_WIDTH : 1,
            parameter DATA8_9_BITS  = DATA8_9_WIDTH > 0 ? DATA8_9_WIDTH : 1,
            parameter DATA9_0_BITS  = DATA9_0_WIDTH > 0 ? DATA9_0_WIDTH : 1,
            parameter DATA9_1_BITS  = DATA9_1_WIDTH > 0 ? DATA9_1_WIDTH : 1,
            parameter DATA9_2_BITS  = DATA9_2_WIDTH > 0 ? DATA9_2_WIDTH : 1,
            parameter DATA9_3_BITS  = DATA9_3_WIDTH > 0 ? DATA9_3_WIDTH : 1,
            parameter DATA9_4_BITS  = DATA9_4_WIDTH > 0 ? DATA9_4_WIDTH : 1,
            parameter DATA9_5_BITS  = DATA9_5_WIDTH > 0 ? DATA9_5_WIDTH : 1,
            parameter DATA9_6_BITS  = DATA9_6_WIDTH > 0 ? DATA9_6_WIDTH : 1,
            parameter DATA9_7_BITS  = DATA9_7_WIDTH > 0 ? DATA9_7_WIDTH : 1,
            parameter DATA9_8_BITS  = DATA9_8_WIDTH > 0 ? DATA9_8_WIDTH : 1,
            parameter DATA9_9_BITS  = DATA9_9_WIDTH > 0 ? DATA9_9_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [DATA0_0_BITS-1:0]  s0_data0,
            input   wire    [DATA0_1_BITS-1:0]  s0_data1,
            input   wire    [DATA0_2_BITS-1:0]  s0_data2,
            input   wire    [DATA0_3_BITS-1:0]  s0_data3,
            input   wire    [DATA0_4_BITS-1:0]  s0_data4,
            input   wire    [DATA0_5_BITS-1:0]  s0_data5,
            input   wire    [DATA0_6_BITS-1:0]  s0_data6,
            input   wire    [DATA0_7_BITS-1:0]  s0_data7,
            input   wire    [DATA0_8_BITS-1:0]  s0_data8,
            input   wire    [DATA0_9_BITS-1:0]  s0_data9,
            input   wire                        s0_valid,
            output  wire                        s0_ready,
            
            input   wire    [DATA1_0_BITS-1:0]  s1_data0,
            input   wire    [DATA1_1_BITS-1:0]  s1_data1,
            input   wire    [DATA1_2_BITS-1:0]  s1_data2,
            input   wire    [DATA1_3_BITS-1:0]  s1_data3,
            input   wire    [DATA1_4_BITS-1:0]  s1_data4,
            input   wire    [DATA1_5_BITS-1:0]  s1_data5,
            input   wire    [DATA1_6_BITS-1:0]  s1_data6,
            input   wire    [DATA1_7_BITS-1:0]  s1_data7,
            input   wire    [DATA1_8_BITS-1:0]  s1_data8,
            input   wire    [DATA1_9_BITS-1:0]  s1_data9,
            input   wire                        s1_valid,
            output  wire                        s1_ready,
            
            input   wire    [DATA2_0_BITS-1:0]  s2_data0,
            input   wire    [DATA2_1_BITS-1:0]  s2_data1,
            input   wire    [DATA2_2_BITS-1:0]  s2_data2,
            input   wire    [DATA2_3_BITS-1:0]  s2_data3,
            input   wire    [DATA2_4_BITS-1:0]  s2_data4,
            input   wire    [DATA2_5_BITS-1:0]  s2_data5,
            input   wire    [DATA2_6_BITS-1:0]  s2_data6,
            input   wire    [DATA2_7_BITS-1:0]  s2_data7,
            input   wire    [DATA2_8_BITS-1:0]  s2_data8,
            input   wire    [DATA2_9_BITS-1:0]  s2_data9,
            input   wire                        s2_valid,
            output  wire                        s2_ready,
            
            input   wire    [DATA3_0_BITS-1:0]  s3_data0,
            input   wire    [DATA3_1_BITS-1:0]  s3_data1,
            input   wire    [DATA3_2_BITS-1:0]  s3_data2,
            input   wire    [DATA3_3_BITS-1:0]  s3_data3,
            input   wire    [DATA3_4_BITS-1:0]  s3_data4,
            input   wire    [DATA3_5_BITS-1:0]  s3_data5,
            input   wire    [DATA3_6_BITS-1:0]  s3_data6,
            input   wire    [DATA3_7_BITS-1:0]  s3_data7,
            input   wire    [DATA3_8_BITS-1:0]  s3_data8,
            input   wire    [DATA3_9_BITS-1:0]  s3_data9,
            input   wire                        s3_valid,
            output  wire                        s3_ready,
            
            input   wire    [DATA4_0_BITS-1:0]  s4_data0,
            input   wire    [DATA4_1_BITS-1:0]  s4_data1,
            input   wire    [DATA4_2_BITS-1:0]  s4_data2,
            input   wire    [DATA4_3_BITS-1:0]  s4_data3,
            input   wire    [DATA4_4_BITS-1:0]  s4_data4,
            input   wire    [DATA4_5_BITS-1:0]  s4_data5,
            input   wire    [DATA4_6_BITS-1:0]  s4_data6,
            input   wire    [DATA4_7_BITS-1:0]  s4_data7,
            input   wire    [DATA4_8_BITS-1:0]  s4_data8,
            input   wire    [DATA4_9_BITS-1:0]  s4_data9,
            input   wire                        s4_valid,
            output  wire                        s4_ready,
            
            input   wire    [DATA5_0_BITS-1:0]  s5_data0,
            input   wire    [DATA5_1_BITS-1:0]  s5_data1,
            input   wire    [DATA5_2_BITS-1:0]  s5_data2,
            input   wire    [DATA5_3_BITS-1:0]  s5_data3,
            input   wire    [DATA5_4_BITS-1:0]  s5_data4,
            input   wire    [DATA5_5_BITS-1:0]  s5_data5,
            input   wire    [DATA5_6_BITS-1:0]  s5_data6,
            input   wire    [DATA5_7_BITS-1:0]  s5_data7,
            input   wire    [DATA5_8_BITS-1:0]  s5_data8,
            input   wire    [DATA5_9_BITS-1:0]  s5_data9,
            input   wire                        s5_valid,
            output  wire                        s5_ready,
            
            input   wire    [DATA6_0_BITS-1:0]  s6_data0,
            input   wire    [DATA6_1_BITS-1:0]  s6_data1,
            input   wire    [DATA6_2_BITS-1:0]  s6_data2,
            input   wire    [DATA6_3_BITS-1:0]  s6_data3,
            input   wire    [DATA6_4_BITS-1:0]  s6_data4,
            input   wire    [DATA6_5_BITS-1:0]  s6_data5,
            input   wire    [DATA6_6_BITS-1:0]  s6_data6,
            input   wire    [DATA6_7_BITS-1:0]  s6_data7,
            input   wire    [DATA6_8_BITS-1:0]  s6_data8,
            input   wire    [DATA6_9_BITS-1:0]  s6_data9,
            input   wire                        s6_valid,
            output  wire                        s6_ready,
            
            input   wire    [DATA7_0_BITS-1:0]  s7_data0,
            input   wire    [DATA7_1_BITS-1:0]  s7_data1,
            input   wire    [DATA7_2_BITS-1:0]  s7_data2,
            input   wire    [DATA7_3_BITS-1:0]  s7_data3,
            input   wire    [DATA7_4_BITS-1:0]  s7_data4,
            input   wire    [DATA7_5_BITS-1:0]  s7_data5,
            input   wire    [DATA7_6_BITS-1:0]  s7_data6,
            input   wire    [DATA7_7_BITS-1:0]  s7_data7,
            input   wire    [DATA7_8_BITS-1:0]  s7_data8,
            input   wire    [DATA7_9_BITS-1:0]  s7_data9,
            input   wire                        s7_valid,
            output  wire                        s7_ready,
            
            input   wire    [DATA8_0_BITS-1:0]  s8_data0,
            input   wire    [DATA8_1_BITS-1:0]  s8_data1,
            input   wire    [DATA8_2_BITS-1:0]  s8_data2,
            input   wire    [DATA8_3_BITS-1:0]  s8_data3,
            input   wire    [DATA8_4_BITS-1:0]  s8_data4,
            input   wire    [DATA8_5_BITS-1:0]  s8_data5,
            input   wire    [DATA8_6_BITS-1:0]  s8_data6,
            input   wire    [DATA8_7_BITS-1:0]  s8_data7,
            input   wire    [DATA8_8_BITS-1:0]  s8_data8,
            input   wire    [DATA8_9_BITS-1:0]  s8_data9,
            input   wire                        s8_valid,
            output  wire                        s8_ready,
            
            input   wire    [DATA9_0_BITS-1:0]  s9_data0,
            input   wire    [DATA9_1_BITS-1:0]  s9_data1,
            input   wire    [DATA9_2_BITS-1:0]  s9_data2,
            input   wire    [DATA9_3_BITS-1:0]  s9_data3,
            input   wire    [DATA9_4_BITS-1:0]  s9_data4,
            input   wire    [DATA9_5_BITS-1:0]  s9_data5,
            input   wire    [DATA9_6_BITS-1:0]  s9_data6,
            input   wire    [DATA9_7_BITS-1:0]  s9_data7,
            input   wire    [DATA9_8_BITS-1:0]  s9_data8,
            input   wire    [DATA9_9_BITS-1:0]  s9_data9,
            input   wire                        s9_valid,
            output  wire                        s9_ready,
            
            output  wire    [DATA0_0_BITS-1:0]  m_data0_0,
            output  wire    [DATA0_1_BITS-1:0]  m_data0_1,
            output  wire    [DATA0_2_BITS-1:0]  m_data0_2,
            output  wire    [DATA0_3_BITS-1:0]  m_data0_3,
            output  wire    [DATA0_4_BITS-1:0]  m_data0_4,
            output  wire    [DATA0_5_BITS-1:0]  m_data0_5,
            output  wire    [DATA0_6_BITS-1:0]  m_data0_6,
            output  wire    [DATA0_7_BITS-1:0]  m_data0_7,
            output  wire    [DATA0_8_BITS-1:0]  m_data0_8,
            output  wire    [DATA0_9_BITS-1:0]  m_data0_9,
            output  wire    [DATA1_0_BITS-1:0]  m_data1_0,
            output  wire    [DATA1_1_BITS-1:0]  m_data1_1,
            output  wire    [DATA1_2_BITS-1:0]  m_data1_2,
            output  wire    [DATA1_3_BITS-1:0]  m_data1_3,
            output  wire    [DATA1_4_BITS-1:0]  m_data1_4,
            output  wire    [DATA1_5_BITS-1:0]  m_data1_5,
            output  wire    [DATA1_6_BITS-1:0]  m_data1_6,
            output  wire    [DATA1_7_BITS-1:0]  m_data1_7,
            output  wire    [DATA1_8_BITS-1:0]  m_data1_8,
            output  wire    [DATA1_9_BITS-1:0]  m_data1_9,
            output  wire    [DATA2_0_BITS-1:0]  m_data2_0,
            output  wire    [DATA2_1_BITS-1:0]  m_data2_1,
            output  wire    [DATA2_2_BITS-1:0]  m_data2_2,
            output  wire    [DATA2_3_BITS-1:0]  m_data2_3,
            output  wire    [DATA2_4_BITS-1:0]  m_data2_4,
            output  wire    [DATA2_5_BITS-1:0]  m_data2_5,
            output  wire    [DATA2_6_BITS-1:0]  m_data2_6,
            output  wire    [DATA2_7_BITS-1:0]  m_data2_7,
            output  wire    [DATA2_8_BITS-1:0]  m_data2_8,
            output  wire    [DATA2_9_BITS-1:0]  m_data2_9,
            output  wire    [DATA3_0_BITS-1:0]  m_data3_0,
            output  wire    [DATA3_1_BITS-1:0]  m_data3_1,
            output  wire    [DATA3_2_BITS-1:0]  m_data3_2,
            output  wire    [DATA3_3_BITS-1:0]  m_data3_3,
            output  wire    [DATA3_4_BITS-1:0]  m_data3_4,
            output  wire    [DATA3_5_BITS-1:0]  m_data3_5,
            output  wire    [DATA3_6_BITS-1:0]  m_data3_6,
            output  wire    [DATA3_7_BITS-1:0]  m_data3_7,
            output  wire    [DATA3_8_BITS-1:0]  m_data3_8,
            output  wire    [DATA3_9_BITS-1:0]  m_data3_9,
            output  wire    [DATA4_0_BITS-1:0]  m_data4_0,
            output  wire    [DATA4_1_BITS-1:0]  m_data4_1,
            output  wire    [DATA4_2_BITS-1:0]  m_data4_2,
            output  wire    [DATA4_3_BITS-1:0]  m_data4_3,
            output  wire    [DATA4_4_BITS-1:0]  m_data4_4,
            output  wire    [DATA4_5_BITS-1:0]  m_data4_5,
            output  wire    [DATA4_6_BITS-1:0]  m_data4_6,
            output  wire    [DATA4_7_BITS-1:0]  m_data4_7,
            output  wire    [DATA4_8_BITS-1:0]  m_data4_8,
            output  wire    [DATA4_9_BITS-1:0]  m_data4_9,
            output  wire    [DATA5_0_BITS-1:0]  m_data5_0,
            output  wire    [DATA5_1_BITS-1:0]  m_data5_1,
            output  wire    [DATA5_2_BITS-1:0]  m_data5_2,
            output  wire    [DATA5_3_BITS-1:0]  m_data5_3,
            output  wire    [DATA5_4_BITS-1:0]  m_data5_4,
            output  wire    [DATA5_5_BITS-1:0]  m_data5_5,
            output  wire    [DATA5_6_BITS-1:0]  m_data5_6,
            output  wire    [DATA5_7_BITS-1:0]  m_data5_7,
            output  wire    [DATA5_8_BITS-1:0]  m_data5_8,
            output  wire    [DATA5_9_BITS-1:0]  m_data5_9,
            output  wire    [DATA6_0_BITS-1:0]  m_data6_0,
            output  wire    [DATA6_1_BITS-1:0]  m_data6_1,
            output  wire    [DATA6_2_BITS-1:0]  m_data6_2,
            output  wire    [DATA6_3_BITS-1:0]  m_data6_3,
            output  wire    [DATA6_4_BITS-1:0]  m_data6_4,
            output  wire    [DATA6_5_BITS-1:0]  m_data6_5,
            output  wire    [DATA6_6_BITS-1:0]  m_data6_6,
            output  wire    [DATA6_7_BITS-1:0]  m_data6_7,
            output  wire    [DATA6_8_BITS-1:0]  m_data6_8,
            output  wire    [DATA6_9_BITS-1:0]  m_data6_9,
            output  wire    [DATA7_0_BITS-1:0]  m_data7_0,
            output  wire    [DATA7_1_BITS-1:0]  m_data7_1,
            output  wire    [DATA7_2_BITS-1:0]  m_data7_2,
            output  wire    [DATA7_3_BITS-1:0]  m_data7_3,
            output  wire    [DATA7_4_BITS-1:0]  m_data7_4,
            output  wire    [DATA7_5_BITS-1:0]  m_data7_5,
            output  wire    [DATA7_6_BITS-1:0]  m_data7_6,
            output  wire    [DATA7_7_BITS-1:0]  m_data7_7,
            output  wire    [DATA7_8_BITS-1:0]  m_data7_8,
            output  wire    [DATA7_9_BITS-1:0]  m_data7_9,
            output  wire    [DATA8_0_BITS-1:0]  m_data8_0,
            output  wire    [DATA8_1_BITS-1:0]  m_data8_1,
            output  wire    [DATA8_2_BITS-1:0]  m_data8_2,
            output  wire    [DATA8_3_BITS-1:0]  m_data8_3,
            output  wire    [DATA8_4_BITS-1:0]  m_data8_4,
            output  wire    [DATA8_5_BITS-1:0]  m_data8_5,
            output  wire    [DATA8_6_BITS-1:0]  m_data8_6,
            output  wire    [DATA8_7_BITS-1:0]  m_data8_7,
            output  wire    [DATA8_8_BITS-1:0]  m_data8_8,
            output  wire    [DATA8_9_BITS-1:0]  m_data8_9,
            output  wire    [DATA9_0_BITS-1:0]  m_data9_0,
            output  wire    [DATA9_1_BITS-1:0]  m_data9_1,
            output  wire    [DATA9_2_BITS-1:0]  m_data9_2,
            output  wire    [DATA9_3_BITS-1:0]  m_data9_3,
            output  wire    [DATA9_4_BITS-1:0]  m_data9_4,
            output  wire    [DATA9_5_BITS-1:0]  m_data9_5,
            output  wire    [DATA9_6_BITS-1:0]  m_data9_6,
            output  wire    [DATA9_7_BITS-1:0]  m_data9_7,
            output  wire    [DATA9_8_BITS-1:0]  m_data9_8,
            output  wire    [DATA9_9_BITS-1:0]  m_data9_9,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    // -------------------------------
    // pack/unpack0
    // -------------------------------
    
    localparam DATA0_WIDTH = DATA0_0_WIDTH + DATA0_1_WIDTH + DATA0_2_WIDTH + DATA0_3_WIDTH + DATA0_4_WIDTH + DATA0_5_WIDTH + DATA0_6_WIDTH + DATA0_7_WIDTH + DATA0_8_WIDTH + DATA0_9_WIDTH;
    localparam DATA0_BITS  = DATA0_WIDTH > 0 ? DATA0_WIDTH : 1;
    
    wire    [DATA0_BITS-1:0]  s0_data;
    wire    [DATA0_BITS-1:0]  m_data0;
    
    jelly_func_pack
            #(
                .W0             (DATA0_0_WIDTH),
                .W1             (DATA0_1_WIDTH),
                .W2             (DATA0_2_WIDTH),
                .W3             (DATA0_3_WIDTH),
                .W4             (DATA0_4_WIDTH),
                .W5             (DATA0_5_WIDTH),
                .W6             (DATA0_6_WIDTH),
                .W7             (DATA0_7_WIDTH),
                .W8             (DATA0_8_WIDTH),
                .W9             (DATA0_9_WIDTH)
            )
    jelly_func_pack_0
            (
                .in0            (s0_data0),
                .in1            (s0_data1),
                .in2            (s0_data2),
                .in3            (s0_data3),
                .in4            (s0_data4),
                .in5            (s0_data5),
                .in6            (s0_data6),
                .in7            (s0_data7),
                .in8            (s0_data8),
                .in9            (s0_data9),
                .out            (s0_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA0_0_WIDTH),
                .W1             (DATA0_1_WIDTH),
                .W2             (DATA0_2_WIDTH),
                .W3             (DATA0_3_WIDTH),
                .W4             (DATA0_4_WIDTH),
                .W5             (DATA0_5_WIDTH),
                .W6             (DATA0_6_WIDTH),
                .W7             (DATA0_7_WIDTH),
                .W8             (DATA0_8_WIDTH),
                .W9             (DATA0_9_WIDTH)
            )
    jelly_func_unpack_0
            (
                .out0           (m_data0_0),
                .out1           (m_data0_1),
                .out2           (m_data0_2),
                .out3           (m_data0_3),
                .out4           (m_data0_4),
                .out5           (m_data0_5),
                .out6           (m_data0_6),
                .out7           (m_data0_7),
                .out8           (m_data0_8),
                .out9           (m_data0_9),
                .in             (m_data0)
            );
    
    
    // -------------------------------
    // pack/unpack1
    // -------------------------------
    
    localparam DATA1_WIDTH = DATA1_0_WIDTH + DATA1_1_WIDTH + DATA1_2_WIDTH + DATA1_3_WIDTH + DATA1_4_WIDTH + DATA1_5_WIDTH + DATA1_6_WIDTH + DATA1_7_WIDTH + DATA1_8_WIDTH + DATA1_9_WIDTH;
    localparam DATA1_BITS  = DATA1_WIDTH > 0 ? DATA1_WIDTH : 1;
    
    wire    [DATA1_BITS-1:0]  s1_data;
    wire    [DATA1_BITS-1:0]  m_data1;
    
    jelly_func_pack
            #(
                .W0             (DATA1_0_WIDTH),
                .W1             (DATA1_1_WIDTH),
                .W2             (DATA1_2_WIDTH),
                .W3             (DATA1_3_WIDTH),
                .W4             (DATA1_4_WIDTH),
                .W5             (DATA1_5_WIDTH),
                .W6             (DATA1_6_WIDTH),
                .W7             (DATA1_7_WIDTH),
                .W8             (DATA1_8_WIDTH),
                .W9             (DATA1_9_WIDTH)
            )
    jelly_func_pack_1
            (
                .in0            (s1_data0),
                .in1            (s1_data1),
                .in2            (s1_data2),
                .in3            (s1_data3),
                .in4            (s1_data4),
                .in5            (s1_data5),
                .in6            (s1_data6),
                .in7            (s1_data7),
                .in8            (s1_data8),
                .in9            (s1_data9),
                .out            (s1_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA1_0_WIDTH),
                .W1             (DATA1_1_WIDTH),
                .W2             (DATA1_2_WIDTH),
                .W3             (DATA1_3_WIDTH),
                .W4             (DATA1_4_WIDTH),
                .W5             (DATA1_5_WIDTH),
                .W6             (DATA1_6_WIDTH),
                .W7             (DATA1_7_WIDTH),
                .W8             (DATA1_8_WIDTH),
                .W9             (DATA1_9_WIDTH)
            )
    jelly_func_unpack_1
            (
                .out0           (m_data1_0),
                .out1           (m_data1_1),
                .out2           (m_data1_2),
                .out3           (m_data1_3),
                .out4           (m_data1_4),
                .out5           (m_data1_5),
                .out6           (m_data1_6),
                .out7           (m_data1_7),
                .out8           (m_data1_8),
                .out9           (m_data1_9),
                .in             (m_data1)
            );
    
    
    // -------------------------------
    // pack/unpack2
    // -------------------------------
    
    localparam DATA2_WIDTH = DATA2_0_WIDTH + DATA2_1_WIDTH + DATA2_2_WIDTH + DATA2_3_WIDTH + DATA2_4_WIDTH + DATA2_5_WIDTH + DATA2_6_WIDTH + DATA2_7_WIDTH + DATA2_8_WIDTH + DATA2_9_WIDTH;
    localparam DATA2_BITS  = DATA2_WIDTH > 0 ? DATA2_WIDTH : 1;
    
    wire    [DATA2_BITS-1:0]  s2_data;
    wire    [DATA2_BITS-1:0]  m_data2;
    
    jelly_func_pack
            #(
                .W0             (DATA2_0_WIDTH),
                .W1             (DATA2_1_WIDTH),
                .W2             (DATA2_2_WIDTH),
                .W3             (DATA2_3_WIDTH),
                .W4             (DATA2_4_WIDTH),
                .W5             (DATA2_5_WIDTH),
                .W6             (DATA2_6_WIDTH),
                .W7             (DATA2_7_WIDTH),
                .W8             (DATA2_8_WIDTH),
                .W9             (DATA2_9_WIDTH)
            )
    jelly_func_pack_2
            (
                .in0            (s2_data0),
                .in1            (s2_data1),
                .in2            (s2_data2),
                .in3            (s2_data3),
                .in4            (s2_data4),
                .in5            (s2_data5),
                .in6            (s2_data6),
                .in7            (s2_data7),
                .in8            (s2_data8),
                .in9            (s2_data9),
                .out            (s2_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA2_0_WIDTH),
                .W1             (DATA2_1_WIDTH),
                .W2             (DATA2_2_WIDTH),
                .W3             (DATA2_3_WIDTH),
                .W4             (DATA2_4_WIDTH),
                .W5             (DATA2_5_WIDTH),
                .W6             (DATA2_6_WIDTH),
                .W7             (DATA2_7_WIDTH),
                .W8             (DATA2_8_WIDTH),
                .W9             (DATA2_9_WIDTH)
            )
    jelly_func_unpack_2
            (
                .out0           (m_data2_0),
                .out1           (m_data2_1),
                .out2           (m_data2_2),
                .out3           (m_data2_3),
                .out4           (m_data2_4),
                .out5           (m_data2_5),
                .out6           (m_data2_6),
                .out7           (m_data2_7),
                .out8           (m_data2_8),
                .out9           (m_data2_9),
                .in             (m_data2)
            );
    
    
    // -------------------------------
    // pack/unpack3
    // -------------------------------
    
    localparam DATA3_WIDTH = DATA3_0_WIDTH + DATA3_1_WIDTH + DATA3_2_WIDTH + DATA3_3_WIDTH + DATA3_4_WIDTH + DATA3_5_WIDTH + DATA3_6_WIDTH + DATA3_7_WIDTH + DATA3_8_WIDTH + DATA3_9_WIDTH;
    localparam DATA3_BITS  = DATA3_WIDTH > 0 ? DATA3_WIDTH : 1;
    
    wire    [DATA3_BITS-1:0]  s3_data;
    wire    [DATA3_BITS-1:0]  m_data3;
    
    jelly_func_pack
            #(
                .W0             (DATA3_0_WIDTH),
                .W1             (DATA3_1_WIDTH),
                .W2             (DATA3_2_WIDTH),
                .W3             (DATA3_3_WIDTH),
                .W4             (DATA3_4_WIDTH),
                .W5             (DATA3_5_WIDTH),
                .W6             (DATA3_6_WIDTH),
                .W7             (DATA3_7_WIDTH),
                .W8             (DATA3_8_WIDTH),
                .W9             (DATA3_9_WIDTH)
            )
    jelly_func_pack_3
            (
                .in0            (s3_data0),
                .in1            (s3_data1),
                .in2            (s3_data2),
                .in3            (s3_data3),
                .in4            (s3_data4),
                .in5            (s3_data5),
                .in6            (s3_data6),
                .in7            (s3_data7),
                .in8            (s3_data8),
                .in9            (s3_data9),
                .out            (s3_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA3_0_WIDTH),
                .W1             (DATA3_1_WIDTH),
                .W2             (DATA3_2_WIDTH),
                .W3             (DATA3_3_WIDTH),
                .W4             (DATA3_4_WIDTH),
                .W5             (DATA3_5_WIDTH),
                .W6             (DATA3_6_WIDTH),
                .W7             (DATA3_7_WIDTH),
                .W8             (DATA3_8_WIDTH),
                .W9             (DATA3_9_WIDTH)
            )
    jelly_func_unpack_3
            (
                .out0           (m_data3_0),
                .out1           (m_data3_1),
                .out2           (m_data3_2),
                .out3           (m_data3_3),
                .out4           (m_data3_4),
                .out5           (m_data3_5),
                .out6           (m_data3_6),
                .out7           (m_data3_7),
                .out8           (m_data3_8),
                .out9           (m_data3_9),
                .in             (m_data3)
            );
    
    
    // -------------------------------
    // pack/unpack4
    // -------------------------------
    
    localparam DATA4_WIDTH = DATA4_0_WIDTH + DATA4_1_WIDTH + DATA4_2_WIDTH + DATA4_3_WIDTH + DATA4_4_WIDTH + DATA4_5_WIDTH + DATA4_6_WIDTH + DATA4_7_WIDTH + DATA4_8_WIDTH + DATA4_9_WIDTH;
    localparam DATA4_BITS  = DATA4_WIDTH > 0 ? DATA4_WIDTH : 1;
    
    wire    [DATA4_BITS-1:0]  s4_data;
    wire    [DATA4_BITS-1:0]  m_data4;
    
    jelly_func_pack
            #(
                .W0             (DATA4_0_WIDTH),
                .W1             (DATA4_1_WIDTH),
                .W2             (DATA4_2_WIDTH),
                .W3             (DATA4_3_WIDTH),
                .W4             (DATA4_4_WIDTH),
                .W5             (DATA4_5_WIDTH),
                .W6             (DATA4_6_WIDTH),
                .W7             (DATA4_7_WIDTH),
                .W8             (DATA4_8_WIDTH),
                .W9             (DATA4_9_WIDTH)
            )
    jelly_func_pack_4
            (
                .in0            (s4_data0),
                .in1            (s4_data1),
                .in2            (s4_data2),
                .in3            (s4_data3),
                .in4            (s4_data4),
                .in5            (s4_data5),
                .in6            (s4_data6),
                .in7            (s4_data7),
                .in8            (s4_data8),
                .in9            (s4_data9),
                .out            (s4_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA4_0_WIDTH),
                .W1             (DATA4_1_WIDTH),
                .W2             (DATA4_2_WIDTH),
                .W3             (DATA4_3_WIDTH),
                .W4             (DATA4_4_WIDTH),
                .W5             (DATA4_5_WIDTH),
                .W6             (DATA4_6_WIDTH),
                .W7             (DATA4_7_WIDTH),
                .W8             (DATA4_8_WIDTH),
                .W9             (DATA4_9_WIDTH)
            )
    jelly_func_unpack_4
            (
                .out0           (m_data4_0),
                .out1           (m_data4_1),
                .out2           (m_data4_2),
                .out3           (m_data4_3),
                .out4           (m_data4_4),
                .out5           (m_data4_5),
                .out6           (m_data4_6),
                .out7           (m_data4_7),
                .out8           (m_data4_8),
                .out9           (m_data4_9),
                .in             (m_data4)
            );
    
    
    // -------------------------------
    // pack/unpack5
    // -------------------------------
    
    localparam DATA5_WIDTH = DATA5_0_WIDTH + DATA5_1_WIDTH + DATA5_2_WIDTH + DATA5_3_WIDTH + DATA5_4_WIDTH + DATA5_5_WIDTH + DATA5_6_WIDTH + DATA5_7_WIDTH + DATA5_8_WIDTH + DATA5_9_WIDTH;
    localparam DATA5_BITS  = DATA5_WIDTH > 0 ? DATA5_WIDTH : 1;
    
    wire    [DATA5_BITS-1:0]  s5_data;
    wire    [DATA5_BITS-1:0]  m_data5;
    
    jelly_func_pack
            #(
                .W0             (DATA5_0_WIDTH),
                .W1             (DATA5_1_WIDTH),
                .W2             (DATA5_2_WIDTH),
                .W3             (DATA5_3_WIDTH),
                .W4             (DATA5_4_WIDTH),
                .W5             (DATA5_5_WIDTH),
                .W6             (DATA5_6_WIDTH),
                .W7             (DATA5_7_WIDTH),
                .W8             (DATA5_8_WIDTH),
                .W9             (DATA5_9_WIDTH)
            )
    jelly_func_pack_5
            (
                .in0            (s5_data0),
                .in1            (s5_data1),
                .in2            (s5_data2),
                .in3            (s5_data3),
                .in4            (s5_data4),
                .in5            (s5_data5),
                .in6            (s5_data6),
                .in7            (s5_data7),
                .in8            (s5_data8),
                .in9            (s5_data9),
                .out            (s5_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA5_0_WIDTH),
                .W1             (DATA5_1_WIDTH),
                .W2             (DATA5_2_WIDTH),
                .W3             (DATA5_3_WIDTH),
                .W4             (DATA5_4_WIDTH),
                .W5             (DATA5_5_WIDTH),
                .W6             (DATA5_6_WIDTH),
                .W7             (DATA5_7_WIDTH),
                .W8             (DATA5_8_WIDTH),
                .W9             (DATA5_9_WIDTH)
            )
    jelly_func_unpack_5
            (
                .out0           (m_data5_0),
                .out1           (m_data5_1),
                .out2           (m_data5_2),
                .out3           (m_data5_3),
                .out4           (m_data5_4),
                .out5           (m_data5_5),
                .out6           (m_data5_6),
                .out7           (m_data5_7),
                .out8           (m_data5_8),
                .out9           (m_data5_9),
                .in             (m_data5)
            );
    
    
    // -------------------------------
    // pack/unpack6
    // -------------------------------
    
    localparam DATA6_WIDTH = DATA6_0_WIDTH + DATA6_1_WIDTH + DATA6_2_WIDTH + DATA6_3_WIDTH + DATA6_4_WIDTH + DATA6_5_WIDTH + DATA6_6_WIDTH + DATA6_7_WIDTH + DATA6_8_WIDTH + DATA6_9_WIDTH;
    localparam DATA6_BITS  = DATA6_WIDTH > 0 ? DATA6_WIDTH : 1;
    
    wire    [DATA6_BITS-1:0]  s6_data;
    wire    [DATA6_BITS-1:0]  m_data6;
    
    jelly_func_pack
            #(
                .W0             (DATA6_0_WIDTH),
                .W1             (DATA6_1_WIDTH),
                .W2             (DATA6_2_WIDTH),
                .W3             (DATA6_3_WIDTH),
                .W4             (DATA6_4_WIDTH),
                .W5             (DATA6_5_WIDTH),
                .W6             (DATA6_6_WIDTH),
                .W7             (DATA6_7_WIDTH),
                .W8             (DATA6_8_WIDTH),
                .W9             (DATA6_9_WIDTH)
            )
    jelly_func_pack_6
            (
                .in0            (s6_data0),
                .in1            (s6_data1),
                .in2            (s6_data2),
                .in3            (s6_data3),
                .in4            (s6_data4),
                .in5            (s6_data5),
                .in6            (s6_data6),
                .in7            (s6_data7),
                .in8            (s6_data8),
                .in9            (s6_data9),
                .out            (s6_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA6_0_WIDTH),
                .W1             (DATA6_1_WIDTH),
                .W2             (DATA6_2_WIDTH),
                .W3             (DATA6_3_WIDTH),
                .W4             (DATA6_4_WIDTH),
                .W5             (DATA6_5_WIDTH),
                .W6             (DATA6_6_WIDTH),
                .W7             (DATA6_7_WIDTH),
                .W8             (DATA6_8_WIDTH),
                .W9             (DATA6_9_WIDTH)
            )
    jelly_func_unpack_6
            (
                .out0           (m_data6_0),
                .out1           (m_data6_1),
                .out2           (m_data6_2),
                .out3           (m_data6_3),
                .out4           (m_data6_4),
                .out5           (m_data6_5),
                .out6           (m_data6_6),
                .out7           (m_data6_7),
                .out8           (m_data6_8),
                .out9           (m_data6_9),
                .in             (m_data6)
            );
    
    
    // -------------------------------
    // pack/unpack7
    // -------------------------------
    
    localparam DATA7_WIDTH = DATA7_0_WIDTH + DATA7_1_WIDTH + DATA7_2_WIDTH + DATA7_3_WIDTH + DATA7_4_WIDTH + DATA7_5_WIDTH + DATA7_6_WIDTH + DATA7_7_WIDTH + DATA7_8_WIDTH + DATA7_9_WIDTH;
    localparam DATA7_BITS  = DATA7_WIDTH > 0 ? DATA7_WIDTH : 1;
    
    wire    [DATA7_BITS-1:0]  s7_data;
    wire    [DATA7_BITS-1:0]  m_data7;
    
    jelly_func_pack
            #(
                .W0             (DATA7_0_WIDTH),
                .W1             (DATA7_1_WIDTH),
                .W2             (DATA7_2_WIDTH),
                .W3             (DATA7_3_WIDTH),
                .W4             (DATA7_4_WIDTH),
                .W5             (DATA7_5_WIDTH),
                .W6             (DATA7_6_WIDTH),
                .W7             (DATA7_7_WIDTH),
                .W8             (DATA7_8_WIDTH),
                .W9             (DATA7_9_WIDTH)
            )
    jelly_func_pack_7
            (
                .in0            (s7_data0),
                .in1            (s7_data1),
                .in2            (s7_data2),
                .in3            (s7_data3),
                .in4            (s7_data4),
                .in5            (s7_data5),
                .in6            (s7_data6),
                .in7            (s7_data7),
                .in8            (s7_data8),
                .in9            (s7_data9),
                .out            (s7_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA7_0_WIDTH),
                .W1             (DATA7_1_WIDTH),
                .W2             (DATA7_2_WIDTH),
                .W3             (DATA7_3_WIDTH),
                .W4             (DATA7_4_WIDTH),
                .W5             (DATA7_5_WIDTH),
                .W6             (DATA7_6_WIDTH),
                .W7             (DATA7_7_WIDTH),
                .W8             (DATA7_8_WIDTH),
                .W9             (DATA7_9_WIDTH)
            )
    jelly_func_unpack_7
            (
                .out0           (m_data7_0),
                .out1           (m_data7_1),
                .out2           (m_data7_2),
                .out3           (m_data7_3),
                .out4           (m_data7_4),
                .out5           (m_data7_5),
                .out6           (m_data7_6),
                .out7           (m_data7_7),
                .out8           (m_data7_8),
                .out9           (m_data7_9),
                .in             (m_data7)
            );
    
    
    // -------------------------------
    // pack/unpack8
    // -------------------------------
    
    localparam DATA8_WIDTH = DATA8_0_WIDTH + DATA8_1_WIDTH + DATA8_2_WIDTH + DATA8_3_WIDTH + DATA8_4_WIDTH + DATA8_5_WIDTH + DATA8_6_WIDTH + DATA8_7_WIDTH + DATA8_8_WIDTH + DATA8_9_WIDTH;
    localparam DATA8_BITS  = DATA8_WIDTH > 0 ? DATA8_WIDTH : 1;
    
    wire    [DATA8_BITS-1:0]  s8_data;
    wire    [DATA8_BITS-1:0]  m_data8;
    
    jelly_func_pack
            #(
                .W0             (DATA8_0_WIDTH),
                .W1             (DATA8_1_WIDTH),
                .W2             (DATA8_2_WIDTH),
                .W3             (DATA8_3_WIDTH),
                .W4             (DATA8_4_WIDTH),
                .W5             (DATA8_5_WIDTH),
                .W6             (DATA8_6_WIDTH),
                .W7             (DATA8_7_WIDTH),
                .W8             (DATA8_8_WIDTH),
                .W9             (DATA8_9_WIDTH)
            )
    jelly_func_pack_8
            (
                .in0            (s8_data0),
                .in1            (s8_data1),
                .in2            (s8_data2),
                .in3            (s8_data3),
                .in4            (s8_data4),
                .in5            (s8_data5),
                .in6            (s8_data6),
                .in7            (s8_data7),
                .in8            (s8_data8),
                .in9            (s8_data9),
                .out            (s8_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA8_0_WIDTH),
                .W1             (DATA8_1_WIDTH),
                .W2             (DATA8_2_WIDTH),
                .W3             (DATA8_3_WIDTH),
                .W4             (DATA8_4_WIDTH),
                .W5             (DATA8_5_WIDTH),
                .W6             (DATA8_6_WIDTH),
                .W7             (DATA8_7_WIDTH),
                .W8             (DATA8_8_WIDTH),
                .W9             (DATA8_9_WIDTH)
            )
    jelly_func_unpack_8
            (
                .out0           (m_data8_0),
                .out1           (m_data8_1),
                .out2           (m_data8_2),
                .out3           (m_data8_3),
                .out4           (m_data8_4),
                .out5           (m_data8_5),
                .out6           (m_data8_6),
                .out7           (m_data8_7),
                .out8           (m_data8_8),
                .out9           (m_data8_9),
                .in             (m_data8)
            );
    
    
    // -------------------------------
    // pack/unpack9
    // -------------------------------
    
    localparam DATA9_WIDTH = DATA9_0_WIDTH + DATA9_1_WIDTH + DATA9_2_WIDTH + DATA9_3_WIDTH + DATA9_4_WIDTH + DATA9_5_WIDTH + DATA9_6_WIDTH + DATA9_7_WIDTH + DATA9_8_WIDTH + DATA9_9_WIDTH;
    localparam DATA9_BITS  = DATA9_WIDTH > 0 ? DATA9_WIDTH : 1;
    
    wire    [DATA9_BITS-1:0]  s9_data;
    wire    [DATA9_BITS-1:0]  m_data9;
    
    jelly_func_pack
            #(
                .W0             (DATA9_0_WIDTH),
                .W1             (DATA9_1_WIDTH),
                .W2             (DATA9_2_WIDTH),
                .W3             (DATA9_3_WIDTH),
                .W4             (DATA9_4_WIDTH),
                .W5             (DATA9_5_WIDTH),
                .W6             (DATA9_6_WIDTH),
                .W7             (DATA9_7_WIDTH),
                .W8             (DATA9_8_WIDTH),
                .W9             (DATA9_9_WIDTH)
            )
    jelly_func_pack_9
            (
                .in0            (s9_data0),
                .in1            (s9_data1),
                .in2            (s9_data2),
                .in3            (s9_data3),
                .in4            (s9_data4),
                .in5            (s9_data5),
                .in6            (s9_data6),
                .in7            (s9_data7),
                .in8            (s9_data8),
                .in9            (s9_data9),
                .out            (s9_data)
            );
    
    jelly_func_unpack
            #(
                .W0             (DATA9_0_WIDTH),
                .W1             (DATA9_1_WIDTH),
                .W2             (DATA9_2_WIDTH),
                .W3             (DATA9_3_WIDTH),
                .W4             (DATA9_4_WIDTH),
                .W5             (DATA9_5_WIDTH),
                .W6             (DATA9_6_WIDTH),
                .W7             (DATA9_7_WIDTH),
                .W8             (DATA9_8_WIDTH),
                .W9             (DATA9_9_WIDTH)
            )
    jelly_func_unpack_9
            (
                .out0           (m_data9_0),
                .out1           (m_data9_1),
                .out2           (m_data9_2),
                .out3           (m_data9_3),
                .out4           (m_data9_4),
                .out5           (m_data9_5),
                .out6           (m_data9_6),
                .out7           (m_data9_7),
                .out8           (m_data9_8),
                .out9           (m_data9_9),
                .in             (m_data9)
            );
    
    jelly_data_combine_pack
            #(
                .NUM            (NUM),
                .DATA0_WIDTH    (DATA0_WIDTH),
                .DATA1_WIDTH    (DATA1_WIDTH),
                .DATA2_WIDTH    (DATA2_WIDTH),
                .DATA3_WIDTH    (DATA3_WIDTH),
                .DATA4_WIDTH    (DATA4_WIDTH),
                .DATA5_WIDTH    (DATA5_WIDTH),
                .DATA6_WIDTH    (DATA6_WIDTH),
                .DATA7_WIDTH    (DATA7_WIDTH),
                .DATA8_WIDTH    (DATA8_WIDTH),
                .DATA9_WIDTH    (DATA9_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (M_REGS)
            )
         i_data_combine_pack
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s0_data        (s0_data),
                .s0_valid       (s0_valid),
                .s0_ready       (s0_ready),
                
                .s1_data        (s1_data),
                .s1_valid       (s1_valid),
                .s1_ready       (s1_ready),
                
                .s2_data        (s2_data),
                .s2_valid       (s2_valid),
                .s2_ready       (s2_ready),
                
                .s3_data        (s3_data),
                .s3_valid       (s3_valid),
                .s3_ready       (s3_ready),
                
                .s4_data        (s4_data),
                .s4_valid       (s4_valid),
                .s4_ready       (s4_ready),
                
                .s5_data        (s5_data),
                .s5_valid       (s5_valid),
                .s5_ready       (s5_ready),
                
                .s6_data        (s6_data),
                .s6_valid       (s6_valid),
                .s6_ready       (s6_ready),
                
                .s7_data        (s7_data),
                .s7_valid       (s7_valid),
                .s7_ready       (s7_ready),
                
                .s8_data        (s8_data),
                .s8_valid       (s8_valid),
                .s8_ready       (s8_ready),
                
                .s9_data        (s9_data),
                .s9_valid       (s9_valid),
                .s9_ready       (s9_ready),
                
                .m_data0        (m_data0),
                .m_data1        (m_data1),
                .m_data2        (m_data2),
                .m_data3        (m_data3),
                .m_data4        (m_data4),
                .m_data5        (m_data5),
                .m_data6        (m_data6),
                .m_data7        (m_data7),
                .m_data8        (m_data8),
                .m_data9        (m_data9),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
endmodule


`default_nettype wire


// end of file
