// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_fifo_width_convert_pack
        #(
            parameter ASYNC               = 1,
            parameter FIFO_PTR_WIDTH      = 9,
            parameter FIFO_RAM_TYPE       = "block",
            parameter FIFO_LOW_DEALY      = 0,
            parameter FIFO_DOUT_REGS      = 1,
            parameter FIFO_S_REGS         = 1,
            parameter FIFO_M_REGS         = 1,
            
            parameter S_NUM               = 1,
            parameter M_NUM               = 1,
            parameter UNIT0_WIDTH         = 32,
            parameter UNIT1_WIDTH         = 0,
            parameter UNIT2_WIDTH         = 0,
            parameter UNIT3_WIDTH         = 0,
            parameter UNIT4_WIDTH         = 0,
            parameter UNIT5_WIDTH         = 0,
            parameter UNIT6_WIDTH         = 0,
            parameter UNIT7_WIDTH         = 0,
            parameter UNIT8_WIDTH         = 0,
            parameter UNIT9_WIDTH         = 0,
            parameter S_DATA0_WIDTH       = S_NUM * UNIT0_WIDTH,
            parameter S_DATA1_WIDTH       = S_NUM * UNIT1_WIDTH,
            parameter S_DATA2_WIDTH       = S_NUM * UNIT2_WIDTH,
            parameter S_DATA3_WIDTH       = S_NUM * UNIT3_WIDTH,
            parameter S_DATA4_WIDTH       = S_NUM * UNIT4_WIDTH,
            parameter S_DATA5_WIDTH       = S_NUM * UNIT5_WIDTH,
            parameter S_DATA6_WIDTH       = S_NUM * UNIT6_WIDTH,
            parameter S_DATA7_WIDTH       = S_NUM * UNIT7_WIDTH,
            parameter S_DATA8_WIDTH       = S_NUM * UNIT8_WIDTH,
            parameter S_DATA9_WIDTH       = S_NUM * UNIT9_WIDTH,
            parameter M_DATA0_WIDTH       = M_NUM * UNIT0_WIDTH,
            parameter M_DATA1_WIDTH       = M_NUM * UNIT1_WIDTH,
            parameter M_DATA2_WIDTH       = M_NUM * UNIT2_WIDTH,
            parameter M_DATA3_WIDTH       = M_NUM * UNIT3_WIDTH,
            parameter M_DATA4_WIDTH       = M_NUM * UNIT4_WIDTH,
            parameter M_DATA5_WIDTH       = M_NUM * UNIT5_WIDTH,
            parameter M_DATA6_WIDTH       = M_NUM * UNIT6_WIDTH,
            parameter M_DATA7_WIDTH       = M_NUM * UNIT7_WIDTH,
            parameter M_DATA8_WIDTH       = M_NUM * UNIT8_WIDTH,
            parameter M_DATA9_WIDTH       = M_NUM * UNIT9_WIDTH,
            parameter HAS_FIRST           = 0,                          // first を備える
            parameter HAS_LAST            = 0,                          // last を備える
            parameter AUTO_FIRST          = (HAS_LAST & !HAS_FIRST),    // last の次を自動的に first とする
            parameter HAS_ALIGN_S         = 1,                          // slave 側のアライメントを指定する
            parameter HAS_ALIGN_M         = 1,                          // master 側のアライメントを指定する
            parameter FIRST_OVERWRITE     = 0,  // first時前方に残変換があれば吐き出さずに上書き
            parameter FIRST_FORCE_LAST    = 0,  // first時前方に残変換があれば強制的にlastを付与(残が無い場合はlastはつかない)
            parameter ALIGN_S_WIDTH       = S_NUM <=   2 ? 1 :
                                            S_NUM <=   4 ? 2 :
                                            S_NUM <=   8 ? 3 :
                                            S_NUM <=  16 ? 4 :
                                            S_NUM <=  32 ? 5 :
                                            S_NUM <=  64 ? 6 :
                                            S_NUM <= 128 ? 7 :
                                            S_NUM <= 256 ? 8 :
                                            S_NUM <= 512 ? 9 : 10,
            parameter ALIGN_M_WIDTH       = M_NUM <=   2 ? 1 :
                                            M_NUM <=   4 ? 2 :
                                            M_NUM <=   8 ? 3 :
                                            M_NUM <=  16 ? 4 :
                                            M_NUM <=  32 ? 5 :
                                            M_NUM <=  64 ? 6 :
                                            M_NUM <= 128 ? 7 :
                                            M_NUM <= 256 ? 8 :
                                            M_NUM <= 512 ? 9 : 10,
            parameter USER_F_WIDTH        = 0,
            parameter USER_L_WIDTH        = 0,
            parameter CONVERT_S_REGS      = 1,
            
            parameter POST_CONVERT        = (M_NUM < S_NUM),
            
            
            // local
            parameter UNIT0_BITS          = UNIT0_WIDTH   > 0 ? UNIT0_WIDTH   : 1,
            parameter UNIT1_BITS          = UNIT1_WIDTH   > 0 ? UNIT1_WIDTH   : 1,
            parameter UNIT2_BITS          = UNIT2_WIDTH   > 0 ? UNIT2_WIDTH   : 1,
            parameter UNIT3_BITS          = UNIT3_WIDTH   > 0 ? UNIT3_WIDTH   : 1,
            parameter UNIT4_BITS          = UNIT4_WIDTH   > 0 ? UNIT4_WIDTH   : 1,
            parameter UNIT5_BITS          = UNIT5_WIDTH   > 0 ? UNIT5_WIDTH   : 1,
            parameter UNIT6_BITS          = UNIT6_WIDTH   > 0 ? UNIT6_WIDTH   : 1,
            parameter UNIT7_BITS          = UNIT7_WIDTH   > 0 ? UNIT7_WIDTH   : 1,
            parameter UNIT8_BITS          = UNIT8_WIDTH   > 0 ? UNIT8_WIDTH   : 1,
            parameter UNIT9_BITS          = UNIT9_WIDTH   > 0 ? UNIT9_WIDTH   : 1,
            parameter S_DATA0_BITS        = S_DATA0_WIDTH > 0 ? S_DATA0_WIDTH : 1,
            parameter S_DATA1_BITS        = S_DATA1_WIDTH > 0 ? S_DATA1_WIDTH : 1,
            parameter S_DATA2_BITS        = S_DATA2_WIDTH > 0 ? S_DATA2_WIDTH : 1,
            parameter S_DATA3_BITS        = S_DATA3_WIDTH > 0 ? S_DATA3_WIDTH : 1,
            parameter S_DATA4_BITS        = S_DATA4_WIDTH > 0 ? S_DATA4_WIDTH : 1,
            parameter S_DATA5_BITS        = S_DATA5_WIDTH > 0 ? S_DATA5_WIDTH : 1,
            parameter S_DATA6_BITS        = S_DATA6_WIDTH > 0 ? S_DATA6_WIDTH : 1,
            parameter S_DATA7_BITS        = S_DATA7_WIDTH > 0 ? S_DATA7_WIDTH : 1,
            parameter S_DATA8_BITS        = S_DATA8_WIDTH > 0 ? S_DATA8_WIDTH : 1,
            parameter S_DATA9_BITS        = S_DATA9_WIDTH > 0 ? S_DATA9_WIDTH : 1,
            parameter M_DATA0_BITS        = M_DATA0_WIDTH > 0 ? M_DATA0_WIDTH : 1,
            parameter M_DATA1_BITS        = M_DATA1_WIDTH > 0 ? M_DATA1_WIDTH : 1,
            parameter M_DATA2_BITS        = M_DATA2_WIDTH > 0 ? M_DATA2_WIDTH : 1,
            parameter M_DATA3_BITS        = M_DATA3_WIDTH > 0 ? M_DATA3_WIDTH : 1,
            parameter M_DATA4_BITS        = M_DATA4_WIDTH > 0 ? M_DATA4_WIDTH : 1,
            parameter M_DATA5_BITS        = M_DATA5_WIDTH > 0 ? M_DATA5_WIDTH : 1,
            parameter M_DATA6_BITS        = M_DATA6_WIDTH > 0 ? M_DATA6_WIDTH : 1,
            parameter M_DATA7_BITS        = M_DATA7_WIDTH > 0 ? M_DATA7_WIDTH : 1,
            parameter M_DATA8_BITS        = M_DATA8_WIDTH > 0 ? M_DATA8_WIDTH : 1,
            parameter M_DATA9_BITS        = M_DATA9_WIDTH > 0 ? M_DATA9_WIDTH : 1,
            parameter USER_F_BITS         = USER_F_WIDTH  > 0 ? USER_F_WIDTH  : 1,
            parameter USER_L_BITS         = USER_L_WIDTH  > 0 ? USER_L_WIDTH  : 1
        )
        (
            input   wire                        endian,
            
            input   wire    [UNIT0_BITS-1:0]    padding0,
            input   wire    [UNIT1_BITS-1:0]    padding1,
            input   wire    [UNIT2_BITS-1:0]    padding2,
            input   wire    [UNIT3_BITS-1:0]    padding3,
            input   wire    [UNIT4_BITS-1:0]    padding4,
            input   wire    [UNIT5_BITS-1:0]    padding5,
            input   wire    [UNIT6_BITS-1:0]    padding6,
            input   wire    [UNIT7_BITS-1:0]    padding7,
            input   wire    [UNIT8_BITS-1:0]    padding8,
            input   wire    [UNIT9_BITS-1:0]    padding9,
            
            input   wire                        s_reset,
            input   wire                        s_clk,
            input   wire    [ALIGN_S_WIDTH-1:0] s_align_s,
            input   wire    [ALIGN_M_WIDTH-1:0] s_align_m,
            input   wire                        s_first,
            input   wire                        s_last,
            input   wire    [S_DATA0_BITS-1:0]  s_data0,
            input   wire    [S_DATA1_BITS-1:0]  s_data1,
            input   wire    [S_DATA2_BITS-1:0]  s_data2,
            input   wire    [S_DATA3_BITS-1:0]  s_data3,
            input   wire    [S_DATA4_BITS-1:0]  s_data4,
            input   wire    [S_DATA5_BITS-1:0]  s_data5,
            input   wire    [S_DATA6_BITS-1:0]  s_data6,
            input   wire    [S_DATA7_BITS-1:0]  s_data7,
            input   wire    [S_DATA8_BITS-1:0]  s_data8,
            input   wire    [S_DATA9_BITS-1:0]  s_data9,
            input   wire    [USER_F_BITS-1:0]   s_user_f,
            input   wire    [USER_L_BITS-1:0]   s_user_l,
            input   wire                        s_valid,
            output  wire                        s_ready,
            output  wire    [FIFO_PTR_WIDTH:0]  s_fifo_free_count,
            output  wire                        s_fifo_wr_signal,
            
            input   wire                        m_reset,
            input   wire                        m_clk,
            output  wire                        m_first,
            output  wire                        m_last,
            output  wire    [M_DATA0_BITS-1:0]  m_data0,
            output  wire    [M_DATA1_BITS-1:0]  m_data1,
            output  wire    [M_DATA2_BITS-1:0]  m_data2,
            output  wire    [M_DATA3_BITS-1:0]  m_data3,
            output  wire    [M_DATA4_BITS-1:0]  m_data4,
            output  wire    [M_DATA5_BITS-1:0]  m_data5,
            output  wire    [M_DATA6_BITS-1:0]  m_data6,
            output  wire    [M_DATA7_BITS-1:0]  m_data7,
            output  wire    [M_DATA8_BITS-1:0]  m_data8,
            output  wire    [M_DATA9_BITS-1:0]  m_data9,
            output  wire    [USER_F_BITS-1:0]   m_user_f,
            output  wire    [USER_L_BITS-1:0]   m_user_l,
            output  wire                        m_valid,
            input   wire                        m_ready,
            output  wire    [FIFO_PTR_WIDTH:0]  m_fifo_data_count,
            output  wire                        m_fifo_rd_signal
        );
    
    localparam S_PACK_WIDTH = S_DATA0_WIDTH
                            + S_DATA1_WIDTH
                            + S_DATA2_WIDTH
                            + S_DATA3_WIDTH
                            + S_DATA4_WIDTH
                            + S_DATA5_WIDTH
                            + S_DATA6_WIDTH
                            + S_DATA7_WIDTH
                            + S_DATA8_WIDTH
                            + S_DATA9_WIDTH;
    localparam S_PACK_BITS  = S_PACK_WIDTH > 0 ? S_PACK_WIDTH : 1;
    
    localparam S_CTLS_WIDTH = ALIGN_S_WIDTH
                            + ALIGN_M_WIDTH
                            + (HAS_FIRST   ? 1 : 0)
                            + (HAS_LAST    ? 1 : 0)
                            + USER_F_WIDTH
                            + USER_L_WIDTH;
    localparam S_CTLS_BITS  = S_CTLS_WIDTH > 0 ? S_CTLS_WIDTH : 1;
    
    
    localparam M_PACK_WIDTH = M_DATA0_WIDTH
                            + M_DATA1_WIDTH
                            + M_DATA2_WIDTH
                            + M_DATA3_WIDTH
                            + M_DATA4_WIDTH
                            + M_DATA5_WIDTH
                            + M_DATA6_WIDTH
                            + M_DATA7_WIDTH
                            + M_DATA8_WIDTH
                            + M_DATA9_WIDTH;
    localparam M_PACK_BITS  = M_PACK_WIDTH > 0 ? M_PACK_WIDTH : 1;
    
    localparam M_CTLS_WIDTH = (HAS_FIRST   ? 1 : 0)
                            + (HAS_LAST    ? 1 : 0)
                            + USER_F_WIDTH
                            + USER_L_WIDTH;
    localparam M_CTLS_BITS  = M_CTLS_WIDTH > 0 ? M_CTLS_WIDTH : 1;
    
    
    generate
    if ( POST_CONVERT ) begin : post_convert
        
        // FIFO
        wire    [S_PACK_BITS-1:0]   s_pack;
        wire    [S_CTLS_BITS-1:0]   s_ctls;
        jelly_func_pack
                #(
                    .W0                 (S_DATA0_WIDTH),
                    .W1                 (S_DATA1_WIDTH),
                    .W2                 (S_DATA2_WIDTH),
                    .W3                 (S_DATA3_WIDTH),
                    .W4                 (S_DATA4_WIDTH),
                    .W5                 (S_DATA5_WIDTH),
                    .W6                 (S_DATA6_WIDTH),
                    .W7                 (S_DATA7_WIDTH),
                    .W8                 (S_DATA8_WIDTH),
                    .W9                 (S_DATA9_WIDTH)
                )
            jelly_func_pack_data
                (
                    .in0                (s_data0),
                    .in1                (s_data1),
                    .in2                (s_data2),
                    .in3                (s_data3),
                    .in4                (s_data4),
                    .in5                (s_data5),
                    .in6                (s_data6),
                    .in7                (s_data7),
                    .in8                (s_data8),
                    .in9                (s_data9),
                    .out                (s_pack)
                );
        
        jelly_func_pack
                #(
                    .W0                 (ALIGN_S_WIDTH),
                    .W1                 (ALIGN_M_WIDTH),
                    .W2                 (HAS_FIRST   ? 1 : 0),
                    .W3                 (HAS_LAST    ? 1 : 0),
                    .W4                 (USER_F_WIDTH),
                    .W5                 (USER_L_WIDTH)
                )
            jelly_func_pack_ctls
                (
                    .in0                (s_align_s),
                    .in1                (s_align_m),
                    .in2                (s_first),
                    .in3                (s_last),
                    .in4                (s_user_f),
                    .in5                (s_user_l),
                    .out                (s_ctls)
                );
        
        wire    [S_PACK_BITS-1:0]   fifo_pack;
        wire    [S_CTLS_BITS-1:0]   fifo_ctls;
        wire                        fifo_valid;
        wire                        fifo_ready;
        jelly_fifo_pack
                #(
                    .ASYNC              (ASYNC),
                    .DATA0_WIDTH        (S_PACK_WIDTH),
                    .DATA1_WIDTH        (S_CTLS_WIDTH),
                    .PTR_WIDTH          (FIFO_PTR_WIDTH),
                    .DOUT_REGS          (FIFO_DOUT_REGS),
                    .RAM_TYPE           (FIFO_RAM_TYPE),
                    .LOW_DEALY          (FIFO_LOW_DEALY),
                    .S_REGS             (FIFO_S_REGS),
                    .M_REGS             (FIFO_M_REGS)
                )
            i_fifo_pack
                (
                    .s_reset            (s_reset),
                    .s_clk              (s_clk),
                    .s_data0            (s_pack),
                    .s_data1            (s_ctls),
                    .s_valid            (s_valid),
                    .s_ready            (s_ready),
                    .s_free_count       (s_fifo_free_count),
                    
                    .m_reset            (m_reset),
                    .m_clk              (m_clk),
                    .m_data0            (fifo_pack),
                    .m_data1            (fifo_ctls),
                    .m_valid            (fifo_valid),
                    .m_ready            (fifo_ready),
                    .m_data_count       (m_fifo_data_count)
                );
        
        wire    [S_DATA0_BITS-1:0]  fifo_data0;
        wire    [S_DATA1_BITS-1:0]  fifo_data1;
        wire    [S_DATA2_BITS-1:0]  fifo_data2;
        wire    [S_DATA3_BITS-1:0]  fifo_data3;
        wire    [S_DATA4_BITS-1:0]  fifo_data4;
        wire    [S_DATA5_BITS-1:0]  fifo_data5;
        wire    [S_DATA6_BITS-1:0]  fifo_data6;
        wire    [S_DATA7_BITS-1:0]  fifo_data7;
        wire    [S_DATA8_BITS-1:0]  fifo_data8;
        wire    [S_DATA9_BITS-1:0]  fifo_data9;
        
        wire    [ALIGN_S_WIDTH-1:0] fifo_align_s;
        wire    [ALIGN_M_WIDTH-1:0] fifo_align_m;
        wire                        fifo_first;
        wire                        fifo_last;
        wire    [USER_F_BITS-1:0]   fifo_user_f;
        wire    [USER_L_BITS-1:0]   fifo_user_l;
        
        jelly_func_unpack
                #(
                    .W0                 (S_DATA0_WIDTH),
                    .W1                 (S_DATA1_WIDTH),
                    .W2                 (S_DATA2_WIDTH),
                    .W3                 (S_DATA3_WIDTH),
                    .W4                 (S_DATA4_WIDTH),
                    .W5                 (S_DATA5_WIDTH),
                    .W6                 (S_DATA6_WIDTH),
                    .W7                 (S_DATA7_WIDTH),
                    .W8                 (S_DATA8_WIDTH),
                    .W9                 (S_DATA9_WIDTH)
                )
            jelly_func_unpack_data
                (
                    .in                 (fifo_pack),
                    .out0               (fifo_data0),
                    .out1               (fifo_data1),
                    .out2               (fifo_data2),
                    .out3               (fifo_data3),
                    .out4               (fifo_data4),
                    .out5               (fifo_data5),
                    .out6               (fifo_data6),
                    .out7               (fifo_data7),
                    .out8               (fifo_data8),
                    .out9               (fifo_data9)
                );
        
        jelly_func_unpack
                #(
                    .W0                 (ALIGN_S_WIDTH),
                    .W1                 (ALIGN_M_WIDTH),
                    .W2                 (HAS_FIRST   ? 1 : 0),
                    .W3                 (HAS_LAST    ? 1 : 0),
                    .W4                 (USER_F_WIDTH),
                    .W5                 (USER_L_WIDTH)
                )
            jelly_func_unpack_ctls
                (
                    .in                 (fifo_ctls),
                    .out0               (fifo_align_s),
                    .out1               (fifo_align_m),
                    .out2               (fifo_first),
                    .out3               (fifo_last),
                    .out4               (fifo_user_f),
                    .out5               (fifo_user_l)
                );
        
        
        // convert
        jelly_stream_width_convert_pack
                #(
                    .S_NUM              (S_NUM),
                    .M_NUM              (M_NUM),
                    .UNIT0_WIDTH        (UNIT0_WIDTH),
                    .UNIT1_WIDTH        (UNIT1_WIDTH),
                    .UNIT2_WIDTH        (UNIT2_WIDTH),
                    .UNIT3_WIDTH        (UNIT3_WIDTH),
                    .UNIT4_WIDTH        (UNIT4_WIDTH),
                    .UNIT5_WIDTH        (UNIT5_WIDTH),
                    .UNIT6_WIDTH        (UNIT6_WIDTH),
                    .UNIT7_WIDTH        (UNIT7_WIDTH),
                    .UNIT8_WIDTH        (UNIT8_WIDTH),
                    .UNIT9_WIDTH        (UNIT9_WIDTH),
                    .S_DATA0_WIDTH      (S_DATA0_WIDTH),
                    .S_DATA1_WIDTH      (S_DATA1_WIDTH),
                    .S_DATA2_WIDTH      (S_DATA2_WIDTH),
                    .S_DATA3_WIDTH      (S_DATA3_WIDTH),
                    .S_DATA4_WIDTH      (S_DATA4_WIDTH),
                    .S_DATA5_WIDTH      (S_DATA5_WIDTH),
                    .S_DATA6_WIDTH      (S_DATA6_WIDTH),
                    .S_DATA7_WIDTH      (S_DATA7_WIDTH),
                    .S_DATA8_WIDTH      (S_DATA8_WIDTH),
                    .S_DATA9_WIDTH      (S_DATA9_WIDTH),
                    .M_DATA0_WIDTH      (M_DATA0_WIDTH),
                    .M_DATA1_WIDTH      (M_DATA1_WIDTH),
                    .M_DATA2_WIDTH      (M_DATA2_WIDTH),
                    .M_DATA3_WIDTH      (M_DATA3_WIDTH),
                    .M_DATA4_WIDTH      (M_DATA4_WIDTH),
                    .M_DATA5_WIDTH      (M_DATA5_WIDTH),
                    .M_DATA6_WIDTH      (M_DATA6_WIDTH),
                    .M_DATA7_WIDTH      (M_DATA7_WIDTH),
                    .M_DATA8_WIDTH      (M_DATA8_WIDTH),
                    .M_DATA9_WIDTH      (M_DATA9_WIDTH),
                    .HAS_FIRST          (HAS_FIRST),
                    .HAS_LAST           (HAS_LAST),
                    .AUTO_FIRST         (AUTO_FIRST),
                    .HAS_ALIGN_S        (HAS_ALIGN_S),
                    .HAS_ALIGN_M        (HAS_ALIGN_M),
                    .FIRST_OVERWRITE    (FIRST_OVERWRITE),
                    .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                    .ALIGN_S_WIDTH      (ALIGN_S_WIDTH),
                    .ALIGN_M_WIDTH      (ALIGN_M_WIDTH),
                    .USER_F_WIDTH       (USER_F_WIDTH),
                    .USER_L_WIDTH       (USER_L_WIDTH),
                    .S_REGS             (CONVERT_S_REGS)
                )
            i_stream_width_convert_pack
                (
                    .reset              (m_reset),
                    .clk                (m_clk),
                    .cke                (1'b1),
                    
                    .endian             (endian),
                    
                    .padding0           (padding0),
                    .padding1           (padding1),
                    .padding2           (padding2),
                    .padding3           (padding3),
                    .padding4           (padding4),
                    .padding5           (padding5),
                    .padding6           (padding6),
                    .padding7           (padding7),
                    .padding8           (padding8),
                    .padding9           (padding9),
                    
                    .s_align_s          (fifo_align_s),
                    .s_align_m          (fifo_align_m),
                    .s_first            (HAS_FIRST ? fifo_first : 1'b0),
                    .s_last             (HAS_LAST  ? fifo_last  : 1'b0),
                    .s_data0            (fifo_data0),
                    .s_data1            (fifo_data1),
                    .s_data2            (fifo_data2),
                    .s_data3            (fifo_data3),
                    .s_data4            (fifo_data4),
                    .s_data5            (fifo_data5),
                    .s_data6            (fifo_data6),
                    .s_data7            (fifo_data7),
                    .s_data8            (fifo_data8),
                    .s_data9            (fifo_data9),
                    .s_user_f           (fifo_user_f),
                    .s_user_l           (fifo_user_l),
                    .s_valid            (fifo_valid),
                    .s_ready            (fifo_ready),
                    
                    .m_first            (m_first),
                    .m_last             (m_last),
                    .m_data0            (m_data0),
                    .m_data1            (m_data1),
                    .m_data2            (m_data2),
                    .m_data3            (m_data3),
                    .m_data4            (m_data4),
                    .m_data5            (m_data5),
                    .m_data6            (m_data6),
                    .m_data7            (m_data7),
                    .m_data8            (m_data8),
                    .m_data9            (m_data9),
                    .m_user_f           (m_user_f),
                    .m_user_l           (m_user_l),
                    .m_valid            (m_valid),
                    .m_ready            (m_ready)
                );
        
        assign s_fifo_wr_signal = (s_valid   & s_ready);
        assign m_fifo_rd_signal = (fifo_valid & fifo_ready);
    end
    else begin : pre_convert
        // convert
        wire                        conv_first;
        wire                        conv_last;
        wire    [M_DATA0_BITS-1:0]  conv_data0;
        wire    [M_DATA1_BITS-1:0]  conv_data1;
        wire    [M_DATA2_BITS-1:0]  conv_data2;
        wire    [M_DATA3_BITS-1:0]  conv_data3;
        wire    [M_DATA4_BITS-1:0]  conv_data4;
        wire    [M_DATA5_BITS-1:0]  conv_data5;
        wire    [M_DATA6_BITS-1:0]  conv_data6;
        wire    [M_DATA7_BITS-1:0]  conv_data7;
        wire    [M_DATA8_BITS-1:0]  conv_data8;
        wire    [M_DATA9_BITS-1:0]  conv_data9;
        wire    [USER_F_BITS-1:0]   conv_user_f;
        wire    [USER_L_BITS-1:0]   conv_user_l;
        wire                        conv_valid;
        wire                        conv_ready;
        jelly_stream_width_convert_pack
                #(
                    .S_NUM              (S_NUM),
                    .M_NUM              (M_NUM),
                    .UNIT0_WIDTH        (UNIT0_WIDTH),
                    .UNIT1_WIDTH        (UNIT1_WIDTH),
                    .UNIT2_WIDTH        (UNIT2_WIDTH),
                    .UNIT3_WIDTH        (UNIT3_WIDTH),
                    .UNIT4_WIDTH        (UNIT4_WIDTH),
                    .UNIT5_WIDTH        (UNIT5_WIDTH),
                    .UNIT6_WIDTH        (UNIT6_WIDTH),
                    .UNIT7_WIDTH        (UNIT7_WIDTH),
                    .UNIT8_WIDTH        (UNIT8_WIDTH),
                    .UNIT9_WIDTH        (UNIT9_WIDTH),
                    .S_DATA0_WIDTH      (S_DATA0_WIDTH),
                    .S_DATA1_WIDTH      (S_DATA1_WIDTH),
                    .S_DATA2_WIDTH      (S_DATA2_WIDTH),
                    .S_DATA3_WIDTH      (S_DATA3_WIDTH),
                    .S_DATA4_WIDTH      (S_DATA4_WIDTH),
                    .S_DATA5_WIDTH      (S_DATA5_WIDTH),
                    .S_DATA6_WIDTH      (S_DATA6_WIDTH),
                    .S_DATA7_WIDTH      (S_DATA7_WIDTH),
                    .S_DATA8_WIDTH      (S_DATA8_WIDTH),
                    .S_DATA9_WIDTH      (S_DATA9_WIDTH),
                    .M_DATA0_WIDTH      (M_DATA0_WIDTH),
                    .M_DATA1_WIDTH      (M_DATA1_WIDTH),
                    .M_DATA2_WIDTH      (M_DATA2_WIDTH),
                    .M_DATA3_WIDTH      (M_DATA3_WIDTH),
                    .M_DATA4_WIDTH      (M_DATA4_WIDTH),
                    .M_DATA5_WIDTH      (M_DATA5_WIDTH),
                    .M_DATA6_WIDTH      (M_DATA6_WIDTH),
                    .M_DATA7_WIDTH      (M_DATA7_WIDTH),
                    .M_DATA8_WIDTH      (M_DATA8_WIDTH),
                    .M_DATA9_WIDTH      (M_DATA9_WIDTH),
                    .HAS_FIRST          (HAS_FIRST),
                    .HAS_LAST           (HAS_LAST),
                    .AUTO_FIRST         (AUTO_FIRST),
                    .HAS_ALIGN_S        (HAS_ALIGN_S),
                    .HAS_ALIGN_M        (HAS_ALIGN_M),
                    .FIRST_OVERWRITE    (FIRST_OVERWRITE),
                    .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                    .ALIGN_S_WIDTH      (ALIGN_S_WIDTH),
                    .ALIGN_M_WIDTH      (ALIGN_M_WIDTH),
                    .USER_F_WIDTH       (USER_F_WIDTH),
                    .USER_L_WIDTH       (USER_L_WIDTH),
                    .S_REGS             (CONVERT_S_REGS)
                )
            i_stream_width_convert_pack
                (
                    .reset              (s_reset),
                    .clk                (s_clk),
                    .cke                (1'b1),
                    
                    .endian             (endian),
                    
                    .padding0           (padding0),
                    .padding1           (padding1),
                    .padding2           (padding2),
                    .padding3           (padding3),
                    .padding4           (padding4),
                    .padding5           (padding5),
                    .padding6           (padding6),
                    .padding7           (padding7),
                    .padding8           (padding8),
                    .padding9           (padding9),
                    
                    .s_align_s          (s_align_s),
                    .s_align_m          (s_align_m),
                    .s_first            (HAS_FIRST ? s_first : 1'b0),
                    .s_last             (HAS_LAST  ? s_last  : 1'b0),
                    .s_data0            (s_data0),
                    .s_data1            (s_data1),
                    .s_data2            (s_data2),
                    .s_data3            (s_data3),
                    .s_data4            (s_data4),
                    .s_data5            (s_data5),
                    .s_data6            (s_data6),
                    .s_data7            (s_data7),
                    .s_data8            (s_data8),
                    .s_data9            (s_data9),
                    .s_user_f           (s_user_f),
                    .s_user_l           (s_user_l),
                    .s_valid            (s_valid),
                    .s_ready            (s_ready),
                    
                    .m_first            (conv_first),
                    .m_last             (conv_last),
                    .m_data0            (conv_data0),
                    .m_data1            (conv_data1),
                    .m_data2            (conv_data2),
                    .m_data3            (conv_data3),
                    .m_data4            (conv_data4),
                    .m_data5            (conv_data5),
                    .m_data6            (conv_data6),
                    .m_data7            (conv_data7),
                    .m_data8            (conv_data8),
                    .m_data9            (conv_data9),
                    .m_user_f           (conv_user_f),
                    .m_user_l           (conv_user_l),
                    .m_valid            (conv_valid),
                    .m_ready            (conv_ready)
                );
        
        // FIFO
        wire    [M_PACK_BITS-1:0]   conv_pack;
        wire    [M_CTLS_BITS-1:0]   conv_ctls;
        jelly_func_pack
                #(
                    .W0                 (M_DATA0_WIDTH),
                    .W1                 (M_DATA1_WIDTH),
                    .W2                 (M_DATA2_WIDTH),
                    .W3                 (M_DATA3_WIDTH),
                    .W4                 (M_DATA4_WIDTH),
                    .W5                 (M_DATA5_WIDTH),
                    .W6                 (M_DATA6_WIDTH),
                    .W7                 (M_DATA7_WIDTH),
                    .W8                 (M_DATA8_WIDTH),
                    .W9                 (M_DATA9_WIDTH)
                )
            jelly_func_pack_data
                (
                    .in0                (conv_data0),
                    .in1                (conv_data1),
                    .in2                (conv_data2),
                    .in3                (conv_data3),
                    .in4                (conv_data4),
                    .in5                (conv_data5),
                    .in6                (conv_data6),
                    .in7                (conv_data7),
                    .in8                (conv_data8),
                    .in9                (conv_data9),
                    .out                (conv_pack)
                );
        
        jelly_func_pack
                #(
                    .W0                 (HAS_FIRST   ? 1 : 0),
                    .W1                 (HAS_LAST    ? 1 : 0),
                    .W2                 (USER_F_WIDTH),
                    .W3                 (USER_L_WIDTH)
                )
            jelly_func_pack_ctls
                (
                    .in0                (conv_first),
                    .in1                (conv_last),
                    .in2                (conv_user_f),
                    .in3                (conv_user_l),
                    .out                (conv_ctls)
                );
        
        wire    [M_PACK_BITS-1:0]   m_pack;
        wire    [M_CTLS_BITS-1:0]   m_ctls;
        jelly_fifo_pack
                #(
                    .ASYNC              (ASYNC),
                    .DATA0_WIDTH        (M_PACK_WIDTH),
                    .DATA1_WIDTH        (M_CTLS_WIDTH),
                    .PTR_WIDTH          (FIFO_PTR_WIDTH),
                    .DOUT_REGS          (FIFO_DOUT_REGS),
                    .RAM_TYPE           (FIFO_RAM_TYPE),
                    .LOW_DEALY          (FIFO_LOW_DEALY),
                    .S_REGS             (FIFO_S_REGS),
                    .M_REGS             (FIFO_M_REGS)
                )
            i_fifo_pack
                (
                    .s_reset            (s_reset),
                    .s_clk              (s_clk),
                    .s_data0            (conv_pack),
                    .s_data1            (conv_ctls),
                    .s_valid            (conv_valid),
                    .s_ready            (conv_ready),
                    .s_free_count       (s_fifo_free_count),
                    
                    .m_reset            (m_reset),
                    .m_clk              (m_clk),
                    .m_data0            (m_pack),
                    .m_data1            (m_ctls),
                    .m_valid            (m_valid),
                    .m_ready            (m_ready),
                    .m_data_count       (m_fifo_data_count)
                );
        
        wire    [M_DATA0_BITS-1:0]  fifo_data0;
        wire    [M_DATA1_BITS-1:0]  fifo_data1;
        wire    [M_DATA2_BITS-1:0]  fifo_data2;
        wire    [M_DATA3_BITS-1:0]  fifo_data3;
        wire    [M_DATA4_BITS-1:0]  fifo_data4;
        wire    [M_DATA5_BITS-1:0]  fifo_data5;
        wire    [M_DATA6_BITS-1:0]  fifo_data6;
        wire    [M_DATA7_BITS-1:0]  fifo_data7;
        wire    [M_DATA8_BITS-1:0]  fifo_data8;
        wire    [M_DATA9_BITS-1:0]  fifo_data9;
        
        wire    [ALIGN_S_WIDTH-1:0] fifo_align_s;
        wire    [ALIGN_M_WIDTH-1:0] fifo_align_m;
        wire                        fifo_first;
        wire                        fifo_last;
        wire    [USER_F_BITS-1:0]   fifo_user_f;
        wire    [USER_L_BITS-1:0]   fifo_user_l;
        
        jelly_func_unpack
                #(
                    .W0                 (M_DATA0_WIDTH),
                    .W1                 (M_DATA1_WIDTH),
                    .W2                 (M_DATA2_WIDTH),
                    .W3                 (M_DATA3_WIDTH),
                    .W4                 (M_DATA4_WIDTH),
                    .W5                 (M_DATA5_WIDTH),
                    .W6                 (M_DATA6_WIDTH),
                    .W7                 (M_DATA7_WIDTH),
                    .W8                 (M_DATA8_WIDTH),
                    .W9                 (M_DATA9_WIDTH)
                )
            jelly_func_unpack_data
                (
                    .in                 (m_pack),
                    .out0               (m_data0),
                    .out1               (m_data1),
                    .out2               (m_data2),
                    .out3               (m_data3),
                    .out4               (m_data4),
                    .out5               (m_data5),
                    .out6               (m_data6),
                    .out7               (m_data7),
                    .out8               (m_data8),
                    .out9               (m_data9)
                );
        
        jelly_func_unpack
                #(
                    .W0                 (HAS_FIRST ? 1 : 0),
                    .W1                 (HAS_LAST  ? 1 : 0),
                    .W2                 (USER_F_WIDTH),
                    .W3                 (USER_L_WIDTH)
                )
            jelly_func_unpack_ctls
                (
                    .in                 (m_ctls),
                    .out0               (m_first),
                    .out1               (m_last),
                    .out2               (m_user_f),
                    .out3               (m_user_l)
                );
        
        assign s_fifo_wr_signal = (conv_valid & conv_ready);
        assign m_fifo_rd_signal = (m_valid    & m_ready);
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
