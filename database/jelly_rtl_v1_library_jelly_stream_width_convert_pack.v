// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_stream_width_convert_pack
        #(
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
            parameter S_REGS              = (S_NUM != M_NUM),
            
            
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
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
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
            input   wire    [USER_F_BITS-1:0]   s_user_f,   // アライメント先頭前提で伝搬するユーザーデータ
            input   wire    [USER_L_BITS-1:0]   s_user_l,   // アライメント末尾前提で伝搬するユーザーデータ
            input   wire                        s_valid,
            output  wire                        s_ready,
            
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
            input   wire                        m_ready
        );
    
    // pack/unpack
    localparam PACK_UNIT    = UNIT0_WIDTH
                            + UNIT1_WIDTH
                            + UNIT2_WIDTH
                            + UNIT3_WIDTH
                            + UNIT4_WIDTH
                            + UNIT5_WIDTH
                            + UNIT6_WIDTH
                            + UNIT7_WIDTH
                            + UNIT8_WIDTH
                            + UNIT9_WIDTH;
    
    localparam S_PACK_WIDTH = S_NUM * PACK_UNIT;
    localparam M_PACK_WIDTH = M_NUM * PACK_UNIT;
    localparam S_PACK_BITS  = S_PACK_WIDTH > 0 ? S_PACK_WIDTH : 1;
    localparam M_PACK_BITS  = M_PACK_WIDTH > 0 ? M_PACK_WIDTH : 1;
    
    wire    [M_PACK_BITS-1:0]   m_pack;
    wire    [S_PACK_BITS-1:0]   s_pack;
    
    jelly_func_pack
            #(
                .N          (S_NUM),
                .W0         (UNIT0_WIDTH),
                .W1         (UNIT1_WIDTH),
                .W2         (UNIT2_WIDTH),
                .W3         (UNIT3_WIDTH),
                .W4         (UNIT4_WIDTH),
                .W5         (UNIT5_WIDTH),
                .W6         (UNIT6_WIDTH),
                .W7         (UNIT7_WIDTH),
                .W8         (UNIT8_WIDTH),
                .W9         (UNIT9_WIDTH)
            )
        i_func_pack
            (
                .in0        (s_data0),
                .in1        (s_data1),
                .in2        (s_data2),
                .in3        (s_data3),
                .in4        (s_data4),
                .in5        (s_data5),
                .in6        (s_data6),
                .in7        (s_data7),
                .in8        (s_data8),
                .in9        (s_data9),
                .out        (s_pack)
            );
    
    jelly_func_unpack
            #(
                .N          (M_NUM),
                .W0         (UNIT0_WIDTH),
                .W1         (UNIT1_WIDTH),
                .W2         (UNIT2_WIDTH),
                .W3         (UNIT3_WIDTH),
                .W4         (UNIT4_WIDTH),
                .W5         (UNIT5_WIDTH),
                .W6         (UNIT6_WIDTH),
                .W7         (UNIT7_WIDTH),
                .W8         (UNIT8_WIDTH),
                .W9         (UNIT9_WIDTH)
            )
        i_func_unpack
            (
                .in         (m_pack),
                .out0       (m_data0),
                .out1       (m_data1),
                .out2       (m_data2),
                .out3       (m_data3),
                .out4       (m_data4),
                .out5       (m_data5),
                .out6       (m_data6),
                .out7       (m_data7),
                .out8       (m_data8),
                .out9       (m_data9)
            );
    
    
    localparam  PADDING_WIDTH  = PACK_UNIT;
    localparam  PADDING_BITS   = PADDING_WIDTH  > 0 ? PADDING_WIDTH  : 1;
    
    wire    [PADDING_BITS-1:0]  padding_pack;
    jelly_func_pack
            #(
                .N                  (1),
                .W0                 (UNIT0_WIDTH),
                .W1                 (UNIT1_WIDTH),
                .W2                 (UNIT2_WIDTH),
                .W3                 (UNIT3_WIDTH),
                .W4                 (UNIT4_WIDTH),
                .W5                 (UNIT5_WIDTH),
                .W6                 (UNIT6_WIDTH),
                .W7                 (UNIT7_WIDTH),
                .W8                 (UNIT8_WIDTH),
                .W9                 (UNIT9_WIDTH)
            )
        i_func_pack_padding
            (
                .in0                (padding0),
                .in1                (padding1),
                .in2                (padding2),
                .in3                (padding3),
                .in4                (padding4),
                .in5                (padding5),
                .in6                (padding6),
                .in7                (padding7),
                .in8                (padding8),
                .in9                (padding9),
                .out                (padding_pack)
            );
    
    
    // packing
    jelly_stream_width_convert
            #(
                .UNIT_WIDTH         (PACK_UNIT),
                .S_NUM              (S_NUM),
                .M_NUM              (M_NUM),
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
                .S_REGS             (S_REGS)
            )
        i_stream_width_convert
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .endian             (endian),
                .padding            (padding_pack),
                
                .s_align_s          (s_align_s),
                .s_align_m          (s_align_m),
                .s_first            (s_first),
                .s_last             (s_last),
                .s_data             (s_pack),
                .s_user_f           (s_user_f),
                .s_user_l           (s_user_l),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_first            (m_first),
                .m_last             (m_last),
                .m_data             (m_pack),
                .m_user_f           (m_user_f),
                .m_user_l           (m_user_l),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
