// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4s_video_fifo_width_converter
        #(
            parameter S_NUM               = 4,
            parameter M_NUM               = 8,
            parameter NUM_GCD             = 1,
            parameter DATA_UNIT           = 8,
            parameter USER_UNIT           = 0,
            parameter ALLOW_UNALIGN_FIRST = 1,
            parameter ALLOW_UNALIGN_LAST  = 1,
            parameter FIRST_FORCE_LAST    = 1,  // firstで前方吐き出し時に残変換があれば強制的にlastを付与
            parameter FIRST_OVERWRITE     = 0,  // first時前方に残変換があれば吐き出さずに上書き
            parameter CONVERT_S_REGS      = 1,
            
            parameter ASYNC               = 1,
            parameter FIFO_PTR_WIDTH      = 10,
            parameter FIFO_RAM_TYPE       = "block",
            parameter FIFO_LOW_DEALY      = 0,
            parameter FIFO_DOUT_REGS      = 1,
            parameter FIFO_SLAVE_REGS     = 1,
            parameter FIFO_MASTER_REGS    = 1,
            
            parameter POST_CONVERT        = (M_TDATA_WIDTH < S_TDATA_WIDTH),
            
            
            // local
            parameter S_TDATA_WIDTH       = S_NUM * DATA_UNIT,
            parameter M_TDATA_WIDTH       = M_NUM * DATA_UNIT,
            parameter S_TUSER_WIDTH       = S_NUM * USER_UNIT + 1,
            parameter M_TUSER_WIDTH       = M_NUM * USER_UNIT + 1
        )
        (
            input   wire                        endian,
            
            input   wire                        s_axi4s_aresetn,
            input   wire                        s_axi4s_aclk,
            input   wire    [S_TUSER_WIDTH-1:0] s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [S_TDATA_WIDTH-1:0] s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            output  wire    [FIFO_PTR_WIDTH:0]  s_fifo_free_count,
            output  wire                        s_fifo_wr_signal,
            
            
            input   wire                        m_axi4s_aresetn,
            input   wire                        m_axi4s_aclk,
            output  wire    [M_TUSER_WIDTH-1:0] m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [M_TDATA_WIDTH-1:0] m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready,
            output  wire    [FIFO_PTR_WIDTH:0]  m_fifo_data_count,
            output  wire                        m_fifo_rd_signal
        );
    
    
    // tuser の bit0 を framestart として特別扱いする
    localparam  S_USER_WIDTH = S_NUM * USER_UNIT;
    localparam  M_USER_WIDTH = M_NUM * USER_UNIT;
    
    localparam  S_USER_BITS  = S_USER_WIDTH > 0 ? S_USER_WIDTH : 1;
    localparam  M_USER_BITS  = M_USER_WIDTH > 0 ? M_USER_WIDTH : 1;
    
    wire                        s_first;
    wire    [S_USER_BITS-1:0]   s_user;
    wire                        m_first;
    wire    [M_USER_BITS-1:0]   m_user;
    
    assign s_first       = s_axi4s_tuser[0];
    assign s_user        = s_axi4s_tuser >> 1;
    
    assign m_axi4s_tuser = {m_user, m_first};
    
    
    // FIFO
    jelly_fifo_width_convert_pack
            #(
                .ASYNC              (ASYNC),
                .FIFO_PTR_WIDTH     (FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE      (FIFO_RAM_TYPE ),
                .FIFO_LOW_DEALY     (FIFO_LOW_DEALY),
                .FIFO_DOUT_REGS     (FIFO_DOUT_REGS),
                .FIFO_S_REGS        (FIFO_SLAVE_REGS),
                .FIFO_M_REGS        (FIFO_MASTER_REGS),
                
                .NUM_GCD            (NUM_GCD),
                .S_NUM              (S_NUM),
                .M_NUM              (M_NUM),
                .UNIT0_WIDTH        (DATA_UNIT),
                .UNIT1_WIDTH        (USER_UNIT),
                .HAS_FIRST          (1),
                .HAS_LAST           (1),
                .ALLOW_UNALIGN_FIRST(ALLOW_UNALIGN_FIRST),
                .ALLOW_UNALIGN_LAST (ALLOW_UNALIGN_LAST),
                .FIRST_FORCE_LAST   (FIRST_FORCE_LAST),
                .FIRST_OVERWRITE    (FIRST_OVERWRITE),
                .CONVERT_S_REGS     (CONVERT_S_REGS),
                
                .POST_CONVERT       (POST_CONVERT)
            )
        i_fifo_width_convert_pack
            (
                .endian             (endian),
                
                .padding0           ({DATA_UNIT{1'bx}}),
                .padding1           ({USER_UNIT{1'bx}}),
                
                .s_reset            (~s_axi4s_aresetn),
                .s_clk              (s_axi4s_aclk),
                .s_first            (s_first),
                .s_last             (s_axi4s_tlast),
                .s_data0            (s_axi4s_tdata),
                .s_data1            (s_user),
                .s_valid            (s_axi4s_tvalid),
                .s_ready            (s_axi4s_tready),
                .s_fifo_free_count  (s_fifo_free_count),
                .s_fifo_wr_signal   (s_fifo_wr_signal),
                
                .m_reset            (~m_axi4s_aresetn),
                .m_clk              (m_axi4s_aclk),
                .m_first            (m_first),
                .m_last             (m_axi4s_tlast),
                .m_data0            (m_axi4s_tdata),
                .m_data1            (m_user),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready),
                .m_fifo_data_count  (m_fifo_data_count),
                .m_fifo_rd_signal   (m_fifo_rd_signal)
            );
    
endmodule


`default_nettype wire


// end of file

