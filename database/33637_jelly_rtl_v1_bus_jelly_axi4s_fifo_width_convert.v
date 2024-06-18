// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4s_fifo_width_convert
        #(
            parameter ASYNC            = 1,
            parameter FIFO_PTR_WIDTH   = 9,
            parameter FIFO_RAM_TYPE    = "block",
            parameter FIFO_LOW_DEALY   = 0,
            parameter FIFO_DOUT_REGS   = 1,
            parameter FIFO_S_REGS      = 1,
            parameter FIFO_M_REGS      = 1,
            
            parameter HAS_STRB         = 0,
            parameter HAS_KEEP         = 0,
            parameter HAS_FIRST        = 0,
            parameter HAS_LAST         = 0,
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
            
            
            parameter CONVERT_S_REGS   = 1,
            
            parameter POST_CONVERT     = (M_TDATA_WIDTH < S_TDATA_WIDTH),
            
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
            input   wire                        endian,
            
            input   wire                        s_aresetn,
            input   wire                        s_aclk,
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
            output  wire    [FIFO_PTR_WIDTH:0]  fifo_free_count,
            output  wire                        fifo_wr_signal,
            
            
            input   wire                        m_aresetn,
            input   wire                        m_aclk,
            output  wire    [M_TDATA_BITS-1:0]  m_axi4s_tdata,
            output  wire    [M_TSTRB_BITS-1:0]  m_axi4s_tstrb,
            output  wire    [M_TKEEP_BITS-1:0]  m_axi4s_tkeep,
            output  wire                        m_axi4s_tfirst,
            output  wire                        m_axi4s_tlast,
            output  wire    [M_TUSER_BITS-1:0]  m_axi4s_tuser,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready,
            output  wire    [FIFO_PTR_WIDTH:0]  fifo_data_count,
            output  wire                        fifo_rd_signal
        );
    
    localparam ALIGN_S_BITS = HAS_ALIGN_S ? ALIGN_S_WIDTH : 1;
    localparam ALIGN_M_BITS = HAS_ALIGN_M ? ALIGN_M_WIDTH : 1;
    
    localparam S_PACK_WIDTH = (HAS_ALIGN_S ? ALIGN_S_WIDTH : 0)
                            + (HAS_ALIGN_M ? ALIGN_M_WIDTH : 0)
                            + S_TUSER_WIDTH;
    localparam S_PACK_BITS  = S_PACK_WIDTH > 0 ? S_PACK_WIDTH : 1;
    
    generate
    if ( POST_CONVERT ) begin : blk_post_cnv
        
        // FIFO
        wire    [ALIGN_S_BITS-1:0]      fifo_align_s;
        wire    [ALIGN_M_BITS-1:0]      fifo_align_m;
        wire    [S_TUSER_BITS-1:0]      fifo_tuser;
        wire                            fifo_tfirst;
        wire                            fifo_tlast;
        wire    [S_TSTRB_BITS-1:0]      fifo_tkeep;
        wire    [S_TSTRB_BITS-1:0]      fifo_tstrb;
        wire    [S_TDATA_BITS-1:0]      fifo_tdata;
        wire                            fifo_tvalid;
        wire                            fifo_tready;
        
        // pack
        wire    [S_PACK_BITS-1:0]       s_pack;
        wire    [ALIGN_S_BITS-1:0]      s_align_s_pack = HAS_ALIGN_S ? s_align_s : 1'b0;
        wire    [ALIGN_M_BITS-1:0]      s_align_m_pack = HAS_ALIGN_M ? s_align_m : 1'b0;
        jelly_func_pack
                #(
                    .W0                 (HAS_ALIGN_S ? ALIGN_S_WIDTH : 0),
                    .W1                 (HAS_ALIGN_M ? ALIGN_M_WIDTH : 0),
                    .W2                 (S_TUSER_WIDTH)
                )
            i_func_pack
                (
                    .in0                (s_align_s_pack),
                    .in1                (s_align_m_pack),
                    .in2                (s_axi4s_tuser),
                    .out                (s_pack)
                );
        
        // unpack
        wire    [S_PACK_BITS-1:0]       fifo_pack;
        jelly_func_unpack
                #(
                    .W0                 (HAS_ALIGN_S ? ALIGN_S_WIDTH : 0),
                    .W1                 (HAS_ALIGN_M ? ALIGN_M_WIDTH : 0),
                    .W2                 (S_TUSER_WIDTH)
                )
            i_func_unpack
                (
                    .in                 (fifo_pack),
                    .out0               (fifo_align_s),
                    .out1               (fifo_align_m),
                    .out2               (fifo_tuser)
                );
        
        // fifo
        jelly_axi4s_fifo
                #(
                    .ASYNC              (ASYNC),
                    .HAS_FIRST          (HAS_FIRST),
                    .HAS_LAST           (HAS_LAST),
                    .HAS_STRB           (HAS_STRB),
                    .HAS_KEEP           (HAS_KEEP),
                    
                    .BYTE_WIDTH         (BYTE_WIDTH),
                    .TUSER_WIDTH        (S_PACK_WIDTH),
                    .TDATA_WIDTH        (S_TDATA_WIDTH),
                    .TSTRB_WIDTH        (S_TSTRB_WIDTH),
                    .TKEEP_WIDTH        (S_TKEEP_WIDTH),
                    
                    .PTR_WIDTH          (FIFO_PTR_WIDTH),
                    .RAM_TYPE           (FIFO_RAM_TYPE),
                    .LOW_DEALY          (FIFO_LOW_DEALY),
                    .DOUT_REGS          (FIFO_DOUT_REGS),
                    .S_REGS             (FIFO_S_REGS),
                    .M_REGS             (FIFO_M_REGS)
                )
            i_axi4s_fifo
                (
                    .s_aresetn          (s_aresetn),
                    .s_aclk             (s_aclk),
                    .s_axi4s_tfirst     (s_axi4s_tfirst),
                    .s_axi4s_tlast      (s_axi4s_tlast),
                    .s_axi4s_tuser      (s_pack),
                    .s_axi4s_tstrb      (s_axi4s_tstrb),
                    .s_axi4s_tkeep      (s_axi4s_tkeep),
                    .s_axi4s_tdata      (s_axi4s_tdata),
                    .s_axi4s_tvalid     (s_axi4s_tvalid),
                    .s_axi4s_tready     (s_axi4s_tready),
                    .s_free_count       (fifo_free_count),
                    
                    .m_aresetn          (m_aresetn),
                    .m_aclk             (m_aclk),
                    .m_axi4s_tuser      (fifo_pack),
                    .m_axi4s_tfirst     (fifo_tfirst),
                    .m_axi4s_tlast      (fifo_tlast),
                    .m_axi4s_tstrb      (fifo_tstrb),
                    .m_axi4s_tkeep      (fifo_tkeep),
                    .m_axi4s_tdata      (fifo_tdata),
                    .m_axi4s_tvalid     (fifo_tvalid),
                    .m_axi4s_tready     (fifo_tready),
                    .m_data_count       (fifo_data_count)
                );
        
        // width convert
        jelly_axi4s_width_convert
                #(
                    .HAS_STRB           (HAS_STRB),
                    .HAS_KEEP           (HAS_KEEP),
                    .HAS_FIRST          (HAS_FIRST),
                    .HAS_LAST           (HAS_LAST),
                    .HAS_ALIGN_S        (HAS_ALIGN_S),
                    .HAS_ALIGN_M        (HAS_ALIGN_M),
                    .BYTE_WIDTH         (BYTE_WIDTH),
                    .S_TDATA_WIDTH      (S_TDATA_WIDTH),
                    .M_TDATA_WIDTH      (M_TDATA_WIDTH),
                    .S_TSTRB_WIDTH      (S_TSTRB_WIDTH),
                    .S_TKEEP_WIDTH      (S_TKEEP_WIDTH),
                    .S_TUSER_WIDTH      (S_TUSER_WIDTH),
                    .M_TSTRB_WIDTH      (M_TSTRB_WIDTH),
                    .M_TKEEP_WIDTH      (M_TKEEP_WIDTH),
                    .M_TUSER_WIDTH      (M_TUSER_WIDTH),
                    .AUTO_FIRST         (AUTO_FIRST),
                    .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                    .FIRST_OVERWRITE    (FIRST_OVERWRITE),
                    .ALIGN_S_WIDTH      (ALIGN_S_BITS),
                    .ALIGN_M_WIDTH      (ALIGN_M_BITS),
                    .S_REGS             (CONVERT_S_REGS)
                )
            i_axi4s_width_convert
                (
                    .aresetn            (m_aresetn),
                    .aclk               (m_aclk),
                    .aclken             (1'b1),
                    .endian             (endian),
                    
                    .s_align_s          (fifo_align_s),
                    .s_align_m          (fifo_align_m),
                    .s_axi4s_tdata      (fifo_tdata),
                    .s_axi4s_tstrb      (fifo_tstrb),
                    .s_axi4s_tkeep      (fifo_tkeep),
                    .s_axi4s_tfirst     (fifo_tfirst),
                    .s_axi4s_tlast      (fifo_tlast),
                    .s_axi4s_tuser      (fifo_tuser),
                    .s_axi4s_tvalid     (fifo_tvalid),
                    .s_axi4s_tready     (fifo_tready),
                    
                    .m_axi4s_tdata      (m_axi4s_tdata),
                    .m_axi4s_tstrb      (m_axi4s_tstrb),
                    .m_axi4s_tkeep      (m_axi4s_tkeep),
                    .m_axi4s_tfirst     (m_axi4s_tfirst),
                    .m_axi4s_tlast      (m_axi4s_tlast),
                    .m_axi4s_tuser      (m_axi4s_tuser),
                    .m_axi4s_tvalid     (m_axi4s_tvalid),
                    .m_axi4s_tready     (m_axi4s_tready)
                );
        
        assign fifo_wr_signal = (s_axi4s_tvalid & s_axi4s_tready);
        assign fifo_rd_signal = (fifo_tvalid & fifo_tready);
    end
    else begin : blk_pre_cnv
        
        // width convert
        wire    [M_TDATA_WIDTH-1:0]     conv_tdata;
        wire    [M_TSTRB_WIDTH-1:0]     conv_tstrb;
        wire    [M_TKEEP_BITS-1:0]      conv_tkeep;
        wire                            conv_tfirst;
        wire                            conv_tlast;
        wire    [M_TUSER_BITS-1:0]      conv_tuser;
        wire                            conv_tvalid;
        wire                            conv_tready;
        
        jelly_axi4s_width_convert
                #(
                    .HAS_STRB           (HAS_STRB),
                    .HAS_KEEP           (HAS_KEEP),
                    .HAS_FIRST          (HAS_FIRST),
                    .HAS_LAST           (HAS_LAST),
                    .HAS_ALIGN_S        (HAS_ALIGN_S),
                    .HAS_ALIGN_M        (HAS_ALIGN_M),
                    .BYTE_WIDTH         (BYTE_WIDTH),
                    .S_TDATA_WIDTH      (S_TDATA_WIDTH),
                    .M_TDATA_WIDTH      (M_TDATA_WIDTH),
                    .S_TSTRB_WIDTH      (S_TSTRB_WIDTH),
                    .S_TKEEP_WIDTH      (S_TKEEP_WIDTH),
                    .S_TUSER_WIDTH      (S_TUSER_WIDTH),
                    .M_TSTRB_WIDTH      (M_TSTRB_WIDTH),
                    .M_TKEEP_WIDTH      (M_TKEEP_WIDTH),
                    .M_TUSER_WIDTH      (M_TUSER_WIDTH),
                    .AUTO_FIRST         (AUTO_FIRST),
                    .FIRST_OVERWRITE    (FIRST_OVERWRITE),
                    .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                    .ALIGN_S_WIDTH      (ALIGN_S_WIDTH),
                    .ALIGN_M_WIDTH      (ALIGN_M_WIDTH),
                    .S_REGS             (CONVERT_S_REGS)
                )
            i_axi4s_width_convert
                (
                    .aresetn            (s_aresetn),
                    .aclk               (s_aclk),
                    .aclken             (1'b1),
                    .endian             (endian),
                    
                    .s_align_s          (s_align_s),
                    .s_align_m          (s_align_m),
                    .s_axi4s_tuser      (s_axi4s_tuser),
                    .s_axi4s_tdata      (s_axi4s_tdata),
                    .s_axi4s_tstrb      (s_axi4s_tstrb),
                    .s_axi4s_tkeep      (s_axi4s_tkeep),
                    .s_axi4s_tfirst     (s_axi4s_tfirst),
                    .s_axi4s_tlast      (s_axi4s_tlast),
                    .s_axi4s_tvalid     (s_axi4s_tvalid),
                    .s_axi4s_tready     (s_axi4s_tready),
                    
                    .m_axi4s_tuser      (conv_tuser),
                    .m_axi4s_tdata      (conv_tdata),
                    .m_axi4s_tstrb      (conv_tstrb),
                    .m_axi4s_tkeep      (conv_tkeep),
                    .m_axi4s_tfirst     (conv_tfirst),
                    .m_axi4s_tlast      (conv_tlast),
                    .m_axi4s_tvalid     (conv_tvalid),
                    .m_axi4s_tready     (conv_tready)
                );
        
        // FIFO
        jelly_axi4s_fifo
                #(
                    .ASYNC              (ASYNC),
                    .HAS_FIRST          (HAS_FIRST),
                    .HAS_LAST           (HAS_LAST),
                    .HAS_STRB           (HAS_STRB),
                    .HAS_KEEP           (HAS_KEEP),
                    
                    .BYTE_WIDTH         (BYTE_WIDTH),
                    .TUSER_WIDTH        (M_TUSER_WIDTH),
                    .TDATA_WIDTH        (M_TDATA_WIDTH),
                    .TSTRB_WIDTH        (M_TSTRB_WIDTH),
                    .TKEEP_WIDTH        (M_TKEEP_WIDTH),
                    
                    .PTR_WIDTH          (FIFO_PTR_WIDTH),
                    .RAM_TYPE           (FIFO_RAM_TYPE),
                    .LOW_DEALY          (FIFO_LOW_DEALY),
                    .DOUT_REGS          (FIFO_DOUT_REGS),
                    .S_REGS             (FIFO_S_REGS),
                    .M_REGS             (FIFO_M_REGS)
                )
            i_axi4s_fifo
                (
                    .s_aresetn          (s_aresetn),
                    .s_aclk             (s_aclk),
                    .s_axi4s_tfirst     (conv_tfirst),
                    .s_axi4s_tlast      (conv_tlast),
                    .s_axi4s_tuser      (conv_tuser),
                    .s_axi4s_tstrb      (conv_tstrb),
                    .s_axi4s_tkeep      (conv_tkeep),
                    .s_axi4s_tdata      (conv_tdata),
                    .s_axi4s_tvalid     (conv_tvalid),
                    .s_axi4s_tready     (conv_tready),
                    .s_free_count       (fifo_free_count),
                    
                    .m_aresetn          (m_aresetn),
                    .m_aclk             (m_aclk),
                    .m_axi4s_tuser      (m_axi4s_tuser),
                    .m_axi4s_tfirst     (m_axi4s_tfirst),
                    .m_axi4s_tlast      (m_axi4s_tlast),
                    .m_axi4s_tstrb      (m_axi4s_tstrb),
                    .m_axi4s_tkeep      (m_axi4s_tkeep),
                    .m_axi4s_tdata      (m_axi4s_tdata),
                    .m_axi4s_tvalid     (m_axi4s_tvalid),
                    .m_axi4s_tready     (m_axi4s_tready),
                    .m_data_count       (fifo_data_count)
                );
        
        assign fifo_wr_signal = (conv_tvalid & conv_tready);
        assign fifo_rd_signal = (m_axi4s_tvalid & m_axi4s_tready);
    end
    endgenerate
    
    
    // for simulation
    integer count_s;
    always @(posedge s_aclk) begin
        if ( ~s_aresetn ) begin
            count_s <= 0;
        end
        else begin
            if ( s_axi4s_tvalid & s_axi4s_tready ) begin
                count_s <= count_s + 1;
            end
        end
    end
    
    integer count_m;
    always @(posedge m_aclk) begin
        if ( ~m_aresetn ) begin
            count_m <= 0;
        end
        else begin
            if ( m_axi4s_tvalid & m_axi4s_tready ) begin
                count_m <= count_m + 1;
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file

