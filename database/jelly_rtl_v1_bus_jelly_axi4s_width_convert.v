// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4s_width_convert
        #(
            parameter HAS_STRB         = 1,
            parameter HAS_KEEP         = 0,
            parameter HAS_FIRST        = 0,
            parameter HAS_LAST         = 1,
            parameter HAS_ALIGN_S      = 0,  // slave 側のアライメントを指定する
            parameter HAS_ALIGN_M      = 0,  // master 側のアライメントを指定する
            
            parameter BYTE_WIDTH       = 8,
            parameter S_TDATA_WIDTH    = 32,
            parameter M_TDATA_WIDTH    = 64,
            parameter S_TUSER_WIDTH    = 0,
            
            parameter AUTO_FIRST       = (HAS_LAST & !HAS_FIRST),    // last の次を自動的に first とする
            parameter FIRST_OVERWRITE  = 0,  // first時前方に残変換があれば吐き出さずに上書き
            parameter FIRST_FORCE_LAST = 0,  // first時前方に残変換があれば強制的にlastを付与(残が無い場合はlastはつかない)
            parameter ALIGN_S_WIDTH    = S_TDATA_WIDTH / BYTE_WIDTH <=   2 ? 1 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <=   4 ? 2 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <=   8 ? 3 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <=  16 ? 4 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <=  32 ? 5 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <=  64 ? 6 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <= 128 ? 7 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <= 256 ? 8 :
                                         S_TDATA_WIDTH / BYTE_WIDTH <= 512 ? 9 : 10,
            parameter ALIGN_M_WIDTH    = M_TDATA_WIDTH / BYTE_WIDTH <=   2 ? 1 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <=   4 ? 2 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <=   8 ? 3 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <=  16 ? 4 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <=  32 ? 5 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <=  64 ? 6 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <= 128 ? 7 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <= 256 ? 8 :
                                         M_TDATA_WIDTH / BYTE_WIDTH <= 512 ? 9 : 10,
            
            parameter S_REGS           = 1,
            
            
            // local
            parameter S_TSTRB_WIDTH    = S_TDATA_WIDTH / BYTE_WIDTH,
            parameter S_TKEEP_WIDTH    = S_TDATA_WIDTH / BYTE_WIDTH,
            parameter M_TSTRB_WIDTH    = M_TDATA_WIDTH / BYTE_WIDTH,
            parameter M_TKEEP_WIDTH    = M_TDATA_WIDTH / BYTE_WIDTH,
            parameter M_TUSER_WIDTH    = S_TUSER_WIDTH * M_TDATA_WIDTH / S_TDATA_WIDTH,
            
            parameter S_TDATA_BITS     = S_TDATA_WIDTH > 0 ? S_TDATA_WIDTH : 1,
            parameter S_TSTRB_BITS     = S_TSTRB_WIDTH > 0 ? S_TSTRB_WIDTH : 1,
            parameter S_TKEEP_BITS     = S_TKEEP_WIDTH > 0 ? S_TKEEP_WIDTH : 1,
            parameter S_TUSER_BITS     = S_TUSER_WIDTH > 0 ? S_TUSER_WIDTH : 1,
            parameter M_TDATA_BITS     = M_TDATA_WIDTH > 0 ? M_TDATA_WIDTH : 1,
            parameter M_TSTRB_BITS     = M_TSTRB_WIDTH > 0 ? M_TSTRB_WIDTH : 1,
            parameter M_TKEEP_BITS     = M_TKEEP_WIDTH > 0 ? M_TKEEP_WIDTH : 1,
            parameter M_TUSER_BITS     = M_TUSER_WIDTH > 0 ? M_TUSER_WIDTH : 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        endian,
            
            input   wire    [ALIGN_S_WIDTH-1:0] s_align_s,
            input   wire    [ALIGN_M_WIDTH-1:0] s_align_m,
            input   wire    [S_TDATA_BITS-1:0]  s_axi4s_tdata,
            input   wire    [S_TSTRB_BITS-1:0]  s_axi4s_tstrb,
            input   wire    [S_TKEEP_BITS-1:0]  s_axi4s_tkeep,
            input   wire                        s_axi4s_tfirst,
            input   wire                        s_axi4s_tlast,
            input   wire    [S_TUSER_BITS-1:0]  s_axi4s_tuser,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            
            output  wire    [M_TDATA_BITS-1:0]  m_axi4s_tdata,
            output  wire    [M_TSTRB_BITS-1:0]  m_axi4s_tstrb,
            output  wire    [M_TKEEP_BITS-1:0]  m_axi4s_tkeep,
            output  wire                        m_axi4s_tfirst,
            output  wire                        m_axi4s_tlast,
            output  wire    [M_TUSER_BITS-1:0]  m_axi4s_tuser,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready
        );
    
    
    localparam  S_NUM       = S_TDATA_WIDTH / BYTE_WIDTH;
    localparam  M_NUM       = M_TDATA_WIDTH / BYTE_WIDTH;
    
    localparam  DATA_WIDTH  = S_TDATA_WIDTH / S_NUM;
    localparam  STRB_WIDTH  = HAS_STRB ? (S_TSTRB_WIDTH / S_NUM) : 0;
    localparam  KEEP_WIDTH  = HAS_KEEP ? (S_TKEEP_WIDTH / S_NUM) : 0;
    localparam  USER_WIDTH  = S_TUSER_WIDTH / S_NUM;
    
    localparam  DATA_BITS   = DATA_WIDTH > 0 ? DATA_WIDTH : 1;
    localparam  STRB_BITS   = STRB_WIDTH > 0 ? STRB_WIDTH : 1;
    localparam  KEEP_BITS   = KEEP_WIDTH > 0 ? KEEP_WIDTH : 1;
    localparam  USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    localparam  S_DATA_BITS = S_NUM * DATA_WIDTH > 0 ? S_NUM * DATA_WIDTH : 1;
    localparam  S_STRB_BITS = S_NUM * STRB_WIDTH > 0 ? S_NUM * STRB_WIDTH : 1;
    localparam  S_KEEP_BITS = S_NUM * KEEP_WIDTH > 0 ? S_NUM * KEEP_WIDTH : 1;
    localparam  S_USER_BITS = S_NUM * USER_WIDTH > 0 ? S_NUM * USER_WIDTH : 1;
    
    localparam  M_DATA_BITS = S_NUM * DATA_WIDTH > 0 ? M_NUM * DATA_WIDTH : 1;
    localparam  M_STRB_BITS = S_NUM * STRB_WIDTH > 0 ? M_NUM * STRB_WIDTH : 1;
    localparam  M_KEEP_BITS = S_NUM * KEEP_WIDTH > 0 ? M_NUM * KEEP_WIDTH : 1;
    localparam  M_USER_BITS = S_NUM * USER_WIDTH > 0 ? M_NUM * USER_WIDTH : 1;
    
    
    // UNALIGN を許可しない時はフラグだけスルーさせる
    wire                        s_conv_tfirst;
    wire                        s_conv_tlast;
    wire    [S_DATA_BITS-1:0]   s_conv_tdata;
    wire    [S_STRB_BITS-1:0]   s_conv_tstrb;
    wire    [S_KEEP_BITS-1:0]   s_conv_tkeep;
    wire    [S_USER_BITS-1:0]   s_conv_tuser;
    wire                        s_conv_tvalid;
    wire                        s_conv_tready;
    
    wire                        m_conv_tfirst;
    wire                        m_conv_tlast;
    wire    [M_DATA_BITS-1:0]   m_conv_tdata;
    wire    [M_STRB_BITS-1:0]   m_conv_tstrb;
    wire    [M_KEEP_BITS-1:0]   m_conv_tkeep;
    wire    [M_USER_BITS-1:0]   m_conv_tuser;
    wire                        m_conv_tvalid;
    wire                        m_conv_tready;
    
    jelly_stream_width_convert_pack
            #(
                .S_NUM              (S_NUM),
                .M_NUM              (M_NUM),
                .UNIT0_WIDTH        (DATA_WIDTH),
                .UNIT1_WIDTH        (STRB_WIDTH),
                .UNIT2_WIDTH        (KEEP_WIDTH),
                .UNIT3_WIDTH        (USER_WIDTH),
                
                .HAS_FIRST          (HAS_FIRST),
                .HAS_LAST           (HAS_LAST),
                .AUTO_FIRST         (AUTO_FIRST),
                .HAS_ALIGN_S        (HAS_ALIGN_S),
                .HAS_ALIGN_M        (HAS_ALIGN_M),
                .FIRST_OVERWRITE    (FIRST_OVERWRITE),
                .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                .ALIGN_S_WIDTH      (ALIGN_S_WIDTH),
                .ALIGN_M_WIDTH      (ALIGN_M_WIDTH),
                .USER_F_WIDTH       (0),
                .USER_L_WIDTH       (0),
                .S_REGS             (S_REGS)
            )
        i_stream_width_convert_pack
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (aclken),
                
                .endian             (endian),
                
                .padding0           ({DATA_BITS{1'bx}}),
                .padding1           ({STRB_BITS{1'b0}}),
                .padding2           ({KEEP_BITS{1'b0}}),
                .padding3           ({USER_BITS{1'bx}}),
                
                .s_align_s          (s_align_s),
                .s_align_m          (s_align_m),
                .s_first            (s_conv_tfirst),
                .s_last             (s_conv_tlast),
                .s_data0            (s_conv_tdata),
                .s_data1            (s_conv_tstrb),
                .s_data2            (s_conv_tkeep),
                .s_data3            (s_conv_tuser),
                .s_user_f           (1'b0),
                .s_user_l           (1'b0),
                .s_valid            (s_conv_tvalid),
                .s_ready            (s_conv_tready),
                
                .m_first            (m_conv_tfirst),
                .m_last             (m_conv_tlast),
                .m_data0            (m_conv_tdata),
                .m_data1            (m_conv_tstrb),
                .m_data2            (m_conv_tkeep),
                .m_data3            (m_conv_tuser),
                .m_user_f           (),
                .m_user_l           (),
                .m_valid            (m_conv_tvalid),
                .m_ready            (m_conv_tready)
            );
    
    assign s_conv_tfirst  = HAS_FIRST ? s_axi4s_tfirst : 1'b0;
    assign s_conv_tlast   = HAS_LAST  ? s_axi4s_tlast  : 1'b0;
    assign s_conv_tdata   = s_axi4s_tdata;
    assign s_conv_tstrb   = HAS_STRB  ? s_axi4s_tstrb  : 1'b1;
    assign s_conv_tkeep   = HAS_KEEP  ? s_axi4s_tkeep  : 1'b1;
    assign s_conv_tuser   = s_axi4s_tuser;
    assign s_conv_tvalid  = s_axi4s_tvalid;
    assign s_axi4s_tready = s_conv_tready;
    
    assign m_axi4s_tfirst = HAS_FIRST ? m_conv_tfirst : 1'b0;
    assign m_axi4s_tlast  = HAS_LAST  ? m_conv_tlast  : 1'b0;
    assign m_axi4s_tdata  = m_conv_tdata;
    assign m_axi4s_tstrb  = HAS_STRB  ? m_conv_tstrb : {M_TSTRB_BITS{1'b1}};
    assign m_axi4s_tkeep  = HAS_KEEP  ? m_conv_tkeep : {M_TKEEP_BITS{1'b1}};
    assign m_axi4s_tuser  = m_conv_tuser;
    assign m_axi4s_tvalid = m_conv_tvalid;
    assign m_conv_tready  = m_axi4s_tready;
    
    
endmodule


`default_nettype wire


// end of file
