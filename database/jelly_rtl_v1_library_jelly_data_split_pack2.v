// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module jelly_data_split_pack2
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
            
            input   wire    [DATA0_0_BITS-1:0]  s_data0_0,
            input   wire    [DATA0_1_BITS-1:0]  s_data0_1,
            input   wire    [DATA0_2_BITS-1:0]  s_data0_2,
            input   wire    [DATA0_3_BITS-1:0]  s_data0_3,
            input   wire    [DATA0_4_BITS-1:0]  s_data0_4,
            input   wire    [DATA0_5_BITS-1:0]  s_data0_5,
            input   wire    [DATA0_6_BITS-1:0]  s_data0_6,
            input   wire    [DATA0_7_BITS-1:0]  s_data0_7,
            input   wire    [DATA0_8_BITS-1:0]  s_data0_8,
            input   wire    [DATA0_9_BITS-1:0]  s_data0_9,
            input   wire    [DATA1_0_BITS-1:0]  s_data1_0,
            input   wire    [DATA1_1_BITS-1:0]  s_data1_1,
            input   wire    [DATA1_2_BITS-1:0]  s_data1_2,
            input   wire    [DATA1_3_BITS-1:0]  s_data1_3,
            input   wire    [DATA1_4_BITS-1:0]  s_data1_4,
            input   wire    [DATA1_5_BITS-1:0]  s_data1_5,
            input   wire    [DATA1_6_BITS-1:0]  s_data1_6,
            input   wire    [DATA1_7_BITS-1:0]  s_data1_7,
            input   wire    [DATA1_8_BITS-1:0]  s_data1_8,
            input   wire    [DATA1_9_BITS-1:0]  s_data1_9,
            input   wire    [DATA2_0_BITS-1:0]  s_data2_0,
            input   wire    [DATA2_1_BITS-1:0]  s_data2_1,
            input   wire    [DATA2_2_BITS-1:0]  s_data2_2,
            input   wire    [DATA2_3_BITS-1:0]  s_data2_3,
            input   wire    [DATA2_4_BITS-1:0]  s_data2_4,
            input   wire    [DATA2_5_BITS-1:0]  s_data2_5,
            input   wire    [DATA2_6_BITS-1:0]  s_data2_6,
            input   wire    [DATA2_7_BITS-1:0]  s_data2_7,
            input   wire    [DATA2_8_BITS-1:0]  s_data2_8,
            input   wire    [DATA2_9_BITS-1:0]  s_data2_9,
            input   wire    [DATA3_0_BITS-1:0]  s_data3_0,
            input   wire    [DATA3_1_BITS-1:0]  s_data3_1,
            input   wire    [DATA3_2_BITS-1:0]  s_data3_2,
            input   wire    [DATA3_3_BITS-1:0]  s_data3_3,
            input   wire    [DATA3_4_BITS-1:0]  s_data3_4,
            input   wire    [DATA3_5_BITS-1:0]  s_data3_5,
            input   wire    [DATA3_6_BITS-1:0]  s_data3_6,
            input   wire    [DATA3_7_BITS-1:0]  s_data3_7,
            input   wire    [DATA3_8_BITS-1:0]  s_data3_8,
            input   wire    [DATA3_9_BITS-1:0]  s_data3_9,
            input   wire    [DATA4_0_BITS-1:0]  s_data4_0,
            input   wire    [DATA4_1_BITS-1:0]  s_data4_1,
            input   wire    [DATA4_2_BITS-1:0]  s_data4_2,
            input   wire    [DATA4_3_BITS-1:0]  s_data4_3,
            input   wire    [DATA4_4_BITS-1:0]  s_data4_4,
            input   wire    [DATA4_5_BITS-1:0]  s_data4_5,
            input   wire    [DATA4_6_BITS-1:0]  s_data4_6,
            input   wire    [DATA4_7_BITS-1:0]  s_data4_7,
            input   wire    [DATA4_8_BITS-1:0]  s_data4_8,
            input   wire    [DATA4_9_BITS-1:0]  s_data4_9,
            input   wire    [DATA5_0_BITS-1:0]  s_data5_0,
            input   wire    [DATA5_1_BITS-1:0]  s_data5_1,
            input   wire    [DATA5_2_BITS-1:0]  s_data5_2,
            input   wire    [DATA5_3_BITS-1:0]  s_data5_3,
            input   wire    [DATA5_4_BITS-1:0]  s_data5_4,
            input   wire    [DATA5_5_BITS-1:0]  s_data5_5,
            input   wire    [DATA5_6_BITS-1:0]  s_data5_6,
            input   wire    [DATA5_7_BITS-1:0]  s_data5_7,
            input   wire    [DATA5_8_BITS-1:0]  s_data5_8,
            input   wire    [DATA5_9_BITS-1:0]  s_data5_9,
            input   wire    [DATA6_0_BITS-1:0]  s_data6_0,
            input   wire    [DATA6_1_BITS-1:0]  s_data6_1,
            input   wire    [DATA6_2_BITS-1:0]  s_data6_2,
            input   wire    [DATA6_3_BITS-1:0]  s_data6_3,
            input   wire    [DATA6_4_BITS-1:0]  s_data6_4,
            input   wire    [DATA6_5_BITS-1:0]  s_data6_5,
            input   wire    [DATA6_6_BITS-1:0]  s_data6_6,
            input   wire    [DATA6_7_BITS-1:0]  s_data6_7,
            input   wire    [DATA6_8_BITS-1:0]  s_data6_8,
            input   wire    [DATA6_9_BITS-1:0]  s_data6_9,
            input   wire    [DATA7_0_BITS-1:0]  s_data7_0,
            input   wire    [DATA7_1_BITS-1:0]  s_data7_1,
            input   wire    [DATA7_2_BITS-1:0]  s_data7_2,
            input   wire    [DATA7_3_BITS-1:0]  s_data7_3,
            input   wire    [DATA7_4_BITS-1:0]  s_data7_4,
            input   wire    [DATA7_5_BITS-1:0]  s_data7_5,
            input   wire    [DATA7_6_BITS-1:0]  s_data7_6,
            input   wire    [DATA7_7_BITS-1:0]  s_data7_7,
            input   wire    [DATA7_8_BITS-1:0]  s_data7_8,
            input   wire    [DATA7_9_BITS-1:0]  s_data7_9,
            input   wire    [DATA8_0_BITS-1:0]  s_data8_0,
            input   wire    [DATA8_1_BITS-1:0]  s_data8_1,
            input   wire    [DATA8_2_BITS-1:0]  s_data8_2,
            input   wire    [DATA8_3_BITS-1:0]  s_data8_3,
            input   wire    [DATA8_4_BITS-1:0]  s_data8_4,
            input   wire    [DATA8_5_BITS-1:0]  s_data8_5,
            input   wire    [DATA8_6_BITS-1:0]  s_data8_6,
            input   wire    [DATA8_7_BITS-1:0]  s_data8_7,
            input   wire    [DATA8_8_BITS-1:0]  s_data8_8,
            input   wire    [DATA8_9_BITS-1:0]  s_data8_9,
            input   wire    [DATA9_0_BITS-1:0]  s_data9_0,
            input   wire    [DATA9_1_BITS-1:0]  s_data9_1,
            input   wire    [DATA9_2_BITS-1:0]  s_data9_2,
            input   wire    [DATA9_3_BITS-1:0]  s_data9_3,
            input   wire    [DATA9_4_BITS-1:0]  s_data9_4,
            input   wire    [DATA9_5_BITS-1:0]  s_data9_5,
            input   wire    [DATA9_6_BITS-1:0]  s_data9_6,
            input   wire    [DATA9_7_BITS-1:0]  s_data9_7,
            input   wire    [DATA9_8_BITS-1:0]  s_data9_8,
            input   wire    [DATA9_9_BITS-1:0]  s_data9_9,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [DATA0_0_BITS-1:0]  m0_data0,
            output  wire    [DATA0_1_BITS-1:0]  m0_data1,
            output  wire    [DATA0_2_BITS-1:0]  m0_data2,
            output  wire    [DATA0_3_BITS-1:0]  m0_data3,
            output  wire    [DATA0_4_BITS-1:0]  m0_data4,
            output  wire    [DATA0_5_BITS-1:0]  m0_data5,
            output  wire    [DATA0_6_BITS-1:0]  m0_data6,
            output  wire    [DATA0_7_BITS-1:0]  m0_data7,
            output  wire    [DATA0_8_BITS-1:0]  m0_data8,
            output  wire    [DATA0_9_BITS-1:0]  m0_data9,
            output  wire                        m0_valid,
            input   wire                        m0_ready,
            
            output  wire    [DATA1_0_BITS-1:0]  m1_data0,
            output  wire    [DATA1_1_BITS-1:0]  m1_data1,
            output  wire    [DATA1_2_BITS-1:0]  m1_data2,
            output  wire    [DATA1_3_BITS-1:0]  m1_data3,
            output  wire    [DATA1_4_BITS-1:0]  m1_data4,
            output  wire    [DATA1_5_BITS-1:0]  m1_data5,
            output  wire    [DATA1_6_BITS-1:0]  m1_data6,
            output  wire    [DATA1_7_BITS-1:0]  m1_data7,
            output  wire    [DATA1_8_BITS-1:0]  m1_data8,
            output  wire    [DATA1_9_BITS-1:0]  m1_data9,
            output  wire                        m1_valid,
            input   wire                        m1_ready,
            
            output  wire    [DATA2_0_BITS-1:0]  m2_data0,
            output  wire    [DATA2_1_BITS-1:0]  m2_data1,
            output  wire    [DATA2_2_BITS-1:0]  m2_data2,
            output  wire    [DATA2_3_BITS-1:0]  m2_data3,
            output  wire    [DATA2_4_BITS-1:0]  m2_data4,
            output  wire    [DATA2_5_BITS-1:0]  m2_data5,
            output  wire    [DATA2_6_BITS-1:0]  m2_data6,
            output  wire    [DATA2_7_BITS-1:0]  m2_data7,
            output  wire    [DATA2_8_BITS-1:0]  m2_data8,
            output  wire    [DATA2_9_BITS-1:0]  m2_data9,
            output  wire                        m2_valid,
            input   wire                        m2_ready,
            
            output  wire    [DATA3_0_BITS-1:0]  m3_data0,
            output  wire    [DATA3_1_BITS-1:0]  m3_data1,
            output  wire    [DATA3_2_BITS-1:0]  m3_data2,
            output  wire    [DATA3_3_BITS-1:0]  m3_data3,
            output  wire    [DATA3_4_BITS-1:0]  m3_data4,
            output  wire    [DATA3_5_BITS-1:0]  m3_data5,
            output  wire    [DATA3_6_BITS-1:0]  m3_data6,
            output  wire    [DATA3_7_BITS-1:0]  m3_data7,
            output  wire    [DATA3_8_BITS-1:0]  m3_data8,
            output  wire    [DATA3_9_BITS-1:0]  m3_data9,
            output  wire                        m3_valid,
            input   wire                        m3_ready,
            
            output  wire    [DATA4_0_BITS-1:0]  m4_data0,
            output  wire    [DATA4_1_BITS-1:0]  m4_data1,
            output  wire    [DATA4_2_BITS-1:0]  m4_data2,
            output  wire    [DATA4_3_BITS-1:0]  m4_data3,
            output  wire    [DATA4_4_BITS-1:0]  m4_data4,
            output  wire    [DATA4_5_BITS-1:0]  m4_data5,
            output  wire    [DATA4_6_BITS-1:0]  m4_data6,
            output  wire    [DATA4_7_BITS-1:0]  m4_data7,
            output  wire    [DATA4_8_BITS-1:0]  m4_data8,
            output  wire    [DATA4_9_BITS-1:0]  m4_data9,
            output  wire                        m4_valid,
            input   wire                        m4_ready,
            
            output  wire    [DATA5_0_BITS-1:0]  m5_data0,
            output  wire    [DATA5_1_BITS-1:0]  m5_data1,
            output  wire    [DATA5_2_BITS-1:0]  m5_data2,
            output  wire    [DATA5_3_BITS-1:0]  m5_data3,
            output  wire    [DATA5_4_BITS-1:0]  m5_data4,
            output  wire    [DATA5_5_BITS-1:0]  m5_data5,
            output  wire    [DATA5_6_BITS-1:0]  m5_data6,
            output  wire    [DATA5_7_BITS-1:0]  m5_data7,
            output  wire    [DATA5_8_BITS-1:0]  m5_data8,
            output  wire    [DATA5_9_BITS-1:0]  m5_data9,
            output  wire                        m5_valid,
            input   wire                        m5_ready,
            
            output  wire    [DATA6_0_BITS-1:0]  m6_data0,
            output  wire    [DATA6_1_BITS-1:0]  m6_data1,
            output  wire    [DATA6_2_BITS-1:0]  m6_data2,
            output  wire    [DATA6_3_BITS-1:0]  m6_data3,
            output  wire    [DATA6_4_BITS-1:0]  m6_data4,
            output  wire    [DATA6_5_BITS-1:0]  m6_data5,
            output  wire    [DATA6_6_BITS-1:0]  m6_data6,
            output  wire    [DATA6_7_BITS-1:0]  m6_data7,
            output  wire    [DATA6_8_BITS-1:0]  m6_data8,
            output  wire    [DATA6_9_BITS-1:0]  m6_data9,
            output  wire                        m6_valid,
            input   wire                        m6_ready,
            
            output  wire    [DATA7_0_BITS-1:0]  m7_data0,
            output  wire    [DATA7_1_BITS-1:0]  m7_data1,
            output  wire    [DATA7_2_BITS-1:0]  m7_data2,
            output  wire    [DATA7_3_BITS-1:0]  m7_data3,
            output  wire    [DATA7_4_BITS-1:0]  m7_data4,
            output  wire    [DATA7_5_BITS-1:0]  m7_data5,
            output  wire    [DATA7_6_BITS-1:0]  m7_data6,
            output  wire    [DATA7_7_BITS-1:0]  m7_data7,
            output  wire    [DATA7_8_BITS-1:0]  m7_data8,
            output  wire    [DATA7_9_BITS-1:0]  m7_data9,
            output  wire                        m7_valid,
            input   wire                        m7_ready,
            
            output  wire    [DATA8_0_BITS-1:0]  m8_data0,
            output  wire    [DATA8_1_BITS-1:0]  m8_data1,
            output  wire    [DATA8_2_BITS-1:0]  m8_data2,
            output  wire    [DATA8_3_BITS-1:0]  m8_data3,
            output  wire    [DATA8_4_BITS-1:0]  m8_data4,
            output  wire    [DATA8_5_BITS-1:0]  m8_data5,
            output  wire    [DATA8_6_BITS-1:0]  m8_data6,
            output  wire    [DATA8_7_BITS-1:0]  m8_data7,
            output  wire    [DATA8_8_BITS-1:0]  m8_data8,
            output  wire    [DATA8_9_BITS-1:0]  m8_data9,
            output  wire                        m8_valid,
            input   wire                        m8_ready,
            
            output  wire    [DATA9_0_BITS-1:0]  m9_data0,
            output  wire    [DATA9_1_BITS-1:0]  m9_data1,
            output  wire    [DATA9_2_BITS-1:0]  m9_data2,
            output  wire    [DATA9_3_BITS-1:0]  m9_data3,
            output  wire    [DATA9_4_BITS-1:0]  m9_data4,
            output  wire    [DATA9_5_BITS-1:0]  m9_data5,
            output  wire    [DATA9_6_BITS-1:0]  m9_data6,
            output  wire    [DATA9_7_BITS-1:0]  m9_data7,
            output  wire    [DATA9_8_BITS-1:0]  m9_data8,
            output  wire    [DATA9_9_BITS-1:0]  m9_data9,
            output  wire                        m9_valid,
            input   wire                        m9_ready
        );
    
    
    // -------------------------------
    // pack/unpack0
    // -------------------------------
    
    localparam DATA0_WIDTH = DATA0_0_WIDTH + DATA0_1_WIDTH + DATA0_2_WIDTH + DATA0_3_WIDTH + DATA0_4_WIDTH + DATA0_5_WIDTH + DATA0_6_WIDTH + DATA0_7_WIDTH + DATA0_8_WIDTH + DATA0_9_WIDTH;
    localparam DATA0_BITS  = DATA0_WIDTH > 0 ? DATA0_WIDTH : 1;
    
    wire    [DATA0_BITS-1:0]  s_data0;
    wire    [DATA0_BITS-1:0]  m0_data;
    
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
                .in0            (s_data0_0),
                .in1            (s_data0_1),
                .in2            (s_data0_2),
                .in3            (s_data0_3),
                .in4            (s_data0_4),
                .in5            (s_data0_5),
                .in6            (s_data0_6),
                .in7            (s_data0_7),
                .in8            (s_data0_8),
                .in9            (s_data0_9),
                .out            (s_data0)
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
                .out0           (m0_data0),
                .out1           (m0_data1),
                .out2           (m0_data2),
                .out3           (m0_data3),
                .out4           (m0_data4),
                .out5           (m0_data5),
                .out6           (m0_data6),
                .out7           (m0_data7),
                .out8           (m0_data8),
                .out9           (m0_data9),
                .in             (m0_data)
            );
    
    
    // -------------------------------
    // pack/unpack1
    // -------------------------------
    
    localparam DATA1_WIDTH = DATA1_0_WIDTH + DATA1_1_WIDTH + DATA1_2_WIDTH + DATA1_3_WIDTH + DATA1_4_WIDTH + DATA1_5_WIDTH + DATA1_6_WIDTH + DATA1_7_WIDTH + DATA1_8_WIDTH + DATA1_9_WIDTH;
    localparam DATA1_BITS  = DATA1_WIDTH > 0 ? DATA1_WIDTH : 1;
    
    wire    [DATA1_BITS-1:0]  s_data1;
    wire    [DATA1_BITS-1:0]  m1_data;
    
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
                .in0            (s_data1_0),
                .in1            (s_data1_1),
                .in2            (s_data1_2),
                .in3            (s_data1_3),
                .in4            (s_data1_4),
                .in5            (s_data1_5),
                .in6            (s_data1_6),
                .in7            (s_data1_7),
                .in8            (s_data1_8),
                .in9            (s_data1_9),
                .out            (s_data1)
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
                .out0           (m1_data0),
                .out1           (m1_data1),
                .out2           (m1_data2),
                .out3           (m1_data3),
                .out4           (m1_data4),
                .out5           (m1_data5),
                .out6           (m1_data6),
                .out7           (m1_data7),
                .out8           (m1_data8),
                .out9           (m1_data9),
                .in             (m1_data)
            );
    
    
    // -------------------------------
    // pack/unpack2
    // -------------------------------
    
    localparam DATA2_WIDTH = DATA2_0_WIDTH + DATA2_1_WIDTH + DATA2_2_WIDTH + DATA2_3_WIDTH + DATA2_4_WIDTH + DATA2_5_WIDTH + DATA2_6_WIDTH + DATA2_7_WIDTH + DATA2_8_WIDTH + DATA2_9_WIDTH;
    localparam DATA2_BITS  = DATA2_WIDTH > 0 ? DATA2_WIDTH : 1;
    
    wire    [DATA2_BITS-1:0]  s_data2;
    wire    [DATA2_BITS-1:0]  m2_data;
    
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
                .in0            (s_data2_0),
                .in1            (s_data2_1),
                .in2            (s_data2_2),
                .in3            (s_data2_3),
                .in4            (s_data2_4),
                .in5            (s_data2_5),
                .in6            (s_data2_6),
                .in7            (s_data2_7),
                .in8            (s_data2_8),
                .in9            (s_data2_9),
                .out            (s_data2)
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
                .out0           (m2_data0),
                .out1           (m2_data1),
                .out2           (m2_data2),
                .out3           (m2_data3),
                .out4           (m2_data4),
                .out5           (m2_data5),
                .out6           (m2_data6),
                .out7           (m2_data7),
                .out8           (m2_data8),
                .out9           (m2_data9),
                .in             (m2_data)
            );
    
    
    // -------------------------------
    // pack/unpack3
    // -------------------------------
    
    localparam DATA3_WIDTH = DATA3_0_WIDTH + DATA3_1_WIDTH + DATA3_2_WIDTH + DATA3_3_WIDTH + DATA3_4_WIDTH + DATA3_5_WIDTH + DATA3_6_WIDTH + DATA3_7_WIDTH + DATA3_8_WIDTH + DATA3_9_WIDTH;
    localparam DATA3_BITS  = DATA3_WIDTH > 0 ? DATA3_WIDTH : 1;
    
    wire    [DATA3_BITS-1:0]  s_data3;
    wire    [DATA3_BITS-1:0]  m3_data;
    
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
                .in0            (s_data3_0),
                .in1            (s_data3_1),
                .in2            (s_data3_2),
                .in3            (s_data3_3),
                .in4            (s_data3_4),
                .in5            (s_data3_5),
                .in6            (s_data3_6),
                .in7            (s_data3_7),
                .in8            (s_data3_8),
                .in9            (s_data3_9),
                .out            (s_data3)
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
                .out0           (m3_data0),
                .out1           (m3_data1),
                .out2           (m3_data2),
                .out3           (m3_data3),
                .out4           (m3_data4),
                .out5           (m3_data5),
                .out6           (m3_data6),
                .out7           (m3_data7),
                .out8           (m3_data8),
                .out9           (m3_data9),
                .in             (m3_data)
            );
    
    
    // -------------------------------
    // pack/unpack4
    // -------------------------------
    
    localparam DATA4_WIDTH = DATA4_0_WIDTH + DATA4_1_WIDTH + DATA4_2_WIDTH + DATA4_3_WIDTH + DATA4_4_WIDTH + DATA4_5_WIDTH + DATA4_6_WIDTH + DATA4_7_WIDTH + DATA4_8_WIDTH + DATA4_9_WIDTH;
    localparam DATA4_BITS  = DATA4_WIDTH > 0 ? DATA4_WIDTH : 1;
    
    wire    [DATA4_BITS-1:0]  s_data4;
    wire    [DATA4_BITS-1:0]  m4_data;
    
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
                .in0            (s_data4_0),
                .in1            (s_data4_1),
                .in2            (s_data4_2),
                .in3            (s_data4_3),
                .in4            (s_data4_4),
                .in5            (s_data4_5),
                .in6            (s_data4_6),
                .in7            (s_data4_7),
                .in8            (s_data4_8),
                .in9            (s_data4_9),
                .out            (s_data4)
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
                .out0           (m4_data0),
                .out1           (m4_data1),
                .out2           (m4_data2),
                .out3           (m4_data3),
                .out4           (m4_data4),
                .out5           (m4_data5),
                .out6           (m4_data6),
                .out7           (m4_data7),
                .out8           (m4_data8),
                .out9           (m4_data9),
                .in             (m4_data)
            );
    
    
    // -------------------------------
    // pack/unpack5
    // -------------------------------
    
    localparam DATA5_WIDTH = DATA5_0_WIDTH + DATA5_1_WIDTH + DATA5_2_WIDTH + DATA5_3_WIDTH + DATA5_4_WIDTH + DATA5_5_WIDTH + DATA5_6_WIDTH + DATA5_7_WIDTH + DATA5_8_WIDTH + DATA5_9_WIDTH;
    localparam DATA5_BITS  = DATA5_WIDTH > 0 ? DATA5_WIDTH : 1;
    
    wire    [DATA5_BITS-1:0]  s_data5;
    wire    [DATA5_BITS-1:0]  m5_data;
    
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
                .in0            (s_data5_0),
                .in1            (s_data5_1),
                .in2            (s_data5_2),
                .in3            (s_data5_3),
                .in4            (s_data5_4),
                .in5            (s_data5_5),
                .in6            (s_data5_6),
                .in7            (s_data5_7),
                .in8            (s_data5_8),
                .in9            (s_data5_9),
                .out            (s_data5)
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
                .out0           (m5_data0),
                .out1           (m5_data1),
                .out2           (m5_data2),
                .out3           (m5_data3),
                .out4           (m5_data4),
                .out5           (m5_data5),
                .out6           (m5_data6),
                .out7           (m5_data7),
                .out8           (m5_data8),
                .out9           (m5_data9),
                .in             (m5_data)
            );
    
    
    // -------------------------------
    // pack/unpack6
    // -------------------------------
    
    localparam DATA6_WIDTH = DATA6_0_WIDTH + DATA6_1_WIDTH + DATA6_2_WIDTH + DATA6_3_WIDTH + DATA6_4_WIDTH + DATA6_5_WIDTH + DATA6_6_WIDTH + DATA6_7_WIDTH + DATA6_8_WIDTH + DATA6_9_WIDTH;
    localparam DATA6_BITS  = DATA6_WIDTH > 0 ? DATA6_WIDTH : 1;
    
    wire    [DATA6_BITS-1:0]  s_data6;
    wire    [DATA6_BITS-1:0]  m6_data;
    
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
                .in0            (s_data6_0),
                .in1            (s_data6_1),
                .in2            (s_data6_2),
                .in3            (s_data6_3),
                .in4            (s_data6_4),
                .in5            (s_data6_5),
                .in6            (s_data6_6),
                .in7            (s_data6_7),
                .in8            (s_data6_8),
                .in9            (s_data6_9),
                .out            (s_data6)
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
                .out0           (m6_data0),
                .out1           (m6_data1),
                .out2           (m6_data2),
                .out3           (m6_data3),
                .out4           (m6_data4),
                .out5           (m6_data5),
                .out6           (m6_data6),
                .out7           (m6_data7),
                .out8           (m6_data8),
                .out9           (m6_data9),
                .in             (m6_data)
            );
    
    
    // -------------------------------
    // pack/unpack7
    // -------------------------------
    
    localparam DATA7_WIDTH = DATA7_0_WIDTH + DATA7_1_WIDTH + DATA7_2_WIDTH + DATA7_3_WIDTH + DATA7_4_WIDTH + DATA7_5_WIDTH + DATA7_6_WIDTH + DATA7_7_WIDTH + DATA7_8_WIDTH + DATA7_9_WIDTH;
    localparam DATA7_BITS  = DATA7_WIDTH > 0 ? DATA7_WIDTH : 1;
    
    wire    [DATA7_BITS-1:0]  s_data7;
    wire    [DATA7_BITS-1:0]  m7_data;
    
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
                .in0            (s_data7_0),
                .in1            (s_data7_1),
                .in2            (s_data7_2),
                .in3            (s_data7_3),
                .in4            (s_data7_4),
                .in5            (s_data7_5),
                .in6            (s_data7_6),
                .in7            (s_data7_7),
                .in8            (s_data7_8),
                .in9            (s_data7_9),
                .out            (s_data7)
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
                .out0           (m7_data0),
                .out1           (m7_data1),
                .out2           (m7_data2),
                .out3           (m7_data3),
                .out4           (m7_data4),
                .out5           (m7_data5),
                .out6           (m7_data6),
                .out7           (m7_data7),
                .out8           (m7_data8),
                .out9           (m7_data9),
                .in             (m7_data)
            );
    
    
    // -------------------------------
    // pack/unpack8
    // -------------------------------
    
    localparam DATA8_WIDTH = DATA8_0_WIDTH + DATA8_1_WIDTH + DATA8_2_WIDTH + DATA8_3_WIDTH + DATA8_4_WIDTH + DATA8_5_WIDTH + DATA8_6_WIDTH + DATA8_7_WIDTH + DATA8_8_WIDTH + DATA8_9_WIDTH;
    localparam DATA8_BITS  = DATA8_WIDTH > 0 ? DATA8_WIDTH : 1;
    
    wire    [DATA8_BITS-1:0]  s_data8;
    wire    [DATA8_BITS-1:0]  m8_data;
    
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
                .in0            (s_data8_0),
                .in1            (s_data8_1),
                .in2            (s_data8_2),
                .in3            (s_data8_3),
                .in4            (s_data8_4),
                .in5            (s_data8_5),
                .in6            (s_data8_6),
                .in7            (s_data8_7),
                .in8            (s_data8_8),
                .in9            (s_data8_9),
                .out            (s_data8)
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
                .out0           (m8_data0),
                .out1           (m8_data1),
                .out2           (m8_data2),
                .out3           (m8_data3),
                .out4           (m8_data4),
                .out5           (m8_data5),
                .out6           (m8_data6),
                .out7           (m8_data7),
                .out8           (m8_data8),
                .out9           (m8_data9),
                .in             (m8_data)
            );
    
    
    // -------------------------------
    // pack/unpack9
    // -------------------------------
    
    localparam DATA9_WIDTH = DATA9_0_WIDTH + DATA9_1_WIDTH + DATA9_2_WIDTH + DATA9_3_WIDTH + DATA9_4_WIDTH + DATA9_5_WIDTH + DATA9_6_WIDTH + DATA9_7_WIDTH + DATA9_8_WIDTH + DATA9_9_WIDTH;
    localparam DATA9_BITS  = DATA9_WIDTH > 0 ? DATA9_WIDTH : 1;
    
    wire    [DATA9_BITS-1:0]  s_data9;
    wire    [DATA9_BITS-1:0]  m9_data;
    
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
                .in0            (s_data9_0),
                .in1            (s_data9_1),
                .in2            (s_data9_2),
                .in3            (s_data9_3),
                .in4            (s_data9_4),
                .in5            (s_data9_5),
                .in6            (s_data9_6),
                .in7            (s_data9_7),
                .in8            (s_data9_8),
                .in9            (s_data9_9),
                .out            (s_data9)
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
                .out0           (m9_data0),
                .out1           (m9_data1),
                .out2           (m9_data2),
                .out3           (m9_data3),
                .out4           (m9_data4),
                .out5           (m9_data5),
                .out6           (m9_data6),
                .out7           (m9_data7),
                .out8           (m9_data8),
                .out9           (m9_data9),
                .in             (m9_data)
            );
    
    jelly_data_split_pack
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
         i_data_split_pack
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_data0),
                .s_data1        (s_data1),
                .s_data2        (s_data2),
                .s_data3        (s_data3),
                .s_data4        (s_data4),
                .s_data5        (s_data5),
                .s_data6        (s_data6),
                .s_data7        (s_data7),
                .s_data8        (s_data8),
                .s_data9        (s_data9),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m0_data        (m0_data),
                .m0_valid       (m0_valid),
                .m0_ready       (m0_ready),
                
                .m1_data        (m1_data),
                .m1_valid       (m1_valid),
                .m1_ready       (m1_ready),
                
                .m2_data        (m2_data),
                .m2_valid       (m2_valid),
                .m2_ready       (m2_ready),
                
                .m3_data        (m3_data),
                .m3_valid       (m3_valid),
                .m3_ready       (m3_ready),
                
                .m4_data        (m4_data),
                .m4_valid       (m4_valid),
                .m4_ready       (m4_ready),
                
                .m5_data        (m5_data),
                .m5_valid       (m5_valid),
                .m5_ready       (m5_ready),
                
                .m6_data        (m6_data),
                .m6_valid       (m6_valid),
                .m6_ready       (m6_ready),
                
                .m7_data        (m7_data),
                .m7_valid       (m7_valid),
                .m7_ready       (m7_ready),
                
                .m8_data        (m8_data),
                .m8_valid       (m8_valid),
                .m8_ready       (m8_ready),
                
                .m9_data        (m9_data),
                .m9_valid       (m9_valid),
                .m9_ready       (m9_ready)
            );
    
endmodule


`default_nettype wire


// end of file
